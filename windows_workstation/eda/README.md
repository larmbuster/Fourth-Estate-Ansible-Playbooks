# Event-Driven Ansible: Splunk-Triggered STIG Hardening

Automatically apply Windows 11 DISA STIG V2R6 hardening to workstations the moment they power on, using Splunk alerts and Ansible Automation Platform's Event-Driven Ansible (EDA).

## Splunk Integration Approaches

There are two ways to send events from Splunk to EDA. Both deliver the same alert payload to the `ansible.eda.webhook` source plugin, so the **rulebook works unchanged** with either approach.

| | Approach A: Official Add-on (Recommended) | Approach B: Generic Webhook (Fallback) |
|---|---|---|
| **Splunk component** | [Red Hat Event Driven Ansible Add-on for Splunk](https://splunkbase.splunk.com/app/7868) | Splunk built-in webhook alert action |
| **Built by** | Red Hat / Cisco (official Splunk partner) | Splunk (native feature) |
| **Install** | Free download from Splunkbase | Nothing to install |
| **Transport options** | Webhook or Kafka | Webhook only |
| **Payload control** | Single event, batched, or all events (gzip compressed) | Single event (first result row) |
| **Auth options** | None, Basic, or Bearer token | None |
| **Retry / timeout** | Configurable in add-on UI | Not configurable |
| **Splunk products** | Splunk Core, Enterprise Security (ES), ITSI | Splunk Core only |
| **Best for** | Production deployments, high-volume environments | Restricted Splunk Cloud instances that cannot install Splunkbase apps |

## Architecture

```
                 Event Logs               Webhook POST              run_job_template
┌──────────────┐ ─────────> ┌──────────────┐ ─────────> ┌──────────────┐ ─────────> ┌──────────────┐
│  Windows 11  │            │    Splunk    │            │     EDA      │            │     AAP      │
│  Workstation │            │  (Alert on   │            │  Controller  │            │  Controller  │
│              │            │ EventID 6005)│            │  (Rulebook)  │            │(Job Template)│
└──────────────┘            └──────────────┘            └──────────────┘            └──────────────┘
       ^                                                                                   │
       └───────────────────────────── WinRM / STIG hardening ─────────────────────────────┘
```

1. A Windows workstation powers on, generating **Event ID 6005** ("The Event Log service was started") in the System event log.
2. The Splunk Universal Forwarder on the workstation sends the event to Splunk.
3. A Splunk **saved search** detects the power-on event and triggers an alert action that sends the event to EDA (via the official add-on or built-in webhook).
4. The webhook sends an HTTP POST to the **EDA Controller** webhook endpoint.
5. The EDA **rulebook** evaluates the payload and fires `run_job_template`.
6. AAP runs the **Win11 STIG Hardening** job template, limited to the specific workstation that powered on.

## Prerequisites

| Component | Minimum Version | Purpose |
|---|---|---|
| Red Hat Ansible Automation Platform | 2.5 | Automation controller + EDA controller |
| Splunk Enterprise or Cloud | 9.3+ (add-on) / 9.0+ (generic webhook) | Event monitoring, alerts |
| Red Hat EDA Add-on for Splunk | 1.0.1+ | Custom alert action (Approach A only) |
| Splunk Universal Forwarder | 9.0+ | Installed on Windows workstations |
| Windows 11 workstations | 22H2+ | Domain-joined, WinRM enabled |
| `ansible.eda` collection | 1.0.0+ | Webhook event source plugin |
| `ansible.windows` collection | 2.1.0+ | Required by the win11_stig role |
| `community.windows` collection | 2.0.0+ | Required by the win11_stig role |

## Directory Contents

```
eda/
├── README.md             # This file
├── requirements.yml      # EDA collection dependencies
└── rulebook.yml          # EDA rulebook (Splunk webhook listener)
```

## Setup

### Step 1: Splunk Configuration

#### 1a. Verify Event Log Forwarding

Ensure the Splunk Universal Forwarder on each Windows workstation is configured to forward the System event log. In `inputs.conf` on the forwarder:

```ini
[WinEventLog:System]
disabled = 0
index = main
```

Verify that events with `EventCode=6005` are reaching your Splunk instance by running this search:

```spl
sourcetype=WinEventLog:System EventCode=6005
| table _time host EventCode Message
| sort -_time
```

#### 1b. Create a Saved Search and Alert

1. In Splunk, navigate to **Search & Reporting**.
2. Run the following search to find workstation power-on events:

   ```spl
   sourcetype=WinEventLog:System EventCode=6005
   ```

3. Click **Save As > Alert**.
4. Configure the alert:

   | Setting | Value |
   |---|---|
   | Title | `Workstation Power-On Detection` |
   | Alert type | Real-time |
   | Trigger condition | Per result |
   | Throttle | Recommended: 300 seconds per `host` to avoid duplicate triggers during rapid reboots |

5. Add a trigger action using **one** of the two approaches below.

---

#### 1c. Approach A: Red Hat EDA Add-on for Splunk (Recommended)

The [Red Hat Event Driven Ansible Add-on for Splunk](https://splunkbase.splunk.com/app/7868) is the officially supported integration, built by Red Hat in partnership with Cisco/Splunk. It provides a dedicated alert action with configurable transport, authentication, payload batching, and retry logic. Source code is available under Apache 2.0 at [github.com/RedHatInsights/eventing-splunk-app](https://github.com/RedHatInsights/eventing-splunk-app).

**Install the add-on:**

1. In Splunk, navigate to **Apps > Find More Apps** (or visit [Splunkbase](https://splunkbase.splunk.com/app/7868)).
2. Search for **Red Hat Event Driven Ansible Add-on for Splunk**.
3. Click **Install** (free download). Compatible with Splunk 9.3 -- 10.1.
4. Restart Splunk if prompted.

**Configure the webhook connection:**

1. In Splunk, navigate to the add-on's configuration page.
2. Set the **webhook endpoint** to your EDA controller URL:

   ```
   https://<eda-controller-host>:5001/endpoint
   ```

   If using AAP Event Streams (see the Event Streams section below), use the Event Stream URL instead.

3. Choose an **authentication method**:

   | Method | When to use |
   |---|---|
   | Bearer token | Matches `ansible.eda.webhook` token parameter (recommended) |
   | Basic | Useful with AAP Event Streams configured for Basic Auth |
   | None | Testing only; not recommended for production |

4. Configure **connection timeout** and **retry** parameters as appropriate for your network.
5. Toggle **SSL hostname verification** based on your TLS setup (disable only if using self-signed certificates in a lab).

**Configure the alert action:**

1. Return to the saved search alert created in Step 1b.
2. Under **Trigger Actions**, click **Add Actions** and select the **Red Hat EDA** alert action (provided by the add-on).
3. Configure the payload mode:

   | Mode | Description | Recommended for |
   |---|---|---|
   | Single event | Sends the first result row (default) | This use case -- one host per power-on event |
   | All events in batches | Sends results in configurable batch sizes | Bulk processing scenarios |
   | All events compressed | Sends all results in a gzip-compressed payload | High-volume environments |

   For workstation power-on detection, **Single event** is the correct choice since each EventCode=6005 alert corresponds to one host.

4. Save the alert.

**Additional capabilities (optional):**

- **Kafka transport**: If your environment uses Kafka, the add-on can publish events to a Kafka topic instead of using webhooks. Configure the bootstrap server and security protocol (None, SASL_PLAINTEXT, SASL_SSL) in the add-on settings. On the EDA side, use the `ansible.eda.kafka` source plugin instead of `ansible.eda.webhook`.
- **Splunk Enterprise Security**: Use the add-on as an Adaptive Response Action from the Incident Review or Mission Control dashboard.
- **Splunk ITSI**: Use the "Ansible Episode Action (ITSI)" from the Episode Review page or configure it in notable event aggregation policy action rules.
- **`kafkapublish` search command**: Send ad-hoc search results to Kafka directly from SPL: `| kafkapublish topic_name=<topic> env_name=<env>`.

For detailed guidance, see the [Splunk Lantern how-to article](https://lantern.splunk.com/Data_Descriptors/Red_Hat/Automating_IT_remediation_with_ITSI_and_Red_Hat_Ansible).

---

#### 1d. Approach B: Generic Splunk Webhook (Fallback)

Use Splunk's built-in webhook alert action if you cannot install the official add-on (e.g., restricted Splunk Cloud instances or Splunk versions below 9.3).

1. On the saved search alert created in Step 1b, under **Trigger Actions**, click **Add Actions > Webhook**.
2. Set the webhook URL to your EDA endpoint:

   ```
   https://<eda-controller-host>:5001/endpoint
   ```

   If using AAP Event Streams (see the Event Streams section below), use the Event Stream URL instead.

3. Save the alert.

**Webhook allow list (Splunk 9.0+):**

In Splunk 9.0 and later, webhook URLs must be on the allow list:

1. Navigate to **Settings > Server Settings > Server settings > Webhook allow list**.
2. Add your EDA controller URL to the list.

Alternatively, add to `alert_actions.conf`:

```ini
[webhook]
param.allowlist = https://<eda-controller-host>:5001/endpoint
```

**Limitations compared to the official add-on:**

- No configurable retry or timeout logic
- No payload batching or compression
- No Bearer token or Basic auth on the Splunk side (authentication relies entirely on the EDA webhook token)
- No Kafka transport option
- Not supported in Splunk ES or ITSI

### Step 2: AAP Controller Configuration

#### 2a. Create the Job Template

1. In AAP Controller, navigate to **Resources > Templates > Add > Add job template**.
2. Configure:

   | Setting | Value |
   |---|---|
   | Name | `Win11 STIG Hardening` |
   | Job Type | Run |
   | Inventory | Your Windows workstations inventory |
   | Project | Project containing this repository |
   | Playbook | `windows_workstation/site.yml` |
   | Credentials | Machine credential with WinRM/admin access |
   | **Prompt on launch** | Check **Limit** (required so EDA can target a single host) |

3. Optionally enable **Prompt on launch** for **Variables** if you want EDA to pass extra context (like `eda_triggered`, `splunk_search_name`).
4. Click **Save**.

#### 2b. Create the AAP Credential for EDA

EDA Controller needs credentials to trigger job templates on AAP Controller:

1. In EDA Controller, navigate to **Automation Decisions > Infrastructure > Credentials**.
2. Click **Create credential**.
3. Configure:

   | Setting | Value |
   |---|---|
   | Name | `AAP Controller` |
   | Credential Type | `Red Hat Ansible Automation Platform` |
   | Controller URL | `https://<aap-controller-host>` |
   | Token | A personal access token from AAP Controller |

### Step 3: EDA Controller Configuration

#### 3a. Create the EDA Project

1. Navigate to **Automation Decisions > Projects > Create project**.
2. Point the project to the Git repository containing this rulebook. The EDA project path should include the `windows_workstation/eda/` directory.
3. Sync the project.

#### 3b. Create the Decision Environment

1. Navigate to **Automation Decisions > Infrastructure > Decision Environments**.
2. Create or select a decision environment that includes the `ansible.eda` collection. The default AAP 2.5 decision environment includes it.

#### 3c. Activate the Rulebook

1. Navigate to **Automation Decisions > Rulebook Activations > Create rulebook activation**.
2. Configure:

   | Setting | Value |
   |---|---|
   | Name | `STIG Hardening on Power-On` |
   | Project | The EDA project created above |
   | Rulebook | `rulebook.yml` |
   | Decision Environment | Your decision environment |
   | Credential | `AAP Controller` credential from Step 2b |
   | Restart policy | `On failure` |
   | Log level | `Info` |
   | Variables | See below |

3. In the **Variables** field (YAML format):

   ```yaml
   EDA_WEBHOOK_TOKEN: "<your-secret-token>"
   JOB_TEMPLATE_NAME: "Win11 STIG Hardening"
   AAP_ORGANIZATION: "Default"
   ```

   Store sensitive values like `EDA_WEBHOOK_TOKEN` in an Ansible Vault or AAP credential rather than in plaintext.

4. Click **Create rulebook activation**.

### Step 4: OpenShift Route (if applicable)

If AAP is deployed on OpenShift, the webhook port (5001) must be exposed externally so Splunk can reach it:

```bash
oc expose service <eda-activation-service-name> \
  --port=5001 \
  --name=eda-splunk-webhook \
  --hostname=eda-splunk.apps.example.com
```

For TLS (recommended):

```bash
oc create route edge eda-splunk-webhook \
  --service=<eda-activation-service-name> \
  --port=5001 \
  --hostname=eda-splunk.apps.example.com
```

Use the resulting route URL as the Splunk webhook destination.

## Event Streams (Recommended for Production)

AAP 2.5 provides **Event Streams** as a built-in, more robust alternative to direct webhook listeners. Event Streams handle authentication, provide event inspection/debugging, and can be shared across multiple rulebook activations.

### Why Use Event Streams

- Built-in support for HMAC, Token, Basic Auth, OAuth2, and ECDSA authentication
- Event inspection UI for debugging payloads before enabling forwarding
- Single endpoint reusable across multiple rulebook activations
- No need to manually expose webhook ports on OpenShift

### Event Streams Setup

1. **Create an Event Stream credential**:
   - Navigate to **Automation Decisions > Infrastructure > Credentials > Create credential**.
   - Select credential type **Token** (or **HMAC** for shared-secret verification).
   - Enter the shared secret that Splunk will send in its webhook requests.

2. **Create an Event Stream**:
   - Navigate to **Automation Decisions > Event Streams > Create event stream**.
   - Select the credential created above.
   - Set **Forward events to rulebook activation** to disabled initially (for testing).
   - Save. Copy the generated **Event Stream URL**.

3. **Configure Splunk to POST to the Event Stream URL** instead of the direct webhook port. If using the official add-on (Approach A), update the endpoint URL in the add-on's configuration page. If using the generic webhook (Approach B), update the webhook URL in the alert action.

4. **Test connectivity**:
   - Trigger a test event in Splunk.
   - In the Event Stream details page, verify that **Events received** increments and inspect the Header and Body.

5. **Attach to rulebook activation**:
   - Toggle **Forward events to rulebook activation** to enabled.
   - When creating or editing the rulebook activation, click the gear icon next to **Event streams**.
   - Map `__SOURCE_1` to your Splunk event stream.
   - The event stream transparently replaces the `ansible.eda.webhook` source in the rulebook.

## Testing

### Send a Test Event via curl

Simulate a Splunk webhook payload to verify the rulebook processes events correctly:

```bash
curl -X POST https://<eda-endpoint>:5001/endpoint \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer <your-secret-token>" \
  -d '{
    "result": {
      "host": "WORKSTATION01",
      "sourcetype": "WinEventLog:System",
      "EventCode": "6005",
      "Message": "The Event Log service was started.",
      "_time": "2026-03-13T08:00:00.000-05:00"
    },
    "sid": "scheduler_admin_search_test_123",
    "results_link": "https://splunk.example.com/app/search/@go?sid=test_123",
    "search_name": "Workstation Power-On Detection",
    "owner": "admin",
    "app": "search"
  }'
```

### Verify in AAP

1. **EDA Rule Audit**: Navigate to **Automation Decisions > Rule Audit**. Confirm that the rule "Workstation powered on - run STIG hardening" fired.
2. **Job Template Run**: Navigate to **Automation Execution > Jobs**. Confirm a job ran for the `Win11 STIG Hardening` template with the limit set to `WORKSTATION01`.

### Dry Run (CLI)

To test the rulebook locally without triggering a real job template:

```bash
ansible-rulebook --rulebook rulebook.yml \
  --vars vars.yml \
  --print-events
```

Then send the curl test payload above to `http://localhost:5001/endpoint`.

## Troubleshooting

| Symptom | Likely Cause | Resolution |
|---|---|---|
| No events in EDA Rule Audit | Splunk webhook not reaching EDA | Check firewall rules, OpenShift route, and Splunk webhook allow list. Verify the URL in Splunk's alert action. |
| Rule fires but job template fails | AAP credential misconfigured or job template missing "Prompt on launch" for Limit | Verify the AAP credential in EDA has a valid token. Ensure the job template has Limit checked under Prompt on launch. |
| `event.payload.result.host` is undefined | Splunk alert not returning a `host` field | Run the saved search manually in Splunk and verify the results include a `host` field. Adjust the search or field extraction if needed. |
| Job runs but targets wrong host | Hostname mismatch between Splunk and AAP inventory | Ensure the Splunk `host` field value matches the `inventory_hostname` in your AAP inventory exactly (case-sensitive). |
| Duplicate job runs for the same boot | Splunk alert firing multiple times | Increase the throttle window on the Splunk alert (e.g., 300 seconds per host). |
| Webhook returns 401 Unauthorized | Token mismatch | Verify `EDA_WEBHOOK_TOKEN` in the rulebook activation variables matches the Bearer token Splunk is sending. If using Event Streams, check the Event Stream credential. |
| Rulebook activation fails to start | Decision environment missing `ansible.eda` | Install the collection in the decision environment, or use the default AAP 2.5 decision environment which includes it. |

## Splunk Search Reference

### Basic Power-On Detection

```spl
sourcetype=WinEventLog:System EventCode=6005
```

### Power-On with Downtime Duration

```spl
sourcetype=WinEventLog:System (EventCode=6005 OR EventCode=6006)
| transaction host startswith="EventCode=6006" endswith="EventCode=6005"
| eval downtime=tostring(duration, "duration")
| table _time host downtime
| sort -_time
```

### Relevant Windows Event IDs

| Event ID | Source | Meaning |
|---|---|---|
| 6005 | EventLog | The Event Log service was started (system boot) |
| 6006 | EventLog | The Event Log service was stopped (clean shutdown) |
| 6008 | EventLog | Unexpected previous shutdown |
| 6009 | EventLog | OS version detected at boot time |
| 1074 | User32 | User-initiated restart or shutdown |
| 41 | Kernel-Power | Unclean system reboot |
