# STAR Answer Formatter

## Overview

Format interview answers with STAR while preserving contribution boundaries and metric evidence.

## Required Checks Before Writing

1. What did the candidate personally implement, modify, validate, or investigate?
2. Which parts were only read or learned?
3. Which results have evidence?
4. Which claims need downgraded wording?

## STAR Structure

### Situation (背景)
State the project context, problem, and constraints.

### Task (任务)
State the candidate'"'"'s exact responsibility. Use one of:
- 负责实现
- 参与优化/迭代
- 参与联调/验证
- 参与排查
- 熟悉/梳理

### Action (行动)
Describe concrete work:
- Files/modules touched
- Technical path chosen
- Validation performed
- Trade-off considered

### Result (结果)
Use metrics only when evidence exists.
If evidence is missing, describe the mechanism or verified qualitative result.

### Tradeoff (取舍)
Explain why the chosen path fit the constraints and what it sacrificed.

## Answer Template

```markdown
**问题: [问题]**

**Situation（背景）:**
[1-2句] 项目背景、问题、约束。

**Task（任务）:**
[1句] 我的边界是：[负责实现/参与优化/参与联调/参与排查/熟悉梳理] [具体模块]。

**Action（行动）:**
- 我改动/验证/梳理了: `[file/module]`
- 采用了: [技术方案]
- 取舍是: [为什么不用另一个方案]

**Result（结果）:**
- 有证据: [指标 + 数据来源]
- 无证据: [机制性结果，不写数字]

**Tradeoff（取舍）:**
- 选择了: [xxx]，因为 [xxx]
- 牺牲了: [xxx]
- 如果重来: [xxx]
```

## Safe Result Examples

Unstable:
```markdown
接口响应时间提升 70%。
```

Safer without metrics:
```markdown
通过日志和 Postman 定位接口重复查询问题，参与优化查询链路并补充验证记录。
```

Safest with evidence:
```markdown
接口平均耗时从 1.2s 降至 350ms，数据来自 Postman 连续 10 次请求均值。
```

## Pressure-Test Add-On

After each STAR answer, prepare 2-3 likely follow-ups:
- 这部分是你写的吗？
- 你改过哪些文件？
- 这个结果怎么证明？
- 如果数据量扩大 10 倍怎么办？
- 线上出错怎么回滚？

## Tips for Interns

### Do
- Say exactly what you owned.
- Mention files, modules, tests, logs, or APIs when useful.
- Use metrics only with a source.
- Admit read-only familiarity as read-only familiarity.

### Don'"'"'t
- Say "主导" if you only participated.
- Say "核心模块" if you only read the core workflow.
- Invent benchmark ranges.
- Hide trade-offs or failure cases.
