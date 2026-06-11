#!/bin/bash
# Install script for project-interview-prep skill

set -e

echo "=========================================="
echo "  Project Interview Prep - Installer"
echo "=========================================="
echo ""

# Detect current directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "Select platform to install:"
echo ""
echo "  1) Claude Code"
echo "  2) Codex App"
echo "  3) Cursor"
echo "  4) All platforms"
echo ""
read -p "Enter choice [1-4]: " choice

install_claude() {
    echo ""
    echo "📦 Installing for Claude Code..."
    mkdir -p ~/.claude/plugins
    cp -r "$PROJECT_DIR/.claude-plugin" ~/.claude/plugins/project-interview-prep
    cp -r "$PROJECT_DIR/skills" ~/.claude/plugins/project-interview-prep/
    echo "✅ Claude Code installation complete!"
    echo "   Location: ~/.claude/plugins/project-interview-prep"
}

install_codex() {
    echo ""
    echo "📦 Installing for Codex App..."
    mkdir -p ~/.codex/plugins
    cp -r "$PROJECT_DIR/.codex-plugin" ~/.codex/plugins/project-interview-prep
    cp -r "$PROJECT_DIR/skills" ~/.codex/plugins/project-interview-prep/
    echo "✅ Codex App installation complete!"
    echo "   Location: ~/.codex/plugins/project-interview-prep"
}

install_cursor() {
    echo ""
    echo "📦 Installing for Cursor..."
    mkdir -p ~/.cursor/plugins
    cp -r "$PROJECT_DIR/.cursor-plugin" ~/.cursor/plugins/project-interview-prep
    cp -r "$PROJECT_DIR/skills" ~/.cursor/plugins/project-interview-prep/
    echo "✅ Cursor installation complete!"
    echo "   Location: ~/.cursor/plugins/project-interview-prep"
}

case $choice in
    1)
        install_claude
        ;;
    2)
        install_codex
        ;;
    3)
        install_cursor
        ;;
    4)
        install_claude
        install_codex
        install_cursor
        ;;
    *)
        echo "❌ Invalid choice"
        exit 1
        ;;
esac

echo ""
echo "=========================================="
echo "  Installation Complete!"
echo "=========================================="
echo ""
echo "Usage:"
echo "  - Ask about code flow: '帮我分析一下XX的流程'"
echo "  - Prepare interview: '出几道面试题'"
echo "  - Build resume: '帮我写简历'"
