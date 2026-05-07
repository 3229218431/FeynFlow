#!/bin/bash
# FeynFlow pre-build hook
# 验证环境和依赖

echo "🔍 FeynFlow Pre-Build Check"

# 检查是否有教科书原文目录
if [ ! -d "教科书原文" ]; then
  echo "⚠️  教科书原文/ 不存在，请先运行 02-extract agent"
  exit 1
fi

# 检查模板
if [ ! -d "Templates" ]; then
  echo "⚠️  Templates/ 不存在，正在复制..."
  cp -r "$(dirname $0)/../templates" ./Templates
fi

echo "✅ Pre-build check passed"
exit 0
