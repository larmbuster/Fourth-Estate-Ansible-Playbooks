#!/usr/bin/env bash
set -euo pipefail

: "${WIN_HOST:?WIN_HOST is required}"
: "${WIN_ADMIN_USER:?WIN_ADMIN_USER is required}"
: "${WIN_ADMIN_PASS:?WIN_ADMIN_PASS is required}"
: "${INVENTORY_PATH:?INVENTORY_PATH is required}"

mkdir -p "$(dirname "${INVENTORY_PATH}")"

cat > "${INVENTORY_PATH}" <<EOF
[windows_workstations]
ci-win11 ansible_host=${WIN_HOST}

[windows_workstations:vars]
ansible_connection=winrm
ansible_winrm_transport=ntlm
ansible_port=5986
ansible_winrm_scheme=https
ansible_winrm_server_cert_validation=ignore
ansible_user=${WIN_ADMIN_USER}
ansible_password=${WIN_ADMIN_PASS}
EOF
