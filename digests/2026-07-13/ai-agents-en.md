# OpenClaw Ecosystem Digest 2026-07-13

> Issues: 287 | PRs: 500 | Projects covered: 13 | Generated: 2026-07-13 05:45 UTC

- [OpenClaw](https://github.com/openclaw/openclaw)
- [NanoBot](https://github.com/HKUDS/nanobot)
- [Hermes Agent](https://github.com/nousresearch/hermes-agent)
- [PicoClaw](https://github.com/sipeed/picoclaw)
- [NanoClaw](https://github.com/qwibitai/nanoclaw)
- [NullClaw](https://github.com/nullclaw/nullclaw)
- [IronClaw](https://github.com/nearai/ironclaw)
- [LobsterAI](https://github.com/netease-youdao/LobsterAI)
- [TinyClaw](https://github.com/TinyAGI/tinyagi)
- [Moltis](https://github.com/moltis-org/moltis)
- [CoPaw](https://github.com/agentscope-ai/CoPaw)
- [ZeptoClaw](https://github.com/qhkm/zeptoclaw)
- [ZeroClaw](https://github.com/zeroclaw-labs/zeroclaw)

---

## OpenClaw Deep Dive

⚠️ Summary generation failed.

---

## Cross-Ecosystem Comparison

# AI Agent & Personal Assistant Ecosystem Cross-Project Analysis
**Date:** 2026-07-13  
**Analyst:** Senior Ecosystem Analyst

## 1. Ecosystem Overview
The open-source personal AI assistant landscape is currently transitioning from experimental experimentation to **enterprise-grade operational stability**. While projects like **IronClaw** and **ZeroClaw** demonstrate massive feature velocity focused on extensibility and modular architecture, others like **LobsterAI** and **NanoClaw** are prioritizing desktop polish and governance. A clear trend is the fragmentation of the "runtime" layer; projects are aggressively hardening their execution environments (e.g., CoPaw's Runtime 2.0, IronClaw's Extension Runtime) to support complex workflows. Security and governance are no longer secondary features but are central to the roadmap, evidenced by token ceiling enforcement, operator approvals, and memory sanitization.

## 2. Activity Comparison
*Note: Activity metrics are based on the last 24 hours (2026-07-13). Projects with no activity are listed as "None".*

| Project | Issues (24h) | PRs (24h) | Release Status | Health Assessment |
| :--- | :--- | :--- | :--- | :--- |
| **IronClaw** | 0 (implied high dev) | 50 (22 merged) | None | **High Iteration** (Feature train, CI hardening) |
| **ZeroClaw** | 3 | 50 (49 active) | None | **High Implementation** (Runtime refactor, new channels) |
| **CoPaw** | 39 | 26 (8 merged) | v2.0.0 (Fragile) | **High Strain** (Post-upgrade stability regressions) |
| **LobsterAI** | 1 | 15 (13 merged) | None | **Stable** (UI polish, Windows focus) |
| **NanoBot** | 4 | 14 (8 merged) | None | **Stabilizing** (Bug fixes, regressions) |
| **NanoClaw** | 3 | 13 (2 merged) | None | **Secure** (Governance, token limits) |
| **NullClaw** | 0 | 11 (4 merged) | None | **Healthy** (Maintenance, config) |
| **TinyClaw** | None | None | None | **Inactive** |
| **Moltis** | None | None | None | **Inactive** |
| **ZeptoClaw** | None | None | None | **Inactive** |

## 3. OpenClaw's Position
*Note: Specific data for the core reference project (OpenClaw) was unavailable in the provided digest summaries. The following analysis positions the available peer projects to contextualize the ecosystem standards OpenClaw is likely benchmarked against.*

**Peer Context & Competitive Position:**
OpenClaw serves as the architectural anchor for this ecosystem, but the peer projects illustrate a divergence in implementation strategies:
*   **vs. IronClaw:** While IronClaw focuses on a heavy, platform-centric "Extension Runtime," OpenClaw appears to prioritize a more modular, agent-focused architecture (evidenced by the strong focus on "Model Presets" and "Long Task" management in NanoBot).
*   **vs. CoPaw:** Where CoPaw is struggling with a Runtime 2.0 migration, OpenClaw is likely maintaining a focus on stability and backward compatibility, given the prevalence of stability patches in other projects.
*   **vs. ZeroClaw:** OpenClaw seems to differ from ZeroClaw by not currently pushing aggressive "Gateway Kanban" or "Inkbox" channel integrations, suggesting a focus on core agent logic over multi-channel ecosystem expansion.

## 4. Shared Technical Focus Areas
Several critical technical requirements have emerged across the ecosystem, signaling a maturation of the agent infrastructure:

*   **Runtime Stability & Isolation:**
    *   *Projects:* **CoPaw** (Sandbox crashes, pwsh recursion), **IronClaw** (Flaky tests), **ZeroClaw** (Loop detector).
    *   *Need:* Projects are aggressively fixing subprocess management and test isolation to prevent agent crashes.
*   **Governance & Security:**
    *   *Projects:* **NanoClaw** (Operator verbs, tool allowlist), **ZeroClaw** (Content scanning), **IronClaw** (Static pre-push checks).
    *   *Need:* Moving from open execution to controlled execution with approval workflows and content safety.
*   **Memory & Context Management:**
    *   *Projects:* **NanoBot** (Pruning logic, base64 handling), **NullClaw** (Recall limits, auto_recall), **CoPaw** (Context compression).
    *   *Need:* Efficient handling of large context windows and memory pruning to prevent token bloat.
*   **Multi-Channel Architecture:**
    *   *Projects:* **NanoBot** (Discord fixes), **NanoClaw** (LINE formatting), **ZeroClaw** (Inkbox integration), **CoPaw** (Zalo).
    *   *Need:* Robust adapters that handle specific quirks of each platform (e.g., token caps, formatting).

## 5. Differentiation Analysis
The projects have carved out distinct niches within the ecosystem:

*   **IronClaw (The Enterprise Platform):**
    *   *Focus:* Runtime extensibility and cost tracking.
    *   *Target:* Developers building complex, multi-agent systems needing observability and CI/CD integration.
*   **CoPaw (The Open Framework):**
    *   *Focus:* Runtime 2.0 refactoring and tool execution.
    *   *Target:* Developers seeking a flexible framework, though currently facing high churn due to architectural changes.
*   **LobsterAI (The Desktop Client):**
    *   *Focus:* Windows-native UX, file handling, and notifications.
    *   *Target:* End-users requiring a polished graphical interface for personal assistants.
*   **NanoClaw (The Governance Engine):**
    *   *Focus:* CLI control, tool allowlists, and token ceilings.
    *   *Target:* System administrators and operators requiring strict control over agent capabilities.
*   **ZeroClaw (The Modular Gateway):**
    *   *Focus:* Gateway UX, Kanban boards, and diverse channel support (Inkbox).
    *   *Target:* Users managing complex communication workflows across multiple protocols.

## 6. Community Momentum & Maturity
*   **Tier 1: Rapid Iteration (High Velocity)**
    *   **IronClaw & ZeroClaw:** Both have >50 PRs. These projects are in a "feature build" phase, likely approaching a major release (v0.8.3 for ZeroClaw, Extension Runtime for IronClaw).
    *   **CoPaw:** High PR count but low health score due to v2.0 instability. The community is debugging heavily but the project is currently in a "growing pain" phase.
*   **Tier 2: Stabilization (Maintenance Mode)**
    *   **LobsterAI, NanoClaw, NullClaw:** Focused on closing stale issues, polishing UI, and security hardening. These projects appear mature and less volatile.
*   **Tier 3: Dormant**
    *   **TinyClaw, Moltis, ZeptoClaw:** No activity detected. These projects may be stalled, archived, or operating on a different release cadence.

## 7. Trend Signals for AI Agent Developers

1.  **From "Chat" to "Orchestration":** The shift toward "Extension Runtime" (IronClaw) and "Governance Verbs" (NanoClaw) indicates agents are no longer just chatbots but are becoming orchestration engines with lifecycle management.
2.  **Desktop Native is Key:** **LobsterAI**'s focus on branded title bars and web installers suggests that for personal AI assistants to succeed, they must compete with native OS applications (Windows/macOS) rather than just CLI tools.
3.  **Token Economy Awareness:** The urgent fixes for token ceilings (NanoClaw) and cost tracking (IronClaw) signal that developers are moving beyond unlimited context windows to economically viable, finite token management strategies.
4.  **Sandboxing is Critical:** The prevalence of "Sandbox" issues (CoPaw) and "Process isolation" (ZeroClaw) highlights that agents running in user environments require strict isolation to prevent crashes (e.g., memory exhaustion from pwsh).

---

## Peer Project Reports

<details>
<summary><strong>NanoBot</strong> — <a href="https://github.com/HKUDS/nanobot">HKUDS/nanobot</a></summary>

# NanoBot Project Digest
**Date:** 2026-07-13
**Repository:** HKUDS/nanobot

### 1. Today's Overview
NanoBot demonstrates **high activity** with 14 Pull Requests and 4 Issues addressed in the last 24 hours. The project is currently focused on **stability and security patches**, closing 8 PRs and 3 Issues, including critical fixes for Discord integration, memory management, and terminal handling. Development is balanced between stabilizing core infrastructure (WebUI, Runtime) and advancing agent capabilities (Model Presets, Long Task management).

### 2. Releases
**None.** No new versions were released in the last 24 hours.

### 3. Project Progress
*   **Stability Fixes (Merged):** Significant progress was made in resolving regressions and crashes.
    *   **WebUI & Terminal:** Fixed a critical raw-mode terminal state leak that corrupted CLI prompts (`#4903`).
    *   **Agent & Memory:** Corrected Dream session pruning logic to handle base64-encoded filenames and fixed unauthorized Discord DM routing (`#4899`, `#4900`).
    *   **Heartbeat & Streaming:** Rewrote the heartbeat prompt to reflect single-stage execution and added wall-clock timeouts for streaming LLM requests to prevent hanging (`#4896`, `#4902`).
*   **Feature Development (In Progress):**
    *   **Guided Setup:** Added productized Channel setup flows with validation and QR handoff (`#4855`).
    *   **Model Management:** Advanced work on binding model presets to sessions, allowing immutable LLM runtime capture per turn (`#4866`).
    *   **Long Tasks:** gated the "sustained-goal" feature behind an opt-in flag to prevent blocking user interaction during long operations (`#4879`).

### 4. Community Hot Topics
*   **Ollama Latency & Caching** (Issue #4867)
    *   *Status:* Closed
    *   *Analysis:* Users reported a severe 60-second latency added to every turn when using local Ollama models, rendering the system unusable. The issue highlights a critical gap in prompt caching for local providers.
    *   *Link:* [HKUDS/nanobot Issue #4867](https://github.com/HKUDS/nanobot/issues/4867)
*   **Discord Integration Failure** (Issue #4897)
    *   *Status:* Closed
    *   *Analysis:* Users could not receive messages despite the bot showing as online. This suggests a gap in message reception logic within the Discord adapter.
    *   *Link:* [HKUDS/nanobot Issue #4897](https://github.com/HKUDS/nanobot/issues/4897)
*   **Session-Scoped Model Presets** (PR #4866)
    *   *Status:* Open (Conflicts)
    *   *Analysis:* A complex feature request to persist model selection at the session level. The high priority and conflict status indicate this is a high-value architectural change currently being vetted.
    *   *Link:* [HKUDS/nanobot PR #4866](https://github.com/HKUDS/nanobot/pull/4866)

### 5. Bugs & Stability
*   **Critical (P1):**
    *   **Terminal Input Corruption:** The CLI raw-mode state was leaking, causing input prompts to be unreadable after running `nanobot webui`. **Fix PR:** #4903.
    *   **Discord Message Reception:** Unauthorized DMs were failing to reach the pairing flow. **Fix PR:** #4899.
    *   **Streaming Timeouts:** No finite timeout for streaming LLMs could cause indefinite hangs. **Fix PR:** #4902.
*   **High (P1/P2):**
    *   **Dream Session Pruning:** The pruning function failed to recognize base64-encoded filenames introduced in a recent commit. **Fix PR:** #4900.
    *   **Heartbeat Logic:** The heartbeat prompt incorrectly instructed agents to report status rather than execute tasks, causing functionality loss. **Fix PR:** #4896.
    *   **Remote Access Security:** Remote WebUI sessions were gaining full access to the workspace. **Fix PR:** #4892.

### 6. Feature Requests & Roadmap Signals
*   **Model Presets:** The push to bind model presets to sessions (`#4866`) signals a move towards more granular control, likely allowing users to switch LLMs per conversation context without re-configuring the entire agent.
*   **Opt-in Long Tasks:** The gating of the "sustained-goal" feature (`#4879`) suggests the project is refining its definition of "active" agent states to prevent battery drain and UI freezing in mobile or constrained environments.
*   **WebUI Runtime Facade:** The centralized runtime access (`#4769`) suggests a shift towards better isolation between the WebUI and the underlying agent engine.

### 7. User Feedback Summary
*   **Pain Point - Latency:** Users utilizing local models (specifically Ollama) are reporting frustration due to artificial latency added to every interaction, which hinders the "instantaneity" expected of local AI.
*   **Pain Point - Integration:** Discord users are facing connectivity issues, specifically with message routing and pairing flows, which limits adoption of the bot for community management.
*   **Pain Point - Data Confusion:** Users are confused by the `/dream-log` output showing non-Dream commits (e.g., manual backups), indicating a need for better commit filtering or UI separation.

### 8. Backlog Watch
*   **Weather Skill Implementation:** PR #4145 has been open since June 1st (2026). It addresses a missing Weather Skill example. Despite having a high number of files added (README, SKILL.md, tests), it remains unresolved.
    *   *Link:* [HKUDS/nanobot PR #4145](https://github.com/HKUDS/nanobot/pull/4145)
*   **Dream Log Filtering:** Issue #4893 remains open, requesting filtering of non-Dream commits in log outputs. This is a logical follow-up to the memory pruning fix but has not been addressed.
    *   *Link:* [HKUDS/nanobot Issue #4893](https://github.com/HKUDS/nanobot/issues/4893)

</details>

<details>
<summary><strong>Hermes Agent</strong> — <a href="https://github.com/nousresearch/hermes-agent">nousresearch/hermes-agent</a></summary>

⚠️ Summary generation failed.

</details>

<details>
<summary><strong>PicoClaw</strong> — <a href="https://github.com/sipeed/picoclaw">sipeed/picoclaw</a></summary>

⚠️ Summary generation failed.

</details>

<details>
<summary><strong>NanoClaw</strong> — <a href="https://github.com/qwibitai/nanoclaw">qwibitai/nanoclaw</a></summary>

### NanoClaw Project Digest
**Date:** 2026-07-13
**Repository:** [qwibitai/nanoclaw](https://github.com/qwibitai/nanoclaw)

---

### 1. Today's Overview
Activity on the NanoClaw repository remained robust today, with 13 Pull Requests (PRs) updated and 3 new Issues opened. Two significant PRs were merged, addressing critical messaging integrity (LINE formatting) and a hard token ceiling for Claude agents. The community is heavily focused on stabilizing the agent-runner's message handling, specifically tackling "silent drop" events and duplicate reply generation. Overall project health appears stable, with a strong emphasis on security hardening and operational governance features.

### 2. Releases
**No new releases were published in the last 24 hours.**

### 3. Project Progress
*   **Merged/Closed PRs:**
    *   **#3030** (Closed): Added `formatLine()` function to convert Markdown to plain text for LINE channels, preventing literal rendering of formatting characters.
    *   **#3024** (Closed): Fixed the hard 32,000 output token cap for Claude agents by raising the Agent SDK's ceiling to match the model's actual limit.
*   **Key Development Focus:**
    *   **Message Integrity:** Multiple PRs are addressing the "re-wrap nudge" logic to prevent duplicate replies and rescue undelivered messages (PRs #3020, #3028).
    *   **Container Security:** A PR (#3027) relocates the temporary directory to prevent potential poisoning of certificate authorities by the `onecli` proxy.
    *   **Governance:** Core-team initiatives are advancing, specifically adding operator approval verbs (`approve`, `reject`) to the NCL surface (PR #3029).

### 4. Community Hot Topics
*   **Issue #3026: Re-wrap nudge duplicates replies** (Author: fjnoyp)
    *   **Status:** Open
    *   **URL:** [nanocoai/nanoclaw Issue #3026](https://github.com/qwibitai/nanoclaw/issues/3026)
    *   **Analysis:** This is a high-priority UX bug where the system re-runs the model unnecessarily, causing duplicate agent responses when a reply was already sent via `send_message`.
*   **Issue #3023: Every Claude agent capped at 32000 tokens** (Author: javexed)
    *   **Status:** Open
    *   **URL:** [nanocoai/nanoclaw Issue #3023](https://github.com/qwibitai/nanoclaw/issues/3023)
    *   **Analysis:** Users are hitting hard failures when generating long outputs (e.g., large OpenSCAD files). The underlying fix was merged (#3024), but the issue persists for those running older versions.
*   **PR #3029: Operator approval-resolution verbs** (Author: moshe-nanoco)
    *   **Status:** Open
    *   **URL:** [nanocoai/nanoclaw PR #3029](https://github.com/qwibitai/nanoclaw/pull/3029)
    *   **Analysis:** A feature request for CLI-level control over held approvals, addressing a gap in the NCL (NanoClaw Command Language) surface.

### 5. Bugs & Stability
*   **Severity: High** - **Silent Message Drops**
    *   **Issue:** Agents intermittently stop replying to channels (WhatsApp) because the host routes messages but the container fails to spawn due to file permission errors (`EISDIR` on `/tmp/onecli-proxy-ca.pem`).
    *   **Fix PR:** #3027 (Relocate TMPDIR).
*   **Severity: High** - **Hard Output Token Limit**
    *   **Issue:** Claude agents die mid-generation at 32,000 tokens regardless of the model's capability.
    *   **Fix PR:** #3024 (Closed) & #3025 (Open) - raising the SDK limit.
*   **Severity: Medium** - **False Rate Limit Alerts**
    *   **Issue:** #3016 reports that `rate_limit_event` is logged as a "quota error" even when the status is "allowed," leading to noisy logs during normal operation.
    *   **Fix PR:** None yet.

### 6. Feature Requests & Roadmap Signals
*   **Scheduled Tasks in Templates:** PR #3022 proposes allowing template definitions to include recurring cron schedules, reducing manual setup for agent groups.
*   **Per-Group Capability Toggles:** PR #2983 signals a move towards stricter, per-group configuration defaults to disable legacy harness capabilities (like cron) in favor of NanoClaw's native scheduler.
*   **WhatsApp Shared Number Warning:** PR #3021 introduces a safety check to warn users before connecting shared WhatsApp numbers, mitigating suspension risks.

### 7. User Feedback Summary
*   **Operational Friction:** Users are reporting frustration with "silent drops" where channels appear active but the agent container fails to start, disrupting workflows.
*   **Generation Limits:** Developers working on large codebases (CAD, OpenSCAD) are blocked by the 32k token ceiling, highlighting a need for dynamic token scaling.
*   **Log Noise:** The logging of valid "allowed" rate limits as errors is causing confusion regarding system health and quota consumption.

### 8. Backlog Watch
*   **#2986 - Guard Seam (Phase 2):** A core security architecture change defining decision functions for privileged actions. It has been updated recently but remains open, requiring integration testing.
*   **#2982 - Tool Allowlist Drift:** A fix to reconcile the CLI tool allowlist with pinned versions to prevent runtime errors.
*   **#2987 - `/add-audit` Skill:** A significant feature for local audit logging that has been rebased and hardened but is not yet merged.

</details>

<details>
<summary><strong>NullClaw</strong> — <a href="https://github.com/nullclaw/nullclaw">nullclaw/nullclaw</a></summary>

### NullClaw Project Digest: 2026-07-13

**1. Today's Overview**
NullClaw demonstrated high development velocity today, processing 11 Pull Requests with a 4:7 open-to-closed ratio. The team focused primarily on stability improvements and core feature expansion, as evidenced by the closure of four critical bug fixes and the opening of several feature requests. With zero new issues opened, the project appears to be in a healthy maintenance and stabilization phase, actively addressing legacy bugs while preparing for more advanced functionality.

**2. Releases**
No new releases were published on this date. The project is currently in a feature development and bug-fixing cycle rather than a versioning cycle.

**3. Project Progress**
Four Pull Requests were successfully closed, focusing on core stability and configuration management:
*   **Configuration:** Made `queue_mode` configurable via `config.json` (#949) to allow users to define session behavior defaults.
*   **Stability:** Fixed memory leaks in the gateway port probe logic (#950) and suppressed unnecessary stderr initialization logs during agent failures (#951).
*   **Functionality:** Corrected cron job attribution metadata to ensure delivery logs accurately reflect the originating channel/account (#948).

**4. Community Hot Topics**
The most active discussions are centered on architectural improvements and documentation:
*   **Native Anthropic Provider:** A significant push to document the dedicated Anthropic provider with API key and OAuth support (#962).
*   **Memory Management:** Implementation of a robust memory configuration system allowing users to control recall limits and context bytes (#961).
*   **Connectivity Fixes:** Active debugging of Discord gateway socket recovery (#953) and Teams authentication token validation (#958).

**5. Bugs & Stability**
Several stability concerns remain open, with a mix of high-severity memory issues and integration bugs:
*   **Critical:** **Use-after-free error** in `OutboundMessage.channel` affecting one-shot cron jobs (#954). This can cause silent failures or crashes during scheduled message delivery.
*   **High:** **Discord gateway socket recovery** (#953) and **Teams JWT claim validation** (#958), both of which are blocking message delivery for users on these platforms.
*   **Medium:** **Cron paired token persistence** (#959) and **Alpine Linux dependency update** (#956).

**6. Feature Requests & Roadmap Signals**
The roadmap is clearly moving toward granular control over system resources:
*   **Memory Optimization:** The addition of `auto_recall`, `recall_limit`, and `max_context_bytes` (#961) signals a roadmap toward smarter, more efficient context window management, allowing users to fine-tune memory usage dynamically.
*   **Provider Simplification:** The documentation effort for the Native Anthropic provider (#962) suggests a roadmap goal to reduce friction for users adopting Anthropic's API directly.

**7. User Feedback Summary**
While direct user comments were absent in the dataset, the nature of the closed PRs reveals specific user pain points:
*   **Attribution:** Users were confused by cron job delivery logs not matching the specific channel used to trigger them.
*   **Defaults:** Users required better control over queue modes to manage session flow without manual intervention.
*   **Logs:** Users found initialization logs cluttering output channels when agents failed, reducing the signal-to-noise ratio.

**8. Backlog Watch**
*   **Dependency Security:** PR #956 (Dependency update for Alpine 3.23 to 3.24) has been pending since June 15th. While low risk, maintaining up-to-date base images is crucial for long-term security.
*   **Complex Features:** PR #961 (Memory configuration) and #962 (Anthropic docs) represent complex changes that require careful testing before merge to ensure they don't break existing configurations.

</details>

<details>
<summary><strong>IronClaw</strong> — <a href="https://github.com/nearai/ironclaw">nearai/ironclaw</a></summary>

**Project Digest: IronClaw (nearai/ironclaw)**
**Date:** 2026-07-13

### 1. Today's Overview
IronClaw is experiencing high levels of development activity today, with 50 pull requests updated and 22 merged or closed. The primary focus is stabilizing the CI/CD pipeline to address flaky tests that are currently blocking main branch deployments, alongside a significant push to complete the "Extension Runtime" feature train. While new releases are not available, the volume of work suggests a robust push toward the next major milestone, specifically regarding runtime extensibility and cost tracking.

### 2. Releases
*None. No new versions were released in the last 24 hours.*

### 3. Project Progress
*   **Feature Development:** The team is actively advancing the **Extension Runtime** workstream. PR #6025 (P6) adds configuration/connect UI and frontend support, while PR #6012 (P5) implements the delivery coordinator for Slack and Telegram.
*   **Stability Fixes:** 22 PRs were merged/closed, including critical fixes for test isolation (PR #6023) and the implementation of static pre-push checks (PR #6022) to prevent future CI failures.
*   **Infrastructure:** Dependency updates were applied via Dependabot, and the integration harness was switched to the production capability-port factory (PR #6026).

### 4. Community Hot Topics
*   **[PR #6025] feat(extension-runtime): P6 — extraction completion:** A massive XL-sized PR addressing the UI, CLI, and migrations for the extension runtime extraction feature. This is currently one of the most active areas of development.
    *   *Link:* [nearai/ironclaw PR #6025](https://github.com/nearai/ironclaw/pull/6025)
*   **[PR #6012] feat(extension-runtime): P5 — delivery coordinator:** Focuses on the outbound delivery mechanism for Slack and Telegram.
    *   *Link:* [nearai/ironclaw PR #6012](https://github.com/nearai/ironclaw/pull/6012)
*   **[Issue #6014] CI fragility:** Users are flagging that 70% of main push runs are failing due to non-hermetic tests, specifically impacting code coverage.
    *   *Link:* [nearai/ironclaw Issue #6014](https://github.com/nearai/ironclaw/issues/6014)

### 5. Bugs & Stability
*   **[CRITICAL] CI Coverage Fragility (Issue #6014):** The single largest source of red on main. ~70% of July push runs failed (139/200). Root cause identified as structural issues with non-hermetic tests that abort the coverage matrix.
    *   *Status:* Open. Fix in progress via PR #6022.
*   **[HIGH] Flaky Slack Trigger E2E Tests (Issue #6016):** Slack trigger-delivery tests intermittently time out or miss fired triggers, blocking both "Tests (Reborn)" and "Code Coverage" legs.
    *   *Status:* Open. PR #6020 aims to make these journeys deterministic.
*   **[MEDIUM] DB Concurrency Flakiness (Issue #6017):** Postgres delete/recreate race conditions and libSQL concurrent writers are causing test failures under parallel load.
    *   *Status:* Open. Root cause is timing-sensitive rather than deterministic.

### 6. Feature Requests & Roadmap Signals
*   **Extension Runtime (P5/P6):** The roadmap is heavily focused on making the extension runtime production-ready, including delivery coordinators and UI/CLI migrations.
*   **MCP Registration Store:** Implementation of a per-user MCP registration store (PR #5970) to replace older architectures.
*   **Cost Tracking:** Addition of per-run token usage and USD cost reporting to the OpenAI-compatible API responses (PR #5976).
*   **Agent Loop Improvements:** Enhancements to the coding tools to prevent stale edits and add read-before-edit guards, mimicking robust IDE behaviors.

### 7. User Feedback Summary
*   **CI Pain Points:** Users are reporting significant frustration with "flaky" tests that cause massive coverage matrix failures. The feedback emphasizes the need for "static pre-push checks" to catch issues before they reach main.
*   **Observability Needs:** There is a demand for more deterministic Slack journeys. Users want to move away from "delivery targets" or "indexed search" to authoritative Slack capabilities for known conversations.
*   **Tooling Usability:** Users requested better handling of Unix timestamps in tools and a "doctor" command that checks runtime wiring (PR #6019).

### 8. Backlog Watch
*   **[OPEN] Issue #6018:** Request for CI hardening via static pre-push checks. (Related to the fix in PR #6022).
*   **[OPEN] Issue #6015:** Flaky/isolation issues with `build_runtime_input_production_*` tests in the all-features coverage leg.
*   **[OPEN] Issue #6013:** Feature request to enable tools-capable completion nudges for interactive coding.

</details>

<details>
<summary><strong>LobsterAI</strong> — <a href="https://github.com/netease-youdao/LobsterAI">netease-youdao/LobsterAI</a></summary>

# LobsterAI Project Digest: 2026-07-13

## 1. Today's Overview
LobsterAI demonstrated high development velocity today, with 15 Pull Requests updated, resulting in 13 closures or merges and 2 remaining open. Activity was concentrated on stabilizing the coworking module, enhancing Windows-specific UI/UX, and closing maintenance items. However, community engagement regarding bug reports remains low, with only one active issue reported.

## 2. Releases
**None.** No new software releases were published today.

## 3. Project Progress
The bulk of today's progress focused on closing stale PRs and finalizing a wave of new features and fixes.

*   **Coworking Module Stability:** Several fixes were merged to stabilize the coworking experience, including "steer follow-up routing," "queued follow-up coordinator," and "stalled compaction retry maintenance" (PRs #2315, #2319, #2289, #2292).
*   **Windows-Specific Enhancements:** Significant effort was put into the Windows experience, including a branded title bar (PR #2302), logo compression fixes (PR #2316), and a new "Windows web installer" target (PR #2323).
*   **Feature Upgrades:**
    *   **Desktop Notifications:** A major upgrade to the notification system (renamed to `DesktopNotificationManager`) was merged to handle permission requests and foreground modes (PR #2318).
    *   **Scheduled Tasks UI:** A visual overhaul of the scheduled task module (PR #1488) was finalized, moving from a table to a card grid layout with search and date grouping.
    *   **File Handling:** Optimizations to file card display and attachment support in the steer queue were implemented (PRs #2322, #2300).
*   **Maintenance:** Several "stale" PRs were finally processed, including fixes for cowork input classification (PR #1323), skill state isolation (PR #1494), and cron job logic (PR #2320).

## 4. Community Hot Topics
*   **Issue #2293: Multi-Agent USER.md Overwrite Bug** (Open)
    *   **Link:** [netease-youdao/LobsterAI Issue #2293](https://github.com/netease-youdao/LobsterAI/issues/2293)
    *   **Analysis:** This is the sole active issue. It highlights a critical data integrity problem where modifying the "About You" or `USER.md` file in one agent inadvertently overwrites the same file in other agents. This violates the fundamental expectation of isolated agent environments.

## 5. Bugs & Stability
*   **Critical: Agent Data Isolation Failure (Issue #2293)**: The reported bug allows a change in one agent's configuration to corrupt the configurations of all other agents. This is a high-severity bug that impacts the utility of the multi-agent feature.
*   **Stability Fixes Merged**: Several stability-focused PRs were merged today to address underlying issues in the coworking engine, including retry logic for compaction and follow-up stream management, which likely resolved prior user frustration with app hanging or routing errors.

## 6. Feature Requests & Roadmap Signals
*   **Windows Web Installer (PR #2323)**: The addition of an opt-in Windows web installer suggests a roadmap shift toward easier distribution and installation methods for the desktop client.
*   **Enhanced Desktop Notifications (PR #2318)**: The upgrade to handle permission requests and foreground notifications indicates a move toward a more "app-like" and persistent user experience, reducing reliance on OS-native alerts.
*   **Scheduled Task UI (PR #1488)**: The completion of the card-grid UI for scheduled tasks signals a focus on productivity tools and automation management within the agent interface.

## 7. User Feedback Summary
*   **Pain Point:** Users creating multiple agents are reporting that they cannot maintain distinct "personalities" or requirements. The system treats the `USER.md` as a global resource rather than a per-agent resource, forcing users to either accept a single global configuration or accept data loss.
*   **Sentiment:** Frustration is implied by the detailed reproduction steps provided (testing file modification outside the app before restart) and the specific request for confirmation if others are experiencing the same issue.

## 8. Backlog Watch
*   **Issue #2293 (Data Isolation Bug):** This issue has been open for 6 days and has received 4 comments. Given its severity, it requires immediate maintainer attention to prevent data corruption for users managing multiple agents.
*   **PR #1323 (Cowork Error Classification):** This PR has been open for over 3 months. While it was updated today, it remains open, suggesting it may require final review or has a specific blocker not yet addressed.

</details>

<details>
<summary><strong>TinyClaw</strong> — <a href="https://github.com/TinyAGI/tinyagi">TinyAGI/tinyagi</a></summary>

No activity in the last 24 hours.

</details>

<details>
<summary><strong>Moltis</strong> — <a href="https://github.com/moltis-org/moltis">moltis-org/moltis</a></summary>

No activity in the last 24 hours.

</details>

<details>
<summary><strong>CoPaw</strong> — <a href="https://github.com/agentscope-ai/CoPaw">agentscope-ai/CoPaw</a></summary>

# CoPaw Project Digest: 2026-07-13

## 1. Today's Overview
The CoPaw project is experiencing high activity, driven primarily by users reporting stability regressions following the v2.0.0 upgrade. With 39 open issues and 26 updated pull requests in the last 24 hours, the community is actively debugging the new Runtime 2.0 architecture. While the project remains functional, the volume of critical bug reports—specifically regarding Windows sandbox stability, context compression logic, and tool execution timeouts—indicates that v2.0.0 is in a fragile state requiring immediate maintenance attention.

## 2. Releases
**No new releases detected.**
The project appears to be stabilizing around **v2.0.0** (with a hotfix bump to `2.0.0.post1` in PR #6007). The absence of a new release suggests the maintainers are focused on closing critical bugs (PRs #6004, #6014) rather than releasing a polished v2.0.1.

## 3. Project Progress
**8 PRs Merged/Closed Today**
*   **Runtime Stability:** PR #6014 was merged to fix shell command timeouts in Runtime 2.0 (addressing the hard-coded 60s limit).
*   **Context & Tooling:** PR #6004 was merged to fix tool call pairing issues, resolving MODEL_EXECUTION_ERROR reports.
*   **Compatibility:** PR #5991 was closed to handle legacy file block types, improving session migration from v1.x to v2.0.
*   **UI/UX:** PR #6011 was closed to fix browser autofill in model settings.
*   **Feature Addition:** PR #5801 (created earlier, closed today) added the **Zalo Bot channel**, expanding platform support to Vietnam's popular messenger.

## 4. Community Hot Topics
The most active discussions revolve around breaking changes in v2.0.0:

*   **Windows Sandbox Critical Failure (Issue #5951):** This is the most severe topic. Users report that the Windows desktop shell (pwsh) is experiencing infinite recursion and memory exhaustion (20GB cap), making the tool unusable.
    *   *Analysis:* This suggests a flaw in the subprocess management or environment isolation in the new Runtime.
*   **Context Compression & Tool Pairing (Issues #5986, #5960):** Multiple users report that the new context compression middleware is breaking the pairing between `tool_calls` and `tool_result` messages, causing 400 Bad Request errors.
    *   *Analysis:* The compression logic is likely splitting messages incorrectly across the boundary of compression.
*   **Shell Execution Timeouts (Issue #5963):** Users are frustrated that `execute_shell_command` is hard-capped at 60 seconds, ignoring custom timeouts, and silently offloading long commands to failure.

## 5. Bugs & Stability
**Severity Ranking:**

1.  **Critical (P0):**
    *   **Windows Sandbox Crash:** pwsh recursion explosion and NTFS ACL pollution (Issue #5951). *Status: Unresolved.*
2.  **High (P1):**
    *   **MODEL_EXECUTION_ERROR:** Broken tool_call/tool_result pairing causing API 400 errors (Issues #5996, #5986, #5985).
    *   **Session Data Loss:** Chat list and history mapping are broken after upgrading to v2.0.0 (Issue #5964).
3.  **Medium (P2):**
    *   **Shell Command Timeout:** Hard-coded 60s limit preventing long-running tasks (Issue #5963).
    *   **UI Glitches:** Feishu messages not appearing in Console UI; TUI crashes on mouse click (Issues #6003, #6008).

## 6. Feature Requests & Roadmap Signals
*   **Cross-Channel Session Handoff:** Users want to seamlessly continue a session from Console to Feishu/DingTalk without splitting the conversation history (Issue #5999).
*   **Session Management:** Requests for import/export and grouping of sessions to manage multiple agents/clusters (Issue #5903).
*   **Tool Result Control:** Users want the ability to truncate or selectively send long tool results to channels to save tokens (Issue #5976).
*   **Visual Fallback:** A request for vision fallback capabilities in the Console UI (PR #5726).

## 7. User Feedback Summary
The user sentiment is currently **dissatisfied with stability**, specifically regarding the v2.0.0 migration.
*   **Dissatisfaction:** "V2.0.0 is becoming less stable than V1.x" (Issue #6013). Users are comparing it unfavorably to competitors like WorkBuddy.
*   **Frustration with Governance:** Users in restricted environments (ARM, low memory) are frustrated by "AUTO" approval modes that trigger constantly despite the sandbox being unavailable (Issue #5994).
*   **Operational Pain:** "The message queue functionality is gone" (Issue #6006) and "Skill pool never updates" (Issue #6001) are causing immediate workflow stoppages.

## 8. Backlog Watch
The following items are long-standing or critical blockers requiring maintainer attention:
*   **Desktop Bundle Missing Modules:** The PyInstaller bundle for the Desktop app is missing the `agentscope.tool._builtin._scripts` submodule, breaking Glob tools (Issue #5965).
*   **Legacy Media Compatibility:** PR #5993 attempts to fix v1.x media compatibility, but the underlying architecture for loading old sessions remains fragile (Issue #5964).
*   **Auto-approval Logic:** The governance layer needs to detect when a sandbox is truly unavailable (Issue #6016) to prevent "approval spam" on devices like OpenWRT or Raspberry Pi.

</details>

<details>
<summary><strong>ZeptoClaw</strong> — <a href="https://github.com/qhkm/zeptoclaw">qhkm/zeptoclaw</a></summary>

No activity in the last 24 hours.

</details>

<details>
<summary><strong>ZeroClaw</strong> — <a href="https://github.com/zeroclaw-labs/zeroclaw">zeroclaw-labs/zeroclaw</a></summary>

**ZeroClaw Project Digest**
**Date:** 2026-07-13
**Project:** ZeroClaw (zeroclaw-labs/zeroclaw)

### 1. Today's Overview
ZeroClaw demonstrated high development velocity today, with 50 Pull Requests updated (49 open, 1 merged/closed) and only 3 Issues opened. This indicates a phase of active implementation and stabilization, likely driven by a push towards the v0.8.3 release cycle or a major feature rollout. The activity is heavily concentrated in runtime stability, channel integrations (specifically Telegram and a new Inkbox channel), and gateway UX improvements.

### 2. Releases
**None.**
No new releases were detected in the last 24 hours. The project is currently in a heavy feature implementation and bug-fixing phase prior to a version bump.

### 3. Project Progress
The project is seeing a massive influx of work, with 49 active PRs in the pipeline. Significant progress is visible in:
*   **Channel Infrastructure:** A major new feature PR (#8384) introduces the "Inkbox" channel (email/SMS/voice/iMessage) with a comprehensive Quickstart.
*   **Runtime Stability:** Multiple PRs are addressing the Agent runtime loop detector (#8937) and history management (#8784) to prevent panics and ensure proper tool-call history preservation.
*   **Gateway UX:** A "In-app upgrade" feature (#8173) is being finalized, allowing the web dashboard to handle auto-restarts and version detection natively.

### 4. Community Hot Topics
The most active discussions are centered on architectural enhancements and complex integrations:
*   **Gateway Kanban Board (RFC):** Issue #8832 proposes a visual Kanban board for the gateway to coordinate agent work, currently waiting for maintainer review.
*   **Inkbox Integration:** PR #8384 is a large-scale feature (Size XL) adding a native channel for Inkbox, indicating a strategic push to support diverse communication protocols.
*   **Memory Security:** PR #8984 introduces content scanning at memory write/recall boundaries, a high-risk but critical security feature.

### 5. Bugs & Stability
Several stability issues were addressed today, with a mix of low and high severity:
*   **High Severity:**
    *   **Gemini Tool-Call History:** PR #8935 fixes a regression where Gemini rejects follow-up requests due to missing thought signatures.
    *   **Agent Lifecycle Events:** PR #8916 fixes a gap in observability where agent start/end events were not emitting for channel turns.
    *   **Loop Detector Hashing:** PR #8937 prevents deep cloning of tool arguments in the loop detector to avoid performance panics.
*   **Medium Severity:**
    *   **Tool-Call Sanitization:** PR #8931 fixes HTTP 400 errors caused by malformed tool-call arguments on upstream providers.
    *   **Bedrock Prompt Caching:** PR #8943 fixes a compatibility issue with Amazon Nova 2 models rejecting `cachePoint` blocks.
*   **Low Severity:**
    *   **UI Polish:** PR #8939 fixes an unwanted horizontal scrollbar in the web dashboard sidebar.

### 6. Feature Requests & Roadmap Signals
User feedback suggests a clear roadmap for the upcoming v0.8.3 release:
*   **Multi-Session Support:** Issue #7543, which requested multi-session chat UI capabilities (new/switch/rename/delete sessions), is marked as "Accepted." This is a high-priority feature likely to land in the next release.
*   **In-App Upgrades:** PR #8173 implements the end-to-end mechanism for web-based upgrades, directly addressing user friction with manual daemon restarts.
*   **Declarative Skills:** PR #8965 introduces auto-activation for skills, moving towards a more declarative configuration model.

### 7. User Feedback Summary
The user base is actively testing new channels and reporting specific configuration friction points:
*   **Telegram Users:** Reported issues with command limits exceeding 100 and configuration property naming errors (#8823), which have been actively patched.
*   **Observability Needs:** Users highlighted that diagnostic tools (Doctor/ZeroCode) were failing to show partial results on timeouts or hiding log paths, which has been addressed in PRs #8910 and #8928.
*   **Documentation:** Community contributors are stepping up to improve docs (e.g., expanding the Telegram guide in #8825).

### 8. Backlog Watch
*   **RFC #8832 (Gateway Kanban):** Needs immediate maintainer review to proceed. This is a high-risk/high-reward architectural change.
*   **PR #8784 (Runtime Refactor):** A complex refactor of the history loop contract that requires careful review due to "risk:high" classification.
*   **PR #8384 (Inkbox):** A large-scale dependency and integration feature that requires QA testing for stability.

</details>