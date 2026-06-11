# Java Project Link Tracer

## Overview

Analyze Java project call chains by tracing from Controllers to data layer.

## Entry Point Detection

Look for these patterns to find API entry points:

### Spring Boot Controllers
```java
@RestController
@RequestMapping("/api/orders")
public class OrderController {
    @PostMapping
    public OrderResponse createOrder(@RequestBody OrderRequest request) { ... }
    
    @GetMapping("/{id}")
    public OrderResponse getOrder(@PathVariable String id) { ... }
}
```

### Dubbo/gRPC Services
```java
@DubboService
public class OrderServiceImpl implements OrderService {
    @Override
    public OrderResponse createOrder(OrderRequest request) { ... }
}
```

## Call Chain Tracing

### Layer Pattern
Java projects typically follow this structure:
```
src/main/java/
  controller/    → REST controllers (parameter validation, auth)
  service/       → Business logic (orchestration)
  repository/    → Data access (JPA/MyBatis)
  model/         → Entity/DTO classes
  config/        → Configuration classes
  util/          → Utility classes
```

### Key Code Patterns to Identify

**Dependency Injection:**
```java
@Service
public class OrderService {
    @Autowired
    private OrderRepository orderRepository;
    
    @Autowired
    private RabbitTemplate rabbitTemplate;
}
```

**Transaction Management:**
```java
@Transactional
public OrderResponse createOrder(OrderRequest request) { ... }
```

**AOP Patterns:**
```java
@Aspect
@Component
public class LogAspect {
    @Around("@annotation(LogExecutionTime)")
    public Object logExecutionTime(ProceedingJoinPoint joinPoint) { ... }
}
```

## Core Logic Identification

### NOT Core Logic (Simple CRUD)
- Basic JPA/MyBatis CRUD operations
- Simple parameter validation with @Valid
- Direct entity-to-DTO mapping

### Core Logic (Worth Highlighting)
- **Distributed Transactions**: Saga, TCC, eventual consistency
- **Async Processing**: @Async, CompletableFuture, ThreadPool
- **Caching**: Spring Cache, Redis patterns
- **Message Queue**: RabbitMQ/Kafka producer/consumer
- **Circuit Breaker**: Resilience4j, Hystrix
- **Rate Limiting**: Guava RateLimiter, Sentinel
- **State Machine**: Spring StateMachine

## Output Template

```markdown
## 📍 链路: [功能名称]

### 入口
- API: `[METHOD] /api/v1/xxx`
- Controller: `ClassName.methodName()` @ path/file.java:line

### 调用链
┌─────────────────────────────────────────────────────────┐
│  HTTP Request                                           │
│       ↓                                                 │
│  Controller.method()           [参数校验、权限检查]       │
│       ↓                                                 │
│  Service.method()              [业务逻辑处理]            │
│       ↓                                                 │
│  ├── Repository.save()         [写数据库]                │
│  ├── CacheClient.set()         [更新缓存]                │
│  └── RabbitTemplate.convert()  [发送消息]                │
└─────────────────────────────────────────────────────────┘

### 核心代码位置
1. [技术点]: `path/file.java:startLine-endLine`

### 技术亮点
- ✅ [亮点]: [说明]
```
