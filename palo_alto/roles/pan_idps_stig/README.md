# pan_idps_stig

Palo Alto PAN-OS IDPS DISA STIG V3 hardening role.

## STIG Reference

- **Title**: Palo Alto Networks IDPS Security Technical Implementation Guide
- **Version**: 3
- **Release**: Release: 2 Benchmark Date: 30 Jan 2025
- **Benchmark ID**: Palo_Alto_Networks_IDPS_STIG
- **Total Rules**: 29 (CAT I: 0, CAT II: 27, CAT III: 2)

## Requirements

- Ansible >= 2.14
- Collection: `paloaltonetworks.panos`
- Platform: Palo Alto PAN-OS

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `authorization` -- Authorization (5 rules)
- `logging` -- Logging (19 rules)
- `network_services` -- Network Services (3 rules)
- `routing` -- Routing (1 rules)
- `system_hardening` -- System Hardening (1 rules)
- `cat1` -- All CAT I (high) findings (0 rules)
- `cat2` -- All CAT II (medium) findings (27 rules)
- `cat3` -- All CAT III (low) findings (2 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: panos_devices
  roles:
    - role: pan_idps_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| PANW-IP-000001 | MEDIUM | automated | network_services |
| PANW-IP-000007 | MEDIUM | automated | logging |
| PANW-IP-000008 | MEDIUM | automated | logging |
| PANW-IP-000010 | MEDIUM | automated | logging |
| PANW-IP-000018 | MEDIUM | automated | logging |
| PANW-IP-000020 | MEDIUM | automated | network_services |
| PANW-IP-000024 | MEDIUM | manual | logging |
| PANW-IP-000026 | MEDIUM | automated | network_services |
| PANW-IP-000028 | MEDIUM | automated | logging |
| PANW-IP-000029 | MEDIUM | automated | logging |
| PANW-IP-000030 | MEDIUM | manual | system_hardening |
| PANW-IP-000031 | MEDIUM | automated | routing |
| PANW-IP-000032 | MEDIUM | automated | logging |
| PANW-IP-000033 | MEDIUM | automated | logging |
| PANW-IP-000039 | LOW | automated | logging |
| PANW-IP-000041 | MEDIUM | automated | logging |
| PANW-IP-000043 | MEDIUM | automated | logging |
| PANW-IP-000045 | MEDIUM | automated | logging |
| PANW-IP-000046 | MEDIUM | manual | authorization |
| PANW-IP-000047 | MEDIUM | manual | authorization |
| PANW-IP-000048 | MEDIUM | manual | logging |
| PANW-IP-000049 | MEDIUM | automated | authorization |
| PANW-IP-000050 | MEDIUM | automated | authorization |
| PANW-IP-000051 | MEDIUM | automated | logging |
| PANW-IP-000052 | MEDIUM | automated | logging |
| PANW-IP-000053 | MEDIUM | automated | authorization |
| PANW-IP-000055 | MEDIUM | automated | logging |
| PANW-IP-000056 | MEDIUM | automated | logging |
| PANW-IP-000058 | LOW | automated | logging |

## License

MIT

## Author

Fourth Estate
