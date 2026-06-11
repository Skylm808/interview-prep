# Project Interview Prep

A skill for coding agents that helps interns and junior developers understand project core logic, prepare for technical interviews, and generate resume materials.

## Features

- 🔍 **Link Analysis**: Trace code call chains from entry point to data layer
- 🎤 **Interview Questions**: Generate 3-5 questions per topic with difficulty levels (初级/中级/高级)
- ⭐ **STAR Answers**: Structured answers using Situation-Task-Action-Result method
- 📄 **Resume Builder**: Extract project highlights as quantified bullet points
- ⚖️ **Tradeoff Analysis**: Analyze technical decisions and their tradeoffs

## Supported Platforms

| Platform | Installation |
|----------|--------------|
| Claude Code | `.claude-plugin/` |
| Codex App | `.codex-plugin/` |
| Cursor | `.cursor-plugin/` |

## Quick Start

### Option 1: Manual Installation

```bash
# Clone the repository
git clone https://github.com/Skylm808/interview-prep.git

# Run install script
cd interview-prep
chmod +x scripts/install.sh
./scripts/install.sh
```

### Option 2: Platform-Specific

**Claude Code:**
```bash
cp -r .claude-plugin ~/.claude/plugins/project-interview-prep
cp -r skills ~/.claude/plugins/project-interview-prep/
```

**Codex App:**
```bash
mkdir -p ~/.codex/plugins
cp -r .codex-plugin ~/.codex/plugins/project-interview-prep
cp -r skills ~/.codex/plugins/project-interview-prep/
```

**Cursor:**
```bash
mkdir -p ~/.cursor/plugins
cp -r .cursor-plugin ~/.cursor/plugins/project-interview-prep
cp -r skills ~/.cursor/plugins/project-interview-prep/
```

## Usage

Once installed, the skill will auto-trigger when you ask questions like:

### Link Analysis (链路分析)
```
"帮我分析一下订单创建的流程"
"这个功能是怎么调用的"
"看看用户登录的链路"
```

### Interview Preparation (面试准备)
```
"出几道订单创建的面试题"
"这个功能怎么回答面试官"
"准备一下分布式事务的面试"
```

### Resume Building (简历撰写)
```
"帮我提取这个项目的亮点写简历"
"帮我写简历素材"
"量化一下这个功能的成果"
```

### Tradeoff Analysis (取舍分析)
```
"为什么用Saga而不是2PC"
"这个方案有什么tradeoff"
"对比一下这两个方案"
```

## Output Examples

### Link Analysis Output
```
📍 链路: 订单创建

入口
- API: POST /api/v1/orders
- Handler: OrderHandler.CreateOrder() @ handler/order.go:45

调用链
┌─────────────────────────────────────────┐
│  HTTP Request                           │
│       ↓                                 │
│  Handler.CreateOrder()  [参数校验]       │
│       ↓                                 │
│  Service.Create()       [业务逻辑]       │
│       ↓                                 │
│  ├── Repo.Insert()      [写数据库]       │
│  └── MQ.Publish()       [发消息]         │
└─────────────────────────────────────────┘
```

### Interview Question Output
```
🎤 面试题: 订单创建

🟢 初级
Q1: 请描述订单创建的整体流程？

🟡 中级
Q3: 为什么用Saga而不是2PC？
> Tradeoff: 牺牲强一致性，换取高可用性

🔴 高级
Q5: 如果订单量增长10倍，有什么瓶颈？
```

### Resume Output
```
📄 简历素材

电商订单系统 | 后端开发实习生 | 2025.06-2025.09

- 设计并实现订单创建链路，采用Saga模式处理分布式事务，
  保证数据最终一致性，成功率99.99%

- 通过RabbitMQ实现异步解耦，系统可用性提升至99.9%
```

## Skill Structure

```
skills/
├── project-interview-prep/
│   ├── SKILL.md              # Main skill entry point
│   ├── analyzers/
│   │   ├── go-link-tracer.md    # Go project analysis
│   │   └── java-link-tracer.md  # Java project analysis
│   ├── interview/
│   │   ├── question-bank.md     # Question templates
│   │   └── star-formatter.md    # STAR answer format
│   └── resume/
│       └── bullet-builder.md    # Resume builder
├── link-analysis/
│   └── SKILL.md              # Standalone link analysis skill
└── interview-prep/
    └── SKILL.md              # Standalone interview prep skill
```

## Design Philosophy

1. **No exaggeration**: Honest answers suitable for intern level
2. **Quantified results**: Always include metrics when possible
3. **Tradeoff aware**: Every decision has pros and cons
4. **STAR method**: Structured answers for behavioral questions
5. **Beyond CRUD**: Focus on non-trivial code patterns

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

MIT License

## Acknowledgments

Inspired by [obra/superpowers](https://github.com/obra/superpowers) skill framework.
