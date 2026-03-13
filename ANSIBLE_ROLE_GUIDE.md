# Ansible Role Creation Guide

This guide covers best practices for creating Ansible roles in this project. It applies to all roles, not just STIG-specific ones.

---

## Role Directory Structure

An Ansible role uses a defined directory structure. Include only the directories the role needs.

```
roles/
  <role_name>/
    tasks/main.yml            # Task entry point (required)
    defaults/main.yml         # User-configurable variables (low priority, easily overridden)
    vars/main.yml             # Internal constants (high priority, not intended for override)
    handlers/main.yml         # Event-driven actions triggered by notify
    meta/main.yml             # Role metadata, dependencies, Galaxy info
    meta/argument_specs.yml   # Variable type and validation specs
    README.md                 # Role documentation
```

Optional directories (include only when needed):

- `templates/` -- Jinja2 template files (`.j2` extension)
- `files/` -- static files for use with `ansible.builtin.copy` or `ansible.builtin.script`
- `library/` -- custom modules scoped to the role
- `module_utils/` -- custom module utilities
- `lookup_plugins/` -- custom lookup plugins
- `filter_plugins/` -- custom filter plugins

Ansible automatically loads `main.yml` from each standard directory. Additional YAML files can be included via `import_tasks` or `include_tasks`.

---

## Naming Conventions

### Role Names

- Use lowercase with underscores: `<vendor>_<product>_<function>`
- Examples: `f5_bigip_system`, `oracle_database_create`, `win11_stig`
- Role names should be descriptive enough to understand purpose at a glance

### Variable Names

- Prefix every variable with the role name to prevent collisions: `<role_name>_<variable>`
- Examples: `f5_bigip_system_hostname`, `oracle_install_db_home`
- Use lowercase with underscores throughout

---

## tasks/main.yml

Keep `main.yml` as a lightweight orchestrator that imports category-specific task files:

```yaml
---
- name: "<Category> tasks"
  ansible.builtin.import_tasks: <category>.yml
  tags:
    - <category_tag>
```

### import_tasks vs include_tasks

| Feature | `import_tasks` (static) | `include_tasks` (dynamic) |
|---|---|---|
| Processed at | Parse time | Runtime |
| Tags on inner tasks | Work with `--tags` | Do NOT work |
| `--list-tasks` output | Shows all tasks | Shows include only |
| Loop support | No | Yes |
| Variable file paths | No | Yes |

**Prefer `import_tasks`** for predictable behavior and full tag support. Use `include_tasks` only when you need looping or runtime-dynamic file selection.

### Pre-flight Assertions

Start `main.yml` with assertions to fail fast on unsupported targets:

```yaml
- name: "Pre-flight | Verify target platform"
  ansible.builtin.assert:
    that:
      - <condition>
    fail_msg: >-
      This role requires <platform>.
    quiet: true
  tags:
    - always
```

---

## Variables

### defaults/main.yml (user-facing)

These have the lowest priority in Ansible's variable precedence and are designed to be overridden via `group_vars`, `host_vars`, `-e`, or any other variable source.

```yaml
---
# <RULE-OR-CONTEXT>: <description>. Acceptable range: <range>
<role_prefix>_<variable_name>: <sensible_default>
```

Guidelines:
- Document every variable with a comment explaining its purpose and acceptable values
- Group related variables under section headers
- Set values to sensible, safe defaults
- Never put secrets in defaults -- reference Vault variables in documentation

### vars/main.yml (internal constants)

These have higher priority than defaults and should not be overridden by users:

```yaml
---
<role_prefix>_internal_version: "1.0"
```

Use for: version strings, fixed lookup values, platform-specific constants.

### meta/argument_specs.yml (validation)

Define type, default, required status, and description for each overridable variable:

```yaml
---
argument_specs:
  main:
    short_description: <role description>
    options:
      <role_prefix>_<variable>:
        type: <int|str|bool|list|dict>
        required: <true|false>
        default: <value>
        description: <what this variable does>
        choices:               # optional, for constrained values
          - <choice1>
          - <choice2>
```

Supported types: `str`, `int`, `float`, `bool`, `list`, `dict`, `path`, `raw`.

For lists of dicts, use `elements: dict` with nested `options`.

---

## Handlers

Define handlers in `handlers/main.yml` for actions that should run only when triggered by `notify`:

```yaml
---
- name: Restart service
  ansible.builtin.service:
    name: <service>
    state: restarted
  when: <role_prefix>_auto_restart | default(false) | bool
```

Guidelines:
- Handlers run once at the end of a play, regardless of how many tasks notify them
- Gate handler execution with a boolean default variable for safety
- Keep handler count minimal (1-2 per role)
- Tasks trigger handlers with `notify: <handler name>`

---

## meta/main.yml

```yaml
---
galaxy_info:
  role_name: <role_name>
  author: <author>
  description: >-
    <One or two sentence description of what the role does.>
  license: MIT
  min_ansible_version: "2.14"
  platforms:
    - name: <platform>
      versions:
        - "<version>"
  galaxy_tags:
    - <tag1>
    - <tag2>

dependencies: []
```

Guidelines:
- Maximum 20 galaxy_tags
- List all supported platforms and versions
- Declare role dependencies only when another role must run first

---

## FQCN (Fully Qualified Collection Names)

Always use fully qualified module names to avoid ambiguity:

```yaml
# Correct
- ansible.builtin.debug:
    msg: "Hello"

- cisco.ios.ios_config:
    lines:
      - "hostname Router1"

# Incorrect
- debug:
    msg: "Hello"

- ios_config:
    lines:
      - "hostname Router1"
```

This applies to all modules, including `ansible.builtin.*`.

---

## Tagging Strategy

Apply consistent tags to every task for selective execution:

- **Category tags**: group tasks by function (e.g., `networking`, `security`, `users`)
- **Phase tags**: group tasks by deployment stage (e.g., `phase1`, `install`, `configure`)
- **Component tags**: identify the specific component (e.g., `ntp`, `syslog`, `ssl`)

Special tags:
- `always` -- runs regardless of tag selection (use for pre-flight checks and summaries)
- `never` -- skipped unless explicitly selected (use for destructive or optional tasks)

Usage examples:

```bash
ansible-playbook site.yml --tags security
ansible-playbook site.yml --tags phase1,phase2
ansible-playbook site.yml --skip-tags destructive
```

---

## Idempotency

Every role must be idempotent: running it twice produces no changes on the second run.

- **Vendor modules** (cisco.ios, f5networks, paloaltonetworks, etc.) are inherently idempotent.
- **`ansible.builtin.lineinfile`**, **`ansible.builtin.copy`**, **`ansible.builtin.file`** are idempotent.
- **`ansible.builtin.command`** and **`ansible.builtin.shell`** are NOT idempotent by default. When unavoidable, always add:

```yaml
- name: "Run custom command"
  ansible.builtin.command:
    cmd: "<command>"
    creates: "<file that indicates command already ran>"   # or use changed_when
  register: result
  changed_when: "<condition indicating actual change>"
  failed_when: result.rc != 0
```

---

## Check Mode Support

Roles should support `--check` (dry run) mode:

- Most vendor modules support check mode natively -- they report what would change without making changes.
- Use `check_mode: false` on tasks that must always run even in check mode (e.g., gathering facts, reading current state).
- Never use `check_mode: false` on tasks that make changes.

---

## Content Management (Files and Config)

Prefer inline content over template files when the content is short or fully variable-driven:

```yaml
# Inline content from variable (no template file needed)
- name: "Create config file"
  ansible.builtin.copy:
    content: "{{ my_role_config_content }}"
    dest: /etc/app/config.conf
    mode: "0644"

# Single line edit
- name: "Set config value"
  ansible.builtin.lineinfile:
    path: /etc/app/config.conf
    regexp: '^setting_name='
    line: "setting_name={{ my_role_setting_value }}"

# Multi-line block
- name: "Add config block"
  ansible.builtin.blockinfile:
    path: /etc/app/config.conf
    marker: "# {mark} ANSIBLE MANAGED - <context>"
    block: |
      setting_one={{ my_role_value_one }}
      setting_two={{ my_role_value_two }}
```

Use Jinja2 templates (`templates/`) only when the config file is complex with conditional logic, loops, or extensive variable interpolation that would be unwieldy inline.

---

## Playbook Structure (site.yml)

```yaml
---
# =========================================
# <Product> Automation Playbook
#
# Usage:
#   ansible-galaxy collection install -r requirements.yml
#   ansible-playbook -i inventory site.yml
# =========================================

- name: <Descriptive play name>
  hosts: <host_group>
  gather_facts: <true|false>

  roles:
    - role: <role_name>

# =========================================
# Summary Play
# =========================================

- name: Automation Summary
  hosts: <host_group>
  gather_facts: false
  tags:
    - always

  tasks:
    - name: Display summary
      ansible.builtin.debug:
        msg:
          - "================================================"
          - "<Product> automation complete"
          - "Target: {{ inventory_hostname }}"
          - "================================================"
```

---

## requirements.yml

List all required Ansible collections with minimum versions:

```yaml
---
collections:
  - name: <namespace.collection>
    version: ">=<minimum_version>"
```

Install before running:

```bash
ansible-galaxy collection install -r requirements.yml
```

---

## inventory.example

Provide a template inventory so users know what connection variables are needed:

```ini
# =========================================
# <Product> Inventory
# Copy this file to 'inventory' and customize
# =========================================

[<host_group>]
# host01 ansible_host=192.168.1.10

[<host_group>:vars]
ansible_connection=<connection_type>
# ansible_user={{ vault_user }}
# ansible_password={{ vault_password }}
```

Common connection types:
- `ansible.netcommon.network_cli` -- Cisco IOS, NX-OS, IOS-XR, ASA (SSH CLI)
- `ansible.netcommon.httpapi` -- API-based network devices
- `local` -- F5 BIG-IP, Palo Alto (REST API from controller)
- `ssh` -- Linux/Unix hosts (default)
- `winrm` -- Windows hosts

---

## README.md Template

```markdown
# <role_name>

<One-liner description of what the role does.>

## Requirements

- Ansible >= 2.14
- Collections: `<namespace.collection>`
- Platform: <supported platforms>

## Role Variables

| Variable | Default | Description |
|---|---|---|
| `<role_prefix>_<var>` | `<default>` | <description> |

## Dependencies

None.

## Example Playbook

    - hosts: <group>
      roles:
        - role: <role_name>

## Tags

- `<tag1>` -- <description>
- `<tag2>` -- <description>

## License

MIT

## Author

Fourth Estate
```

---

## Checklist for New Roles

- [ ] Role placed in the correct vendor directory under `roles/`
- [ ] `tasks/main.yml` starts with pre-flight assertions
- [ ] All module calls use FQCN
- [ ] All tasks have meaningful tags
- [ ] Variables namespaced with role prefix
- [ ] `defaults/main.yml` has documented, sensible defaults
- [ ] `vars/main.yml` has internal constants (if any)
- [ ] `meta/main.yml` has complete galaxy_info
- [ ] `meta/argument_specs.yml` validates all overridable variables
- [ ] `handlers/main.yml` exists if tasks use `notify`
- [ ] Handler execution gated by a boolean variable
- [ ] No `command`/`shell` without `changed_when`
- [ ] Role is idempotent (second run reports no changes)
- [ ] `--check` mode works without errors
- [ ] README.md documents all variables, tags, and usage
- [ ] `requirements.yml` lists all required collections
- [ ] `inventory.example` shows correct connection variables
