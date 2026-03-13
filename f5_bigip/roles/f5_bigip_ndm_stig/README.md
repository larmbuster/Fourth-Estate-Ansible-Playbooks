# f5_bigip_ndm_stig

F5 BIG-IP NDM DISA STIG V1 hardening role.

## STIG Reference

- **Title**: F5 BIG-IP TMOS NDM Security Technical Implementation Guide
- **Version**: 1
- **Release**: Release: 2 Benchmark Date: 02 Jul 2025
- **Benchmark ID**: F5_BIG-IP_TMOS_NDM_STIG
- **Total Rules**: 29 (CAT I: 8, CAT II: 20, CAT III: 1)

## Requirements

- Ansible >= 2.14
- Collection: `f5networks.f5_modules`
- Platform: F5 BIG-IP

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `authentication` -- Authentication (16 rules)
- `authorization` -- Authorization (2 rules)
- `logging` -- Logging (5 rules)
- `session_management` -- Session Management (3 rules)
- `system_hardening` -- System Hardening (3 rules)
- `cat1` -- All CAT I (high) findings (8 rules)
- `cat2` -- All CAT II (medium) findings (20 rules)
- `cat3` -- All CAT III (low) findings (1 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: f5_bigip_devices
  roles:
    - role: f5_bigip_ndm_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| F5BI-DM-300001 | MEDIUM | automated | session_management |
| F5BI-DM-300003 | MEDIUM | automated | authentication |
| F5BI-DM-300009 | MEDIUM | automated | authentication |
| F5BI-DM-300010 | HIGH | automated | authentication |
| F5BI-DM-300012 | MEDIUM | automated | logging |
| F5BI-DM-300013 | MEDIUM | automated | authentication |
| F5BI-DM-300014 | MEDIUM | manual | authorization |
| F5BI-DM-300033 | LOW | automated | logging |
| F5BI-DM-300034 | HIGH | automated | logging |
| F5BI-DM-300037 | MEDIUM | automated | logging |
| F5BI-DM-300039 | MEDIUM | automated | system_hardening |
| F5BI-DM-300040 | HIGH | automated | authentication |
| F5BI-DM-300041 | HIGH | automated | system_hardening |
| F5BI-DM-300044 | MEDIUM | automated | authentication |
| F5BI-DM-300045 | HIGH | automated | system_hardening |
| F5BI-DM-300046 | HIGH | automated | authentication |
| F5BI-DM-300048 | MEDIUM | automated | authentication |
| F5BI-DM-300049 | MEDIUM | automated | authentication |
| F5BI-DM-300050 | MEDIUM | automated | authentication |
| F5BI-DM-300051 | MEDIUM | automated | authentication |
| F5BI-DM-300052 | MEDIUM | automated | authentication |
| F5BI-DM-300053 | MEDIUM | automated | authentication |
| F5BI-DM-300054 | MEDIUM | automated | authentication |
| F5BI-DM-300055 | MEDIUM | automated | authentication |
| F5BI-DM-300056 | HIGH | automated | authentication |
| F5BI-DM-300057 | HIGH | automated | session_management |
| F5BI-DM-300060 | MEDIUM | manual | logging |
| F5BI-DM-300098 | MEDIUM | manual | authorization |
| F5BI-DM-300099 | MEDIUM | automated | session_management |

## License

MIT

## Author

Fourth Estate
