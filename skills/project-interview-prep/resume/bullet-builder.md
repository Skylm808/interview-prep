# Resume Bullet Point Builder

## Overview

Extract honest project highlights and format them as resume bullets with evidence-first wording.

## Bullet Point Formula

```
[强动词] + [具体职责] + [技术方案] + [可验证结果]
```

## Strong Action Verbs

- 负责实现
- 参与优化
- 参与联调
- 参与排查
- 梳理并验证
- 设计并落地 (only when actually designed and delivered)

## Evidence Rules

Only use numbers when you can point to:
- Monitoring data
- Logs or tracing
- Postman / curl runs
- Benchmark or load-test output
- SQL or test results

If the data source is missing, write the mechanism or verified outcome instead.

## Before Writing Bullets

If the user has not provided enough facts, ask 3-5 questions first:
- What did you personally implement, modify, validate, or investigate?
- Which files, APIs, pages, jobs, or configs did you touch?
- What evidence exists for the result?
- Which parts were team-owned or only read by you?
- What interview or resume target is this for?

## Safe Wording Map

| Unsafe | Safer |
|---|---|
| 主导整个项目 | 负责实现某模块 / 参与某链路 |
| 负责核心模块 | 熟悉核心链路 / 参与核心模块实现 |
| 性能提升 X% | 参与性能排查并验证优化效果 |
| 自研调度 | 对接平台 API / 使用现有调度能力 |
| 高并发优化 | 查询链路优化 / 异步化处理 |

## Template

```markdown
### 项目经历

**[项目名称]** | [你的角色] | [时间段]

项目简介: [一句话描述]

- [强动词] [具体职责]，采用[技术方案]处理[问题场景]，[可验证结果]
- [强动词] [模块/链路]，通过[验证方式]确认[效果或结论]
- [强动词] [工程改动]，支撑[业务/技术场景]，[证据来源]

### 技术栈
[主要技术]
```

## Good Examples

```markdown
- 负责订单查询链路优化，补充日志打点并协助验证重复查询问题，完成 Postman 连续请求回归。
- 参与权限校验模块实现，梳理配置 CRUD 到配置治理的调用链，补充异常分支验证。
- 参与异步消息联调，确认失败重试和幂等处理逻辑在测试环境可稳定运行。
```

## Output Self-Check

Every bullet must have:
- Contribution boundary: 负责/参与/联调/排查/梳理
- Technical path: module, API, page, job, config, or mechanism
- Evidence level: metric source, test/log/Postman record, or no-number mechanism
- Follow-up survivability: answerable if asked "这是你做的吗？怎么证明？"

If a bullet fails the check, downgrade it or omit it.

## Avoid

- Unsupported metrics
- Overstated ownership
- Implementation detail dumps
- Claims that cannot survive follow-up questions
