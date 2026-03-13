# cisco_iosxr_router_ndm_stig

Cisco IOS-XR Router NDM DISA STIG V3 hardening role.

## STIG Reference

- **Title**: Cisco IOS XR Router NDM Security Technical Implementation Guide
- **Version**: 3
- **Release**: Release: 5 Benchmark Date: 05 Jan 2026
- **Benchmark ID**: Cisco_IOS-XR_Router_NDM_STIG
- **Total Rules**: 27 (CAT I: 7, CAT II: 20, CAT III: 0)

## Requirements

- Ansible >= 2.14
- Collection: `cisco.iosxr`
- Platform: Cisco IOS-XR Router

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `access_control` -- Access Control (2 rules)
- `authentication` -- Authentication (5 rules)
- `authorization` -- Authorization (1 rules)
- `encryption` -- Encryption (4 rules)
- `logging` -- Logging (8 rules)
- `network_services` -- Network Services (2 rules)
- `routing` -- Routing (1 rules)
- `session_management` -- Session Management (3 rules)
- `system_hardening` -- System Hardening (1 rules)
- `cat1` -- All CAT I (high) findings (7 rules)
- `cat2` -- All CAT II (medium) findings (20 rules)
- `cat3` -- All CAT III (low) findings (0 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: cisco_iosxr_routers
  roles:
    - role: cisco_iosxr_router_ndm_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| CISC-ND-000010 | MEDIUM | automated | session_management |
| CISC-ND-000140 | MEDIUM | automated | access_control |
| CISC-ND-000150 | MEDIUM | automated | authentication |
| CISC-ND-000160 | MEDIUM | manual | authorization |
| CISC-ND-000250 | MEDIUM | automated | logging |
| CISC-ND-000280 | MEDIUM | automated | logging |
| CISC-ND-000290 | MEDIUM | automated | access_control |
| CISC-ND-000470 | HIGH | automated | system_hardening |
| CISC-ND-000490 | MEDIUM | automated | authentication |
| CISC-ND-000530 | MEDIUM | automated | authentication |
| CISC-ND-000720 | HIGH | automated | session_management |
| CISC-ND-000980 | MEDIUM | automated | logging |
| CISC-ND-001000 | MEDIUM | automated | logging |
| CISC-ND-001030 | MEDIUM | automated | network_services |
| CISC-ND-001040 | MEDIUM | automated | logging |
| CISC-ND-001050 | MEDIUM | automated | logging |
| CISC-ND-001130 | MEDIUM | automated | encryption |
| CISC-ND-001140 | MEDIUM | automated | encryption |
| CISC-ND-001150 | MEDIUM | automated | encryption |
| CISC-ND-001200 | HIGH | automated | encryption |
| CISC-ND-001210 | HIGH | automated | session_management |
| CISC-ND-001310 | MEDIUM | automated | logging |
| CISC-ND-001370 | HIGH | automated | authentication |
| CISC-ND-001410 | MEDIUM | automated | network_services |
| CISC-ND-001440 | MEDIUM | manual | authentication |
| CISC-ND-001450 | HIGH | automated | logging |
| CISC-ND-001470 | HIGH | automated | routing |

## License

MIT

## Author

Fourth Estate
