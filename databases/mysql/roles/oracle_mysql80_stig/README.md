# oracle_mysql80_stig

Oracle MySQL 8.0 Database DISA STIG V2 hardening role.

## STIG Reference

- **Title**: Oracle MySQL 8.0 Security Technical Implementation Guide
- **Version**: 2
- **Release**: Release: 2 Benchmark Date: 24 Oct 2024
- **Benchmark ID**: Oracle_MySQL_8.0_STIG
- **Total Rules**: 100 (CAT I: 12, CAT II: 88, CAT III: 0)

## Requirements

- Ansible >= 2.14
- Collection: `community.mysql`
- Platform: Oracle MySQL 8.0

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `authentication` -- Authentication (14 rules)
- `authorization` -- Authorization (32 rules)
- `encryption` -- Encryption (8 rules)
- `logging` -- Logging (31 rules)
- `session_management` -- Session Management (1 rules)
- `system_hardening` -- System Hardening (14 rules)
- `cat1` -- All CAT I (high) findings (12 rules)
- `cat2` -- All CAT II (medium) findings (88 rules)
- `cat3` -- All CAT III (low) findings (0 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: mysql_servers
  roles:
    - role: oracle_mysql80_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| MYS8-00-000100 | HIGH | manual | authentication |
| MYS8-00-000200 | MEDIUM | automated | session_management |
| MYS8-00-000300 | MEDIUM | automated | logging |
| MYS8-00-000800 | MEDIUM | automated | logging |
| MYS8-00-001200 | MEDIUM | automated | authorization |
| MYS8-00-001300 | MEDIUM | automated | authorization |
| MYS8-00-001400 | MEDIUM | automated | authorization |
| MYS8-00-001500 | MEDIUM | automated | logging |
| MYS8-00-001600 | MEDIUM | automated | logging |
| MYS8-00-001700 | MEDIUM | automated | authorization |
| MYS8-00-001800 | MEDIUM | automated | authorization |
| MYS8-00-001900 | MEDIUM | automated | authorization |
| MYS8-00-002000 | MEDIUM | automated | logging |
| MYS8-00-002100 | MEDIUM | automated | authorization |
| MYS8-00-002200 | MEDIUM | automated | logging |
| MYS8-00-002300 | MEDIUM | automated | logging |
| MYS8-00-002400 | MEDIUM | automated | authorization |
| MYS8-00-002500 | MEDIUM | automated | authorization |
| MYS8-00-002600 | MEDIUM | automated | authorization |
| MYS8-00-002700 | MEDIUM | automated | authorization |
| MYS8-00-002800 | MEDIUM | automated | logging |
| MYS8-00-002900 | MEDIUM | automated | logging |
| MYS8-00-003000 | MEDIUM | automated | logging |
| MYS8-00-003100 | MEDIUM | automated | logging |
| MYS8-00-003200 | MEDIUM | automated | authorization |
| MYS8-00-003300 | MEDIUM | automated | authorization |
| MYS8-00-003400 | MEDIUM | automated | logging |
| MYS8-00-003500 | MEDIUM | automated | logging |
| MYS8-00-003600 | MEDIUM | automated | logging |
| MYS8-00-003700 | MEDIUM | automated | logging |
| MYS8-00-003800 | MEDIUM | automated | logging |
| MYS8-00-003900 | MEDIUM | automated | logging |
| MYS8-00-004000 | MEDIUM | automated | authorization |
| MYS8-00-004100 | MEDIUM | automated | authorization |
| MYS8-00-004200 | MEDIUM | automated | logging |
| MYS8-00-004300 | MEDIUM | automated | logging |
| MYS8-00-004400 | MEDIUM | automated | logging |
| MYS8-00-004500 | MEDIUM | automated | logging |
| MYS8-00-004600 | MEDIUM | automated | logging |
| MYS8-00-004700 | MEDIUM | automated | authentication |
| MYS8-00-004800 | HIGH | automated | authentication |
| MYS8-00-004900 | MEDIUM | automated | authentication |
| MYS8-00-005000 | HIGH | automated | authentication |
| MYS8-00-005100 | MEDIUM | manual | authentication |
| MYS8-00-005200 | HIGH | automated | authentication |
| MYS8-00-005300 | HIGH | automated | authentication |
| MYS8-00-005400 | HIGH | manual | authorization |
| MYS8-00-005500 | MEDIUM | automated | system_hardening |
| MYS8-00-005600 | MEDIUM | automated | system_hardening |
| MYS8-00-005700 | MEDIUM | automated | logging |
| MYS8-00-005800 | MEDIUM | automated | system_hardening |
| MYS8-00-006000 | MEDIUM | automated | system_hardening |
| MYS8-00-006100 | MEDIUM | automated | authentication |
| MYS8-00-006200 | HIGH | automated | encryption |
| MYS8-00-006300 | MEDIUM | manual | authentication |
| MYS8-00-006400 | MEDIUM | automated | authorization |
| MYS8-00-006500 | MEDIUM | automated | authorization |
| MYS8-00-006600 | MEDIUM | automated | authorization |
| MYS8-00-006800 | MEDIUM | automated | authorization |
| MYS8-00-007000 | MEDIUM | automated | encryption |
| MYS8-00-007200 | HIGH | automated | logging |
| MYS8-00-007300 | MEDIUM | automated | system_hardening |
| MYS8-00-007400 | MEDIUM | automated | system_hardening |
| MYS8-00-007500 | MEDIUM | automated | logging |
| MYS8-00-007800 | MEDIUM | automated | logging |
| MYS8-00-008000 | MEDIUM | automated | authorization |
| MYS8-00-008100 | MEDIUM | automated | encryption |
| MYS8-00-008200 | MEDIUM | automated | authorization |
| MYS8-00-008300 | MEDIUM | automated | authorization |
| MYS8-00-008400 | MEDIUM | automated | authorization |
| MYS8-00-008500 | MEDIUM | automated | system_hardening |
| MYS8-00-008700 | MEDIUM | automated | authorization |
| MYS8-00-009000 | MEDIUM | automated | system_hardening |
| MYS8-00-009100 | MEDIUM | automated | authorization |
| MYS8-00-009200 | MEDIUM | automated | authorization |
| MYS8-00-009300 | MEDIUM | automated | logging |
| MYS8-00-009600 | MEDIUM | automated | logging |
| MYS8-00-009700 | MEDIUM | automated | logging |
| MYS8-00-009800 | MEDIUM | automated | logging |
| MYS8-00-009900 | MEDIUM | automated | logging |
| MYS8-00-010300 | MEDIUM | automated | authentication |
| MYS8-00-010400 | MEDIUM | automated | authentication |
| MYS8-00-010500 | MEDIUM | automated | authorization |
| MYS8-00-010600 | MEDIUM | automated | authorization |
| MYS8-00-010700 | MEDIUM | automated | authorization |
| MYS8-00-010800 | MEDIUM | automated | system_hardening |
| MYS8-00-010900 | MEDIUM | automated | system_hardening |
| MYS8-00-011000 | MEDIUM | automated | system_hardening |
| MYS8-00-011100 | MEDIUM | automated | authentication |
| MYS8-00-011300 | MEDIUM | automated | encryption |
| MYS8-00-011500 | MEDIUM | automated | encryption |
| MYS8-00-011600 | MEDIUM | automated | encryption |
| MYS8-00-011700 | HIGH | automated | encryption |
| MYS8-00-011800 | MEDIUM | automated | encryption |
| MYS8-00-011900 | MEDIUM | manual | authentication |
| MYS8-00-012000 | HIGH | automated | authorization |
| MYS8-00-012100 | HIGH | automated | authorization |
| MYS8-00-012300 | MEDIUM | automated | system_hardening |
| MYS8-00-012500 | MEDIUM | manual | system_hardening |
| MYS8-00-012600 | HIGH | automated | system_hardening |

## License

MIT

## Author

Fourth Estate
