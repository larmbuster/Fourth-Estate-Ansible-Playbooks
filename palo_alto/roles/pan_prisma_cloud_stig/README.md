# pan_prisma_cloud_stig

Palo Alto Prisma Cloud Compute Cloud DISA STIG V2 hardening role.

## STIG Reference

- **Title**: Palo Alto Networks Prisma Cloud Compute Security Technical Implementation Guide
- **Version**: 2
- **Release**: Release: 2 Benchmark Date: 30 Jan 2025
- **Benchmark ID**: PAN_Prisma_Cloud_Compute_STIG
- **Total Rules**: 31 (CAT I: 8, CAT II: 23, CAT III: 0)

## Requirements

- Ansible >= 2.14
- Collection: `paloaltonetworks.prisma_cloud`
- Platform: Palo Alto Prisma Cloud Compute

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `access_control` -- Access Control (2 rules)
- `authentication` -- Authentication (5 rules)
- `authorization` -- Authorization (4 rules)
- `logging` -- Logging (5 rules)
- `network_services` -- Network Services (6 rules)
- `routing` -- Routing (1 rules)
- `session_management` -- Session Management (2 rules)
- `system_hardening` -- System Hardening (6 rules)
- `cat1` -- All CAT I (high) findings (8 rules)
- `cat2` -- All CAT II (medium) findings (23 rules)
- `cat3` -- All CAT III (low) findings (0 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: prisma_cloud
  roles:
    - role: pan_prisma_cloud_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| CNTR-PC-000020 | HIGH | automated | session_management |
| CNTR-PC-000030 | MEDIUM | automated | authorization |
| CNTR-PC-000120 | MEDIUM | automated | authentication |
| CNTR-PC-000130 | MEDIUM | automated | access_control |
| CNTR-PC-000140 | HIGH | automated | access_control |
| CNTR-PC-000240 | MEDIUM | automated | system_hardening |
| CNTR-PC-000260 | MEDIUM | automated | system_hardening |
| CNTR-PC-000290 | HIGH | automated | logging |
| CNTR-PC-000310 | MEDIUM | automated | logging |
| CNTR-PC-000430 | HIGH | automated | authorization |
| CNTR-PC-000450 | HIGH | automated | system_hardening |
| CNTR-PC-000480 | MEDIUM | automated | network_services |
| CNTR-PC-000500 | MEDIUM | automated | network_services |
| CNTR-PC-000510 | MEDIUM | automated | authentication |
| CNTR-PC-000530 | MEDIUM | automated | routing |
| CNTR-PC-000590 | MEDIUM | automated | authentication |
| CNTR-PC-000640 | MEDIUM | automated | authentication |
| CNTR-PC-000750 | MEDIUM | automated | authentication |
| CNTR-PC-000850 | MEDIUM | automated | authorization |
| CNTR-PC-000880 | MEDIUM | automated | logging |
| CNTR-PC-001030 | MEDIUM | automated | logging |
| CNTR-PC-001170 | HIGH | automated | system_hardening |
| CNTR-PC-001220 | HIGH | automated | system_hardening |
| CNTR-PC-001250 | MEDIUM | automated | session_management |
| CNTR-PC-001350 | MEDIUM | automated | authorization |
| CNTR-PC-001380 | MEDIUM | automated | system_hardening |
| CNTR-PC-001390 | HIGH | automated | logging |
| CNTR-PC-001440 | MEDIUM | automated | network_services |
| CNTR-PC-001470 | MEDIUM | automated | network_services |
| CNTR-PC-001490 | MEDIUM | automated | network_services |
| CNTR-PC-001770 | MEDIUM | automated | network_services |

## License

MIT

## Author

Fourth Estate
