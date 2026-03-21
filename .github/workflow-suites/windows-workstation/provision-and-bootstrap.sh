#!/usr/bin/env bash
set -euo pipefail

: "${AZ_LOCATION:?AZ_LOCATION is required}"
: "${AZ_VM_SIZE:?AZ_VM_SIZE is required}"
: "${AZ_IMAGE:?AZ_IMAGE is required}"
: "${WIN_ADMIN_USER:?WIN_ADMIN_USER is required}"
: "${WIN_ADMIN_PASS:?WIN_ADMIN_PASS is required}"

SUFFIX="${GITHUB_RUN_ID:-local}-${GITHUB_RUN_ATTEMPT:-1}"
SUFFIX="${SUFFIX//[^a-zA-Z0-9-]/-}"
RG_NAME="rg-win11-ci-${SUFFIX,,}"
VM_NAME="vmwin11${GITHUB_RUN_ID:-local}"
NSG_NAME="${VM_NAME}-nsg"

echo "RG_NAME=${RG_NAME}" >> "${GITHUB_ENV}"

RUNNER_IP="$(
  curl -fsS https://api.ipify.org || curl -fsS https://ifconfig.me
)"
RUNNER_CIDR="${RUNNER_IP}/32"

az group create \
  --name "${RG_NAME}" \
  --location "${AZ_LOCATION}" \
  --output none

az network nsg create \
  --resource-group "${RG_NAME}" \
  --name "${NSG_NAME}" \
  --output none

# Allow WinRM HTTPS for test connectivity.
az network nsg rule create \
  --resource-group "${RG_NAME}" \
  --nsg-name "${NSG_NAME}" \
  --name AllowWinRMHttpsFromRunner \
  --priority 1000 \
  --access Allow \
  --protocol Tcp \
  --direction Inbound \
  --destination-port-ranges 5986 \
  --source-address-prefixes "${RUNNER_CIDR}" \
  --output none

az vm create \
  --resource-group "${RG_NAME}" \
  --name "${VM_NAME}" \
  --image "${AZ_IMAGE}" \
  --size "${AZ_VM_SIZE}" \
  --admin-username "${WIN_ADMIN_USER}" \
  --admin-password "${WIN_ADMIN_PASS}" \
  --public-ip-sku Standard \
  --storage-sku StandardSSD_LRS \
  --nsg "${NSG_NAME}" \
  --output none

PUBLIC_IP="$(az vm show -d -g "${RG_NAME}" -n "${VM_NAME}" --query publicIps -o tsv)"
echo "WIN_HOST=${PUBLIC_IP}" >> "${GITHUB_ENV}"

# Bootstrap WinRM over HTTPS with a self-signed cert.
az vm run-command invoke \
  --resource-group "${RG_NAME}" \
  --name "${VM_NAME}" \
  --command-id RunPowerShellScript \
  --scripts @.github/workflow-suites/windows-workstation/bootstrap-winrm.ps1 \
  --output none
