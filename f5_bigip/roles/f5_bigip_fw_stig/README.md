# f5_bigip_fw_stig

F5 BIG-IP Firewall DISA STIG V1 hardening role.

## STIG Reference

- **Title**: F5 BIG-IP TMOS Firewall Security Technical Implementation Guide
- **Version**: 1
- **Release**: Release: 1 Benchmark Date: 26 Sep 2024
- **Benchmark ID**: F5_BIG-IP_TMOS_FW_STIG
- **Total Rules**: 14 (CAT I: 3, CAT II: 9, CAT III: 2)

## Requirements

- Ansible >= 2.14
- Collection: `f5networks.f5_modules`
- Platform: F5 BIG-IP

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `access_control` -- Access Control (10 rules)
- `authorization` -- Authorization (1 rules)
- `logging` -- Logging (3 rules)
- `cat1` -- All CAT I (high) findings (3 rules)
- `cat2` -- All CAT II (medium) findings (9 rules)
- `cat3` -- All CAT III (low) findings (2 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: f5_bigip_devices
  roles:
    - role: f5_bigip_fw_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| F5BI-FW-300001 | MEDIUM | automated | access_control |
| F5BI-FW-300002 | HIGH | automated | access_control |
| F5BI-FW-300005 | MEDIUM | automated | access_control |
| F5BI-FW-300012 | LOW | automated | logging |
| F5BI-FW-300013 | MEDIUM | automated | logging |
| F5BI-FW-300015 | MEDIUM | automated | access_control |
| F5BI-FW-300017 | HIGH | automated | authorization |
| F5BI-FW-300020 | HIGH | automated | access_control |
| F5BI-FW-300021 | LOW | automated | logging |
| F5BI-FW-300028 | MEDIUM | manual | access_control |
| F5BI-FW-300029 | MEDIUM | automated | access_control |
| F5BI-FW-300030 | MEDIUM | automated | access_control |
| F5BI-FW-300031 | MEDIUM | automated | access_control |
| F5BI-FW-300033 | MEDIUM | automated | access_control |

## License

MIT

## Author

Fourth Estate
