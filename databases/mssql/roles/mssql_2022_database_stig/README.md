# mssql_2022_database_stig

MS SQL Server 2022 Database DISA STIG V1 hardening role.

## STIG Reference

- **Title**: Microsoft SQL Server 2022 Database Security Technical Implementation Guide
- **Version**: 1
- **Release**: Release: 2 Benchmark Date: 05 Jan 2026
- **Benchmark ID**: MS_SQL_Server_2022_Database_STIG
- **Total Rules**: 22 (CAT I: 4, CAT II: 18, CAT III: 0)

## Requirements

- Ansible >= 2.14
- Collection: `community.general`
- Platform: MS SQL Server 2022

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `authentication` -- Authentication (3 rules)
- `authorization` -- Authorization (8 rules)
- `backup_recovery` -- Backup Recovery (1 rules)
- `logging` -- Logging (1 rules)
- `network_services` -- Network Services (6 rules)
- `system_hardening` -- System Hardening (3 rules)
- `cat1` -- All CAT I (high) findings (4 rules)
- `cat2` -- All CAT II (medium) findings (18 rules)
- `cat3` -- All CAT III (low) findings (0 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: mssql_2022_servers
  roles:
    - role: mssql_2022_database_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| SQLD-22-000100 | HIGH | manual | authentication |
| SQLD-22-000300 | HIGH | manual | authorization |
| SQLD-22-000500 | MEDIUM | automated | network_services |
| SQLD-22-000600 | MEDIUM | automated | system_hardening |
| SQLD-22-000700 | MEDIUM | automated | authorization |
| SQLD-22-001200 | MEDIUM | automated | authorization |
| SQLD-22-001300 | MEDIUM | manual | network_services |
| SQLD-22-001400 | MEDIUM | manual | authorization |
| SQLD-22-001500 | MEDIUM | manual | backup_recovery |
| SQLD-22-001600 | MEDIUM | automated | network_services |
| SQLD-22-001700 | MEDIUM | automated | logging |
| SQLD-22-001800 | MEDIUM | automated | authentication |
| SQLD-22-001900 | MEDIUM | automated | authorization |
| SQLD-22-002000 | MEDIUM | automated | authorization |
| SQLD-22-002100 | MEDIUM | automated | system_hardening |
| SQLD-22-002400 | MEDIUM | automated | authorization |
| SQLD-22-002600 | MEDIUM | automated | network_services |
| SQLD-22-002800 | MEDIUM | automated | authorization |
| SQLD-22-002900 | MEDIUM | automated | system_hardening |
| SQLD-22-003100 | MEDIUM | automated | network_services |
| SQLD-22-003200 | HIGH | automated | authentication |
| SQLD-22-003300 | HIGH | manual | network_services |

## License

MIT

## Author

Fourth Estate
