# f5_bigip_vpn_stig

F5 BIG-IP VPN DISA STIG V1 hardening role.

## STIG Reference

- **Title**: F5 BIG-IP TMOS VPN Security Technical Implementation Guide
- **Version**: 1
- **Release**: Release: 1 Benchmark Date: 26 Sep 2024
- **Benchmark ID**: F5_BIG-IP_TMOS_VPN_STIG
- **Total Rules**: 12 (CAT I: 8, CAT II: 4, CAT III: 0)

## Requirements

- Ansible >= 2.14
- Collection: `f5networks.f5_modules`
- Platform: F5 BIG-IP

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `authentication` -- Authentication (1 rules)
- `encryption` -- Encryption (11 rules)
- `cat1` -- All CAT I (high) findings (8 rules)
- `cat2` -- All CAT II (medium) findings (4 rules)
- `cat3` -- All CAT III (low) findings (0 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: f5_bigip_devices
  roles:
    - role: f5_bigip_vpn_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| F5BI-VN-300004 | HIGH | automated | encryption |
| F5BI-VN-300005 | HIGH | automated | encryption |
| F5BI-VN-300006 | HIGH | automated | encryption |
| F5BI-VN-300009 | HIGH | automated | encryption |
| F5BI-VN-300021 | HIGH | automated | encryption |
| F5BI-VN-300024 | MEDIUM | automated | encryption |
| F5BI-VN-300025 | MEDIUM | automated | encryption |
| F5BI-VN-300026 | MEDIUM | automated | encryption |
| F5BI-VN-300033 | HIGH | automated | authentication |
| F5BI-VN-300040 | HIGH | automated | encryption |
| F5BI-VN-300041 | HIGH | automated | encryption |
| F5BI-VN-300044 | MEDIUM | automated | encryption |

## License

MIT

## Author

Fourth Estate
