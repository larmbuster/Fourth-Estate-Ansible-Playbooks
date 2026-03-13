# cisco_asa_vpn_stig

Cisco ASA VPN DISA STIG V2 hardening role.

## STIG Reference

- **Title**: Cisco ASA VPN Security Technical Implementation Guide
- **Version**: 2
- **Release**: Release: 2 Benchmark Date: 24 Oct 2024
- **Benchmark ID**: Cisco_ASA_VPN_STIG
- **Total Rules**: 41 (CAT I: 10, CAT II: 28, CAT III: 3)

## Requirements

- Ansible >= 2.14
- Collection: `cisco.asa`
- Platform: Cisco ASA

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `authentication` -- Authentication (8 rules)
- `encryption` -- Encryption (23 rules)
- `logging` -- Logging (9 rules)
- `session_management` -- Session Management (1 rules)
- `cat1` -- All CAT I (high) findings (10 rules)
- `cat2` -- All CAT II (medium) findings (28 rules)
- `cat3` -- All CAT III (low) findings (3 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: asa_devices
  roles:
    - role: cisco_asa_vpn_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| CASA-VN-000010 | LOW | automated | logging |
| CASA-VN-000020 | LOW | automated | logging |
| CASA-VN-000080 | MEDIUM | automated | logging |
| CASA-VN-000090 | MEDIUM | automated | logging |
| CASA-VN-000120 | MEDIUM | automated | authentication |
| CASA-VN-000150 | HIGH | automated | encryption |
| CASA-VN-000160 | MEDIUM | automated | encryption |
| CASA-VN-000170 | MEDIUM | automated | encryption |
| CASA-VN-000180 | MEDIUM | automated | encryption |
| CASA-VN-000190 | MEDIUM | automated | encryption |
| CASA-VN-000200 | MEDIUM | automated | encryption |
| CASA-VN-000210 | HIGH | automated | encryption |
| CASA-VN-000230 | MEDIUM | automated | encryption |
| CASA-VN-000240 | HIGH | automated | encryption |
| CASA-VN-000300 | MEDIUM | automated | encryption |
| CASA-VN-000310 | MEDIUM | automated | encryption |
| CASA-VN-000340 | HIGH | automated | encryption |
| CASA-VN-000350 | MEDIUM | automated | encryption |
| CASA-VN-000360 | MEDIUM | automated | encryption |
| CASA-VN-000390 | MEDIUM | automated | authentication |
| CASA-VN-000400 | MEDIUM | automated | authentication |
| CASA-VN-000410 | MEDIUM | automated | authentication |
| CASA-VN-000440 | HIGH | automated | authentication |
| CASA-VN-000450 | MEDIUM | automated | authentication |
| CASA-VN-000460 | MEDIUM | automated | session_management |
| CASA-VN-000500 | MEDIUM | automated | logging |
| CASA-VN-000510 | MEDIUM | automated | logging |
| CASA-VN-000520 | LOW | automated | logging |
| CASA-VN-000530 | MEDIUM | automated | logging |
| CASA-VN-000550 | HIGH | automated | encryption |
| CASA-VN-000560 | MEDIUM | automated | encryption |
| CASA-VN-000610 | MEDIUM | automated | encryption |
| CASA-VN-000630 | MEDIUM | automated | encryption |
| CASA-VN-000640 | HIGH | automated | encryption |
| CASA-VN-000650 | HIGH | automated | encryption |
| CASA-VN-000660 | MEDIUM | automated | authentication |
| CASA-VN-000700 | MEDIUM | automated | encryption |
| CASA-VN-000720 | MEDIUM | automated | logging |
| CASA-VN-000730 | MEDIUM | automated | encryption |
| CASA-VN-000760 | HIGH | automated | encryption |
| CASA-VN-000130 | HIGH | automated | authentication |

## License

MIT

## Author

Fourth Estate
