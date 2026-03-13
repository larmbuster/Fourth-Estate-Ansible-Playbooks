# cisco_nxos_switch_rtr_stig

Cisco NX-OS Switch RTR DISA STIG V3 hardening role.

## STIG Reference

- **Title**: Cisco NX OS Switch RTR Security Technical Implementation Guide
- **Version**: 3
- **Release**: Release: 3 Benchmark Date: 30 Jan 2025
- **Benchmark ID**: Cisco_NX-OS_Switch_RTR_STIG
- **Total Rules**: 78 (CAT I: 7, CAT II: 45, CAT III: 26)

## Requirements

- Ansible >= 2.14
- Collection: `cisco.nxos`
- Platform: Cisco NX-OS Switch

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `access_control` -- Access Control (35 rules)
- `authentication` -- Authentication (4 rules)
- `authorization` -- Authorization (1 rules)
- `logging` -- Logging (2 rules)
- `network_services` -- Network Services (10 rules)
- `routing` -- Routing (21 rules)
- `switching` -- Switching (2 rules)
- `system_hardening` -- System Hardening (3 rules)
- `cat1` -- All CAT I (high) findings (7 rules)
- `cat2` -- All CAT II (medium) findings (45 rules)
- `cat3` -- All CAT III (low) findings (26 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: cisco_nxos_switches
  roles:
    - role: cisco_nxos_switch_rtr_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| CISC-RT-000010 | MEDIUM | automated | access_control |
| CISC-RT-000020 | MEDIUM | automated | routing |
| CISC-RT-000030 | MEDIUM | automated | authentication |
| CISC-RT-000040 | MEDIUM | automated | routing |
| CISC-RT-000050 | MEDIUM | automated | authentication |
| CISC-RT-000060 | LOW | automated | access_control |
| CISC-RT-000080 | MEDIUM | automated | system_hardening |
| CISC-RT-000120 | MEDIUM | automated | access_control |
| CISC-RT-000140 | MEDIUM | automated | access_control |
| CISC-RT-000150 | MEDIUM | automated | access_control |
| CISC-RT-000160 | LOW | automated | network_services |
| CISC-RT-000170 | MEDIUM | automated | access_control |
| CISC-RT-000190 | MEDIUM | automated | access_control |
| CISC-RT-000200 | LOW | automated | access_control |
| CISC-RT-000240 | HIGH | automated | access_control |
| CISC-RT-000250 | MEDIUM | automated | access_control |
| CISC-RT-000260 | MEDIUM | automated | access_control |
| CISC-RT-000270 | MEDIUM | automated | access_control |
| CISC-RT-000310 | HIGH | automated | access_control |
| CISC-RT-000320 | MEDIUM | automated | access_control |
| CISC-RT-000330 | MEDIUM | automated | access_control |
| CISC-RT-000340 | MEDIUM | automated | access_control |
| CISC-RT-000350 | MEDIUM | automated | routing |
| CISC-RT-000360 | LOW | automated | access_control |
| CISC-RT-000370 | LOW | automated | access_control |
| CISC-RT-000380 | MEDIUM | automated | network_services |
| CISC-RT-000390 | MEDIUM | automated | access_control |
| CISC-RT-000450 | MEDIUM | automated | access_control |
| CISC-RT-000470 | LOW | automated | routing |
| CISC-RT-000480 | MEDIUM | automated | routing |
| CISC-RT-000490 | MEDIUM | automated | routing |
| CISC-RT-000500 | MEDIUM | automated | routing |
| CISC-RT-000510 | MEDIUM | automated | routing |
| CISC-RT-000520 | MEDIUM | automated | routing |
| CISC-RT-000530 | MEDIUM | automated | routing |
| CISC-RT-000540 | LOW | automated | routing |
| CISC-RT-000550 | LOW | automated | access_control |
| CISC-RT-000560 | MEDIUM | automated | routing |
| CISC-RT-000570 | LOW | automated | routing |
| CISC-RT-000580 | LOW | automated | routing |
| CISC-RT-000590 | LOW | automated | routing |
| CISC-RT-000600 | LOW | automated | routing |
| CISC-RT-000610 | LOW | automated | routing |
| CISC-RT-000620 | MEDIUM | automated | system_hardening |
| CISC-RT-000630 | HIGH | manual | logging |
| CISC-RT-000640 | HIGH | automated | routing |
| CISC-RT-000650 | MEDIUM | automated | routing |
| CISC-RT-000660 | MEDIUM | automated | authentication |
| CISC-RT-000670 | HIGH | automated | system_hardening |
| CISC-RT-000680 | HIGH | automated | switching |
| CISC-RT-000700 | MEDIUM | automated | network_services |
| CISC-RT-000710 | LOW | automated | network_services |
| CISC-RT-000720 | MEDIUM | automated | switching |
| CISC-RT-000730 | HIGH | automated | access_control |
| CISC-RT-000740 | MEDIUM | automated | access_control |
| CISC-RT-000750 | MEDIUM | automated | routing |
| CISC-RT-000760 | LOW | automated | network_services |
| CISC-RT-000770 | LOW | automated | network_services |
| CISC-RT-000780 | MEDIUM | automated | network_services |
| CISC-RT-000790 | MEDIUM | automated | logging |
| CISC-RT-000800 | MEDIUM | manual | access_control |
| CISC-RT-000810 | LOW | automated | access_control |
| CISC-RT-000820 | LOW | automated | access_control |
| CISC-RT-000830 | LOW | automated | access_control |
| CISC-RT-000840 | LOW | automated | access_control |
| CISC-RT-000860 | LOW | automated | access_control |
| CISC-RT-000870 | MEDIUM | automated | access_control |
| CISC-RT-000880 | MEDIUM | automated | network_services |
| CISC-RT-000890 | MEDIUM | automated | routing |
| CISC-RT-000900 | MEDIUM | automated | access_control |
| CISC-RT-000910 | MEDIUM | automated | authentication |
| CISC-RT-000920 | LOW | automated | access_control |
| CISC-RT-000930 | LOW | automated | access_control |
| CISC-RT-000940 | LOW | automated | network_services |
| CISC-RT-000950 | LOW | automated | network_services |
| CISC-RT-000236 | LOW | automated | access_control |
| CISC-RT-000237 | MEDIUM | automated | authorization |
| CISC-RT-000391 | MEDIUM | automated | access_control |

## License

MIT

## Author

Fourth Estate
