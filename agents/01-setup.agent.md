---
run: sequential
---

# Agent 01: 环境准备

## 任务
初始化新学科项目：检查依赖、创建目录、搜索辅助材料。

## 步骤

### 第1步：检查 Pandoc
运行 `pandoc --version` 确认已安装。若失败则提示用户安装。

### 第2步：创建项目目录
```bash
mkdir -p 教科书原文 agents Templates
cp -r ../FeynFlow/templates/* ./Templates/
```

### 第3步：确认学科信息
向用户确认以下信息并将答案写入 `.feynflow-config.json`：
- 学科名称（必填）
- 教科书文件路径（必填，支持 DOCX/PDF/TXT）
- 笔记级别：★基础 / ★★进阶 / ★★★精通
- 考试范围（可选）

### 第3.5步：课程类型自动检测
根据用户输入的学科名称，自动识别课程类型并写入 .feynflow-config.json：

检测规则（优先级从上到下）：
1. 含"英语、四级、六级、考研英语、托福、雅思"关键词 → 类型C（英语），策略C
2. 含"高数、线代、概率论、复变、积分变换、数理方程"关键词 → 类型B（数学），策略B
3. 含"Python、C语言、MATLAB、Verilog、编程、代码、算法"关键词 → 类型A（编程），策略A
4. 含"电磁场、模电、数电、信号、通信、射频、天线、PCB、DSP、FPGA、嵌入式、单片机、控制、电机"关键词 → 类型A（工科硬件），策略A
5. 默认 → 类型A（工科硬件），策略A

将检测结果写入 .feynflow-config.json：
- courseType: "A" | "B" | "C"
- strategy: "策略A" | "策略B" | "策略C"
- activeRules: 对应的规则编号数组

### 第4步：搜索辅助材料
搜索并总结以下内容（写入 `.feynflow-support.md`）：
- 费曼学习法四步法要点
- 该学科的学习策略/指南
- Mermaid/PlantUML/WaveDrom/Graphviz/Vega-Lite 七种图表工具的适用场景

### 第5步：输出配置摘要
告知用户项目已初始化完毕，包括检测到的课程类型和激活的策略。
