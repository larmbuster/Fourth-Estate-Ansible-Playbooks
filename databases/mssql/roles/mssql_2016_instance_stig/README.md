# mssql_2016_instance_stig

MS SQL Server 2016 Instance DISA STIG V3 hardening role.

## STIG Reference

- **Title**: MS SQL Server 2016 Instance Security Technical Implementation Guide
- **Version**: 3
- **Release**: Release: 6 Benchmark Date: 05 Jan 2026
- **Benchmark ID**: MS_SQL_Server_2016_Instance_STIG
- **Total Rules**: 84 (CAT I: 13, CAT II: 69, CAT III: 2)

## Requirements

- Ansible >= 2.14
- Collection: `community.general`
- Platform: MS SQL Server 2016

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `authentication` -- Authentication (16 rules)
- `authorization` -- Authorization (30 rules)
- `encryption` -- Encryption (5 rules)
- `logging` -- Logging (13 rules)
- `network_services` -- Network Services (4 rules)
- `system_hardening` -- System Hardening (16 rules)
- `cat1` -- All CAT I (high) findings (13 rules)
- `cat2` -- All CAT II (medium) findings (69 rules)
- `cat3` -- All CAT III (low) findings (2 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: mssql_2016_servers
  roles:
    - role: mssql_2016_instance_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| SQL6-D0-003600 | MEDIUM | manual | authentication |
| SQL6-D0-003700 | HIGH | manual | authentication |
| SQL6-D0-003800 | MEDIUM | automated | network_services |
| SQL6-D0-003900 | HIGH | manual | authorization |
| SQL6-D0-004000 | MEDIUM | automated | logging |
| SQL6-D0-004100 | MEDIUM | automated | authorization |
| SQL6-D0-004200 | MEDIUM | automated | authentication |
| SQL6-D0-004300 | MEDIUM | automated | logging |
| SQL6-D0-004400 | MEDIUM | automated | authorization |
| SQL6-D0-004600 | MEDIUM | automated | authorization |
| SQL6-D0-004700 | MEDIUM | automated | logging |
| SQL6-D0-005500 | MEDIUM | automated | logging |
| SQL6-D0-005600 | MEDIUM | automated | logging |
| SQL6-D0-005700 | MEDIUM | automated | logging |
| SQL6-D0-005900 | MEDIUM | manual | authorization |
| SQL6-D0-006300 | MEDIUM | automated | authorization |
| SQL6-D0-006500 | MEDIUM | automated | authorization |
| SQL6-D0-006600 | MEDIUM | automated | network_services |
| SQL6-D0-006700 | HIGH | manual | authorization |
| SQL6-D0-006800 | MEDIUM | automated | system_hardening |
| SQL6-D0-006900 | MEDIUM | automated | system_hardening |
| SQL6-D0-007000 | MEDIUM | automated | system_hardening |
| SQL6-D0-007100 | MEDIUM | automated | system_hardening |
| SQL6-D0-007200 | MEDIUM | automated | authorization |
| SQL6-D0-007300 | MEDIUM | automated | authorization |
| SQL6-D0-007400 | MEDIUM | manual | system_hardening |
| SQL6-D0-007500 | MEDIUM | automated | authentication |
| SQL6-D0-007600 | MEDIUM | manual | system_hardening |
| SQL6-D0-007900 | HIGH | automated | authentication |
| SQL6-D0-008000 | MEDIUM | automated | system_hardening |
| SQL6-D0-008200 | HIGH | manual | authentication |
| SQL6-D0-008300 | HIGH | manual | encryption |
| SQL6-D0-008400 | HIGH | automated | encryption |
| SQL6-D0-008700 | HIGH | manual | encryption |
| SQL6-D0-008800 | MEDIUM | manual | authentication |
| SQL6-D0-009500 | HIGH | manual | authorization |
| SQL6-D0-009600 | MEDIUM | automated | authentication |
| SQL6-D0-009700 | MEDIUM | automated | authentication |
| SQL6-D0-009800 | MEDIUM | automated | authorization |
| SQL6-D0-009900 | MEDIUM | manual | system_hardening |
| SQL6-D0-010000 | MEDIUM | automated | authorization |
| SQL6-D0-010100 | MEDIUM | manual | authorization |
| SQL6-D0-010400 | MEDIUM | automated | authorization |
| SQL6-D0-010500 | MEDIUM | automated | authentication |
| SQL6-D0-010900 | MEDIUM | automated | logging |
| SQL6-D0-011000 | MEDIUM | automated | logging |
| SQL6-D0-011100 | MEDIUM | automated | logging |
| SQL6-D0-011200 | MEDIUM | manual | logging |
| SQL6-D0-011400 | MEDIUM | automated | authorization |
| SQL6-D0-011500 | MEDIUM | automated | authorization |
| SQL6-D0-011800 | MEDIUM | automated | authentication |
| SQL6-D0-012300 | MEDIUM | automated | system_hardening |
| SQL6-D0-012400 | MEDIUM | manual | network_services |
| SQL6-D0-012700 | MEDIUM | automated | system_hardening |
| SQL6-D0-012800 | MEDIUM | automated | system_hardening |
| SQL6-D0-013400 | MEDIUM | automated | authorization |
| SQL6-D0-013600 | MEDIUM | automated | authorization |
| SQL6-D0-013800 | MEDIUM | automated | logging |
| SQL6-D0-014200 | MEDIUM | automated | authorization |
| SQL6-D0-014800 | MEDIUM | manual | authentication |
| SQL6-D0-015500 | MEDIUM | automated | logging |
| SQL6-D0-015900 | MEDIUM | automated | logging |
| SQL6-D0-016000 | MEDIUM | automated | system_hardening |
| SQL6-D0-016100 | MEDIUM | automated | network_services |
| SQL6-D0-016200 | HIGH | automated | authentication |
| SQL6-D0-016300 | MEDIUM | automated | authentication |
| SQL6-D0-016400 | MEDIUM | manual | system_hardening |
| SQL6-D0-016500 | MEDIUM | automated | encryption |
| SQL6-D0-016600 | MEDIUM | automated | encryption |
| SQL6-D0-016700 | MEDIUM | automated | authorization |
| SQL6-D0-016800 | MEDIUM | automated | system_hardening |
| SQL6-D0-017000 | MEDIUM | automated | authorization |
| SQL6-D0-017100 | MEDIUM | automated | authorization |
| SQL6-D0-017200 | MEDIUM | automated | authorization |
| SQL6-D0-017400 | MEDIUM | automated | authorization |
| SQL6-D0-017500 | MEDIUM | automated | authorization |
| SQL6-D0-017600 | MEDIUM | automated | authorization |
| SQL6-D0-017700 | MEDIUM | automated | authorization |
| SQL6-D0-017800 | LOW | manual | system_hardening |
| SQL6-D0-017900 | MEDIUM | automated | authorization |
| SQL6-D0-018000 | LOW | manual | authorization |
| SQL6-D0-018100 | HIGH | manual | authentication |
| SQL6-D0-018200 | HIGH | automated | authentication |
| SQL6-D0-018300 | HIGH | automated | system_hardening |

## License

MIT

## Author

Fourth Estate
