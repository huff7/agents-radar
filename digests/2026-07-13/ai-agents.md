# OpenClaw 生态日报 2026-07-13

> Issues: 287 | PRs: 500 | 覆盖项目: 13 个 | 生成时间: 2026-07-13 05:45 UTC

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

## OpenClaw 项目深度报告

# OpenClaw 项目日报 (2026-07-13)

## 1. 今日速览
今日 OpenClaw 项目活跃度极高，社区非常活跃。过去24小时内共处理 **287 条 Issue**（其中 70 条已关闭），**500 条 Pull Request**（其中 206 条已合并/关闭），PR 的合并率高达 41%。项目发布了 **v2026.7.1-beta.6** 版本，引入了新的模型提供商和路由器，并调整了默认模型配置。整体项目健康度良好，处于快速迭代与功能完善期。

## 2. 版本发布
**v2026.7.1-beta.6**

*   **核心更新**：
    *   **新增模型与提供商**：引入 Featherless, Claude Sonnet 5, Mythos 5, Meta Muse Spark 1.1 以及 **ClawRouter**。
    *   **模型配置调整**：将 GPT-5.6 设为新安装的默认模型。为 Sol 和 Terra 模型配置了 `/think ultra` 模式，为 Luna 模型配置了 `max` 模式。
    *   **功能增强**：在 OAuth 刷新后更新模型可用性。
*   **迁移注意事项**：用户若从旧版本升级，需注意新的默认模型配置，并确保 ClawRouter 或相关新模型的 API Key 已正确配置。

## 3. 项目进展
今日社区在代码修复和架构优化方面取得了显著进展：

*   **核心稳定性修复 (P1)**：
    *   **Subagent 生命周期修正**：PR #95847 修复了后台和 Cron 拥有的子代理树在消耗后代完成情况时的生命周期/交付会计缺口，防止任务状态错误。
    *   **会话恢复机制优化**：PR #105806 解决了“卡死会话恢复”中会错误地保留永远不会产生进度的回复操作（`active_reply_work`），防止网关永久阻塞。
    *   **错误处理重构**：PR #105927 统一了核心、网关、插件运行时和内存宿之间的共享错误格式，改善了错误信息的完整性和可调试性。
*   **安全与健壮性**：
    *   **Base64 验证**：PR #105846 和 #105837 增加了 Base64 解码前的验证，防止恶意或格式错误的音频/图像数据导致服务崩溃或内存耗尽。
*   **平台支持与 UI 体验**：
    *   **Android 支持**：PR #106011 为 Android 平台生成了网关协议模型，增强了平台间的协议一致性。
    *   **Web UI 改进**：PR #105814 增加了 iOS/macOS 原生技能管理功能，PR #106045 修复了会话创建时的刷新状态冲突，PR #106046 优化了聊天界面的发送按钮样式。

## 4. 社区热点
今日讨论最热烈的两个议题集中在安全架构和部署模式上：

*   **[Feature] Masked Secrets - 防止 Agent 访问原始 API Key** (#10659)
    *   **热度**：14 条评论，4 个点赞。
    *   **分析**：这是一个高优先级的安全增强请求。用户希望引入“掩码密钥”系统，允许 Agent 在不直接暴露明文 Key 的情况下使用 Key。这直接回应了 Prompt Injection 攻击和意外泄露的痛点。目前处于讨论阶段，尚未有明确的实现 PR。
*   **[Feature] Gateway-lite 模式（无 AI Harness 的确定性部署）** (#86881)
    *   **热度**：9 条评论。
    *   **分析**：用户提出希望 OpenClaw 能作为一个轻量级的网关、Webhook 或定时任务调度器运行，而不强制加载 AI 模型 Harness。这表明 OpenClaw 正在从单一的“AI Agent 平台”向更通用的“事件驱动基础设施”演进，满足非 AI 场景的需求。

## 5. Bug 与稳定性
今日报告了多个严重程度不一的 Bug，主要集中在会话管理、跨平台兼容性和数据丢失风险上：

*   **[P1] Gateway 长时间卡死与恢复失效** (#76038)
    *   **描述**：Session 长时间停留在 `processing` 状态，事件循环完全阻塞，导致 Gateway 无响应。
    *   **状态**：Open。该 Bug 涉及底层会话恢复机制的双重失效。
*   **[P1] v2026.6.9 内存存储迁移导致全量重新嵌入** (#95495)
    *   **描述**：升级后内存向量存储位置变更且无迁移机制，导致 1499 个文件被全量重新嵌入。
    *   **状态**：**已关闭**。这是昨日发布版本中的严重回归，已修复。
*   **[P2] Node v26 下 HTTP 响应解压失败** (#79752)
    *   **描述**：在 macOS 上使用 Node v26 时，gzip 编码的 HTTP 响应未正确解压，导致 Discord 等渠道通信失败。
    *   **状态**：Open。
*   **[P2] WebChat 会话记录被覆盖** (#77012)
    *   **描述**：v2026.5.2 引入的回归，每次回合都会覆盖 JSONL 会话记录，导致刷新后历史消息丢失。
    *   **状态**：Open。
*   **[P2] macOS TCC 权限疯狂请求** (#94147)
    *   **描述**：macOS 桌面端每秒重建 `CLLocationManager`，导致系统频繁弹出隐私权限请求。
    *   **状态**：Open。

## 6. 功能请求与路线图信号
*   **安全与权限模型**：
    *   #12678 (Capability-based permissions)：基于能力的技能/工具权限模型，默认拒绝高风险操作。
    *   #12219 (Skill Permission Manifest)：技能权限清单标准，要求技能声明所需权限。
*   **性能优化**：
    *   #14785 (Reduce tool schema token overhead)：减少工具模式在上下文中的 token 占用（约 3500 token/session），这是一个持续的热点。
*   **运维与部署**：
    *   #86881 (Gateway-lite)：无 AI Harness 的轻量级部署模式，支持纯网关、定时任务。
    *   #13616 (Backup/restore)：配置和会话历史的备份/恢复工具。
*   **UX 改进**：
    *   #16670 (Onboarding Wizard)：引导向导需包含 Memory/Embedding 设置作为必填步骤。

## 7. 用户反馈摘要
*   **痛点 1：权限管理过于复杂**。用户反馈 Feishu 插件需要 `contact:contact.base:readonly` 权限来获取发送者名字，认为对于简单需求来说权限过大。
*   **痛点 2：跨平台兼容性**。大量用户反馈在 **macOS**（特别是 v26.0.0 和 TCC 权限问题）和 **Windows** 上遇到各种崩溃、重启风暴或进程残留问题。
*   **痛点 3：会话持久化焦虑**。用户非常关心会话记录的丢失和迁移问题，如 WebChat 记录覆盖、z.ai 提供商下的上下文丢失等。

## 8. 待处理积压
以下 Issue 虽然活跃，但长期未得到解决，建议维护者关注：

*   **[P1] Stuck Session Recovery 机制双重失效** (#76038)：自 5 月初报告，涉及核心网关阻塞问题，影响面广。
*   **[P1] request.headers SecretRefs 在嵌入代理上下文中失败** (#77675)：安全相关的严重 Bug。
*   **[P2] iOS/macOS 缺少原生技能管理** (#105741)：移动端体验短板。
*   **[Feature] Masked Secrets** (#10659)：安全增强需求，涉及设计层面，讨论热度高但尚未有代码实现。

---
*数据来源：OpenClaw GitHub Repository (2026-07-13)*

---

## 横向生态对比

基于对 2026-07-13 各开源项目的深度分析，以下是横向对比分析报告：

### 1. 生态全景

当前个人 AI 助手与自主智能体开源生态正处于**从“快速实验期”向“生产级稳定期”过渡的关键阶段**。生态呈现出“百花齐放、架构分化”的态势：既有像 **OpenClaw** 和 **ZeroClaw** 这样致力于构建**全栈式 Agent 基础设施**的“平台型”项目，也有如 **Hermes Agent** 和 **NanoClaw** 这样专注于**特定 Agent 交互模式**的“应用型”项目。整体趋势显示，开发者不再满足于单一的对话模型，而是追求具备**多模态集成、跨平台路由、复杂工作流编排**能力的系统。同时，**安全性与权限管理**（如 Masked Secrets）已成为所有项目在迈向成熟期时的共同必修课。

### 2. 各项目活跃度对比

| 项目名称 | 24h Issues 数 | 24h PR 数 | 状态 | 版本发布 | 健康度评估 |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **OpenClaw** | **287** | **500** | 核心迭代 | v2026.7.1-beta.6 | 🟢 **极高** (核心枢纽) |
| **Hermes Agent** | ~0 | **50** | 核心重构 | 无 | 🟢 **高** (研究驱动) |
| **ZeroClaw** | ~0 | **50** | 大规模重构 | 无 | 🟢 **高** (Gateway 重构) |
| **IronClaw** | ~0 | **50** | 基础设施 | 无 | 🟢 **高** (CI/CD 优化) |
| **CoPaw** | **39** | **26** | 稳定磨合 | v2.0.0.post1 | 🟡 **中** (v2.0 回归期) |
| **NanoBot** | **4** | **14** | 体验优化 | 无 | 🟢 **良** (WebUI 专注) |
| **NanoClaw** | **3** | **13** | 逻辑修复 | 无 | 🟢 **良** (CLI 专注) |
| **NullClaw** | ~0 | **11** | 稳定性 | 无 | 🟢 **良** (集成维护) |
| **LobsterAI** | ~0 | **15** | UI/UX | 无 | 🟢 **良** (协作模块) |

*注：PicoClaw 因摘要生成失败未列入；TinyClaw、Moltis、ZeptoClaw 过去24小时无活动。*

### 3. OpenClaw 在生态中的定位

OpenClaw 在当前生态中扮演着**“全能型 Agent 运营中心”**的角色，类似于开源界的“AI 操作系统”。

*   **优势**：拥有最高的社区活跃度与代码吞吐量（500 PR），证明了其庞大的用户基数和开发深度。它不仅是 Agent 的运行时，更是模型路由器、网关和调度器。引入 **ClawRouter** 和支持多模型（GPT-5.6, Mythos 5）使其具备极强的生态兼容性。
*   **技术路线差异**：与 Hermes Agent（侧重 IDE 集成与知识库检索）和 NanoBot（侧重轻量级 WebUI 与 Dream 会话）不同，OpenClaw 采用了**全栈架构**，覆盖了从后端核心到前端 UI，再到多平台集成的全生命周期，适合需要高度定制和复杂业务逻辑的企业级用户。
*   **社区规模**：其 Issue/PR 数量远超其他同类项目，显示出社区规模最大，但也意味着维护压力最大，需应对更多样化的边缘场景。

### 4. 共同关注的技术方向

1.  **安全与权限模型**
    *   **涉及项目**：OpenClaw, NanoClaw, Hermes Agent, ZeroClaw
    *   **具体诉求**：社区普遍担忧 API Key 泄露。OpenClaw 提议 **Masked Secrets**，NanoClaw 推进 **Guard Seam Phase 2**（统一权限检查），Hermes Agent 修复了日志中的密钥泄露问题。行业共识是 Agent 必须具备细粒度的权限声明与审计能力。

2.  **多模态与全渠道集成**
    *   **涉及项目**：OpenClaw, ZeroClaw, CoPaw, NanoBot
    *   **具体诉求**：不再局限于文本聊天。OpenClaw 引入 Android 支持与新的图像模型；ZeroClaw 集成 **Inkbox**（Email/SMS/Voice）；CoPaw 集成 **Zalo Bot**。趋势是从“聊天机器人”向“全渠道通讯基础设施”演进。

3.  **上下文管理与知识库**
    *   **涉及项目**：Hermes Agent, CoPaw, OpenClaw
    *   **具体诉求**：随着 Agent 能力增强，如何高效管理长上下文成为瓶颈。Hermes Agent 优化 **Agent Wikis** 路由；CoPaw 在 v2.0 中修复 **Context Compression** 破坏配对的问题。目标是智能区分“通用知识”与“私有记忆”。

4.  **网关化与基础设施化**
    *   **涉及项目**：OpenClaw, ZeroClaw, IronClaw
    *   **具体诉求**：项目正从“AI 应用”向“AI 基础设施”转型。ZeroClaw 推进 **Gateway-local Kanban**，OpenClaw 讨论 **Gateway-lite**（无 AI Harness 模式），IronClaw 专注于 **Extension Runtime**。这意味着 AI Agent 可能会作为底层服务被其他应用调用。

### 5. 差异化定位分析

| 维度 | **OpenClaw** | **Hermes Agent** | **NanoBot** | **ZeroClaw** |
| :--- | :--- | :--- | :--- | :--- |
| **核心定位** | 全栈 Agent 平台 | 研究型 Agent 智库 | 轻量级 WebUI 助手 | 高性能 Gateway 运行时 |
| **架构重心** | 核心 + 网关 + UI | 核心 + IDE 集成 | 核心 + WebUI + Discord | 核心 + 运行时 + Inbound |
| **主要用户** | 企业开发者、运维人员 | 开发者、研究员 | 个人用户、轻量部署者 | 架构师、系统集成商 |
| **技术栈特点** | 高度模块化，路由复杂 | MoA (多模型编排)，Wiki | Dream 会话，Ollama 优化 | 原生协议支持，Hook 机制 |
| **独特价值** | 统一模型路由与多模型支持 | Cursor IDE 深度集成 | 极致轻量与本地化体验 | Inbound 通道丰富 (Inkbox) |

### 6. 社区热度与成熟度

*   **快速迭代期**：
    *   **OpenClaw, ZeroClaw, IronClaw**：这些项目处于“激进开发”阶段。OpenClaw 和 ZeroClaw 拥有数百级别的 PR 提交，涉及底层架构重构（如生命周期管理、Hook 机制），技术风险较高但功能更新极快。
*   **稳定磨合期**：
    *   **CoPaw**：刚刚发布 v2.0，正处于“阵痛期”。大量用户反馈沙箱崩溃、上下文压缩失效等兼容性问题，社区主要精力集中在 Bug 修复和回滚策略上。
*   **质量巩固期**：
    *   **NanoBot, NullClaw, LobsterAI**：这些项目 PR 数量适中（个位数到十几位），更多是在打磨 UI、修复特定平台的集成问题（如 Discord, Teams, Windows 安装器），显示社区正在追求产品的精致度和稳定性，而非功能堆砌。

### 7. 值得关注的趋势信号

1.  **Agent 安全的“硬约束化”**：从“可以配置”转向“默认拒绝”。OpenClaw 的 Masked Secrets 和 Hermes 的权限模型显示，AI 智能体的安全性已不再是可选功能，而是进入主分支的强制性要求。
2.  **从“Outbound”到“Inbound”**：大多数 Agent 项目专注于发送消息。但 **ZeroClaw** 和 **OpenClaw** 正在大力增强 **Inbound** 能力（接收 Email, SMS, iMessage），这标志着 Agent 正在从“被动响应”向“主动接入生活/工作流”转变。
3.  **基础设施的“无状态化”与“网关化”**：**IronClaw** 的 Extension Runtime 和 **OpenClaw** 的 Gateway-lite 讨论表明，未来的 AI 开发可能不再直接运行完整的 Agent 进程，而是通过网关调用轻量级的 Agent 服务，类似于 API 网关与微服务的关系。
4.  **版本升级的“破坏性测试”**：**CoPaw** 的 v2.0 体验揭示了行业通病：大型版本迭代往往带来严重的兼容性回归。这对开发者提出了更高的要求——在发布新架构前，必须提供完善的迁移指南和沙箱隔离机制。

---

## 同赛道项目详细报告

<details>
<summary><strong>NanoBot</strong> — <a href="https://github.com/HKUDS/nanobot">HKUDS/nanobot</a></summary>

# NanoBot 项目日报 (2026-07-13)

## 1. 今日速览
NanoBot 项目在 2026-07-13 表现出高活跃度，过去24小时共处理 **4 个 Issue**（1 新开/活跃，3 已关闭）和 **14 个 PR**（6 待合并，8 已关闭/合并）。社区主要聚焦于 **WebUI 交互体验**、**Discord 集成稳定性** 以及 **Dream 会话管理** 的优化。整体项目健康度良好，核心功能模块的 Bug 修复效率较高，项目正在向更稳定的架构演进。

## 2. 版本发布
无新版本发布。

## 3. 项目进展
今日有 8 个 PR 被关闭/合并，主要集中在修复关键 Bug 和提升用户体验：
*   **WebUI 交互修复**：PR #4903 成功修复了 WebUI 启动时终端输入流阻塞的问题，确保用户可以正常输入命令。
*   **Discord 集成优化**：PR #4899 解决了 Discord 适配器未授权消息路由的逻辑缺陷，修复了 DM 对话无法正常建立的问题。
*   **系统稳定性增强**：PR #4896 修正了心跳任务执行的提示词逻辑，解决了 v0.2.1 版本后的回归问题；PR #4892 限制了 WebUI 的远程工作区访问权限，提升了安全性。
*   **数据管理修复**：PR #4900 修复了 Dream 会话文件修剪功能，使其能够正确处理 base64 编码的文件名。

## 4. 社区热点
当前讨论热度较高的项目动向集中在**性能优化**和**架构重构**上：
*   **Ollama 性能瓶颈**：Issue #4867 引发了对本地模型调用延迟的广泛讨论，用户反映 Ollama 调用增加了不必要的 60 秒延迟，严重影响本地部署体验。
*   **架构演进**：PR #4769 和 #4866 均涉及核心架构的重构或新功能绑定，涉及 WebUI 运行时访问的集中化以及模型预设与会话的绑定，这是项目迈向更成熟架构的重要信号。

## 5. Bug 与稳定性
今日报告的 Bug 按严重程度排列如下（*已修复* / *待合并*）：

*   **[高] 集成失效**：
    *   Discord 机器人无法接收消息 (#4897) - *已修复*。
    *   WebUI 启动后终端输入流泄漏导致无法交互 (#4903) - *已修复*。
*   **[高] 性能与超时**：
    *   Ollama 本地模型调用延迟过高 (#4867) - *已关闭*。
    *   流式 LLM 请求缺乏墙钟超时保护 (#4902) - *待合并*。
*   **[中] 数据管理**：
    *   Dream 会话文件修剪功能失效（base64 编码兼容性）(#4894) - *已修复*。
    *   `/dream-log` 显示非 Dream 提交内容 (#4893) - *待处理*。
*   **[中] 配置与安全**：
    *   WebUI 远程会话权限过大 (#4892) - *已修复*。
    *   转录 API Key 环境变量占位符解析问题 (#4895) - *待合并*。

## 6. 功能请求与路线图信号
根据当前活跃的 PR，项目下一阶段的开发信号如下：
*   **会话级配置**：PR #4866 提议将模型预设绑定到会话，这意味着项目将支持更细粒度的会话配置，用户可以为不同对话选择不同的模型策略。
*   **WebUI 产品化**：PR #4855 和 #4769 展示了 WebUI 向“引导式设置”和“集中化运行时管理”演进的趋势，表明官方 UI 正在向更易用、更安全的产品级界面发展。
*   **后台任务管理**：PR #4879 通过特性开关控制后台持续任务，这暗示未来可能会提供更精细的后台任务管理能力，以平衡主线程交互与后台计算。

## 7. 用户反馈摘要
从 Issues 中提炼出的真实用户痛点包括：
*   **本地部署体验差**：用户反馈在 32GB 显存环境下使用 Ollama 模型时，单次交互增加 60 秒延迟，导致系统“完全不可用”。
*   **集成配置不透明**：Discord 集成配置完成后，用户状态显示在线但无法收到消息，缺乏明确的报错反馈。
*   **数据管理混乱**：用户在使用 Dream 会话管理工具时，发现旧文件格式与新格式不兼容，导致清理功能失效。

## 8. 待处理积压
以下 Issue 和 PR 需要维护者重点关注或处理：
*   **高优先级（存在冲突）**：
    *   **PR #4866**：[channel, webui, feature] 将模型预设绑定到会话 - 存在冲突，需尽快解决以推进功能。
    *   **PR #4769**：[webui, refactor] 中心化 WebUI 运行时访问 - 存在冲突，影响架构重构进度。
*   **中优先级（待审核/合并）**：
    *   **PR #4902**：流式 LLM 请求超时修复 - 修复了潜在的长时间挂起风险，建议尽快合并。
    *   **Issue #4893**：`/dream-log` 显示非 Dream 提交 - 影响数据可视化的准确性，需尽快修复。
    *   **PR #4145**：天气技能修复 - 已合并多文件，处于待审核状态。

</details>

<details>
<summary><strong>Hermes Agent</strong> — <a href="https://github.com/nousresearch/hermes-agent">nousresearch/hermes-agent</a></summary>

# Hermes Agent (NousResearch/hermes-agent) 日报
**日期**: 2026-07-13  
**分析维度**: 项目活跃度、代码质量、社区反馈、功能演进

---

## 1. 今日速览
今日项目呈现出**极高**的活跃度，过去24小时内提交了 **50 条 Pull Requests**（其中 35 条待合并），显著高于平均水平。尽管没有新版本发布，但核心代码库在“Agent Wikis 路由优化”、“MoA (多模型编排) 稳定性加固”以及“Cursor IDE 集成”等方面取得了实质性进展。社区讨论集中在 macOS 安装程序的安全漏洞、桌面端重启导致的数据丢失以及 Mistral LLM 提供商的缺失上。

## 2. 版本发布
*   **无新版本发布**。当前项目处于快速迭代期，主要更新通过持续集成 (CI) 合并至主分支。

## 3. 项目进展
今日有 **4 条关键 PR 被合并或关闭**，主要集中在核心基础设施和工具链的增强：

*   **Agent Wikis 路由优化 (PR #63595)**: 实现了对覆盖域名的 Agent Wikis 检索优先路由，这将显著提升 Agent 在处理已知知识库问题时的响应速度和准确性。
*   **MoA (多模型编排) 稳定性加固 (PR #63596)**: 引入了成本/延迟预算、熔断器和降级策略，解决了多模型编排中的性能瓶颈和潜在崩溃风险，提升了系统在生产环境下的鲁棒性。
*   **Cursor IDE 集成增强 (PR #63608)**: 通过 ACP (Anthropic Control Protocol) 事件渲染，改进了 Cursor 代理工具调用和进度的原生展示，优化了开发者的使用体验。
*   **网关审批超时修复 (PR #63501)**: 修复了终端命令和代码执行审批的超时逻辑，确保了用户对长耗时操作的掌控权。

## 4. 社区热点
*   **[Feature] 支持 Mistral 作为 LLM 提供商 (Issue #20859)**
    *   **热度**: 👍 18 (最高)
    *   **分析**: 这是一个长期未决但呼声极高的需求。用户指出 Mistral 用户基数大且语音模型已集成，请求原生支持。鉴于 Hermes Agent 专注于多模型兼容性，此需求若被采纳将极大扩展用户群。
    *   [查看详情](https://github.com/nousresearch/hermes-agent/issues/20859)

*   **[Bug] macOS 安装程序劫持全局 Node/npm (Issue #63612)**
    *   **热度**: 新增高优 Bug
    *   **分析**: 这是一个严重的兼容性和安全风险。GUI 启动的安装脚本错误检测到系统 Node 存在，导致其将 Hermes 自带的 Node 覆盖到用户全局路径，可能破坏用户环境。这反映了安装脚本在跨平台路径检测上的脆弱性。
    *   [查看详情](https://github.com/nousresearch/hermes-agent/issues/63612)

*   **[Feature] Relay Messenger 平台支持 (PR #63605)**
    *   **热度**: 新增功能请求
    *   **分析**: 新增对 Relay messenger 的支持，允许 AI 以联系人形式存在。这扩展了 Hermes Agent 的通讯协议支持范围。
    *   [查看详情](https://github.com/nousresearch/hermes-agent/pull/63605)

## 5. Bug 与稳定性
今日报告的 Bug 涉及安全、数据丢失和 UI 适配，按严重程度排列：

*   **🔴 严重 - 数据丢失风险 (Issue #63599)**
    *   **描述**: Desktop GUI 强制重启时，Context Compaction（上下文压缩）注入了过期的摘要，导致重启后丢失最近对话。
    *   **状态**: Open (待修复)
    *   [查看详情](https://github.com/nousresearch/hermes-agent/issues/63599)

*   **🟠 高危 - 密钥泄露风险 (Issue #63594)**
    *   **描述**: Kanban worker 日志绕过了 `security.redact_secrets`，导致私钥在日志文件中以明文存在。
    *   **状态**: Open (待修复)
    *   **关联 PR**: #63610 (修复 PR 已开，待合并)
    *   [查看详情](https://github.com/nousresearch/hermes-agent/issues/63594)

*   **🟠 高危 - 路径劫持 (Issue #63612)**
    *   **描述**: 如上所述，安装程序破坏全局环境变量。
    *   **状态**: Open
    *   [查看详情](https://github.com/nousresearch/hermes-agent/issues/63612)

*   **🟡 中危 - UI 文本换行 (Issue #63601)**
    *   **描述**: 桌面端长模型名称导致布局错乱。
    *   **状态**: Open，但已有对应修复 PR (#63607)。
    *   [查看详情](https://github.com/nousresearch/hermes-agent/issues/63601)

## 6. 功能请求与路线图信号
*   **LLM 生态扩展**: 用户强烈要求支持 **Mistral** (Issue #20859)。随着 Claude/OpenAI 支持的完善，开源社区对 Mistral 的需求日益增长，这可能成为下一个版本的主要补充目标。
*   **Agent Wikis 深度集成**: PR #63595 和 #63606 表明，项目正在将 Agent Wikis（知识库）作为搜索功能的默认路由层，这是提升 Agent 智能水平的关键方向。
*   **平台插件化**: PR #63605 (Relay) 和之前的更新表明，项目正致力于降低新平台接入的门槛，支持更多第三方通讯应用。

## 7. 用户反馈摘要
*   **环境兼容性痛点**: 用户在 macOS 环境下频繁遇到安装脚本误判的问题，导致系统工具被覆盖，反映出跨平台环境变量管理的复杂性。
*   **桌面端健壮性**: 桌面用户反馈在强网络波动或强制重启场景下，应用存在“静默失败”或数据回滚错误的情况，急需加强状态恢复机制。
*   **搜索与知识库**: 用户希望 Agent 在搜索时能优先使用内部知识库（Agent Wikis）而非通用网络搜索，以提高准确性和速度。

## 8. 待处理积压
*   **长期未决 Feature (#20859)**: 支持多种 LLM 提供商（特别是 Mistral），尽管讨论已久，但尚未有实质性合并的 PR，建议维护者评估是否需要设立专项。
*   **大型重构 PR (#60638)**: 桌面端布局树重构（贡献驱动 Shell）已开启 5 天，涉及大量 UI 逻辑变更，需关注是否阻塞其他功能的开发。
*   **安全配置项 (#26064)**: 针对特定 IP 范围的安全豁免配置项，已开启 2 个月，可能被边缘化，需确认是否仍符合当前安全策略。

</details>

<details>
<summary><strong>PicoClaw</strong> — <a href="https://github.com/sipeed/picoclaw">sipeed/picoclaw</a></summary>

⚠️ 摘要生成失败。

</details>

<details>
<summary><strong>NanoClaw</strong> — <a href="https://github.com/qwibitai/nanoclaw">qwibitai/nanoclaw</a></summary>

# NanoClaw 项目日报
**日期：** 2026-07-13  
**分析师：** AI 智能体开源项目分析师

---

### 1. 今日速览
今日 NanoClaw 项目保持了活跃的开发节奏。在 24 小时内，社区共处理了 3 条 Issues 和 13 条 Pull Requests，显示出强劲的工程推进。虽然尚未发布新版本，但社区正在积极修复关键 Bug（特别是关于长文本输出和重复回复的问题）并实现新功能，项目整体健康度良好。

### 2. 版本发布
**无新版本发布。**

### 3. 项目进展
今日项目在稳定性和用户体验方面取得了实质性进展，主要体现在两个核心 Bug 的修复上：
*   **修复长文本输出限制 (PR #3024 [CLOSED])：** 修复了 #3023 报告的“Claude agent 被静默限制在 32000 输出 Token”的问题。该问题导致长轮次在生成长文件（如 CAD 项目的 OpenSCAD 文件）时中途失败。PR #3024 解决了未设置 `CLAUDE_CODE_MAX_OUTPUT_TOKENS` 环境变量导致的默认限制问题，确保长任务能够正常完成。
*   **优化 LINE 渲染与修复重复回复 (PR #3030 [CLOSED], #3028 [OPEN])：** PR #3030 修复了 LINE 频道无法正确渲染 Markdown 的问题（如表格、粗体），将其转换为纯文本发送；同时 PR #3028 正在解决“re-wrap nudge”导致的重复回复 Bug，通过在回合开始时捕获发送的消息序列，防止在 Agent 已通过 `send_message` 回复后再次触发重复逻辑。

### 4. 社区热点
今日讨论最集中的话题集中在**长文本处理稳定性**与**操作逻辑健壮性**上：
*   **Token 限制危机 (#3023)：** 这是一个影响用户生产力的严重 Bug。用户报告在处理 CAD 等需要生成大量代码/文本的任务时，Claude 模型会被硬性限制在 32000 Token，导致任务失败。该问题迅速引起了开发者的重视，并已通过 PR #3024 修复。
*   **重复回复逻辑缺陷 (#3026)：** 用户反馈 Agent Runner 在特定情况下（如长工具链后）会触发 re-wrap nudge，导致模型被重新调用并产生重复回复。这涉及复杂的消息分发逻辑，目前已有修复 PR #3028 在进行中。

### 5. Bug 与稳定性
今日报告的 Bug 按严重程度及处理状态排列：
*   **[已修复] Token 输出上限截断 (#3023)：** 所有 Claude agent 默认被限制在 32000 Token，导致长任务中断。
    *   *Fix:* PR #3024
*   **[已修复] 重复回复问题 (#3026)：** `dispatchResultText` 无法识别 Agent 已通过 `send_message` 发送的消息，导致 re-wrap nudge 重复执行。
    *   *Fix:* PR #3028
*   **[严重/高危] 容器 /tmp 目录污染 (#3027)：** Agent 间歇性静默，容器无法启动。错误日志显示 `/tmp/onecli-proxy-ca.pem` 被错误地视为目录进行操作，可能存在权限提升风险。
    *   *Fix:* PR #3027 (Open)
*   **[中等] Rate Limit 日志噪音 (#3016)：** 即使请求被允许，Rate limit 事件也被错误地记录为 `quota` 错误，产生大量日志干扰。
    *   *Status:* Open

### 6. 功能请求与路线图信号
今日的 PR 展示了项目向**安全加固**和**操作便捷性**发展的趋势：
*   **安全与权限控制增强：**
    *   **Operator Resolution Verbs (#3029)：** 为 ncl approvals 增加批准、拒绝等 CLI 操作动词，解决操作员无法在 CLI 中解除阻塞的问题。
    *   **Guard Seam Phase 2 (#2986)：** 实施基于决策函数的统一权限控制，所有特权操作在执行前必须经过 `guard()` 函数的 `allow | hold | deny` 检查。
    *   **本地审计日志 (#2987)：** 引入 `/add-audit` skill，提供可选的本地审计日志功能。
*   **配置与模板优化：**
    *   **模板任务支持 (#3022)：** 允许在 `tasks/*.md` 中定义定时任务，简化模板作者的工作流程。
    *   **WhatsApp 安全警告 (#3021)：** 在连接共享或个人 WhatsApp 号码时增加警告，防止账号被临时封禁。
    *   **Per-group Harness Toggles (#2983)：** 为新组提供更lean的默认配置，同时保留旧组的兼容性。

### 7. 用户反馈摘要
从 Issues 和 PR 描述中提炼出的真实用户痛点：
*   **场景：** 处理大型代码生成任务（CAD/OpenSCAD）。
*   **痛点：** 期望系统能处理比 32000 Token 更长的输出，而不是在中间突然报错。
*   **场景：** 复杂的 Agent 交互流程。
*   **痛点：** 对消息重复发送感到困惑，这破坏了对话的连贯性，并可能造成消息轰炸。

### 8. 待处理积压
以下重要 PR 已存在数日，需维护者尽快审查合并：
*   **#2986 (Guard Seam Phase 2)：** 安全核心功能，创建于 7-09，涉及权限控制的架构性变更。
*   **#2987 (Audit Skill)：** 安全/审计功能，创建于 7-09，基于最新代码进行了多次 Rebase。
*   **#2982 (Tool Allowlist Drift)：** 7-08 提交，涉及 CLI 版本兼容性检查，防止工具列表与实际环境不一致。
*   **#3020 (Rescue Replies)：** 7-11 提交，解决 Agent Runner 的逻辑 Bug，尚未合并。

</details>

<details>
<summary><strong>NullClaw</strong> — <a href="https://github.com/nullclaw/nullclaw">nullclaw/nullclaw</a></summary>

# NullClaw 项目日报 (2026-07-13)

## 1. 今日速览
NullClaw 项目在过去 24 小时内保持了**高活跃度**，共处理了 11 条 Pull Requests（其中 4 条已合并/关闭，7 条待处理）。项目整体健康度良好，主要工作集中在**系统集成稳定性修复**（Discord、Teams、Cron）和**文档完善**上。值得注意的是，核心的 Cron 调度功能和 Discord 网关连接稳定性得到了重点维护，未发现新版本发布。

## 2. 版本发布
**无**。项目当前处于持续迭代开发阶段，暂无新版本发布。

## 3. 项目进展
今日成功合并并关闭了 4 个 PR，主要推进了以下工作：
*   **配置与日志优化**：PR #951 和 PR #950 分别解决了 Agent 失败时的日志噪音问题以及测试环境下的内存泄漏问题，提升了系统的可观测性和测试稳定性。PR #949 增加了 `queue_mode` 的可配置性，赋予用户更灵活的会话队列管理能力。
*   **Cron 调度增强**：PR #948 修复了 Cron Agent 交付归属传递的问题，确保调度任务的来源信息能正确记录。
*   **总体影响**：这些合并显著改善了系统的鲁棒性，特别是针对错误处理和测试隔离的改进，有助于减少生产环境中的未知问题。

## 4. 社区热点
目前社区关注的热点主要集中在以下几个具有高影响力的开放 PR：

*   **#961 [FEATURE] feat(memory): add configurable auto-recall, recall_limit, max_context_bytes**
    *   **热度分析**：虽然点赞数为 0，但该 PR 引入了内存系统的核心可配置参数（如 `auto_recall`, `recall_limit`），这是高级用户进行精细化管理的关键功能，具有极高的路线图价值。
    *   **链接**：[nullclaw/nullclaw PR #961](https://github.com/nullclaw/nullclaw/pull/961)

*   **#954 [BUGFIX] Fix: one-shot cron jobs silently fail to deliver messages**
    *   **热度分析**：涉及严重的功能性 Bug（静默失败/Use-After-Free），直接影响定时任务的核心功能，社区对此类稳定性问题关注度极高。
    *   **链接**：[nullclaw/nullclaw PR #954](https://github.com/nullclaw/nullclaw/pull/954)

*   **#958 [BUGFIX] fix(teams): accept lowercase `serviceurl` JWT claim**
    *   **热度分析**：修复了 MS Teams 集成中的 Token 验证错误（403），解决了特定平台的连接障碍。
    *   **链接**：[nullclaw/nullclaw PR #958](https://github.com/nullclaw/nullclaw/pull/958)

## 5. Bug 与稳定性
今日报告的 Bug 按严重程度排序如下：

*   **[严重] #954 Use-After-Free 导致定时任务静默失败**：`OutboundMessage.channel` 的释放后使用导致 "schedule once" 类型的 Cron 任务在执行后无法发送消息，需紧急处理。
    *   *状态：待合并*
*   **[中等] #953 Discord 网关 Socket 恢复**：Discord 连接断开后，网关 Socket 恢复机制存在缺陷，可能导致连接卡死。
    *   *状态：待合并*
*   **[中等] #958 Teams JWT 验证不兼容**：Bot Framework Token 验证时对 `serviceUrl` 的大小写敏感处理不当，导致消息被拒绝。
    *   *状态：待合并*
*   **[低] #959 Cron 配对 Token 持久化**：调度工具访问时缺少持久化的 Token，可能影响跨会话的安全性。
    *   *状态：待合并*

*(注：今日已合并的 #951, #950, #949, #948 均为稳定性修复)*

## 6. 功能请求与路线图信号
*   **内存系统精细化控制**：PR #961 提出了为 Memory 模块增加配置项的需求。这表明项目正在从“开箱即用”向“可定制化”演进，未来版本可能引入更细粒度的上下文管理策略。
*   **文档完善**：PR #962 正在补充 Anthropic Provider 的原生支持文档（含 OAuth），这暗示项目正在积极扩展对主流 LLM 提供商的支持深度，降低用户集成门槛。

## 7. 用户反馈摘要
从当前的 PR 动态中提炼出的用户痛点：
*   **集成兼容性**：用户在尝试接入 Teams 时遇到了 Token 验证失败（403），说明跨平台集成（特别是微软生态）仍存在兼容性细节待完善。
*   **任务可靠性**：Cron 任务（特别是单次执行任务）的“静默失败”是一个严重的反馈，用户期望调度任务要么成功，要么明确报错，而不是悄无声息地失败。
*   **日志噪音**：Agent 子进程失败时的日志处理（stderr 混入 stdout）影响了日志的可读性，用户反馈希望过滤掉系统初始化日志。

## 8. 待处理积压
目前共有 7 个开放 PR 待处理，建议维护者优先级排序如下：
1.  **稳定性优先**：#954 (Cron UAF), #953 (Discord Socket), #958 (Teams JWT)。
2.  **功能增强**：#961 (Memory Config), #962 (Anthropic Docs)。
3.  **维护性**：#956 (Dependabot Alpine update)。

*   **链接汇总**：[Pull Requests 列表](https://github.com/nullclaw/nullclaw/pulls?q=is%3Apr+is%3Aopen+sort%3Aupdated-desc+updated%3A2026-07-12..2026-07-13)

</details>

<details>
<summary><strong>IronClaw</strong> — <a href="https://github.com/nearai/ironclaw">nearai/ironclaw</a></summary>

# IronClaw 项目日报
**日期**: 2026-07-13
**分析师**: AI 智能体与个人 AI 助手领域开源项目分析师

---

## 1. 今日速览
IronClaw 项目今日保持极高的开发活跃度，共产生 **50 条 Pull Request**（待合并 28 条）和 **5 条 Issues**。项目当前正处于 **Extension Runtime（扩展运行时）** 的关键开发阶段（P5/P6），同时将大量精力投入到 **CI/CD 流程的稳定性加固** 中。尽管功能迭代迅速，但 CI 碎片化和测试隔离问题成为阻碍主分支进度的首要瓶颈，导致约 70% 的覆盖率测试失败。

## 2. 版本发布
**无**。今日无新版本发布。

## 3. 项目进展
今日项目在依赖管理、测试基础设施和核心功能扩展方面均有推进：
*   **依赖项更新**：PR #5926（已关闭）成功合并了 20 个依赖包的更新，包括 agent-client-protocol 和 webpki-roots 等。
*   **CI 基础设施优化**：PR #6022 正在实施静态 pre-push 检查，旨在拦截导致 CI 失败的常见问题（如 `include_str!` 路径和 Docker-COPY 覆盖率问题）。
*   **工具链改进**：PR #6024 修复了内置时间工具对 Unix 时间戳的解析能力，增强了 agent 的工具使用便利性。
*   **扩展运行时 (Extension Runtime)**：P5（交付协调器）和 P6（配置/UI 完整性）的 PR 正在稳步推进，涉及 Slack/Telegram 出站功能和前端迁移。

## 4. 社区热点
今日社区讨论热度最高的焦点集中在 **CI 稳定性** 与 **测试隔离** 上：
*   **CI 碎片化危机**：Issue #6014 指出主分支 CI 失败率高达 70%，主要源于非确定性测试和覆盖率矩阵的崩溃，这直接阻碍了代码合并。
*   **解决方案提案**：Issue #6018 提议引入静态 pre-push 检查作为“第一道防线”，以捕获那些本可被静态分析发现但当前被漏过的错误。
*   **活跃修复 PR**：PR #6022 和 #6023 是社区针对上述热点问题的直接回应，分别针对静态检查和测试环境锁机制进行修复。

## 5. Bug 与稳定性
今日报告的 Bug 主要集中在并发、竞态条件和测试超时上，部分已修复：

*   **[高严重] CI 覆盖率矩阵崩溃** (#6014)
    *   **描述**：约 70% 的七月主分支推送运行失败，归因于 CI 结构性脆弱，非确定性测试导致覆盖矩阵中断。
    *   **状态**：Open | **Fix PR**: #6022 (Static checks), #6023 (Test lock fix)
*   **[中严重] Slack 触发器 E2E 测试超时** (#6016)
    *   **描述**：Slack 触发器交付测试在 `crates/ironclaw_reborn_composition` 中间歇性超时，导致测试和覆盖率失败。
    *   **状态**：Open | **Fix PR**: #6020 (Deterministic Slack journeys)
*   **[中严重] 数据库并发竞态条件** (#6017)
    *   **描述**：Postgres 删除/重建竞态和 libSQL 并发写入导致契约测试在并行负载下失败。
    *   **状态**：Open
*   **[低严重] 测试环境竞态** (#6015)
    *   **描述**：`build_runtime_input_production_*` 测试在 `all-features` 覆盖率分支中因 `std::env` 竞争而间歇性失败。
    *   **状态**：**Open (已修复)** | **Fix PR**: #6023 (Unified crate process-env test lock)

## 6. 功能请求与路线图信号
用户反馈和 PR 提交揭示了以下功能演进方向：

*   **扩展运行时 (Extension Runtime) - P5/P6**：
    *   **信号**：PR #6012 和 #6025 正在推进交付协调器和 UI/配置的迁移，标志着项目正从后端逻辑向全栈交互演进。
    *   **细节**：增加了对 Slack/Telegram 等渠道的原生出站支持，并完善了配置管理。
*   **成本与使用监控**：
    *   **信号**：PR #5976 添加了 OpenAI 兼容 API 的按次 Token 使用量和美元成本追踪，解决了模型可见性问题。
*   **工具链增强**：
    *   **信号**：PR #6024 修复了时间工具对 Unix 时间戳的解析，PR #6019 增强了 `doctor` 命令的依赖检查，表明项目正在精细化前端工具的易用性。

## 7. 用户反馈摘要
尽管今日 Issues 评论数为 0，但从标题和描述中可提炼出用户的核心痛点：
1.  **CI 流程体验极差**：用户对频繁的 CI 失败（尤其是覆盖率矩阵）感到沮丧，这直接影响了开发效率和代码提交信心。
2.  **工具边界模糊**：在并发场景下，工具（如 LocalDev）可能因环境竞态导致结果不一致，缺乏明确的隔离机制。
3.  **Agent 上下文管理**：模型在处理工具输出时可能遇到边界情况（如时间戳格式、编辑前的读取），需要更智能的兜底逻辑。

## 8. 待处理积压
*   **PR 积压**：目前有 **28 个 PR 待合并**，其中包含多个大型 PR（如 #5970, #5959），合并队列较长，建议维护者关注代码审查效率。
*   **关键 Issue**：**#6014** 仍未解决，这是阻碍主分支健康度的最大隐患。建议优先级最高。
*   **测试稳定性**：#6016 (Slack E2E) 和 #6017 (DB Concurrency) 需要持续关注，可能需要重构测试逻辑而非单纯修复超时。

</details>

<details>
<summary><strong>LobsterAI</strong> — <a href="https://github.com/netease-youdao/LobsterAI">netease-youdao/LobsterAI</a></summary>

# LobsterAI 项目动态日报

**日期：** 2026-07-13
**数据范围：** 过去 24 小时 (2026-07-12 00:00 - 2026-07-13 00:00)

---

## 1. 今日速览
项目整体开发活跃度较高，**PR 产出显著**，过去 24 小时有 15 条 PR 更新，其中 13 条已合并或关闭，主要集中在 Cowork（协作）模块的体验优化、构建系统的改进以及 Windows 平台的 UI 细节修复。相比之下，Issue 讨论较为冷清，仅 1 条活跃。项目处于稳步迭代状态，但在**多 Agent 配置隔离**方面存在关键 Bug，影响了核心使用场景。

## 2. 版本发布
*   **无**。当前无新版本发布计划。

## 3. 项目进展
今日合并/关闭的重要 PR 推进了以下功能与修复：

*   **Cowork 协作模块优化**：
    *   PR #2319：重构首页快速操作场景，将“教育学习”映射为“文档写作”，优化 Office 场景提示词，并修复了快速操作栏交互逻辑。
    *   PR #2315, #2292, #2300：修复了引导（Steer）队列的连接、路由稳定性和附件支持问题，解决了会话切换和流式更新中的状态错乱。
*   **UI/UX 全面升级**：
    *   PR #1488：定时任务模块 UI 全面改版，采用卡片网格布局，新增搜索、日期分组及历史查询功能，提升操作直观性。
    *   PR #2322：优化文件卡组件展示。
    *   PR #2316：修复 Windows 标题栏 Logo 压缩问题，确保侧边栏折叠时的视觉一致性。
*   **构建与部署**：
    *   PR #2323：新增 Windows Web Installer 可选构建目标，支持通过 CDN 下载应用包。
    *   PR #2320, #2289：修复定时任务跳过逻辑以及上下文压缩重试维护的清理问题。

## 4. 社区热点
*   **[OPEN] 多 Agent 配置文件覆盖 Bug (#2293)**：这是今日唯一的活跃 Issue，拥有 4 条评论。用户反映在建立多个 Agent 时，修改任意一个 Agent 的“关于你”或 `USER.md`，会导致所有 Agent 的文件被替换，无法建立独立的配置。该 Bug 自 7 月 7 日提出，至今未修复，严重阻碍了多 Agent 并行工作的能力。
    *   [链接](https://github.com/netease-youdao/LobsterAI/issues/2293)
*   **[stale] Cowork 输入过长误报修复 (#1323)**：标记为 Stale 的 PR，旨在修复上游消息包含 `max_tokens` 时误报“输入过长”的问题，可能已被维护者搁置。

## 5. Bug 与稳定性
*   **[高优先级] 多 Agent 配置文件覆盖 (Issue #2293)**：未修复。用户反馈重启后所有 Agent 的 `USER.md` 会被覆盖，属于数据持久化与隔离机制的严重缺陷。
*   **[已修复] Windows 标题栏 Logo 压缩 (PR #2316)**：修复了侧边栏折叠时 Logo 被压缩的视觉问题。
*   **[已修复] macOS 更新失败 (PR #2321)**：修复了 `hdiutil` 命令失败导致的 Mac 系统更新问题。
*   **[已修复] 引导路由不稳定 (PR #2292)**：修复了会话切换时的状态污染和流式更新延迟问题。

## 6. 功能请求与路线图信号
*   **桌面通知系统升级 (PR #2318)**：提议将通知系统从 TaskCompletionNotifier 升级为 DesktopNotificationManager，增加权限请求等待通知、前台模式以及已解决请求的跟踪功能，提升系统交互闭环。
    *   [链接](https://github.com/netease-youdao/LobsterAI/pull/2318)
*   **Windows Web 安装器 (PR #2323)**：提出了一个可选的 Web 安装方案，旨在降低 Windows 平台的安装门槛，属于发行版层面的功能增强。

## 7. 用户反馈摘要
*   **核心痛点**：用户在尝试配置多 Agent 工作流时，发现配置文件（USER.md）存在**全局污染**现象。这意味着用户无法在同一软件实例中为不同的 Agent 设置独立的“关于”或“系统提示词”，严重降低了多 Agent 场景的实用性。
*   **UI 细节反馈**：Windows 用户反馈标题栏 Logo 在侧边栏折叠时会出现压缩变形，影响了应用的精致感。

## 8. 待处理积压
*   **未解决 Issue**：
    *   [Issue #2293](https://github.com/netease-youdao/LobsterAI/issues/2293)：多 Agent 配置覆盖 Bug，需优先处理数据隔离逻辑。
*   **长期未响应 PR (Stale)**：
    *   [PR #1323](https://github.com/netease-youdao/LobsterAI/pull/1323)：4 月创建的 Cowork 修复，可能需要维护者确认是否合并或关闭。
    *   [PR #1488](https://github.com/netease-youdao/LobsterAI/pull/1488)：4 月创建的定时任务 UI 升级，可能需要更新状态。
    *   [PR #1494](https://github.com/netease-youdao/LobsterAI/pull/1494)：4 月创建的技能会话独立管理修复。

</details>

<details>
<summary><strong>TinyClaw</strong> — <a href="https://github.com/TinyAGI/tinyagi">TinyAGI/tinyagi</a></summary>

过去24小时无活动。

</details>

<details>
<summary><strong>Moltis</strong> — <a href="https://github.com/moltis-org/moltis">moltis-org/moltis</a></summary>

过去24小时无活动。

</details>

<details>
<summary><strong>CoPaw</strong> — <a href="https://github.com/agentscope-ai/CoPaw">agentscope-ai/CoPaw</a></summary>

# CoPaw (agentscope-ai/CoPaw) 项目动态日报

**日期**：2026-07-13  
**分析师**：AI 智能体开源项目分析助手

---

### 1. 今日速览
过去24小时内，CoPaw 项目保持高活跃度，共产生 **39 条 Issue** 和 **26 条 Pull Request**。项目正处于 **v2.0.0** 生态磨合期，稳定性问题成为社区焦点。尽管有多个新功能（如 Zalo Bot）和 UI 修复被合并，但大量用户反馈表明 v2.0.0 在 Windows 沙箱、上下文压缩及会话兼容性方面存在严重缺陷，部分核心功能（如消息队列）疑似丢失，用户满意度面临挑战。

### 2. 版本发布
- **无重大新版本**。
- **v2.0.0.post1**：项目已发布 `2.0.0.post1` 版本（PR #6007），旨在修复已知问题并作为 v2.0.x 的维护版本。

### 3. 项目进展
今日共合并/关闭 **8 条 PR**，主要集中在 UI 优化、兼容性修复及新渠道支持：
- **UI 体验优化**：PR #6011 修复了模型搜索框在登录页自动填充用户名的问题，提升了隐私体验；PR #5975 改进了暗色模式下的文字对比度。
- **v1/v2 兼容性**：PR #5991 修复了 v1.x 会话中遗留 `file` 类型 Block 在 v2.0 加载时的崩溃问题；PR #5993 恢复了 v1 媒体内容在 v2 中的加载。
- **新功能集成**：PR #5801 成功集成了 **Zalo Bot** 频道，支持越南市场的用户接入。
- **长期功能修复**：PR #5530 限制了文本仅自动继续的循环次数，防止死循环；PR #5187 持续推进 Windows 计算机使用（Computer Use）功能的开发。

### 4. 社区热点
今日讨论最激烈的三个议题均围绕 **v2.0.0 的稳定性** 展开：
1.  **Windows 沙箱崩溃** (#5951)：wjt0321 报告升级到 v2.0.0 后，pwsh 窗口无限递归爆炸，内存耗尽，且无法关闭沙箱。这是目前热度最高的问题，涉及底层沙箱实现。
2.  **消息队列功能缺失** (#6006)：xurids 报告 v2.0.0 中消息队列功能消失，导致急迫的修复需求。
3.  **API 调用错误** (#5996)：kukuegg 发现 v2.0.0 在对话时频繁产生 `MODEL_EXECUTION_ERROR`，原因是 ToolResultBlock 被错误序列化。

### 5. Bug 与稳定性
v2.0.0 的引入引发了多起严重的回归问题，严重程度从高到低排列：
- **严重级（阻塞核心功能）**：
    - **上下文压缩破坏配对** (#5986, #5960)：当上下文过长触发压缩时，系统会将 `tool_call` 和 `tool_result` 拆散到不同侧，导致 OpenAI 格式化器返回 400 错误。
    - **Runtime 2.0 硬编码超时** (#5963)：所有 shell 命令被硬性限制在 60 秒，且长命令被静默 offload，用户无法感知执行状态。
    - **Windows 沙箱递归** (#5951)：如前所述，导致工具几乎不可用。
- **中等级（功能异常）**：
    - **技能加载失败** (#6001)：新安装的技能无法在技能池中显示。
    - **Desktop 依赖缺失** (#6012)：PyInstaller 打包版本缺少 `agentscope.tool._builtin._scripts` 模块。
    - **会话映射丢失** (#5964)：v2.0.0 升级后，聊天列表与历史记录的映射关系断裂，导致部分会话无法打开。
- **已有 Fix PR**：
    - PR #6014 修复了 Runtime 2.0 的超时问题。
    - PR #6004 修复了后台工具调用结果注入时的格式错误。

### 6. 功能请求与路线图信号
用户对新功能的渴望依旧强烈，且部分需求已被提上日程：
- **跨平台会话接力** (#5999)：用户希望在不同渠道（如 Console、飞书、钉钉）之间无缝切换同一个会话，目前系统会自动创建独立 Session，导致任务割裂。
- **会话管理增强** (#5903)：请求增加会话分组及导入导出功能，以应对大量会话带来的管理混乱。
- **模型覆盖** (#5992)：允许在单个 Agent 下为不同会话设置不同的模型，增加了灵活性。
- **工具结果截断** (#5976)：允许用户控制工具调用结果的发送长度或是否发送，以减少上下文噪音。

### 7. 用户反馈摘要
从 Issue 评论中提炼出的核心痛点：
- **对 v2.0.0 的信任危机**：多位用户（如 #6013）反馈 v2.0.0 “越来越不稳定”，甚至表示“不如 V1.xxx”，并对比竞品 WorkBuddy 的稳定性。
- **部署环境受限**：在 ARM 架构或低内存设备上，沙箱功能不可用导致审批流程变成纯粹干扰。
- **细节体验**：Web UI 在飞书消息接收上存在延迟或不显示，且生成的文件缺少快捷打开入口。

### 8. 待处理积压
以下长期未决或高优先级问题需要维护者重点关注：
- **沙箱核心缺陷** (#5951)：需要深入排查 pwsh 递归和 NTFS ACL 污染问题。
- **上下文压缩逻辑** (#5986)：需要重构 `_split_context_for_compression` 确保配对完整。
- **消息队列回归** (#6006)：需要确认该功能是否被有意移除或存在配置问题。
- **长期未响应 Issue**：部分早期创建的 Enhancement Issue（如 #5903）虽有人关注但进展缓慢。

</details>

<details>
<summary><strong>ZeptoClaw</strong> — <a href="https://github.com/qhkm/zeptoclaw">qhkm/zeptoclaw</a></summary>

过去24小时无活动。

</details>

<details>
<summary><strong>ZeroClaw</strong> — <a href="https://github.com/zeroclaw-labs/zeroclaw">zeroclaw-labs/zeroclaw</a></summary>

# ZeroClaw 项目日报
**日期：** 2026-07-13  
**分析师：** AI 智能体领域开源分析师

---

## 1. 今日速览
ZeroClaw 项目今日呈现出**极高**的开发活跃度。在 24 小时内，项目新增了 50 条 Pull Request（其中 49 条待合并，1 条已合并/关闭），显示出团队正在进行大规模的代码提交和功能迭代。主要工作集中在运行时架构重构、Provider（提供商）兼容性修复、以及新渠道（如 Inkbox）的集成上。虽然没有新版本发布，但 Issue 讨论热度较高，主要围绕网关可视化改进和多会话支持展开。

---

## 2. 版本发布
无新版本发布。

---

## 3. 项目进展
尽管当日仅有 1 个 PR 完成合并/关闭，但提交的 50 个 PR 涵盖了多个关键领域的推进：

*   **Gateway 用户体验升级**：PR #8173 实现了**Web 仪表盘内的应用内升级**功能，允许用户直接在浏览器中检测版本、查看更新日志并自动重启，无需手动操作终端，显著提升了运维体验。
*   **新渠道接入**：PR #8384 成功集成了 **Inkbox** 通道，提供原生支持 Email、SMS、Voice 和 iMessage，并配套了 Quickstart 引导，扩大了 Agent 的通讯触达能力。
*   **运行时架构重构**：PR #8784 对 Agent 的历史循环逻辑进行了重构，解决了 `before_llm_call` Hook 修改历史消息导致的契约破坏问题，为后续更复杂的 Hook 机制奠定了基础。
*   **Provider 兼容性增强**：修复了 Anthropic Provider 的超时配置问题（PR #8947）以及 OpenRouter 路由下工具调用参数格式化错误（PR #8931），提升了多模型提供商的稳定性。

---

## 4. 社区热点
*   **[RFC] Gateway-local Kanban board for agent work (#8832)** [OPEN]
    *   **热度：** 4 条评论
    *   **分析：** 这是一个关于网关可视化的重大 RFC（请求评论）。用户希望引入类似 Kanban 看板的视图来直观展示 Agent 的工作流，解决当前无法统一查看 Agent 工作状态的问题。**风险等级：高**，需维护者评审。
    *   [查看详情](https://github.com/zeroclaw-labs/zeroclaw/issues/8832)
*   **[Feature] Multi-session support in the gateway web chat UI (#7543)** [OPEN]
    *   **热度：** 4 条评论
    *   **分析：** 用户迫切需要 Web 聊天界面的多会话支持（新建/切换/重命名/删除），以解决当前每个 Agent 只能持有一个固定会话的限制。该需求状态已被标记为 `accepted`，处于高优先级。
    *   [查看详情](https://github.com/zeroclaw-labs/zeroclaw/issues/7543)

---

## 5. Bug 与稳定性
今日提交的修复 PR 涵盖了从低风险 UI 问题到高风险运行时逻辑问题的多个层面：

*   **高风险**：
    *   **Gemini 思维签名丢失** (PR #8935)：修复了多轮对话中工具调用历史丢失 `extra_content` 的问题，防止模型拒绝后续请求。
    *   **Loop Detector 深度克隆** (PR #8937)：修复了 `stream-hash` 工具参数在检测循环时可能导致的性能问题或逻辑错误。
    *   **Agent 生命周期事件缺失** (PR #8916)：修复了 Channel 和 Daemon 旋转时未正确触发 `agent_start`/`agent_end` 事件，导致监控和日志系统无法追踪。
*   **中风险**：
    *   **Doctor 诊断超时** (PR #8910)：修复了 `probe_models` 超时导致整个诊断失败且无结果显示的问题。
    *   **Anthropic 超时配置** (PR #8947)：将硬编码的 120 秒超时改为可配置，提升灵活性。
    *   **Bedrock Nova 2 缓存问题** (PR #8943)：修复了 Nova 2 模型不支持 `cachePoint` 导致的 400 错误。
*   **低风险**：
    *   **Telegram 配置属性名错误** (PR #8823)：修正了 `bind-telegram` 错误提示中的属性名大小写。
    *   **UI 横向滚动条** (PR #8939)：修复了侧边栏渲染时的布局溢出问题。

---

## 6. 功能请求与路线图信号
*   **声明式技能自动激活** (PR #8965)：引入 `[skill]` 触发器机制，允许技能根据 inbound 消息自动激活，并支持图片消息过滤和提供者切换，这可能是 Agent 智能交互的重要演进。
*   **内存内容扫描** (PR #8984)：在 Memory 写入和召回边界增加内容筛查层，旨在提升安全性（如过滤敏感信息），这是一个通用的安全增强功能。
*   **Webhook 挑战响应** (PR #8949)：为 Gateway 添加 Webhook 的 GET 方法支持及 Challenge-echo 机制，为 Slack、WhatsApp 等平台的插件验证提供支持。

---

## 7. 用户反馈摘要
*   **痛点 1（会话管理）**：用户在 Web UI 中无法管理多个独立的对话会话，导致多任务处理困难。
*   **痛点 2（可观测性）**：用户反馈在 ZeroCode Logs 或 Doctor 失败时，难以定位底层的持久化日志路径，必须依赖复杂的命令行命令。
*   **痛点 3（配置易用性）**：Telegram 集成时的配置属性名提示错误，增加了用户配置渠道的挫败感。
*   **痛点 4（状态可见性）**：缺乏可视化的看板来跟踪 Agent 的实时工作流，难以评估系统负载和任务进度。

---

## 8. 待处理积压
*   **#8832 (Gateway Kanban Board)**：创建于 5 天前，高优先级，状态为 RFC，需要维护者尽快评审和定夺。
*   **#7543 (Multi-session Support)**：创建于 1 个月前，状态已接受，但尚未看到对应的实现 PR，可能需要提醒开发者跟进。
*   **#8073 (v0.8.3 Tracker)**：创建于 2 周前，用于追踪 v0.8.3 版本的发布支持工作，目前评论极少，可能处于搁置状态。

---

**项目健康度评估：** 🟢 **优秀** (高活跃度，大量高质量 PR，主要关注稳定性与功能扩展)

</details>