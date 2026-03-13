# f5_nginx_stig

F5 NGINX Web Server DISA STIG V1 hardening role.

## STIG Reference

- **Title**: F5 NGINX Security Technical Implementation Guide
- **Version**: 1
- **Release**: Release: 1 Benchmark Date: 25 Nov 2025
- **Benchmark ID**: F5_NGINX_STIG
- **Total Rules**: 32 (CAT I: 2, CAT II: 30, CAT III: 0)

## Requirements

- Ansible >= 2.14
- Collection: `ansible.builtin`
- Platform: F5 NGINX

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `access_control` -- Access Control (2 rules)
- `authentication` -- Authentication (7 rules)
- `authorization` -- Authorization (6 rules)
- `encryption` -- Encryption (5 rules)
- `logging` -- Logging (2 rules)
- `network_services` -- Network Services (7 rules)
- `session_management` -- Session Management (3 rules)
- `cat1` -- All CAT I (high) findings (2 rules)
- `cat2` -- All CAT II (medium) findings (30 rules)
- `cat3` -- All CAT III (low) findings (0 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: nginx_servers
  roles:
    - role: f5_nginx_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| NGNX-APP-000010 | MEDIUM | automated | session_management |
| NGNX-APP-000040 | HIGH | automated | encryption |
| NGNX-APP-000140 | MEDIUM | automated | authentication |
| NGNX-APP-000150 | MEDIUM | automated | authorization |
| NGNX-APP-000180 | MEDIUM | manual | authorization |
| NGNX-APP-000240 | MEDIUM | automated | logging |
| NGNX-APP-000250 | MEDIUM | automated | authorization |
| NGNX-APP-000370 | MEDIUM | automated | authorization |
| NGNX-APP-000400 | MEDIUM | automated | authorization |
| NGNX-APP-000510 | MEDIUM | automated | encryption |
| NGNX-APP-000590 | MEDIUM | automated | authentication |
| NGNX-APP-000720 | MEDIUM | automated | network_services |
| NGNX-APP-000730 | MEDIUM | automated | authentication |
| NGNX-APP-000850 | MEDIUM | automated | access_control |
| NGNX-APP-001030 | MEDIUM | automated | session_management |
| NGNX-APP-001070 | MEDIUM | automated | network_services |
| NGNX-APP-001400 | HIGH | automated | logging |
| NGNX-APP-001590 | MEDIUM | automated | authorization |
| NGNX-APP-001630 | MEDIUM | manual | access_control |
| NGNX-APP-001640 | MEDIUM | automated | session_management |
| NGNX-APP-001650 | MEDIUM | automated | authentication |
| NGNX-APP-001690 | MEDIUM | automated | authentication |
| NGNX-APP-001840 | MEDIUM | automated | network_services |
| NGNX-APP-001900 | MEDIUM | automated | authentication |
| NGNX-APP-001940 | MEDIUM | automated | network_services |
| NGNX-APP-001960 | MEDIUM | automated | encryption |
| NGNX-APP-002620 | MEDIUM | automated | network_services |
| NGNX-APP-002660 | MEDIUM | automated | encryption |
| NGNX-APP-003040 | MEDIUM | automated | authentication |
| NGNX-APP-003060 | MEDIUM | automated | network_services |
| NGNX-APP-003220 | MEDIUM | automated | encryption |
| NGNX-APP-003330 | MEDIUM | automated | network_services |

## License

MIT

## Author

Fourth Estate
