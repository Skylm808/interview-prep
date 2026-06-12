# Project Interview Prep

A skill for coding agents that helps interns and junior developers understand real project code flow, audit contribution boundaries, prepare for technical interviews, and draft honest resume materials.

## Features

- 🔍 **Link Analysis**: Trace code call chains from entry point to data layer
- 🎤 **Interview Questions**: Generate questions by difficulty and interview stage
- ⭐ **STAR Answers**: Structured answers using Situation-Task-Action-Result method
- 📄 **Resume Builder**: Extract project highlights with evidence-first wording
- ⚖️ **Tradeoff Analysis**: Analyze technical decisions, tradeoffs, and ownership level
- 🧾 **Contribution Audit**: Separate implemented, modified, validated, read-only, and not-involved work

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
"帮我检查这段项目经历有没有夸大"
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

- 负责订单查询链路优化，补充日志打点并协助验证重复查询问题，
  完成 Postman 连续请求回归。

- 参与异步消息联调，确认失败重试和幂等处理逻辑在测试环境可稳定运行。
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

1. **No exaggeration**: Do not claim work that was only read or observed
2. **Evidence first**: Use numbers only when the source is clear
3. **Contribution boundaries**: Separate implemented, modified, validated, investigated, and read-only work
4. **Tradeoff aware**: Explain the option chosen, what it sacrificed, and whether the user participated in that decision
5. **CRUD to engineering value**: Treat CRUD as valuable when it includes permissions, validation, observability, consistency, query design, or governance

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
