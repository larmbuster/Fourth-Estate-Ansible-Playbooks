# cisco_aci_ndm_stig

Cisco ACI NDM DISA STIG V1 hardening role.

## STIG Reference

- **Title**: Cisco ACI NDM Security Technical Implementation Guide
- **Version**: 1
- **Release**: Release: 2 Benchmark Date: 05 Jan 2026
- **Benchmark ID**: Cisco_ACI_NDM_STIG
- **Total Rules**: 26 (CAT I: 7, CAT II: 19, CAT III: 0)

## Requirements

- Ansible >= 2.14
- Collection: `cisco.aci`
- Platform: Cisco ACI

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `authentication` -- Authentication (9 rules)
- `authorization` -- Authorization (2 rules)
- `encryption` -- Encryption (2 rules)
- `logging` -- Logging (7 rules)
- `network_services` -- Network Services (2 rules)
- `session_management` -- Session Management (1 rules)
- `system_hardening` -- System Hardening (3 rules)
- `cat1` -- All CAT I (high) findings (7 rules)
- `cat2` -- All CAT II (medium) findings (19 rules)
- `cat3` -- All CAT III (low) findings (0 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: aci_devices
  roles:
    - role: cisco_aci_ndm_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| CACI-ND-000001 | MEDIUM | automated | logging |
| CACI-ND-000002 | MEDIUM | automated | encryption |
| CACI-ND-000003 | MEDIUM | manual | authorization |
| CACI-ND-000004 | MEDIUM | automated | authentication |
| CACI-ND-000005 | HIGH | automated | system_hardening |
| CACI-ND-000006 | MEDIUM | automated | authentication |
| CACI-ND-000007 | MEDIUM | automated | authentication |
| CACI-ND-000008 | MEDIUM | manual | authentication |
| CACI-ND-000009 | HIGH | automated | authentication |
| CACI-ND-000011 | HIGH | automated | system_hardening |
| CACI-ND-000012 | HIGH | automated | authorization |
| CACI-ND-000014 | MEDIUM | automated | authentication |
| CACI-ND-000016 | HIGH | automated | logging |
| CACI-ND-000017 | MEDIUM | automated | logging |
| CACI-ND-000018 | MEDIUM | manual | logging |
| CACI-ND-000020 | MEDIUM | manual | logging |
| CACI-ND-000021 | MEDIUM | automated | network_services |
| CACI-ND-000024 | MEDIUM | automated | logging |
| CACI-ND-000029 | MEDIUM | manual | logging |
| CACI-ND-000043 | MEDIUM | automated | authentication |
| CACI-ND-000045 | MEDIUM | manual | authentication |
| CACI-ND-000051 | HIGH | automated | encryption |
| CACI-ND-000054 | HIGH | automated | session_management |
| CACI-ND-000056 | MEDIUM | manual | network_services |
| CACI-ND-000057 | MEDIUM | automated | system_hardening |
| CACI-ND-000060 | MEDIUM | automated | authentication |

## License

MIT

## Author

Fourth Estate
