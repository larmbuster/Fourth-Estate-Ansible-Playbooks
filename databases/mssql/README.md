# MS SQL Server DISA STIG Automation

DISA STIG hardening automation for MS SQL Server 2016 and 2022.

## Roles

| Role | STIG | Rules |
|---|---|---|
| `mssql_2022_instance_stig` | MS SQL Server 2022 Instance V1R3 | 80 |
| `mssql_2022_database_stig` | MS SQL Server 2022 Database V1R2 | 22 |
| `mssql_2016_instance_stig` | MS SQL Server 2016 Instance V3R6 | 84 |
| `mssql_2016_database_stig` | MS SQL Server 2016 Database V3R4 | 23 |

## Quick Start

1. Install collections: `ansible-galaxy collection install -r requirements.yml`
2. Copy inventory: `cp inventory.example inventory`
3. Edit inventory with your hosts
4. Run: `ansible-playbook -i inventory stig_site.yml`

## Tags

- `cat1` -- All CAT I (high severity) findings
- `cat2` -- All CAT II (medium severity) findings
- `cat3` -- All CAT III (low severity) findings
- Individual STIG IDs (e.g., `SQL6-D0-015500`)

## License

MIT

## Author

Fourth Estate
