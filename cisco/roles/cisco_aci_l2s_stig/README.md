# cisco_aci_l2s_stig

Cisco ACI L2S DISA STIG V1 hardening role.

## STIG Reference

- **Title**: Cisco ACI Layer 2 Switch Security Technical Implementation Guide
- **Version**: 1
- **Release**: Release: 2 Benchmark Date: 05 Jan 2026
- **Benchmark ID**: Cisco_ACI_L2S_STIG
- **Total Rules**: 7 (CAT I: 1, CAT II: 4, CAT III: 2)

## Requirements

- Ansible >= 2.14
- Collection: `cisco.aci`
- Platform: Cisco ACI

## Role Variables

See `defaults/main.yml` for all configurable variables.
See `vars/main.yml` for STIG constants.

## Tags

- `authentication` -- Authentication (1 rules)
- `switching` -- Switching (6 rules)
- `cat1` -- All CAT I (high) findings (1 rules)
- `cat2` -- All CAT II (medium) findings (4 rules)
- `cat3` -- All CAT III (low) findings (2 rules)

## Dependencies

None.

## Example Playbook

```yaml
- hosts: aci_devices
  roles:
    - role: cisco_aci_l2s_stig
```

## Rule Coverage

| STIG ID | Severity | Type | Theme |
|---|---|---|---|
| CACI-L2-000001 | HIGH | automated | switching |
| CACI-L2-000004 | MEDIUM | automated | authentication |
| CACI-L2-000005 | MEDIUM | manual | switching |
| CACI-L2-000009 | MEDIUM | manual | switching |
| CACI-L2-000010 | LOW | automated | switching |
| CACI-L2-000011 | LOW | automated | switching |
| CACI-L2-000017 | MEDIUM | automated | switching |

## License

MIT

## Author

Fourth Estate
