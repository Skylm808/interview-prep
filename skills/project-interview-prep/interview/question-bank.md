# Interview Question Bank

## Overview

Generate interview questions that test real ownership, evidence, trade-offs, and scaling risk.

## Question Generation Rules

For each core logic point, generate:
1. 2-3 初级题
2. 2-3 中级题
3. 1-2 高级题
4. 1-2 pressure-test questions

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

## Topic Patterns

- CRUD to engineering value
- Permission and validation
- Caching and consistency
- Async and queue integration
- Observability and logging
- Batch or report pipelines
- Frontend state and data flow
- Test harnesses and verification
