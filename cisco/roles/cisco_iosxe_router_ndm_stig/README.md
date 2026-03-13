# cisco_iosxe_router_ndm_stig

Cisco IOS-XE Router NDM DISA STIG V3 hardening role.

## STIG Reference

- **Title**: Cisco IOS XE Router NDM Security Technical Implementation Guide
- **Version**: 3
- **Release**: Release: 6 Benchmark Date: 05 Jan 2026
- **Benchmark ID**: Cisco_IOS-XE_Router_NDM_STIG
- **Total Rules**: 42 (CAT I: 8, CAT II: 34, CAT III: 0)

## Requirements

- Ansible >= 2.14
- Collection: `cisco.ios`
- Platform: Cisco IOS-XE Router

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `access_control` -- Access Control (2 rules)
- `authentication` -- Authentication (11 rules)
- `authorization` -- Authorization (4 rules)
- `encryption` -- Encryption (6 rules)
- `logging` -- Logging (14 rules)
- `network_services` -- Network Services (1 rules)
- `routing` -- Routing (1 rules)
- `session_management` -- Session Management (2 rules)
- `system_hardening` -- System Hardening (1 rules)
- `cat1` -- All CAT I (high) findings (8 rules)
- `cat2` -- All CAT II (medium) findings (34 rules)
- `cat3` -- All CAT III (low) findings (0 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: cisco_iosxe_routers
  roles:
    - role: cisco_iosxe_router_ndm_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| CISC-ND-000010 | MEDIUM | automated | session_management |
| CISC-ND-000090 | MEDIUM | automated | logging |
| CISC-ND-000100 | MEDIUM | automated | logging |
| CISC-ND-000110 | MEDIUM | automated | logging |
| CISC-ND-000120 | MEDIUM | automated | logging |
| CISC-ND-000140 | MEDIUM | automated | access_control |
| CISC-ND-000150 | MEDIUM | automated | authentication |
| CISC-ND-000160 | MEDIUM | manual | authorization |
| CISC-ND-000210 | MEDIUM | automated | logging |
| CISC-ND-000280 | MEDIUM | automated | logging |
| CISC-ND-000290 | MEDIUM | automated | access_control |
| CISC-ND-000330 | MEDIUM | automated | logging |
| CISC-ND-000380 | MEDIUM | automated | authorization |
| CISC-ND-000390 | MEDIUM | automated | authorization |
| CISC-ND-000460 | MEDIUM | automated | authorization |
| CISC-ND-000470 | HIGH | automated | system_hardening |
| CISC-ND-000490 | MEDIUM | automated | authentication |
| CISC-ND-000550 | MEDIUM | automated | authentication |
| CISC-ND-000570 | MEDIUM | automated | authentication |
| CISC-ND-000580 | MEDIUM | automated | authentication |
| CISC-ND-000590 | MEDIUM | automated | authentication |
| CISC-ND-000600 | MEDIUM | automated | authentication |
| CISC-ND-000610 | MEDIUM | automated | authentication |
| CISC-ND-000620 | HIGH | automated | encryption |
| CISC-ND-000720 | HIGH | automated | session_management |
| CISC-ND-000880 | MEDIUM | automated | logging |
| CISC-ND-000980 | MEDIUM | automated | logging |
| CISC-ND-001000 | MEDIUM | automated | logging |
| CISC-ND-001030 | MEDIUM | automated | network_services |
| CISC-ND-001130 | MEDIUM | automated | encryption |
| CISC-ND-001140 | MEDIUM | automated | encryption |
| CISC-ND-001150 | MEDIUM | manual | encryption |
| CISC-ND-001200 | HIGH | automated | encryption |
| CISC-ND-001210 | HIGH | automated | encryption |
| CISC-ND-001250 | MEDIUM | automated | logging |
| CISC-ND-001260 | MEDIUM | automated | authentication |
| CISC-ND-001270 | MEDIUM | automated | logging |
| CISC-ND-001370 | HIGH | automated | authentication |
| CISC-ND-001410 | MEDIUM | automated | logging |
| CISC-ND-001440 | MEDIUM | manual | authentication |
| CISC-ND-001450 | HIGH | automated | logging |
| CISC-ND-001470 | HIGH | automated | routing |

## License

MIT

## Author

Fourth Estate
