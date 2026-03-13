# pan_alg_stig

Palo Alto PAN-OS ALG DISA STIG V3 hardening role.

## STIG Reference

- **Title**: Palo Alto Networks ALG Security Technical Implementation Guide
- **Version**: 3
- **Release**: Release: 4 Benchmark Date: 02 Apr 2025
- **Benchmark ID**: Palo_Alto_Networks_ALG_STIG
- **Total Rules**: 50 (CAT I: 1, CAT II: 46, CAT III: 3)

## Requirements

- Ansible >= 2.14
- Collection: `paloaltonetworks.panos`
- Platform: Palo Alto PAN-OS

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `access_control` -- Access Control (5 rules)
- `authentication` -- Authentication (1 rules)
- `authorization` -- Authorization (11 rules)
- `encryption` -- Encryption (7 rules)
- `logging` -- Logging (17 rules)
- `network_services` -- Network Services (6 rules)
- `routing` -- Routing (1 rules)
- `session_management` -- Session Management (1 rules)
- `system_hardening` -- System Hardening (1 rules)
- `cat1` -- All CAT I (high) findings (1 rules)
- `cat2` -- All CAT II (medium) findings (46 rules)
- `cat3` -- All CAT III (low) findings (3 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: panos_devices
  roles:
    - role: pan_alg_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| PANW-AG-000015 | MEDIUM | manual | access_control |
| PANW-AG-000016 | MEDIUM | automated | encryption |
| PANW-AG-000017 | MEDIUM | automated | encryption |
| PANW-AG-000020 | MEDIUM | automated | encryption |
| PANW-AG-000024 | LOW | automated | logging |
| PANW-AG-000035 | MEDIUM | automated | access_control |
| PANW-AG-000036 | MEDIUM | automated | system_hardening |
| PANW-AG-000037 | MEDIUM | automated | network_services |
| PANW-AG-000038 | MEDIUM | automated | authorization |
| PANW-AG-000044 | MEDIUM | automated | access_control |
| PANW-AG-000047 | MEDIUM | automated | logging |
| PANW-AG-000049 | MEDIUM | automated | logging |
| PANW-AG-000050 | MEDIUM | manual | access_control |
| PANW-AG-000051 | MEDIUM | automated | access_control |
| PANW-AG-000052 | MEDIUM | automated | session_management |
| PANW-AG-000060 | MEDIUM | manual | authorization |
| PANW-AG-000062 | MEDIUM | automated | network_services |
| PANW-AG-000063 | MEDIUM | automated | network_services |
| PANW-AG-000064 | MEDIUM | automated | logging |
| PANW-AG-000065 | MEDIUM | automated | logging |
| PANW-AG-000073 | MEDIUM | automated | network_services |
| PANW-AG-000074 | MEDIUM | automated | network_services |
| PANW-AG-000078 | MEDIUM | automated | encryption |
| PANW-AG-000079 | MEDIUM | automated | encryption |
| PANW-AG-000080 | MEDIUM | automated | logging |
| PANW-AG-000081 | MEDIUM | automated | logging |
| PANW-AG-000094 | MEDIUM | automated | logging |
| PANW-AG-000101 | MEDIUM | automated | authentication |
| PANW-AG-000102 | HIGH | automated | logging |
| PANW-AG-000105 | MEDIUM | automated | logging |
| PANW-AG-000107 | MEDIUM | automated | authorization |
| PANW-AG-000109 | MEDIUM | automated | logging |
| PANW-AG-000111 | LOW | automated | logging |
| PANW-AG-000112 | MEDIUM | automated | authorization |
| PANW-AG-000113 | MEDIUM | automated | authorization |
| PANW-AG-000114 | MEDIUM | automated | logging |
| PANW-AG-000115 | MEDIUM | automated | authorization |
| PANW-AG-000116 | MEDIUM | automated | authorization |
| PANW-AG-000118 | MEDIUM | automated | logging |
| PANW-AG-000119 | MEDIUM | automated | authorization |
| PANW-AG-000120 | MEDIUM | automated | authorization |
| PANW-AG-000121 | MEDIUM | automated | logging |
| PANW-AG-000122 | MEDIUM | automated | logging |
| PANW-AG-000127 | MEDIUM | automated | routing |
| PANW-AG-000141 | MEDIUM | automated | encryption |
| PANW-AG-000143 | MEDIUM | automated | encryption |
| PANW-AG-000144 | LOW | automated | logging |
| PANW-AG-000147 | MEDIUM | manual | authorization |
| PANW-AG-000148 | MEDIUM | manual | network_services |
| PANW-AG-000149 | MEDIUM | manual | authorization |

## License

MIT

## Author

Fourth Estate
