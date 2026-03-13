# mssql_2022_instance_stig

MS SQL Server 2022 Instance DISA STIG V1 hardening role.

## STIG Reference

- **Title**: Microsoft SQL Server 2022 Instance Security Technical Implementation Guide
- **Version**: 1
- **Release**: Release: 3 Benchmark Date: 05 Jan 2026
- **Benchmark ID**: MS_SQL_Server_2022_Instance_STIG
- **Total Rules**: 80 (CAT I: 14, CAT II: 66, CAT III: 0)

## Requirements

- Ansible >= 2.14
- Collection: `community.general`
- Platform: MS SQL Server 2022

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `authentication` -- Authentication (16 rules)
- `authorization` -- Authorization (21 rules)
- `encryption` -- Encryption (4 rules)
- `logging` -- Logging (13 rules)
- `network_services` -- Network Services (6 rules)
- `routing` -- Routing (1 rules)
- `system_hardening` -- System Hardening (19 rules)
- `cat1` -- All CAT I (high) findings (14 rules)
- `cat2` -- All CAT II (medium) findings (66 rules)
- `cat3` -- All CAT III (low) findings (0 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: mssql_2022_servers
  roles:
    - role: mssql_2022_instance_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| SQLI-22-003600 | MEDIUM | manual | authentication |
| SQLI-22-003800 | HIGH | automated | network_services |
| SQLI-22-003700 | HIGH | manual | authentication |
| SQLI-22-003900 | HIGH | manual | authorization |
| SQLI-22-004200 | MEDIUM | automated | authentication |
| SQLI-22-004100 | MEDIUM | automated | authorization |
| SQLI-22-004000 | MEDIUM | automated | logging |
| SQLI-22-004300 | MEDIUM | automated | logging |
| SQLI-22-004400 | MEDIUM | automated | authorization |
| SQLI-22-004600 | MEDIUM | automated | logging |
| SQLI-22-004700 | MEDIUM | automated | logging |
| SQLI-22-005500 | MEDIUM | automated | logging |
| SQLI-22-005900 | MEDIUM | manual | authorization |
| SQLI-22-006300 | MEDIUM | automated | authorization |
| SQLI-22-006600 | MEDIUM | automated | network_services |
| SQLI-22-006500 | MEDIUM | automated | authorization |
| SQLI-22-006700 | HIGH | manual | authorization |
| SQLI-22-006800 | MEDIUM | automated | system_hardening |
| SQLI-22-006900 | MEDIUM | automated | system_hardening |
| SQLI-22-007000 | MEDIUM | automated | system_hardening |
| SQLI-22-017900 | MEDIUM | automated | system_hardening |
| SQLI-22-017700 | MEDIUM | automated | routing |
| SQLI-22-017600 | MEDIUM | automated | logging |
| SQLI-22-017500 | MEDIUM | automated | system_hardening |
| SQLI-22-017400 | MEDIUM | automated | system_hardening |
| SQLI-22-017200 | MEDIUM | automated | authorization |
| SQLI-22-007500 | MEDIUM | automated | authentication |
| SQLI-22-007400 | MEDIUM | manual | system_hardening |
| SQLI-22-007300 | MEDIUM | automated | authorization |
| SQLI-22-007200 | MEDIUM | automated | system_hardening |
| SQLI-22-007700 | MEDIUM | manual | system_hardening |
| SQLI-22-007600 | MEDIUM | manual | system_hardening |
| SQLI-22-007800 | MEDIUM | automated | authentication |
| SQLI-22-008000 | HIGH | automated | network_services |
| SQLI-22-007900 | HIGH | automated | authentication |
| SQLI-22-008200 | HIGH | manual | authentication |
| SQLI-22-008300 | HIGH | manual | encryption |
| SQLI-22-018100 | HIGH | manual | authentication |
| SQLI-22-008700 | HIGH | automated | encryption |
| SQLI-22-009700 | HIGH | automated | authentication |
| SQLI-22-009600 | HIGH | automated | authentication |
| SQLI-22-009500 | HIGH | manual | authorization |
| SQLI-22-009900 | MEDIUM | manual | authorization |
| SQLI-22-009800 | MEDIUM | automated | authorization |
| SQLI-22-010000 | MEDIUM | automated | authorization |
| SQLI-22-010010 | MEDIUM | automated | system_hardening |
| SQLI-22-010020 | MEDIUM | automated | system_hardening |
| SQLI-22-010100 | MEDIUM | manual | authorization |
| SQLI-22-010400 | MEDIUM | automated | authorization |
| SQLI-22-010500 | MEDIUM | automated | authentication |
| SQLI-22-010900 | MEDIUM | automated | logging |
| SQLI-22-011000 | MEDIUM | automated | logging |
| SQLI-22-011100 | MEDIUM | automated | logging |
| SQLI-22-011200 | MEDIUM | manual | logging |
| SQLI-22-011500 | MEDIUM | automated | authorization |
| SQLI-22-011400 | MEDIUM | automated | authorization |
| SQLI-22-011800 | MEDIUM | automated | network_services |
| SQLI-22-012400 | MEDIUM | manual | logging |
| SQLI-22-012300 | MEDIUM | automated | authorization |
| SQLI-22-012600 | MEDIUM | automated | system_hardening |
| SQLI-22-012800 | MEDIUM | automated | system_hardening |
| SQLI-22-018300 | HIGH | automated | system_hardening |
| SQLI-22-013800 | MEDIUM | automated | network_services |
| SQLI-22-014800 | MEDIUM | manual | authentication |
| SQLI-22-015500 | MEDIUM | automated | logging |
| SQLI-22-015900 | MEDIUM | automated | logging |
| SQLI-22-017800 | MEDIUM | manual | system_hardening |
| SQLI-22-016100 | MEDIUM | automated | network_services |
| SQLI-22-016000 | MEDIUM | automated | system_hardening |
| SQLI-22-019500 | MEDIUM | automated | authentication |
| SQLI-22-016200 | MEDIUM | automated | authentication |
| SQLI-22-016300 | MEDIUM | automated | authentication |
| SQLI-22-016400 | MEDIUM | manual | system_hardening |
| SQLI-22-016500 | MEDIUM | automated | encryption |
| SQLI-22-016600 | MEDIUM | automated | encryption |
| SQLI-22-016700 | MEDIUM | automated | authorization |
| SQLI-22-016800 | MEDIUM | automated | system_hardening |
| SQLI-22-017000 | MEDIUM | automated | authorization |
| SQLI-22-017100 | MEDIUM | automated | authorization |
| SQLI-22-004250 | MEDIUM | manual | authentication |

## License

MIT

## Author

Fourth Estate
