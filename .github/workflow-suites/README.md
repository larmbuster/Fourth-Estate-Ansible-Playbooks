# Workflow Suites

This directory holds reusable assets for GitHub Actions workflows.

## Layout

- `windows-workstation/`: Azure provisioning and inventory scripts for ephemeral Windows 11 Ansible testing.

## Convention For Future Workflows

1. Create a dedicated subdirectory per scenario under `.github/workflow-suites/`.
2. Keep the workflow entrypoint under `.github/workflows/` (required by GitHub Actions).
3. Place helper scripts, templates, and docs inside the suite subdirectory.
4. Keep cleanup logic in the workflow with `if: always()` to avoid leaked resources.
