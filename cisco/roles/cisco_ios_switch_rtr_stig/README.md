# cisco_ios_switch_rtr_stig

Cisco IOS Switch RTR DISA STIG V3 hardening role.

## STIG Reference

- **Title**: Cisco IOS Switch RTR Security Technical Implementation Guide
- **Version**: 3
- **Release**: Release: 2 Benchmark Date: 01 Oct 2025
- **Benchmark ID**: Cisco_IOS_Switch_RTR_STIG
- **Total Rules**: 53 (CAT I: 4, CAT II: 38, CAT III: 11)

## Requirements

- Ansible >= 2.14
- Collection: `cisco.ios`
- Platform: Cisco IOS Switch

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `access_control` -- Access Control (37 rules)
- `authentication` -- Authentication (2 rules)
- `authorization` -- Authorization (1 rules)
- `logging` -- Logging (2 rules)
- `network_services` -- Network Services (6 rules)
- `routing` -- Routing (2 rules)
- `system_hardening` -- System Hardening (3 rules)
- `cat1` -- All CAT I (high) findings (4 rules)
- `cat2` -- All CAT II (medium) findings (38 rules)
- `cat3` -- All CAT III (low) findings (11 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: cisco_ios_switches
  roles:
    - role: cisco_ios_switch_rtr_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| CISC-RT-000010 | MEDIUM | automated | access_control |
| CISC-RT-000050 | MEDIUM | automated | routing |
| CISC-RT-000060 | LOW | automated | access_control |
| CISC-RT-000090 | MEDIUM | automated | system_hardening |
| CISC-RT-000120 | HIGH | automated | access_control |
| CISC-RT-000150 | MEDIUM | automated | access_control |
| CISC-RT-000160 | LOW | automated | network_services |
| CISC-RT-000170 | MEDIUM | automated | access_control |
| CISC-RT-000180 | MEDIUM | automated | access_control |
| CISC-RT-000190 | MEDIUM | automated | access_control |
| CISC-RT-000200 | LOW | automated | access_control |
| CISC-RT-000210 | MEDIUM | automated | access_control |
| CISC-RT-000220 | MEDIUM | automated | access_control |
| CISC-RT-000230 | LOW | automated | authentication |
| CISC-RT-000240 | HIGH | automated | access_control |
| CISC-RT-000250 | MEDIUM | automated | access_control |
| CISC-RT-000260 | MEDIUM | automated | access_control |
| CISC-RT-000270 | MEDIUM | automated | access_control |
| CISC-RT-000320 | MEDIUM | automated | access_control |
| CISC-RT-000330 | MEDIUM | automated | access_control |
| CISC-RT-000340 | MEDIUM | automated | access_control |
| CISC-RT-000360 | LOW | automated | access_control |
| CISC-RT-000370 | LOW | automated | access_control |
| CISC-RT-000380 | MEDIUM | automated | network_services |
| CISC-RT-000390 | MEDIUM | automated | access_control |
| CISC-RT-000450 | MEDIUM | automated | access_control |
| CISC-RT-000660 | MEDIUM | automated | authentication |
| CISC-RT-000730 | HIGH | automated | access_control |
| CISC-RT-000740 | MEDIUM | automated | access_control |
| CISC-RT-000760 | LOW | automated | network_services |
| CISC-RT-000770 | LOW | automated | network_services |
| CISC-RT-000780 | MEDIUM | automated | network_services |
| CISC-RT-000790 | MEDIUM | automated | logging |
| CISC-RT-000800 | MEDIUM | manual | access_control |
| CISC-RT-000810 | LOW | automated | access_control |
| CISC-RT-000860 | LOW | automated | access_control |
| CISC-RT-000870 | MEDIUM | automated | access_control |
| CISC-RT-000880 | MEDIUM | automated | network_services |
| CISC-RT-000890 | MEDIUM | automated | logging |
| CISC-RT-000310 | HIGH | automated | access_control |
| CISC-RT-000350 | MEDIUM | automated | access_control |
| CISC-RT-000750 | MEDIUM | automated | system_hardening |
| CISC-RT-000235 | MEDIUM | automated | system_hardening |
| CISC-RT-000236 | LOW | automated | routing |
| CISC-RT-000237 | MEDIUM | automated | authorization |
| CISC-RT-000391 | MEDIUM | automated | access_control |
| CISC-RT-000392 | MEDIUM | automated | access_control |
| CISC-RT-000393 | MEDIUM | automated | access_control |
| CISC-RT-000394 | MEDIUM | automated | access_control |
| CISC-RT-000395 | MEDIUM | automated | access_control |
| CISC-RT-000396 | MEDIUM | automated | access_control |
| CISC-RT-000397 | MEDIUM | automated | access_control |
| CISC-RT-000398 | MEDIUM | automated | access_control |

## License

MIT

## Author

Fourth Estate
