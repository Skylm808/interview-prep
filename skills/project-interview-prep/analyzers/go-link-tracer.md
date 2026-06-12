# Go Project Link Tracer

## Overview

Analyze Go project call chains by tracing from HTTP handlers to data layer.

## Entry Point Detection

Look for these patterns to find API entry points:

### HTTP Framework Handlers
```go
// Gin
router.POST("/api/orders", handler.CreateOrder)
router.GET("/api/orders/:id", handler.GetOrder)

// Echo
e.POST("/api/orders", handler.CreateOrder)

// net/http
http.HandleFunc("/api/orders", handlerFunc)
```

### gRPC Services
```go
// Proto-generated server interface
func (s *server) CreateOrder(ctx context.Context, req *pb.CreateOrderRequest) (*pb.CreateOrderResponse, error)
```

## Call Chain Tracing

### Layer Pattern
Go projects typically follow this structure:
```
cmd/           → main.go entry point
internal/
  handler/     → HTTP handlers (parameter validation, auth check)
  service/     → Business logic (orchestration)
  repository/  → Data access (DB operations)
  model/       → Data structures
  pkg/         → Shared utilities
```

### Key Code Patterns to Identify

**Dependency Injection:**
```go
type OrderService struct {
    repo    OrderRepository
    mq      MessagePublisher
    cache   CacheClient
}
```

**Interface Abstraction:**
```go
type OrderRepository interface {
    Create(ctx context.Context, order *Order) error
    GetByID(ctx context.Context, id string) (*Order, error)
}
```

**Error Handling Patterns:**
```go
if err != nil {
    return fmt.Errorf("failed to create order: %w", err)
}
```

## Core Logic Identification

### CRUD Still Matters When It Adds Engineering Value
- Permission checks and role gating
- Validation chains with real business rules
- Query shaping, filters, pagination, export
- Config governance and rollout control
- Logging, metrics, tracing, and alert hooks
- Data consistency handling around writes or syncs

### Core Logic (Worth Highlighting)
- **Distributed Patterns**: Saga, 2PC, eventual consistency
- **Concurrency**: goroutine pools, channels, sync primitives
- **Caching Strategy**: cache-aside, write-through, invalidation
- **Message Queue**: async processing, event-driven
- **Circuit Breaker**: fault tolerance patterns
- **Rate Limiting**: token bucket, sliding window
- **State Machine**: order status transitions

## Output Template

```markdown
## 📍 链路: [功能名称]

### 入口
- API: `[METHOD] /api/v1/xxx`
- Handler: `package.HandlerMethod()` @ path/file.go:line

### 调用链
┌─────────────────────────────────────────────────────────┐
│  [Entry Point]                                          │
│       ↓                                                 │
│  [Layer 1]              [职责说明]                       │
│       ↓                                                 │
│  [Layer 2]              [职责说明]                       │
│       ↓                                                 │
│  ├── [Dependency 1]     [职责说明]                       │
│  ├── [Dependency 2]     [职责说明]                       │
│  └── [Dependency 3]     [职责说明]                       │
└─────────────────────────────────────────────────────────┘

### 核心代码位置
1. [技术点]: `path/file.go:startLine-endLine`

### 技术亮点
- ✅ [亮点]: [说明]
- 🧾 [贡献边界]: [负责/参与/联调/只读]
```
