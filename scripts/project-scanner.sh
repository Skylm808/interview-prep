#!/bin/bash
# Project Scanner - Detect project type and structure

echo "=== Project Scanner ==="
echo ""

# Detect project type
echo "📦 Project Type Detection:"
if [ -f "go.mod" ]; then
    echo "  ✅ Go project detected (go.mod found)"
    echo "  📋 Module: $(head -1 go.mod | awk '{print $2}')"
    GO_VERSION=$(grep "^go " go.mod | awk '{print $2}')
    echo "  📋 Go Version: $GO_VERSION"
elif [ -f "pom.xml" ]; then
    echo "  ✅ Java/Maven project detected (pom.xml found)"
elif [ -f "build.gradle" ] || [ -f "build.gradle.kts" ]; then
    echo "  ✅ Java/Gradle project detected"
else
    echo "  ⚠️  No standard project file found"
fi

echo ""

# Count source files
echo "📁 Source Files:"
GO_FILES=$(find . -name "*.go" -not -path "./vendor/*" 2>/dev/null | wc -l | tr -d ' ')
JAVA_FILES=$(find . -name "*.java" 2>/dev/null | wc -l | tr -d ' ')

if [ "$GO_FILES" -gt 0 ]; then
    echo "  Go files: $GO_FILES"
fi
if [ "$JAVA_FILES" -gt 0 ]; then
    echo "  Java files: $JAVA_FILES"
fi

echo ""

# Detect frameworks
echo "🔧 Framework Detection:"
if [ -f "go.mod" ]; then
    if grep -q "gin-gonic" go.mod 2>/dev/null; then
        echo "  ✅ Gin (HTTP Framework)"
    fi
    if grep -q "go-redis" go.mod 2>/dev/null; then
        echo "  ✅ Redis"
    fi
    if grep -q "rabbitmq" go.mod 2>/dev/null || grep -q "amqp" go.mod 2>/dev/null; then
        echo "  ✅ RabbitMQ"
    fi
    if grep -q "grpc" go.mod 2>/dev/null; then
        echo "  ✅ gRPC"
    fi
fi

echo ""
echo "=== Scan Complete ==="
