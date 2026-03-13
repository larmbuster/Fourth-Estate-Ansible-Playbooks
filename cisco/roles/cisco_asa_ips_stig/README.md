# cisco_asa_ips_stig

Cisco ASA IPS DISA STIG V2 hardening role.

## STIG Reference

- **Title**: Cisco ASA IPS Security Technical Implementation Guide
- **Version**: 2
- **Release**: Release: 1 Benchmark Date: 24 Jul 2024
- **Benchmark ID**: Cisco_ASA_IPS_STIG
- **Total Rules**: 23 (CAT I: 0, CAT II: 23, CAT III: 0)

## Requirements

- Ansible >= 2.14
- Collection: `cisco.asa`
- Platform: Cisco ASA

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `access_control` -- Access Control (1 rules)
- `authorization` -- Authorization (2 rules)
- `logging` -- Logging (14 rules)
- `network_services` -- Network Services (5 rules)
- `system_hardening` -- System Hardening (1 rules)
- `cat1` -- All CAT I (high) findings (0 rules)
- `cat2` -- All CAT II (medium) findings (23 rules)
- `cat3` -- All CAT III (low) findings (0 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: asa_devices
  roles:
    - role: cisco_asa_ips_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| CASA-IP-000040 | MEDIUM | automated | logging |
| CASA-IP-000050 | MEDIUM | automated | logging |
| CASA-IP-000060 | MEDIUM | automated | logging |
| CASA-IP-000070 | MEDIUM | automated | logging |
| CASA-IP-000080 | MEDIUM | automated | logging |
| CASA-IP-000090 | MEDIUM | automated | logging |
| CASA-IP-000110 | MEDIUM | automated | logging |
| CASA-IP-000120 | MEDIUM | automated | logging |
| CASA-IP-000130 | MEDIUM | automated | logging |
| CASA-IP-000180 | MEDIUM | manual | access_control |
| CASA-IP-000190 | MEDIUM | manual | network_services |
| CASA-IP-000200 | MEDIUM | manual | network_services |
| CASA-IP-000240 | MEDIUM | automated | network_services |
| CASA-IP-000260 | MEDIUM | manual | network_services |
| CASA-IP-000270 | MEDIUM | automated | system_hardening |
| CASA-IP-000280 | MEDIUM | automated | logging |
| CASA-IP-000290 | MEDIUM | automated | network_services |
| CASA-IP-000500 | MEDIUM | manual | authorization |
| CASA-IP-000510 | MEDIUM | manual | authorization |
| CASA-IP-000520 | MEDIUM | automated | logging |
| CASA-IP-000530 | MEDIUM | automated | logging |
| CASA-IP-000560 | MEDIUM | automated | logging |
| CASA-IP-000570 | MEDIUM | automated | logging |

## License

MIT

## Author

Fourth Estate
