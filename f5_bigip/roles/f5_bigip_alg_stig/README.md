# f5_bigip_alg_stig

F5 BIG-IP ALG DISA STIG V1 hardening role.

## STIG Reference

- **Title**: F5 BIG-IP TMOS ALG Security Technical Implementation Guide
- **Version**: 1
- **Release**: Release: 2 Benchmark Date: 02 Jul 2025
- **Benchmark ID**: F5_BIG-IP_TMOS_ALG_STIG
- **Total Rules**: 37 (CAT I: 9, CAT II: 23, CAT III: 5)

## Requirements

- Ansible >= 2.14
- Collection: `f5networks.f5_modules`
- Platform: F5 BIG-IP

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `access_control` -- Access Control (4 rules)
- `authentication` -- Authentication (8 rules)
- `authorization` -- Authorization (3 rules)
- `encryption` -- Encryption (4 rules)
- `logging` -- Logging (2 rules)
- `network_services` -- Network Services (5 rules)
- `session_management` -- Session Management (5 rules)
- `system_hardening` -- System Hardening (6 rules)
- `cat1` -- All CAT I (high) findings (9 rules)
- `cat2` -- All CAT II (medium) findings (23 rules)
- `cat3` -- All CAT III (low) findings (5 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: f5_bigip_devices
  roles:
    - role: f5_bigip_alg_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| F5BI-AP-300001 | MEDIUM | automated | session_management |
| F5BI-AP-300002 | MEDIUM | automated | system_hardening |
| F5BI-AP-300003 | HIGH | automated | encryption |
| F5BI-AP-300006 | MEDIUM | automated | authentication |
| F5BI-AP-300007 | MEDIUM | automated | access_control |
| F5BI-AP-300008 | MEDIUM | automated | access_control |
| F5BI-AP-300012 | HIGH | automated | authorization |
| F5BI-AP-300013 | HIGH | automated | authorization |
| F5BI-AP-300015 | MEDIUM | manual | authorization |
| F5BI-AP-300018 | MEDIUM | automated | logging |
| F5BI-AP-300041 | MEDIUM | automated | system_hardening |
| F5BI-AP-300042 | MEDIUM | automated | network_services |
| F5BI-AP-300043 | MEDIUM | manual | network_services |
| F5BI-AP-300045 | HIGH | automated | system_hardening |
| F5BI-AP-300047 | HIGH | automated | authentication |
| F5BI-AP-300052 | HIGH | automated | authentication |
| F5BI-AP-300054 | MEDIUM | automated | authentication |
| F5BI-AP-300056 | HIGH | automated | session_management |
| F5BI-AP-300059 | MEDIUM | automated | network_services |
| F5BI-AP-300061 | MEDIUM | automated | network_services |
| F5BI-AP-300064 | MEDIUM | automated | system_hardening |
| F5BI-AP-300065 | MEDIUM | automated | logging |
| F5BI-AP-300068 | MEDIUM | automated | access_control |
| F5BI-AP-300069 | MEDIUM | automated | access_control |
| F5BI-AP-300151 | LOW | automated | network_services |
| F5BI-AP-300152 | LOW | automated | system_hardening |
| F5BI-AP-300153 | LOW | automated | system_hardening |
| F5BI-AP-300154 | HIGH | automated | authentication |
| F5BI-AP-300155 | MEDIUM | manual | authentication |
| F5BI-AP-300156 | MEDIUM | automated | session_management |
| F5BI-AP-300157 | LOW | manual | authentication |
| F5BI-AP-300159 | HIGH | automated | encryption |
| F5BI-AP-300160 | MEDIUM | automated | authentication |
| F5BI-AP-300161 | MEDIUM | manual | encryption |
| F5BI-AP-300162 | MEDIUM | manual | session_management |
| F5BI-AP-300163 | MEDIUM | automated | encryption |
| F5BI-AP-300164 | LOW | manual | session_management |

## License

MIT

## Author

Fourth Estate
