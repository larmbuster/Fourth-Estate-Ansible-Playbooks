# Windows Workstation STIG CI — Azure Ephemeral VM

This GitHub Actions workflow provisions a throwaway Windows 11 VM in Azure,
applies the `win11_stig` Ansible role against it, runs an idempotency check,
and tears everything down — all within a single CI run.

## How It Works

```
GitHub Actions runner (ubuntu-latest)
  │
  ├─ Azure Login (OIDC)
  ├─ Pull Execution Environment image from ghcr.io
  ├─ Create resource group, NSG, and Windows 11 VM
  ├─ Bootstrap WinRM HTTPS on the VM (self-signed cert)
  ├─ Generate dynamic Ansible inventory
  ├─ Validate connectivity (win_ping)
  ├─ Run STIG role playbook          ──► WinRM ──► Windows 11 VM
  ├─ Run playbook again (idempotency)
  ├─ Upload logs on failure
  └─ Delete Azure resource group (always)
```

Every Azure resource is created in a uniquely named resource group and deleted
at the end of the run, even on failure. Nothing persists between runs.

## Prerequisites

### 1. Azure Service Principal with OIDC

The workflow authenticates to Azure using OpenID Connect (no stored credentials).
Set up a federated identity for your GitHub repository:

```bash
# Create the app registration and service principal
az ad app create --display-name "github-ci-win11-stig"
APP_ID=$(az ad app list --display-name "github-ci-win11-stig" --query "[0].appId" -o tsv)
az ad sp create --id "$APP_ID"

# Assign Contributor on the subscription (or a dedicated resource group scope)
SUB_ID=$(az account show --query id -o tsv)
az role assignment create \
  --assignee "$APP_ID" \
  --role Contributor \
  --scope "/subscriptions/${SUB_ID}"

# Add a federated credential for the repo
az ad app federated-credential create --id "$APP_ID" --parameters '{
  "name": "github-actions-main",
  "issuer": "https://token.actions.githubusercontent.com",
  "subject": "repo:<owner>/<repo>:environment:ci-windows",
  "audiences": ["api://AzureADTokenExchange"]
}'
```

Replace `<owner>/<repo>` with your GitHub repository.

### 2. GitHub Environment and Secrets

Create a GitHub environment named **`ci-windows`** and add three secrets:

| Secret                   | Value                                              |
| ------------------------ | -------------------------------------------------- |
| `AZURE_CLIENT_ID`       | Application (client) ID from the app registration  |
| `AZURE_TENANT_ID`       | Azure AD tenant ID                                 |
| `AZURE_SUBSCRIPTION_ID` | Azure subscription ID                              |

Using an environment provides deployment protection rules (e.g., required
reviewers) and scopes secrets so they are only available to this workflow.

### 3. Execution Environment Image

The workflow runs Ansible inside an Execution Environment (EE) container rather
than installing Python packages directly. You must build and push the EE image
before the workflow will pass.

**Required EE contents:**

| Component                | Minimum Version |
| ------------------------ | --------------- |
| `ansible-core`           | 2.15+           |
| `ansible.windows`        | 2.1.0+          |
| `community.windows`      | 2.0.0+          |
| `pywinrm`                | 0.4.3+          |
| `requests-credssp`       | 2.0.0+          |

**Build with `ansible-builder`:**

```bash
pip install ansible-builder

# Create an execution-environment.yml (example):
cat > execution-environment.yml <<'EOF'
---
version: 3
dependencies:
  galaxy: requirements.yml
  python:
    - pywinrm>=0.4.3
    - requests-credssp>=2.0.0
  system: []
images:
  base_image:
    name: quay.io/ansible/ansible-runner:latest
EOF

# Build
ansible-builder build --tag ee-windows-stig:latest

# Push to GitHub Container Registry
docker tag ee-windows-stig:latest ghcr.io/<org>/ee-windows-stig:latest
docker push ghcr.io/<org>/ee-windows-stig:latest
```

Once pushed, update the `EE_IMAGE` variable at the top of the workflow file:

```yaml
env:
  EE_IMAGE: ghcr.io/<org>/ee-windows-stig:latest
```

If the GHCR package is private, the workflow already handles authentication
using the built-in `GITHUB_TOKEN` (the `packages: read` permission is set).

## Workflow Triggers

| Trigger              | Condition                                                                              |
| -------------------- | -------------------------------------------------------------------------------------- |
| **Pull request**     | Opened, synchronized, or reopened against `main`/`master` when paths under `windows_workstation/`, `.github/workflow-suites/windows-workstation/`, or the workflow file itself change |
| **Manual dispatch**  | Click "Run workflow" in the Actions tab                                                |

Fork PRs are automatically skipped to prevent secret exposure.

## What Each Step Does

| Step | Description |
| ---- | ----------- |
| **Azure Login (OIDC)** | Authenticates to Azure without stored credentials |
| **Log in to GHCR** | Authenticates Docker to `ghcr.io` so the EE image can be pulled |
| **Install ansible-navigator** | Installs the CLI tool that drives the EE container |
| **Pull Execution Environment** | Downloads the EE image containing Ansible and all dependencies |
| **Generate ephemeral admin password** | Creates a random 32-character password, masks it in logs |
| **Provision Win11 VM and bootstrap WinRM** | Creates a resource group, NSG (only WinRM 5986 from the runner IP), and a `Standard_D4s_v5` Windows 11 VM; then runs a PowerShell script via `az vm run-command` to enable WinRM HTTPS with a self-signed certificate |
| **Build dynamic inventory** | Writes an INI inventory file with the VM's public IP and WinRM connection variables |
| **Validate connectivity** | Runs `ansible.windows.win_ping` through the EE to confirm WinRM is working |
| **Run STIG role playbook** | Executes `windows_workstation/site.yml` with `win11_stig_skip_domain_check=true` (the VM is not domain-joined) and `win11_stig_reboot_strategy=never` (no interactive session in CI) |
| **Idempotency check** | Runs the playbook a second time; emits a `::warning` annotation if any tasks report changed (does not fail the build) |
| **Upload Ansible logs** | On failure, uploads `/tmp/*.log` as a downloadable artifact (retained 7 days) |
| **Cleanup Azure resource group** | Runs `always`, even on failure or cancellation, to delete all Azure resources |

## CI-Specific Role Overrides

Two extra variables are passed to the playbook only in CI:

| Variable | CI Value | Why |
| -------- | -------- | --- |
| `win11_stig_skip_domain_check` | `true` | Ephemeral Azure VMs are standalone, not domain-joined. The pre-flight assertion would otherwise fail immediately. |
| `win11_stig_reboot_strategy` | `never` | The default `notify` strategy calls `msg.exe` which requires an interactive session. Suppressing reboots avoids errors and keeps the CI run stable. |

These variables are defined in the role's `defaults/main.yml` and documented in
`meta/argument_specs.yml`. They should not be set to these values in production.

## Security Notes

- **OIDC authentication** — No long-lived Azure credentials are stored as secrets.
  The workflow exchanges a short-lived GitHub OIDC token for an Azure access token.
- **NSG lockdown** — The provisioning script creates a Network Security Group that
  only allows inbound TCP 5986 (WinRM HTTPS) from the GitHub runner's public IP.
  All other inbound traffic is denied by default.
- **WinRM hardening** — The bootstrap script disables Basic auth and unencrypted
  transport. Only NTLM over HTTPS with a self-signed certificate is enabled.
- **Ephemeral password** — The VM admin password is randomly generated per run,
  masked in GitHub Actions logs, and destroyed with the VM.
- **Fork protection** — The workflow skips execution for pull requests from forks,
  preventing secret exposure.
- **Environment protection** — The `ci-windows` environment can be configured with
  required reviewers or other deployment protection rules.
- **Scoped permissions** — The workflow requests only `id-token: write` (OIDC),
  `contents: read` (checkout), and `packages: read` (GHCR pull).

## Cost

Each run provisions a `Standard_D4s_v5` VM (4 vCPU, 16 GB RAM) in `eastus`.
The VM typically runs for 15–30 minutes before cleanup. At current Azure
pay-as-you-go rates this is roughly $0.05–$0.10 per run. The resource group
is deleted with `--no-wait` at the end of every run so nothing lingers.

## Troubleshooting

**Workflow fails at "Pull Execution Environment"**
The `EE_IMAGE` variable still points to the placeholder. Build and push the EE
image as described in [Execution Environment Image](#3-execution-environment-image).

**"Pre-flight | Verify target is a domain-joined Windows workstation" fails**
The workflow should pass `-e win11_stig_skip_domain_check=true`. If you see this
error, verify the playbook step includes that extra variable.

**WinRM connection timeout**
The NSG only allows the runner's IP. If the runner IP changes mid-job (rare), the
connection will fail. Re-running the workflow gets a fresh NSG rule. Also confirm
the bootstrap script completed successfully by checking the "Provision" step output.

**Idempotency warning**
Some STIG tasks legitimately report `changed` on a second run (e.g., audit policy
commands that always return changed). The warning is informational and does not
fail the build.

## File Layout

```
.github/
├── workflows/
│   └── windows-workstation-azure-ci.yml    # Workflow entrypoint
└── workflow-suites/
    └── windows-workstation/
        ├── README.md                       # This file
        ├── provision-and-bootstrap.sh      # Creates Azure RG, NSG, VM; bootstraps WinRM
        ├── create-inventory.sh             # Writes dynamic Ansible inventory
        └── bootstrap-winrm.ps1             # PowerShell run on the VM to enable WinRM HTTPS
```
