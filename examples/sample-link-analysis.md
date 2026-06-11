# Sample: Link Analysis Output

## 用户输入
"帮我分析一下订单创建的链路"

## AI 输出

## 📍 链路: 订单创建

### 入口
- API: `POST /api/v1/orders`
- Handler: `OrderHandler.CreateOrder()` @ internal/handler/order.go:45

### 调用链
```
┌─────────────────────────────────────────────────────────┐
│  HTTP Request                                           │
│       ↓                                                 │
│  OrderHandler.CreateOrder()     [参数校验、权限检查]      │
│       ↓                                                 │
│  OrderService.Create()          [业务逻辑处理]           │
│       ↓                                                 │
│  ├── OrderRepo.Insert()         [写订单库]               │
│  ├── InventoryClient.Deduct()   [扣库存 - RPC调用]       │
│  └── EventPublisher.Publish()   [发送MQ消息]             │
│       ↓                                                 │
│  OrderStatusUpdater.Update()    [更新订单状态]           │
└─────────────────────────────────────────────────────────┘
```

### 核心代码位置
1. 事务管理: `service/order.go:78-102`
2. 幂等校验: `service/order.go:56` (request_id唯一索引)
3. 补偿逻辑: `service/order.go:120-145` (失败时回滚库存)
4. 状态机: `model/order_status.go:15-30` (pending→confirmed→paid)

### 技术亮点
- ✅ **幂等性设计**: 通过request_id唯一索引防止重复下单
- ✅ **Saga模式**: 分布式事务采用Saga而非2PC，兼顾一致性和性能
- ✅ **异步解耦**: MQ通知下游（物流、积分），主流程不阻塞
- ⚠️ **注意**: 库存扣减失败时需要触发补偿操作

### 外部依赖
- MySQL: 订单库
- Redis: 缓存 + 分布式锁
- RabbitMQ: 异步消息
- gRPC: 库存服务RPC调用
