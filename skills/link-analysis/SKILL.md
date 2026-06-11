---
name: link-analysis
description: Use when the user asks about code flow, call chain, implementation details of a specific feature. Triggers on: "流程", "链路", "怎么调用的", "代码怎么走的", "调用链", "code flow". Supports Go and Java projects.
---

# Link Analysis

## Overview

Trace and visualize the call chain of a specific feature in Go/Java projects, from entry point to data layer.

## When to Use

**Use when:**
- User asks "帮我看看XX的流程"
- User asks "这个功能是怎么调用的"
- User wants to understand code they didn't write

**Do NOT use when:**
- User wants to write new code
- User is debugging an issue

## Quick Reference

| Step | Action |
|------|--------|
| 1 | Detect project type (Go/Java) |
| 2 | Find entry point (Handler/Controller) |
| 3 | Trace service layer |
| 4 | Trace repository/data layer |
| 5 | Identify external dependencies |
| 6 | Output formatted call chain |

## Implementation

### Step 1: Detect Project Type

```bash
!`find . -maxdepth 3 -type f \( -name "go.mod" -o -name "pom.xml" -o -name "build.gradle" \) 2>/dev/null | head -5`
```

### Step 2: Find Entry Point

**Go:** Search for `router.POST`, `router.GET`, `http.HandleFunc`
**Java:** Search for `@RestController`, `@RequestMapping`, `@PostMapping`

### Step 3: Trace Call Chain

Follow function calls from handler → service → repository

### Step 4: Output Format

```markdown
## 📍 链路: [功能名称]

### 入口
- API: `[METHOD] /path`
- Handler: `Function()` @ file:line

### 调用链
┌─────────────────────────────────────────┐
│  Entry Point                            │
│       ↓                                 │
│  Service Layer    [职责]                 │
│       ↓                                 │
│  Repository Layer [职责]                 │
│       ↓                                 │
│  External Deps    [类型]                 │
└─────────────────────────────────────────┘

### 核心代码位置
1. [技术点]: `file:line`
```
