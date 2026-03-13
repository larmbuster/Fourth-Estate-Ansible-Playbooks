# DISA STIG Ansible Role Planning Guide

This guide provides a repeatable process for creating Ansible roles that automate DISA STIG compliance. It is vendor-agnostic and can be applied to any STIG XCCDF XML file.

---

## Step 1: Parse the STIG XML File

Each DISA STIG is published as an XCCDF 1.1 XML file. Extract the following from the XML:

- **Benchmark title and version** from `<title>` and `<version>`.
- **Release info** from `<plain-text id="release-info">`.
- **Total rule count** by counting `<Group id="V-XXXXXX">` elements.
- **Severity breakdown** by counting `severity="high"`, `severity="medium"`, and `severity="low"` attributes on `<Rule>` elements.

For each rule, extract:

- **V-number** from `<Group id="V-XXXXXX">`.
- **STIG ID** from `<Rule><version>` (e.g., `CISC-ND-000160`, `WN11-CC-000005`).
- **Severity** from the `severity` attribute (`high` = CAT I, `medium` = CAT II, `low` = CAT III).
- **Rule title** from `<Rule><title>`.
- **Fix text** from `<fixtext>` -- this describes the remediation steps.
- **Check content** from `<check-content>` -- this describes how to verify compliance.

Use the total rule count as the verification gate: the number of tasks across all category files must equal this count.

---

## Step 2: Classify Each Rule

Categorize every rule into one of three task types:

### Type 1: Automated Remediation

The rule can be fully implemented with an Ansible module. This is the preferred type. Example: setting a banner, configuring NTP, enforcing a password policy.

### Type 2: Verification Only

The rule can be checked but not automatically remediated. Examples: firmware version validation, hardware TPM checks, license verification. These tasks gather information and display it.

### Type 3: Manual Check

The rule cannot be automated at all. Examples: physical security inspections, organizational policy reviews, process-based controls. These tasks print a reminder message.

---

## Step 3: Group Rules by Theme

Organize rules into task files by functional category rather than by severity. Common STIG categories include:

- **Authentication / AAA** -- user accounts, password policy, lockout, MFA, AAA servers
- **Logging / Auditing** -- syslog, audit trails, log retention, timestamps
- **Session Management** -- timeouts, concurrent session limits
- **Banner / Legal Notice** -- login banners, MOTD
- **Access Control** -- ACLs, firewall rules, privilege restrictions
- **Network Services** -- NTP, SNMP, DNS configuration
- **Encryption / TLS** -- cipher suites, certificates, key management
- **Configuration Management** -- unnecessary services, patching, backup, feature toggles

Severity is tracked via tags (`cat1`, `cat2`, `cat3`) on individual tasks, not via file organization.

---

## Step 4: Research Ansible Modules

For each rule category, identify the best Ansible module:

1. **Prefer vendor-specific collection modules** over generic ones. These are idempotent and support check mode.
2. **Use `ansible.builtin.lineinfile`** or **`ansible.builtin.blockinfile`** for config file edits.
3. **Use `ansible.builtin.copy` with `content:`** to create config files inline from variables.
4. **Avoid `command` and `shell` modules** unless no alternative exists. When unavoidable, always include `changed_when` and `failed_when`.

---

## Step 5: Create the Role

### Directory Structure

```
<role_name>/
  defaults/main.yml         # Overridable variables (STIG-compliant defaults)
  vars/main.yml             # Fixed constants (STIG version, date, benchmark ID, total rules)
  handlers/main.yml         # Platform-specific handler (save config / commit / reboot)
  meta/main.yml             # galaxy_info, dependencies
  meta/argument_specs.yml   # Variable type/default/description validation
  tasks/main.yml            # Pre-flight assert + import_tasks by category
  tasks/<category>.yml      # Rules grouped by STIG theme
  README.md                 # Role documentation
```

Do NOT create `templates/` or `files/` directories. All content is managed inline through variables, `copy` with `content:`, `lineinfile`, or `blockinfile`.

### tasks/main.yml

```yaml
---
# =========================================
# <Product> DISA STIG <Version> - Task Orchestrator
# Imports all category task files with tags
# for selective execution (import_tasks enables
# individual STIG ID tag filtering).
#
# Usage:
#   --tags <category>          <PREFIX>-XX-* (N rules)
#   --tags cat1                All CAT I (high) findings
#   --tags cat2                All CAT II (medium) findings
#   --tags cat3                All CAT III (low) findings
#   --tags <PREFIX>-XX-NNNNNN  Single specific finding
# =========================================

- name: "Pre-flight | Verify target is a <platform description>"
  ansible.builtin.assert:
    that:
      - <platform-specific assertions>
    fail_msg: >-
      This role targets <platform> only.
    quiet: true
  tags:
    - always

- name: "<PREFIX>-XX | <Category Name>"
  ansible.builtin.import_tasks: <category>.yml
  tags:
    - <category_tag>
    - <prefix_tag>
```

Use `import_tasks` (static), never `include_tasks` (dynamic), so that tags on individual tasks work with `--tags` and `--skip-tags`.

### Individual Task Patterns

**Type 1 -- Automated Remediation:**

```yaml
# -----------------------------------------
# <STIG-ID> - <SEVERITY>
# -----------------------------------------

- name: "<STIG-ID> | <Rule title from XCCDF>"
  <vendor.collection.module>:
    <parameter>: "{{ <role_prefix>_<variable> }}"
  tags:
    - <STIG-ID>
    - cat1|cat2|cat3
    - <category_tag>
  notify: <handler_name>
```

**Type 2 -- Verification Only:**

```yaml
# -----------------------------------------
# <STIG-ID> - <SEVERITY>
# -----------------------------------------

- name: "<STIG-ID> | <Rule title>"
  <vendor.collection.module>:
    <gather info parameters>
  register: <stig_id_snake>_result
  check_mode: false
  failed_when: false
  tags:
    - <STIG-ID>
    - cat1|cat2|cat3
    - <category_tag>

- name: "<STIG-ID> | Display result"
  ansible.builtin.debug:
    msg: "<Context>: {{ <stig_id_snake>_result.<field> | default('UNKNOWN') }}"
  tags:
    - <STIG-ID>
    - cat1|cat2|cat3
    - <category_tag>
```

**Type 3 -- Manual Check:**

```yaml
# -----------------------------------------
# <STIG-ID> - <SEVERITY>
# -----------------------------------------

- name: "<STIG-ID> | MANUAL CHECK - <description>"
  ansible.builtin.debug:
    msg: "MANUAL CHECK: <guidance from STIG fixtext>"
  tags:
    - <STIG-ID>
    - cat1|cat2|cat3
    - <category_tag>
```

### defaults/main.yml

Group variables by category with section headers. Document each variable with its STIG rule ID. All values pre-set to STIG-compliant defaults.

```yaml
---
# =========================================
# <Product> DISA STIG <Version> - Default Variables
# Override these in group_vars, host_vars,
# or via -e on the command line.
# All values are pre-set to STIG-compliant defaults.
# =========================================

# -----------------------------------------
# <Category Name> (<PREFIX>-XX)
# -----------------------------------------

# <STIG-ID>: <what this variable controls>. STIG minimum/maximum: <value>
<role_prefix>_<descriptive_name>: <stig_compliant_default>
```

Common overridable variables for STIG roles:

- Banner/legal notice text (full DoD banner as a multi-line string)
- Password policy values (min length, complexity, lockout threshold, lockout duration)
- Session timeout values
- Syslog server addresses and ports
- NTP server addresses and authentication keys
- SNMP v3 user definitions
- SSH cipher and MAC algorithm lists
- TLS minimum version
- Audit trail destinations and retention settings
- Feature enable/disable toggles
- Behavior flags (`<prefix>_auto_save`, `<prefix>_auto_commit`, `<prefix>_auto_reboot`)

### vars/main.yml

Fixed constants that should not be overridden:

```yaml
---
# =========================================
# <Product> DISA STIG <Version> - Internal Variables
# These are STIG-mandated constants that should
# not normally be overridden.
# =========================================

<role_prefix>_stig_version: "<Version>"
<role_prefix>_stig_release_info: "<release-info>"
<role_prefix>_stig_benchmark_id: "<id>"
<role_prefix>_stig_total_rules: <count>
```

### meta/main.yml

```yaml
---
galaxy_info:
  role_name: <role_name>
  author: Fourth Estate
  description: >-
    <Product> DISA STIG <Version> hardening role.
    Implements <N> XCCDF rules across <list of categories>.
  license: MIT
  min_ansible_version: "2.14"
  platforms:
    - name: <platform_name>
      versions:
        - "<version>"
  galaxy_tags:
    - <vendor>
    - stig
    - disa
    - hardening
    - security
    - compliance

dependencies: []
```

### meta/argument_specs.yml

Every overridable variable gets a typed spec:

```yaml
---
argument_specs:
  main:
    short_description: <Product> DISA STIG <Version> hardening
    description:
      - <One-liner about what the role does>
    options:
      <role_prefix>_<variable_name>:
        type: <int|str|bool|list>
        default: <value>
        description: <STIG rule context and acceptable values>
```

### handlers/main.yml

One or two handlers maximum, gated by a boolean variable:

```yaml
---
- name: <Action description>
  <vendor.collection.module>:
    <parameters>
  when: <role_prefix>_auto_<action> | default(false) | bool
```

---

## Step 6: Create Supporting Files

### stig_site.yml

Two plays: role application and summary.

```yaml
---
# =========================================
# <Product> DISA STIG <Version> Hardening Playbook
#
# Usage:
#   ansible-galaxy collection install -r requirements.yml
#   ansible-playbook -i inventory stig_site.yml
#
# Tags:
#   - <category>:          <PREFIX>-XX-* <Category> (N rules)
#   - cat1:                All CAT I (high) findings
#   - cat2:                All CAT II (medium) findings
#   - cat3:                All CAT III (low) findings
#   - <PREFIX>-XX-NNNNNN:  Any single STIG finding by ID
# =========================================

- name: <Product> DISA STIG <Version> Hardening
  hosts: <host_group>
  gather_facts: <true|false>

  roles:
    - role: <role_name>

# =========================================
# Summary Play
# =========================================

- name: STIG Hardening Summary
  hosts: <host_group>
  gather_facts: false
  tags:
    - always

  tasks:
    - name: Display hardening summary
      ansible.builtin.debug:
        msg:
          - "================================================"
          - "<Product> DISA STIG <Version> hardening complete"
          - "Target: {{ inventory_hostname }}"
          - "================================================"
          - "Review any verification tasks that reported findings."
          - "Manual checks require administrator review."
          - "================================================"
```

### inventory.example

```ini
# =========================================
# <Product> STIG Hardening Inventory
# Copy this file to 'inventory' and customize
# =========================================

[<host_group>]
# device01 ansible_host=192.168.1.10

[<host_group>:vars]
ansible_connection=<connection_type>
ansible_network_os=<network_os>
# ansible_user={{ vault_user }}
# ansible_password={{ vault_password }}
```

### requirements.yml

```yaml
---
collections:
  - name: <vendor.collection>
    version: ">=<minimum_version>"
  - name: community.general
    version: ">=8.0.0"
```

---

## Step 7: Write the README.md

Each role README follows this structure:

1. **Role Name and Description** -- one-liner from meta/main.yml
2. **STIG Reference** -- STIG title, version, release date, benchmark ID
3. **Requirements** -- Ansible version, collections, platform prerequisites
4. **Role Variables** -- table of all defaults with name, default, and description
5. **Tags** -- full list of available tags (categories, severities, individual STIG IDs)
6. **Dependencies** -- other roles needed (typically none)
7. **Example Playbook** -- minimal working example
8. **Rule Coverage** -- table of all STIG IDs with automation status (automated / verification / manual)
9. **License and Author**

---

## Checklist

Before marking a STIG role complete, verify:

- [ ] Total task count across all category files equals the XCCDF rule count
- [ ] Every V-number from the XML has a corresponding task
- [ ] All module calls use FQCN (e.g., `ansible.builtin.debug`, not `debug`)
- [ ] All tasks have three tags: STIG ID, severity (`cat1`/`cat2`/`cat3`), and category
- [ ] All overridable variables are namespaced with the role prefix
- [ ] All overridable variables have entries in both `defaults/main.yml` and `meta/argument_specs.yml`
- [ ] `vars/main.yml` contains STIG version, release date, benchmark ID, and total rule count
- [ ] No `templates/` or `files/` directories exist -- all content is inline
- [ ] `command`/`shell` usage is minimized; any that exist have `changed_when`
- [ ] Verification-only tasks use `check_mode: false` and `failed_when: false`
- [ ] Manual check tasks use `ansible.builtin.debug` with `"MANUAL CHECK:"` prefix
- [ ] Handler is gated by a boolean default variable
- [ ] README.md includes rule coverage table
- [ ] `stig_site.yml` has both the role play and summary play
- [ ] `inventory.example` has correct connection variables for the platform

---

## Banner Text Approach

Banner text is stored as a variable in `defaults/main.yml` and passed directly to vendor modules. Do not use template files.

**Network devices** -- vendor modules accept banner text directly:

```yaml
- name: "<STIG-ID> | Configure DoD login banner"
  cisco.ios.ios_banner:
    banner: login
    text: "{{ <role_prefix>_banner_text }}"
```

**Linux/NGINX** -- use `ansible.builtin.copy` with `content:`:

```yaml
- name: "<STIG-ID> | Configure login banner"
  ansible.builtin.copy:
    content: "{{ <role_prefix>_banner_text }}"
    dest: /etc/issue
    owner: root
    group: root
    mode: "0644"
```

**Windows** -- use registry:

```yaml
- name: "<STIG-ID> | Configure legal notice text"
  ansible.windows.win_regedit:
    path: HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
    name: LegalNoticeText
    data: "{{ <role_prefix>_legal_notice_text }}"
    type: string
```

**Databases** -- use SQL or platform-specific mechanisms as appropriate.

---

## Config File Edits (No Template Files)

For config file modifications, use these modules instead of Jinja2 templates:

- **Single line**: `ansible.builtin.lineinfile` with `regexp:` and `line:`
- **Multi-line block**: `ansible.builtin.blockinfile` with `block:` and `marker:`
- **Entire file from variable**: `ansible.builtin.copy` with `content:`

This keeps all content within YAML (defaults and tasks), making values visible and overridable without searching through template files.
