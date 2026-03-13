# pan_ndm_stig

Palo Alto PAN-OS NDM DISA STIG V3 hardening role.

## STIG Reference

- **Title**: Palo Alto Networks NDM Security Technical Implementation Guide
- **Version**: 3
- **Release**: Release: 3 Benchmark Date: 02 Apr 2025
- **Benchmark ID**: Palo_Alto_Networks_NDM_STIG
- **Total Rules**: 34 (CAT I: 3, CAT II: 25, CAT III: 6)

## Requirements

- Ansible >= 2.14
- Collection: `paloaltonetworks.panos`
- Platform: Palo Alto PAN-OS

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `authentication` -- Authentication (19 rules)
- `authorization` -- Authorization (1 rules)
- `logging` -- Logging (10 rules)
- `network_services` -- Network Services (1 rules)
- `session_management` -- Session Management (1 rules)
- `system_hardening` -- System Hardening (2 rules)
- `cat1` -- All CAT I (high) findings (3 rules)
- `cat2` -- All CAT II (medium) findings (25 rules)
- `cat3` -- All CAT III (low) findings (6 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: panos_devices
  roles:
    - role: pan_ndm_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| PANW-NM-000015 | MEDIUM | automated | authentication |
| PANW-NM-000016 | LOW | automated | authentication |
| PANW-NM-000024 | MEDIUM | automated | logging |
| PANW-NM-000029 | LOW | automated | logging |
| PANW-NM-000046 | MEDIUM | automated | network_services |
| PANW-NM-000051 | MEDIUM | automated | authentication |
| PANW-NM-000053 | MEDIUM | automated | authentication |
| PANW-NM-000055 | MEDIUM | automated | authentication |
| PANW-NM-000056 | MEDIUM | automated | authentication |
| PANW-NM-000057 | MEDIUM | automated | authentication |
| PANW-NM-000058 | MEDIUM | automated | authentication |
| PANW-NM-000059 | MEDIUM | automated | authentication |
| PANW-NM-000061 | MEDIUM | automated | authorization |
| PANW-NM-000069 | HIGH | automated | session_management |
| PANW-NM-000075 | MEDIUM | automated | logging |
| PANW-NM-000092 | MEDIUM | automated | authentication |
| PANW-NM-000096 | LOW | automated | logging |
| PANW-NM-000097 | LOW | automated | logging |
| PANW-NM-000098 | LOW | automated | authentication |
| PANW-NM-000099 | LOW | automated | system_hardening |
| PANW-NM-000100 | MEDIUM | automated | system_hardening |
| PANW-NM-000101 | MEDIUM | automated | logging |
| PANW-NM-000110 | MEDIUM | automated | authentication |
| PANW-NM-000117 | MEDIUM | automated | logging |
| PANW-NM-000118 | HIGH | manual | logging |
| PANW-NM-000128 | MEDIUM | automated | logging |
| PANW-NM-000131 | MEDIUM | automated | authentication |
| PANW-NM-000136 | MEDIUM | automated | authentication |
| PANW-NM-000141 | MEDIUM | manual | authentication |
| PANW-NM-000142 | MEDIUM | automated | authentication |
| PANW-NM-000143 | HIGH | automated | authentication |
| PANW-NM-000144 | MEDIUM | automated | logging |
| PANW-NM-000145 | MEDIUM | automated | authentication |
| PANW-NM-000048 | MEDIUM | automated | authentication |

## License

MIT

## Author

Fourth Estate
