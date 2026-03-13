# cisco_iosxe_switch_l2s_stig

Cisco IOS-XE Switch L2S DISA STIG V3 hardening role.

## STIG Reference

- **Title**: Cisco IOS XE Switch L2S Security Technical Implementation Guide
- **Version**: 3
- **Release**: Release: 2 Benchmark Date: 02 Jul 2025
- **Benchmark ID**: Cisco_IOS_XE_Switch_L2S_STIG
- **Total Rules**: 22 (CAT I: 1, CAT II: 17, CAT III: 4)

## Requirements

- Ansible >= 2.14
- Collection: `cisco.ios`
- Platform: Cisco IOS-XE Switch

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `authentication` -- Authentication (2 rules)
- `network_services` -- Network Services (3 rules)
- `switching` -- Switching (15 rules)
- `system_hardening` -- System Hardening (2 rules)
- `cat1` -- All CAT I (high) findings (1 rules)
- `cat2` -- All CAT II (medium) findings (17 rules)
- `cat3` -- All CAT III (low) findings (4 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: cisco_iosxe_switches
  roles:
    - role: cisco_iosxe_switch_l2s_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| CISC-L2-000020 | HIGH | automated | authentication |
| CISC-L2-000030 | MEDIUM | automated | authentication |
| CISC-L2-000040 | MEDIUM | automated | network_services |
| CISC-L2-000090 | LOW | automated | switching |
| CISC-L2-000100 | MEDIUM | automated | switching |
| CISC-L2-000110 | MEDIUM | automated | switching |
| CISC-L2-000120 | MEDIUM | automated | switching |
| CISC-L2-000130 | MEDIUM | automated | network_services |
| CISC-L2-000140 | MEDIUM | automated | system_hardening |
| CISC-L2-000150 | MEDIUM | manual | switching |
| CISC-L2-000160 | LOW | automated | switching |
| CISC-L2-000170 | LOW | automated | network_services |
| CISC-L2-000180 | MEDIUM | automated | switching |
| CISC-L2-000190 | MEDIUM | automated | system_hardening |
| CISC-L2-000200 | MEDIUM | automated | switching |
| CISC-L2-000210 | MEDIUM | automated | switching |
| CISC-L2-000220 | MEDIUM | automated | switching |
| CISC-L2-000230 | MEDIUM | automated | switching |
| CISC-L2-000240 | MEDIUM | automated | switching |
| CISC-L2-000250 | MEDIUM | automated | switching |
| CISC-L2-000260 | MEDIUM | automated | switching |
| CISC-L2-000270 | LOW | automated | switching |

## License

MIT

## Author

Fourth Estate
