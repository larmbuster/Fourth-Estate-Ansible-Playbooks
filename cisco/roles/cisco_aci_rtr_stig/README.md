# cisco_aci_rtr_stig

Cisco ACI RTR DISA STIG V1 hardening role.

## STIG Reference

- **Title**: Cisco ACI Router Security Technical Implementation Guide
- **Version**: 1
- **Release**: Release: 2 Benchmark Date: 05 Jan 2026
- **Benchmark ID**: Cisco_ACI_RTR_STIG
- **Total Rules**: 26 (CAT I: 0, CAT II: 18, CAT III: 8)

## Requirements

- Ansible >= 2.14
- Collection: `cisco.aci`
- Platform: Cisco ACI

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `access_control` -- Access Control (8 rules)
- `authorization` -- Authorization (2 rules)
- `encryption` -- Encryption (1 rules)
- `logging` -- Logging (2 rules)
- `network_services` -- Network Services (3 rules)
- `routing` -- Routing (9 rules)
- `system_hardening` -- System Hardening (1 rules)
- `cat1` -- All CAT I (high) findings (0 rules)
- `cat2` -- All CAT II (medium) findings (18 rules)
- `cat3` -- All CAT III (low) findings (8 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: aci_devices
  roles:
    - role: cisco_aci_rtr_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| CACI-RT-000001 | MEDIUM | automated | authorization |
| CACI-RT-000002 | MEDIUM | automated | routing |
| CACI-RT-000003 | MEDIUM | automated | routing |
| CACI-RT-000004 | LOW | automated | routing |
| CACI-RT-000009 | MEDIUM | automated | access_control |
| CACI-RT-000013 | LOW | automated | access_control |
| CACI-RT-000014 | LOW | automated | access_control |
| CACI-RT-000015 | LOW | automated | access_control |
| CACI-RT-000016 | MEDIUM | automated | system_hardening |
| CACI-RT-000017 | MEDIUM | automated | routing |
| CACI-RT-000018 | MEDIUM | automated | routing |
| CACI-RT-000019 | MEDIUM | manual | access_control |
| CACI-RT-000021 | MEDIUM | manual | access_control |
| CACI-RT-000022 | MEDIUM | automated | encryption |
| CACI-RT-000026 | MEDIUM | manual | logging |
| CACI-RT-000027 | MEDIUM | automated | access_control |
| CACI-RT-000028 | MEDIUM | automated | routing |
| CACI-RT-000029 | LOW | automated | routing |
| CACI-RT-000031 | MEDIUM | manual | network_services |
| CACI-RT-000032 | MEDIUM | automated | network_services |
| CACI-RT-000034 | LOW | automated | routing |
| CACI-RT-000035 | LOW | automated | network_services |
| CACI-RT-000038 | LOW | automated | routing |
| CACI-RT-000041 | MEDIUM | automated | authorization |
| CACI-RT-000043 | MEDIUM | manual | logging |
| CACI-RT-000044 | MEDIUM | manual | access_control |

## License

MIT

## Author

Fourth Estate
