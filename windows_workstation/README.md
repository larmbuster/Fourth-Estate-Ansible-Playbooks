# Windows Workstation Ansible Automation

DISA STIG hardening automation for Windows 11 domain-joined workstations.

## Quick Start

1. Install required collections:

```bash
ansible-galaxy collection install -r requirements.yml
```

2. Copy and customize the inventory:

```bash
cp inventory.example inventory
```

3. Run the playbook:

```bash
ansible-playbook -i inventory site.yml --ask-vault-pass
```

## Directory Structure

```
windows_workstation/
├── site.yml                          # Main playbook entry point
├── inventory.example                 # Example inventory
├── requirements.yml                  # Ansible Galaxy collections
├── README.md                         # This file
└── roles/
    └── win11_stig/                   # DISA STIG V2R6 role
        ├── README.md                 # Role documentation
        ├── defaults/main.yml         # Tunable variables
        ├── vars/main.yml             # Internal constants
        ├── tasks/
        │   ├── main.yml              # Task orchestrator
        │   ├── general_checks.yml    # WN11-00-* (45 rules)
        │   ├── account_policies.yml  # WN11-AC-* (9 rules)
        │   ├── audit_policy.yml      # WN11-AU-* (52 rules)
        │   ├── admin_templates.yml   # WN11-CC-* (81 rules)
        │   ├── security_options.yml  # WN11-SO-* (44 rules)
        │   ├── user_rights.yml       # WN11-UR-* (28 rules)
        │   └── public_key.yml        # WN11-PK-* (4 rules)
        ├── handlers/main.yml         # Reboot handler
        └── meta/
            ├── main.yml              # Role metadata
            └── argument_specs.yml    # Variable validation
```

## STIG Reference

- **Benchmark**: DISA STIG for Microsoft Windows 11 V2R6
- **Rules**: 263 XCCDF rules / 264 Tenable audit items
- **Categories**: General (WN11-00), Account Policies (WN11-AC), Audit (WN11-AU), Admin Templates (WN11-CC), Security Options (WN11-SO), User Rights (WN11-UR), Public Key (WN11-PK)

## Running Specific Categories

```bash
# Run only account policies
ansible-playbook -i inventory site.yml --tags account_policies

# Run only CAT I (high severity) findings
ansible-playbook -i inventory site.yml --tags cat1

# Run a single finding
ansible-playbook -i inventory site.yml --tags WN11-CC-000005

# Dry run
ansible-playbook -i inventory site.yml --check --diff
```

## Customization

Override default variables in `group_vars` or via `-e`:

```bash
ansible-playbook -i inventory site.yml \
  -e win11_stig_min_password_length=16 \
  -e win11_stig_lockout_duration=30
```

See `roles/win11_stig/README.md` for the full list of tunable variables.
