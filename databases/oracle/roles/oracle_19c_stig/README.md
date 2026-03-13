# oracle_19c_stig

Oracle Database 19c Database DISA STIG V1 hardening role.

## STIG Reference

- **Title**: Oracle Database 19c Security Technical Implementation Guide
- **Version**: 1
- **Release**: Release: 4 Benchmark Date: 05 Jan 2026
- **Benchmark ID**: Oracle_Database_19c_STIG
- **Total Rules**: 96 (CAT I: 15, CAT II: 80, CAT III: 1)

## Requirements

- Ansible >= 2.14
- Collection: `community.general`
- Platform: Oracle Database 19c

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `access_control` -- Access Control (11 rules)
- `authentication` -- Authentication (23 rules)
- `authorization` -- Authorization (28 rules)
- `backup_recovery` -- Backup Recovery (1 rules)
- `encryption` -- Encryption (3 rules)
- `logging` -- Logging (15 rules)
- `network_services` -- Network Services (7 rules)
- `session_management` -- Session Management (2 rules)
- `system_hardening` -- System Hardening (6 rules)
- `cat1` -- All CAT I (high) findings (15 rules)
- `cat2` -- All CAT II (medium) findings (80 rules)
- `cat3` -- All CAT III (low) findings (1 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: oracle_db_servers
  roles:
    - role: oracle_19c_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| O19C-00-000100 | MEDIUM | automated | session_management |
| O19C-00-000200 | MEDIUM | automated | logging |
| O19C-00-000300 | MEDIUM | automated | session_management |
| O19C-00-000500 | MEDIUM | automated | network_services |
| O19C-00-000800 | HIGH | manual | authentication |
| O19C-00-001000 | HIGH | automated | authorization |
| O19C-00-001700 | LOW | manual | logging |
| O19C-00-001800 | MEDIUM | manual | network_services |
| O19C-00-001900 | MEDIUM | automated | network_services |
| O19C-00-002000 | MEDIUM | automated | logging |
| O19C-00-005600 | MEDIUM | manual | network_services |
| O19C-00-005700 | MEDIUM | automated | logging |
| O19C-00-005800 | MEDIUM | automated | logging |
| O19C-00-005900 | MEDIUM | automated | logging |
| O19C-00-006000 | MEDIUM | automated | logging |
| O19C-00-006600 | MEDIUM | automated | authorization |
| O19C-00-006900 | MEDIUM | automated | authorization |
| O19C-00-007300 | MEDIUM | automated | authorization |
| O19C-00-007400 | HIGH | automated | system_hardening |
| O19C-00-007700 | MEDIUM | automated | authorization |
| O19C-00-007900 | MEDIUM | automated | authorization |
| O19C-00-008000 | HIGH | automated | authorization |
| O19C-00-008100 | MEDIUM | automated | system_hardening |
| O19C-00-008200 | MEDIUM | automated | authorization |
| O19C-00-008300 | MEDIUM | automated | authorization |
| O19C-00-008400 | MEDIUM | automated | access_control |
| O19C-00-008600 | MEDIUM | automated | access_control |
| O19C-00-008700 | MEDIUM | automated | authorization |
| O19C-00-009000 | MEDIUM | automated | authentication |
| O19C-00-009200 | MEDIUM | automated | access_control |
| O19C-00-009300 | MEDIUM | automated | access_control |
| O19C-00-009400 | MEDIUM | automated | authentication |
| O19C-00-009500 | MEDIUM | automated | authorization |
| O19C-00-009600 | MEDIUM | automated | authorization |
| O19C-00-009700 | MEDIUM | automated | authorization |
| O19C-00-009800 | MEDIUM | automated | authorization |
| O19C-00-009900 | HIGH | automated | access_control |
| O19C-00-010000 | MEDIUM | automated | authorization |
| O19C-00-010100 | MEDIUM | automated | authorization |
| O19C-00-010400 | MEDIUM | automated | logging |
| O19C-00-010500 | MEDIUM | automated | access_control |
| O19C-00-010600 | MEDIUM | automated | access_control |
| O19C-00-010700 | MEDIUM | automated | logging |
| O19C-00-010800 | MEDIUM | automated | logging |
| O19C-00-011200 | MEDIUM | automated | network_services |
| O19C-00-011300 | MEDIUM | automated | network_services |
| O19C-00-011500 | MEDIUM | automated | authorization |
| O19C-00-011600 | MEDIUM | automated | access_control |
| O19C-00-011700 | MEDIUM | automated | network_services |
| O19C-00-011800 | HIGH | automated | authorization |
| O19C-00-011900 | HIGH | automated | authentication |
| O19C-00-012000 | MEDIUM | automated | authentication |
| O19C-00-012100 | MEDIUM | automated | authentication |
| O19C-00-012200 | MEDIUM | automated | authorization |
| O19C-00-012300 | MEDIUM | automated | authentication |
| O19C-00-012400 | MEDIUM | automated | authentication |
| O19C-00-012500 | MEDIUM | automated | authentication |
| O19C-00-012900 | MEDIUM | automated | access_control |
| O19C-00-013000 | MEDIUM | automated | access_control |
| O19C-00-013100 | MEDIUM | automated | system_hardening |
| O19C-00-013200 | MEDIUM | automated | authorization |
| O19C-00-013300 | MEDIUM | automated | authorization |
| O19C-00-013400 | MEDIUM | automated | authorization |
| O19C-00-013500 | MEDIUM | manual | system_hardening |
| O19C-00-013700 | MEDIUM | automated | authentication |
| O19C-00-013800 | MEDIUM | automated | authentication |
| O19C-00-013900 | MEDIUM | automated | authentication |
| O19C-00-014600 | MEDIUM | automated | authentication |
| O19C-00-014700 | MEDIUM | manual | authentication |
| O19C-00-014800 | HIGH | automated | authentication |
| O19C-00-014900 | MEDIUM | automated | authentication |
| O19C-00-015200 | HIGH | automated | authentication |
| O19C-00-015300 | MEDIUM | automated | authentication |
| O19C-00-015400 | HIGH | manual | authentication |
| O19C-00-015500 | HIGH | automated | encryption |
| O19C-00-015600 | MEDIUM | automated | authentication |
| O19C-00-016000 | HIGH | automated | encryption |
| O19C-00-016100 | MEDIUM | automated | authorization |
| O19C-00-016700 | MEDIUM | automated | backup_recovery |
| O19C-00-016800 | HIGH | manual | encryption |
| O19C-00-016900 | MEDIUM | automated | authorization |
| O19C-00-017100 | MEDIUM | manual | logging |
| O19C-00-017400 | MEDIUM | automated | authorization |
| O19C-00-017600 | MEDIUM | automated | authorization |
| O19C-00-017700 | HIGH | manual | authorization |
| O19C-00-017900 | MEDIUM | automated | access_control |
| O19C-00-018000 | MEDIUM | automated | system_hardening |
| O19C-00-018100 | MEDIUM | automated | system_hardening |
| O19C-00-018300 | MEDIUM | automated | logging |
| O19C-00-018400 | MEDIUM | automated | authorization |
| O19C-00-018600 | HIGH | automated | logging |
| O19C-00-019800 | MEDIUM | automated | authentication |
| O19C-00-019900 | MEDIUM | automated | authentication |
| O19C-00-020400 | MEDIUM | automated | authentication |
| O19C-00-020500 | MEDIUM | automated | logging |
| O19C-00-020600 | MEDIUM | automated | logging |

## License

MIT

## Author

Fourth Estate
