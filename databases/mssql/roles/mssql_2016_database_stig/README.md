# mssql_2016_database_stig

MS SQL Server 2016 Database DISA STIG V3 hardening role.

## STIG Reference

- **Title**: MS SQL Server 2016 Database Security Technical Implementation Guide
- **Version**: 3
- **Release**: Release: 4 Benchmark Date: 05 Jan 2026
- **Benchmark ID**: MS_SQL_Server_2016_Database_STIG
- **Total Rules**: 23 (CAT I: 4, CAT II: 16, CAT III: 3)

## Requirements

- Ansible >= 2.14
- Collection: `community.general`
- Platform: MS SQL Server 2016

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `authentication` -- Authentication (5 rules)
- `authorization` -- Authorization (9 rules)
- `backup_recovery` -- Backup Recovery (1 rules)
- `logging` -- Logging (1 rules)
- `network_services` -- Network Services (4 rules)
- `system_hardening` -- System Hardening (3 rules)
- `cat1` -- All CAT I (high) findings (4 rules)
- `cat2` -- All CAT II (medium) findings (16 rules)
- `cat3` -- All CAT III (low) findings (3 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: mssql_2016_servers
  roles:
    - role: mssql_2016_database_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| SQL6-D0-000100 | HIGH | manual | authentication |
| SQL6-D0-000300 | HIGH | manual | authorization |
| SQL6-D0-000400 | MEDIUM | automated | authentication |
| SQL6-D0-000500 | LOW | automated | network_services |
| SQL6-D0-000600 | MEDIUM | automated | system_hardening |
| SQL6-D0-000700 | MEDIUM | automated | authorization |
| SQL6-D0-001200 | MEDIUM | automated | authorization |
| SQL6-D0-001300 | MEDIUM | automated | authorization |
| SQL6-D0-001400 | MEDIUM | manual | authorization |
| SQL6-D0-001500 | MEDIUM | manual | backup_recovery |
| SQL6-D0-001600 | MEDIUM | automated | authentication |
| SQL6-D0-001700 | MEDIUM | automated | logging |
| SQL6-D0-001800 | MEDIUM | automated | authentication |
| SQL6-D0-001900 | LOW | automated | authorization |
| SQL6-D0-002000 | MEDIUM | automated | authorization |
| SQL6-D0-002100 | MEDIUM | automated | system_hardening |
| SQL6-D0-002400 | MEDIUM | automated | authorization |
| SQL6-D0-002600 | MEDIUM | automated | network_services |
| SQL6-D0-002800 | LOW | automated | authorization |
| SQL6-D0-002900 | MEDIUM | automated | system_hardening |
| SQL6-D0-003100 | MEDIUM | automated | network_services |
| SQL6-D0-003300 | HIGH | manual | network_services |
| SQL6-D0-003200 | HIGH | automated | authentication |

## License

MIT

## Author

Fourth Estate
