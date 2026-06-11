# Resume Bullet Point Builder

## Overview

Extract project highlights and format as resume bullet points with quantified results.

## Bullet Point Formula

```
[强动词] + [技术方案] + [实现功能] + [量化结果]
```

## Strong Action Verbs

### 技术实现类
- 设计并实现 (Designed and implemented)
- 开发了 (Developed)
- 构建了 (Built)
- 引入了 (Introduced)
- 重构了 (Refactored)

### 优化提升类
- 优化了 (Optimized)
- 提升了 (Improved)
- 降低了 (Reduced)
- 加速了 (Accelerated)

### 架构设计类
- 架构设计 (Architected)
- 技术选型 (Selected technology for)
- 方案设计 (Designed solution for)

## Quantification Dimensions

| 维度 | 示例表达 |
|------|----------|
| 性能 | 响应时间从 Xms 降到 Yms，提升 Z% |
| 吞吐 | 支持 X QPS，日均处理 Y 万请求 |
| 可用性 | 故障率从 X% 降到 Y%，SLA 99.9% |
| 业务 | 支持 X 个业务线，覆盖 Y 万用户 |
| 效率 | 开发效率提升 X%，代码复用率 Y% |
| 成本 | 服务器成本降低 X%，存储节省 Y% |

## Template

```markdown
### 项目经历

**[项目名称]** | [你的角色] | [时间段]

项目简介: [1句话描述项目是什么，解决什么问题]

- [动词] [技术方案]，实现[功能描述]，[量化结果]
- 采用[技术/方案]处理[问题场景]，[效果描述]
- 设计并实现[方案]，支持[业务场景]，[性能指标]

### 技术栈
Go / Gin / MySQL / Redis / RabbitMQ / gRPC
```

## Example Output

```markdown
### 项目经历

**电商订单系统** | 后端开发实习生 | 2025.06 - 2025.09

项目简介: 支撑公司电商核心交易链路，日均处理订单10万+

- 设计并实现订单创建链路，采用Saga模式处理分布式事务，
  保证订单库与库存库的数据最终一致性，成功率99.99%

- 通过RabbitMQ实现订单创建与下游处理的异步解耦，
  下游故障不再阻塞主流程，系统可用性从99.5%提升到99.9%

- 实现基于request_id的幂等机制，防止网络重试导致的重复下单，
  日均拦截重复请求5000+次

- 设计订单状态机（pending → confirmed → paid → shipped），
  支持异常状态的自动补偿与人工介入，处理效率提升30%

- 优化订单查询接口，引入Redis缓存+索引优化，
  响应时间从200ms降到50ms，提升75%

### 技术栈
Go / Gin / MySQL / Redis / RabbitMQ / gRPC
```

## Intern-Friendly Tips

### ✅ Good Practices
1. **Be specific about your role**: "负责XX模块" not "参与项目"
2. **Quantify when possible**: Even rough numbers are better than none
3. **Show learning**: "学习并应用了XX技术"
4. **Be honest**: Interviewers can tell when you exaggerate

### ❌ Avoid
1. **Overclaiming**: "独立设计整个系统" (unless true)
2. **Vague results**: "提升了性能" (how much?)
3. **Too technical**: Don't put implementation details in resume
4. **Too long**: Keep each bullet to 1-2 lines

## Quantification Cheat Sheet for Interns

If you don't have exact numbers, use these reasonable estimates:

| 场景 | 估算范围 |
|------|----------|
| 接口优化 | 响应时间提升 30-80% |
| 缓存引入 | 命中率 80-95% |
| 异步化 | 吞吐提升 2-5倍 |
| 去重/幂等 | 拦截率 99%+ |
| 代码重构 | 开发效率提升 20-50% |

## Output Format

直接输出文字，用户可以复制粘贴到简历中：

```markdown
## 📄 简历素材

[直接输出可复制的内容]
```
