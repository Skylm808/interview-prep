---
name: project-interview-prep
description: Use for real project code-flow study, contribution audit, interview preparation, or honest resume bullets. Do not use for writing code, implementing features, or debugging.
---

# Project Interview Prep

## Overview

Help interns and junior developers understand unfamiliar project code, write honest contribution summaries, and prepare for interview follow-ups.
This skill works best on Go/Java backend projects, but it also applies to frontend, data, batch, testing, and platform code by mapping each project'"'"'s real runtime path.

## Non-Negotiable Rules

- No invented metrics.
- No unsupported numbers.
- No role inflation.
- If you did not build, change, test, or verify it, do not claim ownership.
- If a number has no evidence, omit it.
- If wording is too strong, downgrade it.

### Contribution Boundary Labels

| Situation | Safe wording |
|---|---|
| Implemented it | 负责实现 / 完成实现 |
| Modified it | 参与优化 / 参与迭代 |
| Integrated or validated it | 参与联调 / 参与验证 |
| Investigated a bug | 参与排查 / 协助定位 |
| Only read it | 熟悉 / 梳理 / 理解 |
| Not involved | Do not mention as personal contribution |

### Claim Downgrade Rules

- "主导" -> "参与" or "负责实现"
- "负责核心模块" -> "熟悉核心链路" unless you actually owned it
- "性能提升 X%" -> "参与性能排查/优化" unless you have evidence
- "自研调度" -> "对接平台 API" unless you built the scheduler
- "高并发优化" -> "查询/链路优化" unless the stress data is yours

### Evidence-First Metrics

You may write numbers only when they come from:
- Monitoring or APM
- Logs or tracing
- Postman, curl, or benchmark runs
- SQL, test, or load-test results
- Release or incident data

If you only have a feeling, write the mechanism or outcome, not a number.
Team-level numbers can only be claimed as support unless you can prove your own measurement.

### CRUD To Engineering Value

CRUD is still valuable when it includes engineering work:
- Config CRUD -> config governance
- Report query -> risk visibility
- List filters -> resource inventory
- Sync API -> data consistency handling
- Permission checks -> risk control
- Logging or metrics -> observability
- Pagination or export -> large-data handling

### Design Trade-off Review

For each meaningful feature, identify:
- Option A vs Option B
- Why the current option fits the constraint
- What it sacrifices
- When it may fail
- Future improvement

Common trade-offs:
- Synchronous vs asynchronous
- Real-time computation vs precomputed snapshot
- Cache vs consistency
- Pagination vs full export
- Strict permission vs usability
- Generic framework vs business-specific delivery
- Performance vs implementation complexity
- Storage redundancy vs query cost

### Trade-off Ownership Level

- Participated in decision: say "参与方案设计/讨论"
- Implemented under chosen design: say "理解并实现该方案"
- Read after the fact: say only "梳理后理解该设计取舍"
- Personal future idea: say only "如果后续优化，我会考虑"

## When to Use

**Use when:**
- User asks "帮我看看XX的流程" / "分析一下这个链路"
- User asks "这个怎么实现的" / "为什么用这个方案"
- User mentions "准备面试" / "出几道面试题"
- User asks "帮我写简历" / "提取项目亮点"
- User wants to understand code they did not write
- User needs to review what they truly did vs what they only read
- User wants to turn CRUD-plus work into honest engineering value

**Do NOT use when:**
- User asks to write, modify, refactor, or implement code
- User asks to fix a bug, failing test, build error, or production issue
- User is writing new code from scratch (use brainstorming/planning skills instead)
- User is debugging an existing issue (use systematic-debugging skill)
- User asks about syntax or language basics

## If Information Is Missing

Ask 3-5 fact questions before generating claims, especially for resume bullets:
- Which feature/module did you personally implement, modify, validate, or investigate?
- Which files, APIs, pages, jobs, or configs did you touch?
- What evidence exists for the result: logs, metrics, Postman, test output, screenshots, or release notes?
- Which parts did you only read or learn from others?
- What interview target is this for: internship, campus hiring, first round, second round, manager round, or HR?

## Core Workflow

1. Detect project type and real runtime entrypoint.
2. Build a contribution boundary map.
3. Trace the call chain from entrypoint to data layer or external dependency.
4. Translate CRUD into engineering value only when the code actually adds it.
5. Review design trade-offs.
6. Pressure-test the claims against likely interviewer follow-ups.
7. Generate STAR answers and resume bullets with evidence-first wording.
8. Run the output self-check before finalizing.

## Project Type Detection

Prefer the right analyzer for the stack:
- Go -> `analyzers/go-link-tracer.md`
- Java -> `analyzers/java-link-tracer.md`

If the stack is not Go/Java, trace the equivalent path instead of forcing a backend pattern:
- Frontend: route/page -> component -> hook/store -> API -> cache/server
- Data/batch: job/runner -> transform -> validate -> sink/report
- Test/platform: trigger -> fixture/setup -> executor -> report/artifact

### Project-Type Question Patterns

- Frontend: state ownership, API error handling, loading/empty states, permission rendering, cache invalidation, bundle/performance impact.
- Data/batch: input source, transform rules, idempotency, retry, data quality checks, late-arriving data, backfill strategy.
- Test/platform: trigger path, fixtures, isolation, flakiness control, artifact reporting, environment rollback.
- Backend/API: auth, validation, transaction boundary, consistency, cache, pagination/export, external dependency failure.

## Core Pattern

### Before

```
User: 订单创建怎么做的？
AI: [只扫代码] 创建订单就是插入一条记录...
```

### After

```
User: 订单创建怎么做的？
AI:
📍 链路分析: POST /api/orders → Handler → Service → Repo + MQ
🧾 贡献边界: 负责实现 / 参与联调 / 只读理解
🔥 核心亮点: 幂等、状态流转、异步解耦、权限/校验
🎤 面试追问: 你改了哪些文件？怎么证明结果？数据量扩大怎么办？
📄 简历素材: 证据充分的 bullet points
```

## Output Contract

### 1. Link Analysis

```markdown
## 📍 链路: [功能名称]

### 入口
- API / Page / Job / Event: `[METHOD] /path`
- Entry: `Function()` @ file:line

### 调用链
┌─────────────────────────────────────────────────────────┐
│  Entry Point                                            │
│       ↓                                                 │
│  Orchestrator / Controller      [校验、路由、编排]         │
│       ↓                                                 │
│  Service / Store / Worker       [业务逻辑]               │
│       ↓                                                 │
│  Repo / API / Queue / Cache     [外部依赖]               │
└─────────────────────────────────────────────────────────┘

### 核心代码位置
1. [技术点]: `path/file.go:line-range`

### 贡献边界
- 负责: [...]
- 参与: [...]
- 只读: [...]

### 技术亮点
- ✅ [亮点]: [说明]
- ⚠️ 注意: [边界或风险]
```

### 2. Interview Questions

For each real core logic point, generate:
- 2-3 初级题
- 2-3 中级题
- 1-2 高级题
- 1-2 pressure-test questions
- Interviewer-layer variants for first round, second round, manager round, and HR when relevant

### 3. STAR Answers

Use STAR, then add only evidence-backed metrics.

### 4. Resume Bullets

Write bullets only from verified contributions and supported results.

### 5. Output Self-Check

Before final output, verify every claim has:
- Contribution boundary
- Evidence level
- Technical path
- Trade-off or limitation when relevant
- Follow-up survivability

If a bullet fails any check, downgrade it or omit it.

## Interview Pressure Test

Always prepare follow-up prompts such as:
- 这部分是你写的吗？改过哪些文件？
- 你具体负责哪一段？
- 如果没有这项功能，系统会怎样？
- 为什么不用另一个方案？
- 数据量扩大 10 倍怎么办？
- 慢接口怎么定位？
- 线上出错怎么回滚？
- 这个结果怎么证明？

## Difficulty Levels

| 级别 | 标记 | 考察点 | 适用场景 |
|---|---|---|---|
| 初级 | 🟢 | 基础概念、流程理解 | 校招、实习面试 |
| 中级 | 🟡 | 设计决策、tradeoff 分析 | 初级社招 |
| 高级 | 🔴 | 架构演进、性能与扩展性 | 中高级岗位 |

## Common Mistakes

- Only describing what happened, not why it mattered
- Claiming ownership for code you only read
- Using unsupported numbers
- Writing too much implementation detail in resume bullets
- Failing to prepare for follow-up questions

## Real-World Impact

Using this skill helps interns:
1. Understand code faster
2. Describe their real contribution honestly
3. Prepare evidence-based interview answers
4. Turn CRUD-plus work into engineering value
5. Produce resume bullets that survive follow-up questions
