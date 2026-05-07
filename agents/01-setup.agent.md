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

### 第4步：搜索辅助材料
搜索并总结以下内容（写入 `.feynflow-support.md`）：
- 费曼学习法四步法要点
- 该学科的学习策略/指南
- Mermaid/PlantUML/WaveDrom/Graphviz/Vega-Lite 七种图表工具的适用场景

### 第5步：输出配置摘要
告知用户项目已初始化完毕，可以运行 Agent 02 提取教科书。
