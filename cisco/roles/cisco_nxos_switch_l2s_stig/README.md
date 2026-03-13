# cisco_nxos_switch_l2s_stig

Cisco NX-OS Switch L2S DISA STIG V3 hardening role.

## STIG Reference

- **Title**: Cisco NX OS Switch L2S Security Technical Implementation Guide
- **Version**: 3
- **Release**: Release: 3 Benchmark Date: 05 Jan 2026
- **Benchmark ID**: Cisco_NX-OS_Switch_L2S_STIG
- **Total Rules**: 22 (CAT I: 1, CAT II: 17, CAT III: 4)

## Requirements

- Ansible >= 2.14
- Collection: `cisco.nxos`
- Platform: Cisco NX-OS Switch

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `access_control` -- Access Control (3 rules)
- `authentication` -- Authentication (3 rules)
- `network_services` -- Network Services (3 rules)
- `switching` -- Switching (12 rules)
- `system_hardening` -- System Hardening (1 rules)
- `cat1` -- All CAT I (high) findings (1 rules)
- `cat2` -- All CAT II (medium) findings (17 rules)
- `cat3` -- All CAT III (low) findings (4 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: cisco_nxos_switches
  roles:
    - role: cisco_nxos_switch_l2s_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| CISC-L2-000020 | HIGH | automated | authentication |
| CISC-L2-000030 | MEDIUM | automated | authentication |
| CISC-L2-000060 | MEDIUM | automated | access_control |
| CISC-L2-000070 | MEDIUM | automated | access_control |
| CISC-L2-000080 | MEDIUM | automated | authentication |
| CISC-L2-000090 | LOW | automated | switching |
| CISC-L2-000100 | MEDIUM | automated | switching |
| CISC-L2-000110 | MEDIUM | automated | switching |
| CISC-L2-000120 | MEDIUM | automated | switching |
| CISC-L2-000130 | MEDIUM | automated | network_services |
| CISC-L2-000140 | MEDIUM | automated | network_services |
| CISC-L2-000150 | MEDIUM | manual | switching |
| CISC-L2-000160 | LOW | automated | switching |
| CISC-L2-000170 | LOW | automated | network_services |
| CISC-L2-000190 | MEDIUM | automated | system_hardening |
| CISC-L2-000210 | MEDIUM | automated | switching |
| CISC-L2-000220 | MEDIUM | automated | switching |
| CISC-L2-000230 | MEDIUM | automated | switching |
| CISC-L2-000240 | MEDIUM | automated | access_control |
| CISC-L2-000250 | MEDIUM | automated | switching |
| CISC-L2-000260 | MEDIUM | automated | switching |
| CISC-L2-000270 | LOW | automated | switching |

## License

MIT

## Author

Fourth Estate
