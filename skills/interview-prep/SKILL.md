---
name: interview-prep
description: Use when the user needs interview questions, STAR-formatted answers, or tradeoff analysis for a technical feature. Triggers on: "面试", "出题", "怎么回答", "tradeoff", "面试准备", "interview". Generates 3-5 questions per topic with difficulty levels.
---

# Interview Prep

## Overview

Generate interview questions with STAR-formatted answers for technical features. Each topic gets 3-5 questions across difficulty levels (初级/中级/高级).

## When to Use

**Use when:**
- User asks "出几道面试题"
- User asks "这个怎么回答"
- User wants to prepare for technical interviews
- User asks about tradeoffs between technical solutions

**Do NOT use when:**
- User wants to write code
- User is asking about syntax basics

## Quick Reference

| Difficulty | Marker | Focus | Questions |
|------------|--------|-------|-----------|
| 初级 | 🟢 | 基础概念、流程理解 | 2-3 per topic |
| 中级 | 🟡 | 设计决策、tradeoff | 2-3 per topic |
| 高级 | 🔴 | 架构演进、优化 | 1-2 per topic |

## Implementation

### Step 1: Identify Core Logic Points

From the code analysis, identify non-CRUD patterns:
- Distributed system patterns
- Performance optimizations
- Design patterns
- Complex business rules

### Step 2: Generate Questions

For each core logic point, generate questions following this template:

```markdown
## 🎤 面试题: [功能名称]

### 🟢 初级
**Q1: [问题]**
> 考察点: [xxx]

### 🟡 中级
**Q3: [问题]**
> 考察点: [xxx]
> Tradeoff: [方案对比]

### 🔴 高级
**Q5: [问题]**
> 考察点: [xxx]
```

### Step 3: Provide STAR Answers

For each question, provide structured answer:

```markdown
**Situation（背景）:** [背景]
**Task（任务）:** [目标]
**Action（行动）:** [方案]
**Result（结果）:** [量化成果]
**Tradeoff（取舍）:** [为什么这样选]
```

## Common Topics

- 分布式事务: Saga vs 2PC vs TCC
- 缓存策略: Cache-Aside vs Write-Through
- 消息队列: 同步 vs 异步
- 高并发: 限流、熔断、异步化
- 数据库: 分库分表、索引优化
