# cisco_asa_ndm_stig

Cisco ASA NDM DISA STIG V2 hardening role.

## STIG Reference

- **Title**: Cisco ASA NDM Security Technical Implementation Guide
- **Version**: 2
- **Release**: Release: 4 Benchmark Date: 05 Jan 2026
- **Benchmark ID**: Cisco_ASA_NDM_STIG
- **Total Rules**: 47 (CAT I: 7, CAT II: 40, CAT III: 0)

## Requirements

- Ansible >= 2.14
- Collection: `cisco.asa`
- Platform: Cisco ASA

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `authentication` -- Authentication (10 rules)
- `authorization` -- Authorization (2 rules)
- `encryption` -- Encryption (5 rules)
- `logging` -- Logging (24 rules)
- `network_services` -- Network Services (1 rules)
- `session_management` -- Session Management (2 rules)
- `system_hardening` -- System Hardening (3 rules)
- `cat1` -- All CAT I (high) findings (7 rules)
- `cat2` -- All CAT II (medium) findings (40 rules)
- `cat3` -- All CAT III (low) findings (0 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: asa_devices
  roles:
    - role: cisco_asa_ndm_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| CASA-ND-000010 | MEDIUM | automated | session_management |
| CASA-ND-000090 | MEDIUM | automated | logging |
| CASA-ND-000100 | MEDIUM | automated | logging |
| CASA-ND-000110 | MEDIUM | automated | logging |
| CASA-ND-000120 | MEDIUM | automated | logging |
| CASA-ND-000140 | MEDIUM | automated | authorization |
| CASA-ND-000160 | MEDIUM | manual | authorization |
| CASA-ND-000210 | MEDIUM | automated | logging |
| CASA-ND-000240 | MEDIUM | automated | logging |
| CASA-ND-000260 | MEDIUM | automated | logging |
| CASA-ND-000270 | MEDIUM | automated | logging |
| CASA-ND-000280 | MEDIUM | automated | logging |
| CASA-ND-000290 | MEDIUM | automated | logging |
| CASA-ND-000300 | MEDIUM | automated | logging |
| CASA-ND-000320 | MEDIUM | automated | logging |
| CASA-ND-000430 | HIGH | automated | system_hardening |
| CASA-ND-000450 | MEDIUM | automated | authentication |
| CASA-ND-000470 | MEDIUM | automated | encryption |
| CASA-ND-000490 | MEDIUM | automated | authentication |
| CASA-ND-000520 | MEDIUM | automated | authentication |
| CASA-ND-000530 | MEDIUM | automated | authentication |
| CASA-ND-000550 | MEDIUM | automated | authentication |
| CASA-ND-000570 | MEDIUM | automated | authentication |
| CASA-ND-000580 | MEDIUM | automated | authentication |
| CASA-ND-000690 | HIGH | automated | session_management |
| CASA-ND-000910 | MEDIUM | automated | logging |
| CASA-ND-000920 | MEDIUM | automated | logging |
| CASA-ND-000930 | MEDIUM | automated | logging |
| CASA-ND-000940 | MEDIUM | automated | network_services |
| CASA-ND-000970 | MEDIUM | automated | logging |
| CASA-ND-001050 | MEDIUM | automated | encryption |
| CASA-ND-001070 | MEDIUM | automated | encryption |
| CASA-ND-001080 | MEDIUM | automated | authentication |
| CASA-ND-001140 | HIGH | automated | encryption |
| CASA-ND-001150 | HIGH | automated | encryption |
| CASA-ND-001180 | MEDIUM | automated | system_hardening |
| CASA-ND-001200 | MEDIUM | automated | logging |
| CASA-ND-001210 | MEDIUM | automated | logging |
| CASA-ND-001220 | MEDIUM | automated | logging |
| CASA-ND-001230 | MEDIUM | automated | logging |
| CASA-ND-001240 | MEDIUM | automated | logging |
| CASA-ND-001250 | MEDIUM | automated | logging |
| CASA-ND-001310 | HIGH | automated | authentication |
| CASA-ND-001350 | MEDIUM | automated | logging |
| CASA-ND-001370 | MEDIUM | automated | authentication |
| CASA-ND-001410 | HIGH | automated | logging |
| CASA-ND-001420 | HIGH | automated | system_hardening |

## License

MIT

## Author

Fourth Estate
