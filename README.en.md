[English](README.en.md) | [中文](README.md) | [Español](README.es.md)

---

# FeynFlow — Feynman + Workflow

> **Feynman + Workflow**：Claude Code generates Obsidian notes → Cherry Studio RAG → AI Feynman Tutor interactive teaching.
>
> Turn any textbook into an AI Feynman tutor knowledge base. Full toolchain out of the box.

---

## 📖 Origin Story

> I found the Feynman-method AI prompts incredibly effective: first life analogies, then questions to make you think, then diagrams to explain based on my responses. When I struggled with my electromagnetic fields course, I wondered: can AI help me learn systematically? The solution: Claude Code generates Obsidian notes from the textbook → Cherry Studio reads it as a knowledge base → local embedding models (nearly free) → AI Feynman tutor teaches interactively.

**Core idea**: You're not just making a note library — you're building an **interactive knowledge graph** that an AI tutor can retrieve from and teach with. Every note is both for you and for the AI.

---

## 🔧 Toolchain Overview

```mermaid
flowchart LR
    A[Textbook<br>DOCX/PDF/TXT] --> B[Claude Code<br>Run 4 Agents]
    B --> C[Obsidian Feynman Notes<br>300+ notes with diagrams+links]
    C --> D[Cherry Studio<br>RAG Knowledge Base]
    D --> E[Local Embedding<br>Qwen3-Embedding-8B]
    E --> F[AI Feynman Tutor<br>Interactive Teaching]
    
    F -->|Concept→Analogy→Blind→Simplify| G[✓ Mastered]
    G -->|Still stuck?| H[Backtrack via<br>Concept Navigation]
    H --> B

    style A fill:#4a90d9,color:#fff
    style B fill:#50c878,color:#fff
    style C fill:#ffd700,color:#000
    style D fill:#ff6b6b,color:#fff
    style E fill:#a8e6cf,color:#000
    style F fill:#d4a5f5,color:#fff
```

### Pipeline Breakdown

| Stage | Tool | Output | Description |
|-------|------|--------|-------------|
| 1. Setup | `01-setup agent` + Pandoc | Project skeleton + materials | Auto-search Feynman method + drawing tools + study guides |
| 2. Extract | `02-extract agent` | `教科书原文/` directory | Split textbook into §-level .md files, verbatim |
| 3. Build | `03-build agent` | Concept notes + diagrams + MOC | Feynman 4-step content, 7 diagram types |
| 4. Verify | `04-verify agent` | Quality report | 6 tests T1-T6, auto-fix until all pass |
| 5. Teach | Cherry Studio + AI | Interactive learning | Local embedding model, AI Feynman tutor |

---

## 📦 Package Contents

```
FeynFlow/
├── README.md / .en.md / .es.md   # Multi-language docs with language switcher
├── plugin.json                    # Plugin metadata
│
├── agents/                        # 4 Claude Code agents
│   ├── 01-setup.agent.md          # Environment setup + search materials
│   ├── 02-extract.agent.md        # Extract textbook sections
│   ├── 03-build.agent.md          # Build skeleton + write notes + diagrams
│   └── 04-verify.agent.md         # 6 tests T1-T6 + auto-fix loop
│
├── templates/                     # 7 Obsidian note templates
│   ├── 概念笔记模板.md              # ★/★★/★★★ Feynman notes
│   ├── MOC模板.md                  # Chapter navigation index
│   ├── 习题笔记模板.md              # Exercise problem guide
│   ├── 思考题模板.md                # Preview thought questions
│   ├── 每日学习日志模板.md           # Daily Feynman log
│   ├── MATLAB提示词模板.md          # 6-section code prompts
│   └── AI费曼导师系统指令.md         # Cherry Studio system prompt
│
├── hooks/
│   └── pre-build.sh               # Pre-build check
│
├── skeleton/                      # New project template
│
└── examples/
    └── 电磁场与电磁波/              # Full working example (511 files)
```

---

## 🚀 Quick Start

### Prerequisites

| Software | Purpose | Install |
|----------|---------|---------|
| **Pandoc** ⚠️ Required | Textbook → Markdown | `winget install pandoc`(Win) / `brew install pandoc`(Mac) |
| **Claude Code** | Run agents | `npm install -g @anthropic-ai/claude-code` |
| **Cherry Studio** (optional) | RAG knowledge base | https://github.com/CherryHQ/cherry-studio/releases |
| **Qwen3-Embedding-8B** (optional) | Local embedding | Select in Cherry Studio KB settings (free) |

Verify: `pandoc --version`

### Install

```bash
git clone https://github.com/3229218431/FeynFlow.git
cd FeynFlow
```

### Create Knowledge Base for New Subject

```bash
# Copy skeleton to new directory
cp -r skeleton/* ../my-new-subject/
cd ../my-new-subject
# Place your textbook file here (e.g. textbook.docx)
# Run agents
claude ../FeynFlow/agents/01-setup.agent.md
claude ../FeynFlow/agents/02-extract.agent.md
claude ../FeynFlow/agents/03-build.agent.md
claude ../FeynFlow/agents/04-verify.agent.md
```

### Configure Cherry Studio

1. **Create knowledge base** → Embedding model: `Qwen3-Embedding-8B`
2. **Add folder** → Select `my-new-subject/` directory
3. **System prompt** → Paste `Templates/AI费曼导师系统指令.md` content
4. **Start learning** → AI auto-retrieves textbook content, teaches with Feynman method

---

## 🧠 Note Quality Standards

| Level | Size | Cognitive | Feynman Step | Use Case |
|-------|------|-----------|-------------|----------|
| ★ Basic | 3000-6000 B | Remember+Understand | Steps 1-2 | Advanced topics, simple concepts |
| ★★ Applied | 6000-10000 B | Understand+Apply | Steps 1-3 | Core concepts, regular chapters |
| ★★★ Master | 10000-15000+ B | Analyze+Synthesize | All 4 steps | Hub chapters (Maxwell eq, etc.) |

Every note structure:
```
**Keywords**: tags → RAG optimization
## Textbook Original → [[§link]] → link to central text
## Concept Definition (Feynman Step 1) → one sentence
## Analogy & Intuition (Feynman Step 2) → life metaphors
## Core Formula ($$ + symbol table) → each symbol explained
## Derivation (Mermaid/PlantUML) → visual flowchart
## Common Mistakes (Feynman Step 3) → expose blind spots
## Feynman Check (Feynman Step 4) → self-test questions
## Concept Navigation → [[Wiki links]] → bidirectional links
## My Understanding → user fills in Feynman retelling
```

---

## 🧪 6 Quality Tests (T1-T6)

Agent 04 auto-executes:

| Test | Checks | Auto-fix |
|------|--------|---------|
| **T1 Links** | No dead links, no isolated nodes | ✅ Auto-replace |
| **T2 Formulas** | All in `$$...$$` | ✅ Auto-wrap |
| **T3 Diagrams** | Mermaid/PlantUML syntax | ✅ Auto-correct |
| **T4 Content** | Size, keywords, self-understanding | ✅ Auto-add |
| **T5 Coverage** | Every § has a note | ✅ Auto-create |
| **T6 Graph** | Backlinks complete | ✅ Auto-add |

---

## 📊 Example: EM Fields & Waves

`examples/电磁场与电磁波/` is a fully built example:

| Metric | Value |
|--------|-------|
| Textbook chapters | 1-8 |
| Textbook original files | **64** § files |
| Concept notes | **328** |
| RAG keywords | **166** notes with `**关键词**：` |
| Textbook bidirectional links | **262** `[[§links]]` |
| Mermaid diagrams | **112** |
| Total diagrams | **~250+** (inc. PlantUML/WaveDrom/Graphviz) |
| Min note size | 5000+ bytes |
| Git commits | 45 |
| Build iterations | 6 agent loops |

---

## 🔗 Links

- GitHub: [https://github.com/3229218431/FeynFlow](https://github.com/3229218431/FeynFlow)
- Example: `examples/电磁场与电磁波/`

---

[English](README.en.md) | [中文](README.md) | [Español](README.es.md)
