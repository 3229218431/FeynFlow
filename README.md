[English](README.en.md) | [中文](README.md) | [Español](README.es.md)

---

# FeynFlow — Feynman + Workflow

> **费曼+Workflow**：Claude Code 生成 Obsidian 知识库 → Cherry Studio RAG → AI 费曼导师交互式教学。
>
> 把任意教科书变成一个 AI 费曼导师知识库。全套工具链开箱即用。

---

## 📖 开发初衷

> 我当时在使用带费曼学习法的AI提示词，发现非常好用。先通过生活例子类比，然后提出问题让你自己回答。在根据回答内容不断的画图表解释，效果很好。我当时在学习电磁场与电磁波课程时感觉听不懂，我就在想能否让AI辅助我学习。我先使用Claude Code工具去根据教科书原文生成Obsidian笔记，再把这个笔记作为知识库让cherry Studio读取，本地部署一个文本嵌入模型几乎不需要花钱。

**FeynFlow 的核心思想**：你不是在做一个普通的笔记库，你是在建一个**AI可以检索和教学的互动知识图谱**。每个笔记不仅是为你自己看的，也是为 AI 导师准备的教材。

### 开发时间线

```mermaid
timeline
    title FeynFlow Development
    04-27 : Project skeleton<br>10 H2 + 100 dirs + 289 files
    04-28 : Feynman notes filled<br>46 core + 4 MATLAB prompts
    04-28 : 6 agent rounds<br>All 301 notes >= 5000 bytes
    04-29 : 7 diagram types<br>PlantUML/WaveDrom/Graphviz/Vega
    04-29 : Textbook centralized<br>64 section files + 249 links
    04-30 : RAG + Cherry Studio<br>164 keyword + AI system prompt
    05-07 : FeynFlow plugin<br>4 agents + 7 templates + i18n
```

### 技术栈一览

```mermaid
quadrantChart
    title FeynFlow Tool Stack
    x-axis Lightweight --> Powerful
    y-axis User-facing --> Developer
    quadrant-1 Developer Tools
    quadrant-2 Core Engine
    quadrant-3 Supporting
    quadrant-4 Frontend
    Claude Code: [0.85, 0.75]
    Pandoc: [0.3, 0.7]
    Obsidian: [0.6, 0.25]
    Cherry Studio: [0.7, 0.3]
    Qwen3-Embedding: [0.75, 0.6]
    Git: [0.4, 0.8]
    Mermaid: [0.5, 0.35]
    PlantUML: [0.6, 0.4]
```

---

## 🔧 工具链全览

```mermaid
flowchart LR
    A[Textbook<br>DOCX/PDF/TXT] --> B[Claude Code<br>Run 4 Agents]
    B --> C[Obsidian Feynman Notes<br>300+ with diagrams+links]
    C --> D[Cherry Studio<br>RAG Knowledge Base]
    D --> E[Local Embedding<br>Qwen3-Embedding-8B]
    E --> F[AI Feynman Tutor<br>Interactive Teaching]
    
    F -->|Concept->Analogy->Check| G[Mastered]
    G -->|Still stuck?| H[Backtrack via<br>Concept Navigation]
    H --> B
```

### 工作流程拆解

| 阶段 | 工具 | 产出 | 说明 |
|------|------|------|------|
| 1. 准备 | `01-setup agent` + Pandoc | 项目骨架 + 辅助材料 | 自动搜索费曼法+绘图工具+学习指南 |
| 2. 提取 | `02-extract agent` | `教科书原文/` 目录 | 按§拆分为独立.md文件，一字不差 |
| 3. 构建 | `03-build agent` | 概念笔记 + 图表 + MOC | 费曼四步法填充，7种图表工具 |
| 4. 验证 | `04-verify agent` | 质量报告 | 6项测试T1-T6，自动修复至达标 |
| 5. 教学 | Cherry Studio + AI | 交互式学习 | 本地嵌入模型，AI费曼导师 |

---

## 📦 插件包内容

```
FeynFlow/
├── README.md / .en.md / .es.md   # 多语言项目介绍（附语言切换按钮）
├── plugin.json                    # 插件元数据
│
├── agents/                        # 4个Claude Code agent
│   ├── 01-setup.agent.md          # 环境准备 + 搜索辅助材料
│   ├── 02-extract.agent.md        # 提取教科书原文
│   ├── 03-build.agent.md          # 建骨架 + 写笔记 + 加图表
│   └── 04-verify.agent.md         # 6项测试 T1-T6 + 自动修复
│
├── templates/                     # 7个 Obsidian 笔记模板
│   ├── 概念笔记模板.md              # ★/★★/★★★ 三级费曼笔记
│   ├── MOC模板.md                  # 章节导航索引
│   ├── 习题笔记模板.md              # 费曼式解题引导
│   ├── 思考题模板.md                # 预习思考引导
│   ├── 每日学习日志模板.md           # 费曼复盘
│   ├── MATLAB提示词模板.md          # 六段式提示词
│   └── AI费曼导师系统指令.md         # Cherry Studio 系统指令
│
├── hooks/
│   └── pre-build.sh               # 构建前检查
│
├── skeleton/                      # 新项目可复制骨架
│
└── examples/
    └── 电磁场与电磁波/              # ★完整示例项目（511文件）
```

---

## 🚀 快速开始

### 前置依赖

| 软件 | 用途 | 安装 |
|------|------|------|
| **Pandoc** ⚠️ 必须 | 教科书 → Markdown 转换 | `winget install pandoc`(Win) / `brew install pandoc`(Mac) |
| **Claude Code** | 运行 agent | `npm install -g @anthropic-ai/claude-code` |
| **Cherry Studio**（可选） | RAG 知识库教学 | https://github.com/CherryHQ/cherry-studio/releases |
| **Qwen3-Embedding-8B**（可选） | 本地嵌入模型 | 在 Cherry Studio 知识库设置中选择（免费） |

验证：`pandoc --version`

### 安装 FeynFlow

```bash
git clone https://github.com/3229218431/FeynFlow.git
cd FeynFlow
```

### 为新学科创建知识库

```bash
# 复制骨架到新目录
cp -r skeleton/* ../我的新学科/
cd ../我的新学科

# 把你的教科书放进项目根目录（如 教科书.docx）

# 运行 agent
claude ../FeynFlow/agents/01-setup.agent.md
```

### 运行 Agent 的顺序

```bash
claude ../FeynFlow/agents/01-setup.agent.md    # 1. 准备环境
claude ../FeynFlow/agents/02-extract.agent.md   # 2. 提取章节原文
claude ../FeynFlow/agents/03-build.agent.md     # 3. 构建笔记+图表
claude ../FeynFlow/agents/04-verify.agent.md    # 4. 测试+修复
```

### 在 Cherry Studio 中使用

1. **创建知识库** → 填入名称 → 嵌入模型选 `Qwen3-Embedding-8B`
2. **添加文件夹** → 选择 `我的新学科/` 目录
3. **系统指令** → 粘贴 `Templates/AI费曼导师系统指令.md` 的内容
4. **开始对话** → AI 会自动检索教科书原文，用费曼法回答你的问题

---

## 🧠 笔记三级标准

| 级别 | 字数 | 认知层次 | 费曼步骤 | 适用章节 |
|------|------|---------|---------|---------|
| ★ 基础 | 3000-6000 字节 | 记忆+理解 | 第1-2步 | 进阶选学、简单概念 |
| ★★ 应用 | 6000-10000 字节 | 理解+应用 | 第1-3步 | 核心概念、常规章节 |
| ★★★ 精通 | 10000-15000+ 字节 | 分析+综合 | 全部4步 | 核心枢纽（如麦克斯韦方程） |

每篇笔记的固定结构：
```
**关键词**：标签 → RAG检索优化
## 教科书原文 → [[§链接]] → 链接到集中原文文件
## 概念定义（费曼第1步） → 一句话说清
## 类比与直觉（费曼第2步） → 生活化比喻
## 核心公式详释（$$ + 符号表） → 每个符号含义
## 推导脉络（Mermaid/PlantUML等） → 可视化流程图
## 常见误区（费曼第3步） → 暴露盲区
## 费曼检验（费曼第4步） → 自测题
## 概念导航 → Wiki链接 → 双向连接
## 自己理解 → 用户填写费曼复述
```

---

## 🎨 图表工具覆盖

| 工具 | 数量 | 用途 | Obsidian 渲染 |
|------|------|------|-------------|
| Mermaid | 218+ | 推导流程、状态图、思维导图 | ✅ 原生支持 |
| PlantUML | 30+ | 场分类、边界条件、波导模式 | 需社区插件 |
| WaveDrom | 16+ | 时域波形、时谐场 | 需社区插件 |
| Graphviz | 23+ | 概念拓扑、公式依赖 | 需社区插件 |
| Vega-Lite | 15+ | 场分布曲面、参数扫描 | 需社区插件 |

---

## 🧪 6 项质量测试（T1-T6）

Agent 04 的自动测试循环：

```mermaid
stateDiagram-v2
    [*] --> T1_链接检测
    T1_链接检测 --> T2_公式检测: 通过
    T1_链接检测 --> T1_链接检测: 修复
    T2_公式检测 --> T3_图表语法: 通过
    T2_公式检测 --> T2_公式检测: 修复
    T3_图表语法 --> T4_内容完整: 通过
    T3_图表语法 --> T3_图表语法: 修复
    T4_内容完整 --> T5_覆盖率: 通过
    T4_内容完整 --> T4_内容完整: 修复
    T5_覆盖率 --> T6_图谱连通: 通过
    T5_覆盖率 --> T5_覆盖率: 修复
    T6_图谱连通 --> [*]: 全部通过✅
    T6_图谱连通 --> T6_图谱连通: 修复
    note right of T1_链接检测: 死链+孤立节点
    note right of T2_公式检测: $$...$$包裹
    note right of T3_图表语法: Mermaid/PlantUML
    note right of T4_内容完整: 关键词+自己理解
    note right of T5_覆盖率: TOC逐节对应
    note right of T6_图谱连通: 反向链接完整
```

Agent 04 自动执行：

| 测试 | 检查项 | 自动修复 |
|------|--------|---------|
| **T1 链接** | 无死链、无孤立节点 | ✅ 自动替换 |
| **T2 公式** | 全部 `$$...$$` 包裹 | ✅ 自动包裹 |
| **T3 图表** | Mermaid/PlantUML 语法正确 | ✅ 自动修正 |
| **T4 内容** | 字节数、关键词、自己理解板块 | ✅ 自动补充 |
| **T5 覆盖率** | TOC逐节对应 | ✅ 自动创建 |
| **T6 图谱** | 反向链接完整 | ✅ 自动添加 |

---

## 📊 示例项目：电磁场与电磁波

`examples/电磁场与电磁波/` 是一个完整运行的示例：

| 指标 | 数据 |
|------|------|
| 教科书章节 | 第1~8章 |
| 教科书原文文件 | **64 个** §文件 |
| 概念笔记 | **328 篇** |
| RAG关键词 | **166 篇**含 `**关键词**：` |
| 教科书双向链接 | **262 处** `[[§链接]]` |
| Mermaid 图表 | **112 个** |
| PlantUML 图表 | **30 个** |
| 图表总数 | **约 250+ 个** |
| 每篇笔记字数 | ≥5000 字节 |
| Git 提交 | 45 次 |
| 构建轮次 | 6 轮 agent 循环 |

## 项目结构总览

```mermaid
mindmap
  root((FeynFlow))
    核心插件包
      4个agent
      7个模板
      hooks配置
      plugin.json
    多语言README
      中文
      英文
      西班牙语
    示例项目
      64个§原文
      328篇概念笔记
      250+图表
    工具链
      Claude Code
      Obsidian
      Cherry Studio
      Qwen3-Embedding
```

## 每篇笔记的结构

```mermaid
mindmap
  root((单篇笔记))
    元数据
      YAML frontmatter
      **关键词**：RAG标签
    教科书原文
      → [[§链接]]
    费曼第1步：精准输入
      概念定义
      核心公式 $$
    费曼第2步：简单解释
      类比与直觉
      推导脉络 Mermaid
    费曼第3步：盲点检验
      常见误区
      费曼检验 2-6题
    费曼第4步：简化优化
      概念导航 [[链接]]
      自己理解（用户填写）
```

可直接把 `examples/电磁场与电磁波/` 整个目录导入 Cherry Studio 作为知识库：
1. Cherry Studio → 知识库 → 创建
2. 添加文件夹 → 选择 `examples/电磁场与电磁波/`
3. 系统指令 → `Templates/AI费曼导师系统指令.md`
4. 开始学习

---

## ❓ 常见问题

**Q: 一定要用 Cherry Studio 吗？**
A: 不必须。任何支持 RAG 知识库的 AI 客户端都可以（如 Open-WebUI、AnythingLLM 等）。

**Q: 为什么用 Obsidian？**
A: Obsidian 的 `[[双向链接]]` 和 Mermaid 原生渲染最适合构建知识图谱。

**Q: 支持哪些教科书格式？**
A: Pandoc 支持 DOCX、PDF、TXT、Markdown、LaTeX、HTML 等 30+ 格式。

**Q: 嵌入模型一定要 Qwen3 吗？**
A: 推荐 Qwen3-Embedding-8B（免费且性能第一），也支持任何其他嵌入模型。

**Q: 一个学科大约要建多久？**
A: 取决于教科书篇幅。电磁场示例（8章、64节）在 6 轮 agent 循环中完成，约 2-3 小时。

---

## 🔗 项目链接

- GitHub: [https://github.com/3229218431/FeynFlow](https://github.com/3229218431/FeynFlow)
- 示例项目：`examples/电磁场与电磁波/`

---

[English](README.en.md) | [中文](README.md) | [Español](README.es.md)
