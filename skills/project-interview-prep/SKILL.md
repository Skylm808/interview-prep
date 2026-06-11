---
name: project-interview-prep
description: Use when the user asks about project code flow, implementation details, architecture decisions, technical tradeoffs, or needs interview preparation and resume material generation. Triggers on keywords: 链路, 流程, 怎么实现, 为什么, 核心代码, 面试, 简历, interview, resume, code flow, architecture. Supports Go and Java projects. Analyzes call chains, identifies core logic beyond CRUD, generates STAR-formatted answers, and outputs resume bullet points.
---

# Project Interview Prep

## Overview

Help interns and junior developers understand project core logic, prepare for technical interviews, and generate resume materials. Focus on non-CRUD code: design patterns, distributed system decisions, performance optimizations, and architectural tradeoffs.

## When to Use

**Use when:**
- User asks "帮我看看XX的流程" / "分析一下这个链路"
- User asks "这个怎么实现的" / "为什么用这个方案"
- User mentions "准备面试" / "出几道面试题"
- User asks "帮我写简历" / "提取项目亮点"
- User wants to understand code they didn't write
- User asks about tradeoffs between different technical solutions

**Do NOT use when:**
- User is asking about simple CRUD operations without any design decisions
- User wants to write new code (use brainstorming/planning skills instead)
- User is debugging an existing issue (use systematic-debugging skill)
- User asks about syntax or language basics

**ESPECIALLY use when:**
- User is preparing for an interview and needs structured answers
- User needs to understand tradeoffs in technical decisions
- User wants to quantify their contributions for resume
- User is an intern who joined a project mid-way and needs to catch up

## Core Pattern

### Before (Without this skill)
```
User: 订单创建怎么做的？
AI: [扫描代码] 创建订单就是调用数据库插入一条记录...
→ 浪费机会，没有挖掘技术深度
→ 用户无法回答面试官追问
```

### After (With this skill)
```
User: 订单创建怎么做的？
AI:
📍 链路分析: POST /api/orders → Handler → Service → Repo + MQ
🔥 核心亮点: Saga模式、幂等设计、异步解耦
🎤 面试题: 3道初级 + 2道中级（含STAR参考答案）
📄 简历素材: 3条量化bullet points
```

## Quick Reference

| 用户意图 | 触发词 | 输出内容 |
|---------|--------|----------|
| 链路分析 | 流程、链路、调用链、怎么走的 | 调用图 + 关键节点 + 代码位置 |
| 面试准备 | 面试、出题、怎么回答 | 3-5题分难度 + STAR答案 |
| 简历撰写 | 简历、亮点、项目经历 | 量化bullet points |
| 设计理解 | 为什么、tradeoff、方案对比 | 方案对比 + 取舍分析 |

### Difficulty Levels

| 级别 | 标记 | 考察点 | 适用场景 |
|------|------|--------|----------|
| 初级 | 🟢 | 基础概念、流程理解 | 校招、实习面试 |
| 中级 | 🟡 | 设计决策、tradeoff分析 | 社招初级岗位 |
| 高级 | 🔴 | 架构演进、性能优化 | 社招中级岗位 |

## Implementation

### Step 1: Project Context Detection

First, scan project structure to identify tech stack:

```bash
# Auto-detect project type
!`find . -maxdepth 3 -type f \( -name "go.mod" -o -name "pom.xml" -o -name "build.gradle" -o -name "build.gradle.kts" \) 2>/dev/null | head -5`
```

Based on the result, select appropriate analyzer:
- `go.mod` found → Load `analyzers/go-link-tracer.md`
- `pom.xml` or `build.gradle` found → Load `analyzers/java-link-tracer.md`

### Step 2: Link Analysis

Follow the call chain from entry point to data layer:

**2.1 Find Entry Point**
- Go: Look for `gin.HandleFunc`, `http.HandleFunc`, `router.GET/POST`, or `main()` entry
- Java: Look for `@RestController`, `@Controller`, `@RequestMapping`

**2.2 Trace Call Chain**
Follow the execution flow:
```
Entry Point (Handler/Controller)
    ↓
Service Layer (business logic)
    ↓
Repository/DAO Layer (data access)
    ↓
External Dependencies (DB, Cache, MQ, RPC)
```

**2.3 Identify Core Logic Points**
Mark code that is NOT simple CRUD:
- Design patterns (Strategy, Factory, Observer, etc.)
- Distributed system patterns (Saga, 2PC, eventual consistency)
- Performance optimizations (async, batch, cache strategies)
- Complex business rules (state machines, validation chains)

**2.4 Output Format**
```markdown
## 📍 链路: [功能名称]

### 入口
- API: `POST /api/v1/xxx`
- Handler: `XXXHandler.Method()` @ handler/xxx.go:45

### 调用链
┌─────────────────────────────────────────────────────────┐
│  HTTP Request                                           │
│       ↓                                                 │
│  Handler.Method()              [参数校验、权限检查]       │
│       ↓                                                 │
│  Service.Method()              [业务逻辑处理]            │
│       ↓                                                 │
│  ├── Repo.Insert()             [写数据库]                │
│  ├── CacheClient.Set()         [更新缓存]                │
│  └── MQPublisher.Publish()     [发送消息]                │
└─────────────────────────────────────────────────────────┘

### 核心代码位置
1. [技术点1]: `service/xxx.go:78-102`
2. [技术点2]: `service/xxx.go:56`

### 技术亮点
- ✅ [亮点1]: [简要说明]
- ✅ [亮点2]: [简要说明]
- ⚠️ 注意事项: [需要注意的点]
```

### Step 3: Interview Question Generation

For each identified core logic point, generate 3-5 questions following difficulty levels:

```markdown
## 🎤 面试题: [功能名称]

### 🟢 初级（基础概念）

**Q1: [问题]**
> 考察点: [考察什么能力/知识]
> 参考要点:
> - [要点1]
> - [要点2]

**Q2: [问题]**
> ...

---

### 🟡 中级（设计决策）

**Q3: [问题]**
> 考察点: [考察什么能力/知识]
> 参考要点:
> - 方案A: 优点 [xxx] / 缺点 [xxx]
> - 方案B: 优点 [xxx] / 缺点 [xxx]
> - Tradeoff: [为什么选择当前方案]

**Q4: [问题]**
> ...

---

### 🔴 高级（架构演进）

**Q5: [问题]**
> 考察点: [考察什么能力/知识]
> 参考要点:
> - 当前方案的局限性
> - 可能的优化方向
> - 需要考虑的权衡
```

### Step 4: STAR Answer Formatting

For each question, provide a structured answer using STAR method:

```markdown
## 📝 STAR 回答示例

**问题: [问题]**

**Situation（背景）:**
[项目背景、面临的问题、约束条件]

**Task（任务）:**
[需要解决什么问题、目标是什么、你的职责]

**Action（行动）:**
[具体做了什么、技术方案是什么、为什么这样选择]

**Result（结果）:**
[量化成果、实际效果、学到了什么]

**Tradeoff（取舍）:**
[为什么选这个方案而不是其他方案]
[牺牲了什么、换来了什么]
[如果重新设计会怎么改进]
```

### Step 5: Resume Material Extraction

Extract project highlights and format as resume bullet points:

```markdown
## 📄 简历素材

### 项目经历

**[项目名称]** | [你的角色] | [时间段]

- [强动词] [技术方案]，实现[功能描述]，[量化结果]
- 采用[技术/方案]处理[问题场景]，[效果描述]
- 设计并实现[方案]，支持[业务场景]，[性能指标]

### 技术栈
[列出项目使用的主要技术]
```

**Quantification Suggestions:**
| 维度 | 示例表达 |
|------|----------|
| 性能 | 响应时间从 Xms 降到 Yms，提升 Z% |
| 吞吐 | 支持 X QPS，日均处理 Y 万请求 |
| 可用性 | 故障率从 X% 降到 Y%，可用性 99.9% |
| 业务 | 支持 X 个业务线，覆盖 Y 万用户 |
| 效率 | 开发效率提升 X%，代码复用率 Y% |

## Common Mistakes

### ❌ Mistake 1: Only describing WHAT, not WHY
```
Bad:  调用OrderService.Create()创建订单，然后插入数据库
Good: 采用Saga模式而非2PC处理分布式事务，因为需要兼顾性能和最终一致性
      Tradeoff: 牺牲强一致性，换取更好的系统可用性和性能
```

### ❌ Mistake 2: Exaggerating contributions
```
Bad:  独自设计并实现了整个分布式架构
Good: 负责订单创建模块开发，参与Saga模式的技术选型讨论
```

### ❌ Mistake 3: Missing quantification
```
Bad:  优化了系统性能
Good: 通过引入Redis缓存，将接口响应时间从200ms优化到50ms，提升75%
```

### ❌ Mistake 4: Too much technical detail in resume
```
Bad:  使用ThreadPoolExecutor(corePoolSize=10, maxPoolSize=20, queue=100)
Good: 采用线程池异步处理订单消息，支持1000 QPS并发，日均处理10万+订单
```

### ❌ Mistake 5: Not preparing for follow-up questions
```
Bad:  只准备了表面答案，无法深入讨论
Good: 每个答案都准备2-3层深入点：
      Level 1: 做了什么
      Level 2: 为什么这样做
      Level 3: 遇到了什么问题，怎么解决的
```

## Real-World Impact

Using this skill helps interns:
1. **Understand code faster**: Comprehend unfamiliar code in 30min instead of 2hours
2. **Interview ready**: Prepare 5 structured answers per feature with STAR format
3. **Resume boost**: Generate 3-5 quantified bullet points per project
4. **Articulate tradeoffs**: Clearly explain technical decisions and their implications
5. **Handle follow-ups**: Prepare multi-layer answers for interviewer deep-dives
