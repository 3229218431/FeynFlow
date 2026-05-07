# FeynFlow — Feynman + Workflow

> 费曼+Workflow：Claude Code 生成 Obsidian 知识库 → Cherry Studio RAG → AI 费曼导师交互式教学

## 开发初衷

> 我当时在使用带费曼学习法的AI提示词，发现非常好用。先通过生活例子类比，然后提出问题让你自己回答。在根据回答内容不断的画图表解释，效果很好。我当时在学习电磁场与电磁波课程时感觉听不懂，我就在想能否让AI辅助我学习。我先使用Claude Code工具去根据教科书原文生成Obsidian笔记，再把这个笔记作为知识库让cherry Studio读取，本地部署一个文本嵌入模型几乎不需要花钱。

## 一句话

把任意教科书变成一个 AI 费曼导师知识库——Claude Code 处理原文 → 生成 Obsidian 笔记 → Cherry Studio 读取为 RAG 知识库 → AI 用费曼法教你。

## 工具链

```mermaid
flowchart LR
    A[教科书原文] --> B[Claude Code agents]
    B --> C[Obsidian 费曼式笔记]
    C --> D[Cherry Studio RAG 知识库]
    D --> E[本地嵌入模型<br>Qwen3-Embedding-8B]
    E --> F[AI 费曼导师<br>交互式教学]
    
    F -->|"概念→类比→盲点检验"| G[用户理解]
    G -->|"仍有盲区？"| H[回溯到概念导航<br>前置笔记]
    H --> B
    
    style A fill:#4a90d9,color:#fff
    style B fill:#50c878,color:#fff
    style C fill:#ffd700,color:#000
    style D fill:#ff6b6b,color:#fff
    style E fill:#a8e6cf,color:#000
    style F fill:#d4a5f5,color:#fff
    style G fill:#fff,color:#000,stroke:#333
    style H fill:#f5cba7,color:#000
```

## 插件包内容

| 组件 | 用途 |
|------|------|
| `agents/01-setup.agent.md` | 环境准备 + 搜索辅助材料（费曼法、学习指南、绘图工具） |
| `agents/02-extract.agent.md` | 提取教科书 → 按§拆分为独立原文文件 |
| `agents/03-build.agent.md` | 建H2/H3骨架 + 写费曼式概念笔记 + 添加图表 |
| `agents/04-verify.agent.md` | 质量检查 + 修复问题 + 生成报表 |
| `templates/` | 7个Obsidian笔记模板（概念/MOC/习题/思考题/日志/MATLAB/AI指令） |
| `hooks/` | Claude Code生命周期钩子 |
| `examples/电磁场与电磁波/` | **完整示例项目**（45次提交、398篇笔记、64个原文文件、250+图表） |

## 使用方法

### 依赖安装

**必须安装 Pandoc**（用于将教科书转换为 Markdown）：

| 系统 | 命令 |
|------|------|
| Windows | `winget install pandoc` 或从 [pandoc.org](https://pandoc.org/installing.html) 下载 |
| macOS | `brew install pandoc` |
| Linux | `sudo apt install pandoc`（Ubuntu） / `sudo dnf install pandoc`（Fedora） |

验证：`pandoc --version`

### 安装
```bash
git clone https://github.com/[你的用户名]/FeynFlow.git
cd FeynFlow
cp -r skeleton/* ../我的新学科/
cd ../我的新学科
```

### 运行agent
```bash
# 按顺序运行4个agent
claude agents/01-setup.agent.md
claude agents/02-extract.agent.md
claude agents/03-build.agent.md
claude agents/04-verify.agent.md
```

### 配置Cherry Studio
1. 创建知识库 → 嵌入模型选 `Qwen3-Embedding-8B`
2. 添加文件夹 → 选择你的知识库目录
3. 系统指令 → 粘贴 `templates/AI费曼导师系统指令.md`

## 示例项目

`examples/电磁场与电磁波/` 是一个完整运行的示例：
- 教科书拆解为64个§文件
- 330篇费曼式笔记，全部≥5000字节
- 所有公式可渲染、所有笔记含 Wiki链接
- 164篇含RAG关键词标签
- 可直接导入Cherry Studio使用
