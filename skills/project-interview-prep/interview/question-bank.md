# Interview Question Bank

## Overview

Generate interview questions that test real ownership, evidence, trade-offs, and scaling risk.

## Question Generation Rules

For each core logic point, generate:
1. 2-3 初级题
2. 2-3 中级题
3. 1-2 高级题
4. 1-2 pressure-test questions
5. Interviewer-layer variants when the user is preparing for a specific interview stage

## Required Question Types

### 1. Ownership Check
- 这部分是你写的吗？
- 你改过哪些文件？
- 你实际负责哪一段？

### 2. Evidence Check
- 这个结果怎么证明？
- 数据来自哪里？
- 这是你自己测出来的吗？

### 3. Trade-off Check
- 为什么不用另一个方案？
- 你牺牲了什么？
- 这套设计在什么情况下会失效？

### 4. Scaling Check
- 数据量扩大 10 倍怎么办？
- 慢接口怎么定位？
- 线上出错怎么回滚？

### 5. Interviewer-Layer Check
- 一面: 你做了什么？流程是什么？改了哪些文件？
- 二面: 为什么这么设计？瓶颈在哪里？方案怎么演进？
- 主管面: 这件事对业务有什么价值？你怎么协作和交付？
- HR 面: 你遇到的困难是什么？你学到了什么？你如何证明不是夸大？

## Question Templates

### 🟢 初级题

```
Q: 这个功能的整体流程是什么？
> 考察点: 业务流程理解

Q: 这个链路中有哪些外部依赖？
> 考察点: 系统边界认知

Q: 你负责的部分是什么？
> 考察点: 真实贡献边界
```

### 🟡 中级题

```
Q: 为什么选择[方案A]而不是[方案B]？
> 考察点: 技术选型
> 参考要点: 性能、复杂度、一致性、交付速度

Q: 如果没有这个功能，系统会怎样？
> 考察点: 方案价值

Q: 这个设计有什么局限？你会怎么改？
> 考察点: 反思与演进
```

### 🔴 高级题

```
Q: 如果数据量扩大 10 倍，你怎么改？
> 考察点: 扩展性和瓶颈识别

Q: 慢接口怎么定位？
> 考察点: 排障能力

Q: 线上出错怎么回滚？
> 考察点: 风险控制
```

## Interview Stage Templates

### 一面

```
Q: 你在这个项目里具体负责哪部分？
Q: 这个功能从入口到落库/外部依赖怎么走？
Q: 你怎么验证它是可用的？
```

### 二面

```
Q: 为什么选择当前方案，而不是同步/异步、实时/离线、缓存/不缓存里的另一个方案？
Q: 当前设计的瓶颈是什么？
Q: 数据量、并发、调用失败扩大后怎么处理？
```

### 主管面

```
Q: 这个功能解决了什么业务问题？
Q: 你在团队协作里承担了什么责任？
Q: 如果给你更多时间，你会优先改哪里？
```

### HR 面

```
Q: 这段经历里最困难的点是什么？
Q: 哪些是你做的，哪些是团队做的？
Q: 你怎么确保简历描述是真实的？
```

## Project-Type Patterns

- CRUD to engineering value
- Permission and validation
- Caching and consistency
- Async and queue integration
- Observability and logging

### Frontend
- Route/page to component data flow
- State ownership: local state vs store vs server cache
- Loading, empty, error, and permission states
- API retries, stale data, and cache invalidation
- Bundle size and rendering performance

### Data / Batch
- Source, transform, sink path
- Idempotency and retry
- Data quality checks
- Backfill and late-arriving data
- Report freshness and correctness

### Test / Platform
- Trigger path and execution environment
- Fixture isolation and cleanup
- Flakiness control
- Artifact reporting
- Rollback or rerun strategy
