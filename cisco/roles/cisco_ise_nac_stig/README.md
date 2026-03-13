# cisco_ise_nac_stig

Cisco ISE NAC DISA STIG V2 hardening role.

## STIG Reference

- **Title**: Cisco ISE NAC Security Technical Implementation Guide
- **Version**: 2
- **Release**: Release: 3 Benchmark Date: 05 Jan 2026
- **Benchmark ID**: Cisco_ISE_NAC_STIG
- **Total Rules**: 30 (CAT I: 8, CAT II: 21, CAT III: 1)

## Requirements

- Ansible >= 2.14
- Collection: `cisco.ise`
- Platform: Cisco ISE

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `access_control` -- Access Control (4 rules)
- `authentication` -- Authentication (2 rules)
- `authorization` -- Authorization (7 rules)
- `encryption` -- Encryption (3 rules)
- `logging` -- Logging (8 rules)
- `session_management` -- Session Management (1 rules)
- `system_hardening` -- System Hardening (5 rules)
- `cat1` -- All CAT I (high) findings (8 rules)
- `cat2` -- All CAT II (medium) findings (21 rules)
- `cat3` -- All CAT III (low) findings (1 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: ise_servers
  roles:
    - role: cisco_ise_nac_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| CSCO-NC-000010 | HIGH | automated | encryption |
| CSCO-NC-000020 | HIGH | automated | access_control |
| CSCO-NC-000030 | HIGH | automated | session_management |
| CSCO-NC-000040 | HIGH | automated | access_control |
| CSCO-NC-000050 | HIGH | automated | access_control |
| CSCO-NC-000060 | HIGH | automated | authorization |
| CSCO-NC-000070 | MEDIUM | automated | authorization |
| CSCO-NC-000080 | LOW | automated | system_hardening |
| CSCO-NC-000090 | MEDIUM | automated | system_hardening |
| CSCO-NC-000100 | MEDIUM | automated | logging |
| CSCO-NC-000110 | MEDIUM | automated | system_hardening |
| CSCO-NC-000120 | MEDIUM | automated | authentication |
| CSCO-NC-000130 | MEDIUM | automated | authorization |
| CSCO-NC-000140 | MEDIUM | automated | authorization |
| CSCO-NC-000150 | MEDIUM | automated | logging |
| CSCO-NC-000160 | MEDIUM | automated | logging |
| CSCO-NC-000170 | MEDIUM | automated | logging |
| CSCO-NC-000200 | MEDIUM | automated | logging |
| CSCO-NC-000210 | MEDIUM | automated | logging |
| CSCO-NC-000220 | MEDIUM | automated | authentication |
| CSCO-NC-000230 | MEDIUM | automated | logging |
| CSCO-NC-000240 | MEDIUM | automated | logging |
| CSCO-NC-000250 | MEDIUM | automated | system_hardening |
| CSCO-NC-000260 | MEDIUM | automated | access_control |
| CSCO-NC-000270 | MEDIUM | automated | authorization |
| CSCO-NC-000280 | MEDIUM | automated | authorization |
| CSCO-NC-000290 | MEDIUM | automated | encryption |
| CSCO-NC-000300 | MEDIUM | automated | encryption |
| CSCO-NC-000310 | HIGH | automated | authorization |
| CSCO-NC-000320 | HIGH | automated | system_hardening |

## License

MIT

## Author

Fourth Estate
