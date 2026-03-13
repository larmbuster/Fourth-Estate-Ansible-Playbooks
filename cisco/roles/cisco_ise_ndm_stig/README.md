# cisco_ise_ndm_stig

Cisco ISE NDM DISA STIG V2 hardening role.

## STIG Reference

- **Title**: Cisco ISE NDM Security Technical Implementation Guide
- **Version**: 2
- **Release**: Release: 3 Benchmark Date: 05 Jan 2026
- **Benchmark ID**: Cisco_ISE_NDM_STIG
- **Total Rules**: 53 (CAT I: 9, CAT II: 41, CAT III: 3)

## Requirements

- Ansible >= 2.14
- Collection: `cisco.ise`
- Platform: Cisco ISE

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `access_control` -- Access Control (1 rules)
- `authentication` -- Authentication (16 rules)
- `authorization` -- Authorization (2 rules)
- `encryption` -- Encryption (5 rules)
- `logging` -- Logging (22 rules)
- `session_management` -- Session Management (2 rules)
- `system_hardening` -- System Hardening (5 rules)
- `cat1` -- All CAT I (high) findings (9 rules)
- `cat2` -- All CAT II (medium) findings (41 rules)
- `cat3` -- All CAT III (low) findings (3 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: ise_servers
  roles:
    - role: cisco_ise_ndm_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| CSCO-NM-000010 | LOW | automated | session_management |
| CSCO-NM-000020 | MEDIUM | automated | authentication |
| CSCO-NM-000030 | MEDIUM | automated | logging |
| CSCO-NM-000040 | MEDIUM | automated | logging |
| CSCO-NM-000050 | MEDIUM | automated | logging |
| CSCO-NM-000060 | MEDIUM | automated | logging |
| CSCO-NM-000070 | LOW | automated | logging |
| CSCO-NM-000080 | MEDIUM | automated | authentication |
| CSCO-NM-000090 | HIGH | automated | authorization |
| CSCO-NM-000100 | MEDIUM | automated | logging |
| CSCO-NM-000110 | MEDIUM | automated | authentication |
| CSCO-NM-000120 | MEDIUM | automated | authentication |
| CSCO-NM-000130 | MEDIUM | automated | logging |
| CSCO-NM-000140 | MEDIUM | automated | logging |
| CSCO-NM-000150 | MEDIUM | automated | logging |
| CSCO-NM-000160 | MEDIUM | automated | logging |
| CSCO-NM-000170 | MEDIUM | automated | logging |
| CSCO-NM-000180 | MEDIUM | automated | logging |
| CSCO-NM-000190 | MEDIUM | automated | logging |
| CSCO-NM-000200 | MEDIUM | automated | logging |
| CSCO-NM-000210 | MEDIUM | automated | logging |
| CSCO-NM-000220 | MEDIUM | automated | logging |
| CSCO-NM-000230 | MEDIUM | automated | authentication |
| CSCO-NM-000240 | MEDIUM | automated | logging |
| CSCO-NM-000260 | MEDIUM | automated | system_hardening |
| CSCO-NM-000270 | MEDIUM | automated | authentication |
| CSCO-NM-000280 | MEDIUM | automated | system_hardening |
| CSCO-NM-000300 | MEDIUM | automated | logging |
| CSCO-NM-000330 | LOW | automated | logging |
| CSCO-NM-000340 | MEDIUM | manual | authentication |
| CSCO-NM-000350 | HIGH | automated | system_hardening |
| CSCO-NM-000360 | HIGH | automated | system_hardening |
| CSCO-NM-000370 | MEDIUM | automated | authentication |
| CSCO-NM-000380 | MEDIUM | automated | encryption |
| CSCO-NM-000390 | MEDIUM | automated | authentication |
| CSCO-NM-000400 | MEDIUM | automated | authentication |
| CSCO-NM-000410 | MEDIUM | automated | authentication |
| CSCO-NM-000420 | MEDIUM | automated | authentication |
| CSCO-NM-000430 | MEDIUM | automated | authentication |
| CSCO-NM-000440 | MEDIUM | automated | authentication |
| CSCO-NM-000460 | HIGH | automated | authentication |
| CSCO-NM-000470 | MEDIUM | automated | authentication |
| CSCO-NM-000480 | HIGH | automated | encryption |
| CSCO-NM-000490 | MEDIUM | automated | encryption |
| CSCO-NM-000500 | HIGH | automated | system_hardening |
| CSCO-NM-000510 | HIGH | automated | encryption |
| CSCO-NM-000520 | HIGH | automated | session_management |
| CSCO-NM-000530 | MEDIUM | automated | encryption |
| CSCO-NM-000540 | HIGH | automated | authorization |
| CSCO-NM-000550 | MEDIUM | automated | access_control |
| CSCO-NM-000560 | MEDIUM | automated | logging |
| CSCO-NM-000650 | MEDIUM | automated | logging |
| CSCO-NM-000720 | MEDIUM | automated | logging |

## License

MIT

## Author

Fourth Estate
