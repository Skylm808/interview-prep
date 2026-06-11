# Interview Question Bank

## Overview

Template for generating interview questions based on identified core logic points.

## Question Generation Rules

### For Each Core Logic Point, Generate:

1. **2-3 初级题 (🟢)**: Basic understanding questions
2. **2-3 中级题 (🟡)**: Design decision questions
3. **1-2 高级题 (🔴)**: Architecture evolution questions

## Question Templates

### 🟢 初级题模板

**考察基础概念和流程理解：**

```
Q: 请描述一下[功能]的整体流程？
> 考察点: 对业务流程的理解程度

Q: 这个链路中有哪些外部依赖？
> 考察点: 系统边界认知

Q: [某个技术点]的作用是什么？
> 考察点: 技术概念理解

Q: 如果[某个环节]失败了，会发生什么？
> 考察点: 异常处理意识
```

### 🟡 中级题模板

**考察设计决策和tradeoff分析：**

```
Q: 为什么选择[方案A]而不是[方案B]？
> 考察点: 技术选型能力
> 参考要点:
>   - 方案A: 优点 [xxx] / 缺点 [xxx]
>   - 方案B: 优点 [xxx] / 缺点 [xxx]
>   - Tradeoff: [为什么选择当前方案]

Q: 如何保证[某个特性]？比如数据一致性/幂等性
> 考察点: 分布式系统基础

Q: 这个设计有什么潜在问题？你会如何改进？
> 考察点: 问题识别和优化能力

Q: 如果需要支持[更高并发/更大数据量]，你会怎么设计？
> 考察点: 扩展性思考
```

### 🔴 高级题模板

**考察架构演进和深度思考：**

```
Q: 如果[某个依赖]不可用，系统会怎样？你有什么容灾方案？
> 考察点: 高可用设计

Q: 这个方案在[极端场景]下会有什么问题？
> 考察点: 边界case思考

Q: 如果让你重新设计这个模块，你会怎么做？为什么？
> 考察点: 架构反思能力

Q: 如何监控这个链路的健康状态？关键指标有哪些？
> 考察点: 可观测性思考
```

## Common Technical Topics

### 分布式事务
- Saga vs 2PC vs TCC
- 最终一致性 vs 强一致性
- 补偿机制设计

### 缓存策略
- Cache-Aside vs Write-Through vs Write-Behind
- 缓存穿透/击穿/雪崩
- 缓存一致性

### 消息队列
- 同步 vs 异步
- 消息丢失/重复/顺序
- 死信队列处理

### 高并发
- 限流算法（令牌桶/滑动窗口）
- 熔断降级
- 异步化/批处理

### 数据库
- 分库分表策略
- 索引优化
- 读写分离
