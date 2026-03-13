# cisco_asa_firewall_stig

Cisco ASA Firewall DISA STIG V2 hardening role.

## STIG Reference

- **Title**: Cisco ASA Firewall Security Technical Implementation Guide
- **Version**: 2
- **Release**: Release: 1 Benchmark Date: 24 Jul 2024
- **Benchmark ID**: Cisco_ASA_FW_STIG
- **Total Rules**: 21 (CAT I: 2, CAT II: 19, CAT III: 0)

## Requirements

- Ansible >= 2.14
- Collection: `cisco.asa`
- Platform: Cisco ASA

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `access_control` -- Access Control (10 rules)
- `encryption` -- Encryption (1 rules)
- `logging` -- Logging (7 rules)
- `system_hardening` -- System Hardening (3 rules)
- `cat1` -- All CAT I (high) findings (2 rules)
- `cat2` -- All CAT II (medium) findings (19 rules)
- `cat3` -- All CAT III (low) findings (0 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: asa_devices
  roles:
    - role: cisco_asa_firewall_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| CASA-FW-000010 | HIGH | automated | access_control |
| CASA-FW-000020 | MEDIUM | automated | access_control |
| CASA-FW-000030 | MEDIUM | automated | access_control |
| CASA-FW-000040 | MEDIUM | automated | access_control |
| CASA-FW-000050 | MEDIUM | automated | logging |
| CASA-FW-000090 | MEDIUM | automated | logging |
| CASA-FW-000100 | MEDIUM | automated | logging |
| CASA-FW-000130 | MEDIUM | automated | system_hardening |
| CASA-FW-000150 | MEDIUM | automated | system_hardening |
| CASA-FW-000170 | MEDIUM | automated | access_control |
| CASA-FW-000200 | MEDIUM | automated | logging |
| CASA-FW-000210 | MEDIUM | automated | logging |
| CASA-FW-000220 | HIGH | automated | system_hardening |
| CASA-FW-000230 | MEDIUM | automated | access_control |
| CASA-FW-000240 | MEDIUM | automated | access_control |
| CASA-FW-000250 | MEDIUM | automated | access_control |
| CASA-FW-000260 | MEDIUM | automated | encryption |
| CASA-FW-000270 | MEDIUM | manual | access_control |
| CASA-FW-000280 | MEDIUM | manual | logging |
| CASA-FW-000290 | MEDIUM | automated | access_control |
| CASA-FW-000300 | MEDIUM | automated | logging |

## License

MIT

## Author

Fourth Estate
