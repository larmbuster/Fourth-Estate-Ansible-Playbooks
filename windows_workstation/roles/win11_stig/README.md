# win11_stig

Ansible role implementing the **DISA STIG for Microsoft Windows 11 V2R6** on domain-joined workstations.

Covers **263 XCCDF rules** across 7 STIG categories with a tag-based execution model that lets operators run everything, a single category, a single severity level, or a single finding.

## STIG Coverage

| Task File | STIG IDs | Rules | Tag | Description |
|-----------|----------|-------|-----|-------------|
| `general_checks.yml` | WN11-00-*, WN11-RG-* | 45 | `general_checks` | OS verification, features, services, firewall |
| `account_policies.yml` | WN11-AC-* | 9 | `account_policies` | Password and lockout policies |
| `audit_policy.yml` | WN11-AU-* | 52 | `audit_policy` | Audit subcategory configuration |
| `admin_templates.yml` | WN11-CC-*, WN11-EP-*, WN11-UC-* | 81 | `admin_templates` | Registry-based GPO settings |
| `security_options.yml` | WN11-SO-* | 44 | `security_options` | Security option settings |
| `user_rights.yml` | WN11-UR-* | 28 | `user_rights` | User rights assignment |
| `public_key.yml` | WN11-PK-* | 4 | `public_key` | DoD certificate verification |

## Requirements

- Ansible >= 2.14
- Collections:
  - `ansible.windows` >= 2.1.0
  - `community.windows` >= 2.0.0
- WinRM connectivity to target hosts
- Administrative privileges on target hosts

Install collections:

```bash
ansible-galaxy collection install -r requirements.yml
```

## Role Variables

All tunable values are in `defaults/main.yml` with STIG-compliant defaults pre-set. Override via `group_vars`, `host_vars`, or `-e` on the command line.

### Account Policies

| Variable | Default | STIG Rule | Description |
|----------|---------|-----------|-------------|
| `win11_stig_lockout_duration` | `15` | WN11-AC-000005 | Account lockout duration (minutes) |
| `win11_stig_lockout_threshold` | `3` | WN11-AC-000010 | Failed logon attempts before lockout |
| `win11_stig_lockout_reset_counter` | `15` | WN11-AC-000015 | Minutes before counter resets |
| `win11_stig_password_history` | `24` | WN11-AC-000020 | Passwords remembered |
| `win11_stig_max_password_age` | `60` | WN11-AC-000025 | Maximum password age (days) |
| `win11_stig_min_password_age` | `1` | WN11-AC-000030 | Minimum password age (days) |
| `win11_stig_min_password_length` | `14` | WN11-AC-000035 | Minimum password length |

### Security Options

| Variable | Default | STIG Rule | Description |
|----------|---------|-----------|-------------|
| `win11_stig_renamed_admin_account` | `"adminaccount"` | WN11-SO-000020 | Renamed Administrator account |
| `win11_stig_renamed_guest_account` | `"guestaccount"` | WN11-SO-000025 | Renamed Guest account |
| `win11_stig_inactivity_timeout` | `900` | WN11-SO-000070 | Inactivity timeout (seconds) |
| `win11_stig_legal_notice_caption` | `"DoD Notice..."` | WN11-SO-000080 | Legal notice title |
| `win11_stig_legal_notice_text` | `"You are accessing..."` | WN11-SO-000075 | Legal notice body |
| `win11_stig_cached_logons` | `4` | WN11-SO-000085 | Cached logon count |

### Administrative Templates

| Variable | Default | STIG Rule | Description |
|----------|---------|-----------|-------------|
| `win11_stig_bitlocker_min_pin` | `6` | WN11-00-000032 | BitLocker minimum PIN length |
| `win11_stig_telemetry_level` | `0` | WN11-CC-000205 | Telemetry level (0=Security) |

### User Rights

| Variable | Default | STIG Rule | Description |
|----------|---------|-----------|-------------|
| `win11_stig_network_access_groups` | `[Administrators, Remote Desktop Users]` | WN11-UR-000010 | Network access groups |
| `win11_stig_logon_locally_groups` | `[Administrators, Users]` | WN11-UR-000025 | Local logon groups |
| `win11_stig_deny_network_access_groups` | `[Guests, Local account]` | WN11-UR-000070 | Deny network access |
| `win11_stig_deny_rdp_groups` | `[Guests, Local account]` | WN11-UR-000090 | Deny RDP logon |
| `win11_stig_remote_shutdown_groups` | `[Administrators]` | WN11-UR-000100 | Remote shutdown |

### Behavior

| Variable | Default | Description |
|----------|---------|-------------|
| `win11_stig_auto_reboot` | `false` | Automatically reboot if required |
| `win11_stig_min_os_build` | `"22621.380"` | Minimum OS build for verification |

## Tags

### Category Tags

Run one or more STIG categories:

```bash
ansible-playbook site.yml -i inventory --tags account_policies
ansible-playbook site.yml -i inventory --tags audit_policy,user_rights
ansible-playbook site.yml -i inventory --tags admin_templates
```

### Severity Tags

Run all findings of a severity level:

```bash
ansible-playbook site.yml -i inventory --tags cat1    # CAT I (high) only
ansible-playbook site.yml -i inventory --tags cat2    # CAT II (medium) only
ansible-playbook site.yml -i inventory --tags cat3    # CAT III (low) only
```

### Individual Finding Tags

Target a single STIG rule:

```bash
ansible-playbook site.yml -i inventory --tags WN11-CC-000005
ansible-playbook site.yml -i inventory --tags WN11-AC-000035
```

## Example Playbook

```yaml
- name: Apply Windows 11 STIG
  hosts: windows_workstations
  roles:
    - role: win11_stig
      vars:
        win11_stig_min_password_length: 16
        win11_stig_lockout_duration: 30
        win11_stig_legal_notice_caption: "ACME Corp Notice"
```

## License

MIT

## Author

Fourth Estate
