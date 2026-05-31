#!/bin/bash
# FeynFlow pre-build hook
# 验证环境和依赖

# 课程类型自动检测函数
detect_course_type() {
  local subject="$1"
  case "$subject" in
    *英语*|*四级*|*六级*|*考研英语*|*托福*|*雅思*) echo "C" ;;
    *高数*|*线代*|*概率论*|*复变*|*积分变换*|*数理方程*) echo "B" ;;
    *Python*|*C语言*|*MATLAB*|*Verilog*|*编程*|*代码*) echo "A" ;;
    *电磁场*|*模电*|*数电*|*信号*|*通信*|*射频*|*天线*|*PCB*|*DSP*|*FPGA*|*嵌入式*) echo "A" ;;
    *) echo "A" ;;
  esac
}

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
