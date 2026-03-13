# f5_bigip_dns_stig

F5 BIG-IP DNS DISA STIG V1 hardening role.

## STIG Reference

- **Title**: F5 BIG-IP TMOS DNS Security Technical Implementation Guide
- **Version**: 1
- **Release**: Release: 1 Benchmark Date: 26 Sep 2024
- **Benchmark ID**: F5_BIG-IP_TMOS_DNS_STIG
- **Total Rules**: 12 (CAT I: 2, CAT II: 10, CAT III: 0)

## Requirements

- Ansible >= 2.14
- Collection: `f5networks.f5_modules`
- Platform: F5 BIG-IP

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `access_control` -- Access Control (1 rules)
- `authentication` -- Authentication (1 rules)
- `network_services` -- Network Services (9 rules)
- `session_management` -- Session Management (1 rules)
- `cat1` -- All CAT I (high) findings (2 rules)
- `cat2` -- All CAT II (medium) findings (10 rules)
- `cat3` -- All CAT III (low) findings (0 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: f5_bigip_devices
  roles:
    - role: f5_bigip_dns_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| F5BI-DN-300011 | MEDIUM | automated | network_services |
| F5BI-DN-300012 | MEDIUM | automated | network_services |
| F5BI-DN-300013 | MEDIUM | automated | network_services |
| F5BI-DN-300014 | MEDIUM | automated | network_services |
| F5BI-DN-300015 | MEDIUM | automated | network_services |
| F5BI-DN-300016 | MEDIUM | automated | network_services |
| F5BI-DN-300017 | HIGH | automated | authentication |
| F5BI-DN-300020 | MEDIUM | automated | network_services |
| F5BI-DN-300028 | MEDIUM | automated | network_services |
| F5BI-DN-300030 | MEDIUM | automated | network_services |
| F5BI-DN-300036 | HIGH | automated | session_management |
| F5BI-DN-300039 | MEDIUM | automated | access_control |

## License

MIT

## Author

Fourth Estate
