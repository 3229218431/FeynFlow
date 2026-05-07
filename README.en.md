[English](README.en.md) | [中文](README.md) | [Español](README.es.md)

---

# FeynFlow — Feynman + Workflow

> **Feynman + Workflow**: Claude Code generates Obsidian notes → Cherry Studio RAG → AI Feynman Tutor interactive teaching.
>
> Turn any textbook into an AI Feynman tutor knowledge base. Full toolchain out of the box.

---

## 🧠 What is FeynFlow

FeynFlow is an **automated textbook-to-AI-knowledge-graph toolchain**. It transforms linear textbook content into an interactive knowledge network that AI can search and teach from.

| Traditional Learning | FeynFlow Way |
|--------------------|-------------|
| Read, highlight, take notes yourself | AI auto-generates Feynman notes, you just learn |
| Check answers or ask teachers | AI tutor guides you with Feynman method |
| Knowledge is isolated | Every concept has `[[bidirectional links]]` forming a knowledge graph |
| Review the whole book | AI precisely retrieves knowledge via RAG |
| Notes are for yourself only | Notes are also teaching material for AI |

### Comparison

| Method | Requires | Effect | Cost |
|--------|----------|--------|------|
| Manual Obsidian notes | Time + discipline | Depends on person | $0 |
| Raw ChatGPT | No knowledge base | May hallucinate | $20/mo |
| RAG + textbook PDF | Vector DB | Imprecise retrieval | Varies |
| **FeynFlow** ✅ | **Textbook only** | **Feynman+Graph+AI** | **Nearly free** |

---

## 📖 Origin Story

> I found the Feynman-method AI prompts incredibly effective: first life analogies, then questions to make you think, then diagrams based on my responses. When I struggled with my electromagnetic fields course, I thought: can AI help me learn systematically? So Claude Code generates Obsidian notes from the textbook → Cherry Studio reads it as a knowledge base → local embedding models (nearly free) → AI Feynman tutor teaches interactively.

**Core idea**: You're not just building a note library — you're building an **interactive knowledge graph** that an AI tutor can search and teach from.

### Development Timeline

```mermaid
%%{init: {'theme':'base','themeVariables': {'primaryColor': '#3B82F6','primaryTextColor': '#fff','secondaryColor': '#10B981'}}}%%
timeline
    title FeynFlow Development
    04-27 : Project skeleton : 10 H2 + 100 dirs + 289 files
    04-28 : Feynman notes filled : 46 core + 4 MATLAB
    04-28 : 6 agent rounds : All 301 notes >= 5000B
    04-29 : 7 diagram types : PlantUML/WaveDrom/Graphviz
    04-29 : Textbook centralized : 64 sections + 249 links
    04-30 : RAG + Cherry Studio : 164 keywords + AI prompt
    05-07 : FeynFlow plugin : 4 agents + 7 templates
```

---

## 🔧 Toolchain

```mermaid
%%{init: {'theme':'base','themeVariables': {'background': '#1a1b26','primaryColor': '#3B82F6','primaryTextColor': '#fff','primaryBorderColor': '#2563EB','lineColor': '#6B7280','secondaryColor': '#10B981','tertiaryColor': '#F59E0B','noteTextColor': '#d1d5db','noteBkgColor': '#1f2937'}}}%%
graph LR
    A(Textbook):::input --> B{Claude Code}:::process
    B --> C[Obsidian Notes]:::output
    B --> D[Textbook Files]:::output
    C --> E[Cherry Studio KB]:::ai
    D --> E
    E --> F[Qwen3 Embedding]:::ai
    F --> G[AI Feynman Tutor]:::learn
    G --> H[User Mastery]:::learn
    H -.->|blind spot| C
    
    classDef input fill:#3B82F6,stroke:#2563EB,color:#fff
    classDef process fill:#8B5CF6,stroke:#7C3AED,color:#fff
    classDef output fill:#10B981,stroke:#059669,color:#fff
    classDef ai fill:#F59E0B,stroke:#D97706,color:#fff
    classDef learn fill:#EC4899,stroke:#DB2777,color:#fff
```

### Agent Sequence

```mermaid
%%{init: {'theme':'base','themeVariables': {'actorBkg': '#3B82F6','actorTextColor': '#fff','actorLineColor': '#2563EB','signalColor': '#6B7280','signalTextColor': '#fff','labelBoxBkgColor': '#1f2937','labelBoxBorderColor': '#374151','loopTextColor': '#d1d5db'}}}%%
sequenceDiagram
    participant U as User
    participant A1 as Agent 01 Setup
    participant A2 as Agent 02 Extract
    participant A3 as Agent 03 Build
    participant A4 as Agent 04 Verify
    
    U->>A1: Provide textbook path
    A1->>A1: Check Pandoc + skeleton
    A1->>A2: Ready to extract
    A2->>A2: Convert to Markdown
    A2->>A2: Split into sections
    A2->>A3: Section files ready
    A3->>A3: Create folder structure
    A3->>A3: Write Feynman notes
    A3->>A3: Add diagrams + links
    A3->>A4: Knowledge base built
    loop Until all T1-T6 pass
        A4->>A4: Run quality tests
        A4->>A3: Fix and retry
    end
    A4->>U: Quality report
    U->>CS: Import to Cherry Studio
    CS->>Tutor: AI Feynman tutor begins
```

### Pipeline Breakdown

| Stage | Tool | Output | Description |
|-------|------|--------|-------------|
| 1. Setup | `01-setup` + Pandoc | Project skeleton | Check deps, search materials |
| 2. Extract | `02-extract` | `Textbook Originals/` | Split into section files |
| 3. Build | `03-build` | Notes + diagrams + MOC | Feynman fill + 7 diagram types |
| 4. Verify | `04-verify` | Quality report | 6 tests T1-T6, auto-fix |
| 5. Teach | Cherry Studio + AI | Interactive learning | Local embedding + AI tutor |

### Build Timeline

```mermaid
gantt
    title Knowledge Base Build Timeline
    dateFormat  YYYY-MM-DD
    axisFormat  %m-%d
    section Setup
    Install dependencies       :a1, 2026-05-01, 1d
    Copy templates             :a2, 2026-05-02, 1d
    section Extract
    Convert to MD              :b1, 2026-05-03, 1d
    Split sections             :b2, 2026-05-04, 2d
    section Build
    Create structure           :c1, 2026-05-06, 1d
    Write Feynman notes        :c2, 2026-05-07, 5d
    Add diagrams + links       :c3, 2026-05-12, 3d
    section Verify
    Run T1-T6 tests            :crit, d1, 2026-05-15, 1d
    Fix issues                 :d2, 2026-05-16, 1d
```

---

## 📦 Package Contents

```
FeynFlow/
├── README.md / .en.md / .es.md   # Multi-language docs
├── plugin.json                    # Plugin metadata
├── agents/
│   ├── 01-setup.agent.md          # Environment setup
│   ├── 02-extract.agent.md        # Extract textbook
│   ├── 03-build.agent.md          # Build notes + diagrams
│   └── 04-verify.agent.md         # 6 tests T1-T6 + auto-fix
├── templates/                     # 7 Obsidian templates
├── hooks/
└── examples/
    └── 电磁场与电磁波/              # Full example (511 files)
```

---

## 🚀 Quick Start

### Prerequisites

| Software | Purpose | Install |
|----------|---------|---------|
| **Pandoc** ⚠️ Required | Textbook → Markdown | `winget install pandoc`(Win) / `brew install pandoc`(Mac) |
| **Claude Code** | Run agents | `npm install -g @anthropic-ai/claude-code` |

```bash
git clone https://github.com/3229218431/FeynFlow.git
cd FeynFlow
cp -r skeleton/* ../my-subject/
cd ../my-subject
claude ../FeynFlow/agents/01-setup.agent.md
claude ../FeynFlow/agents/02-extract.agent.md
claude ../FeynFlow/agents/03-build.agent.md
claude ../FeynFlow/agents/04-verify.agent.md
```

---

## 🧠 Note Quality Standards

| Level | Size | Cognitive | Feynman Step | Usage |
|-------|------|-----------|-------------|-------|
| ★ Basic | 3000-6000 B | Remember+Understand | 1-2 | Advanced topics |
| ★★ Applied | 6000-10000 B | Understand+Apply | 1-3 | Core concepts |
| ★★★ Master | 10000-15000 B | Analyze+Synthesize | 1-4 | Hub chapters |

Every note structure:
```
**Keywords**: tags → RAG optimization
## Textbook Original → [[§link]]
## Concept Definition (Feynman Step 1) → one sentence
## Analogy (Feynman Step 2) → life metaphor
## Core Formula ($$ + symbol table)
## Derivation (Mermaid/PlantUML)
## Common Mistakes (Feynman Step 3)
## Feynman Check (Feynman Step 4) → self-test
## Concept Navigation → [[wiki links]]
## My Understanding → user fills in
```

---

## 🧪 6 Quality Tests (T1-T6)

```mermaid
%%{init: {'theme':'base','themeVariables': {'primaryColor': '#EF4444','primaryTextColor':'#fff','secondaryColor': '#F59E0B','noteBkgColor': '#1f2937','noteTextColor': '#d1d5db'}}}%%
stateDiagram-v2
    [*] --> T1_LinkCheck
    T1_LinkCheck --> T2_FormulaCheck: pass
    T1_LinkCheck --> T1_LinkCheck: fix
    T2_FormulaCheck --> T3_DiagramCheck: pass
    T2_FormulaCheck --> T2_FormulaCheck: fix
    T3_DiagramCheck --> T4_ContentCheck: pass
    T3_DiagramCheck --> T3_DiagramCheck: fix
    T4_ContentCheck --> T5_CoverageCheck: pass
    T4_ContentCheck --> T4_ContentCheck: fix
    T5_CoverageCheck --> T6_GraphCheck: pass
    T5_CoverageCheck --> T5_CoverageCheck: fix
    T6_GraphCheck --> [*]: All Passed
    T6_GraphCheck --> T6_GraphCheck: fix
```

---

## 📊 Example: EM Fields & Waves

`examples/电磁场与电磁波/` is a complete working example:

| Metric | Value |
|--------|-------|
| Textbook chapters | 1-8 |
| Textbook original files | **64** § files |
| Concept notes | **328** |
| RAG keywords | **166** |
| Bidirectional links | **262** |
| Mermaid diagrams | **112** |
| PlantUML diagrams | **30** |
| Total diagrams | **~250** |
| Min note size | 5000+ bytes |
| Git commits | 45 |
| Build iterations | 6 agent loops |

---

## 🎯 Why Feynman + Obsidian + RAG Works

```mermaid
%%{init: {'theme':'base','themeVariables': {'primaryColor': '#10B981','primaryBorderColor':'#059669','lineColor':'#6B7280','secondaryColor': '#3B82F6','tertiaryColor': '#F59E0B','primaryTextColor':'#fff'}}}%%
flowchart TD
    subgraph Feynman[Feynman Method]
        A1[Define Concept]:::feyn --> A2[Plain Language]:::feyn
        A2 --> A3[Check Blind Spots]:::feyn
        A3 --> A4[Simplify]:::feyn
    end
    subgraph Obsidian[Obsidian Links]
        B1[Atomic Notes]:::obs --> B2[Wiki Links]:::obs
        B2 --> B3[Knowledge Graph]:::obs
        B3 --> B4[Discover Connections]:::obs
    end
    subgraph RAG[RAG AI]
        C1[Vector Embedding]:::rag --> C2[Semantic Search]:::rag
        C2 --> C3[AI + Context]:::rag
        C3 --> C4[Accurate Answers]:::rag
    end
    A4 -.-> C1
    B4 -.-> A3
    C4 -.-> A2
    
    classDef feyn fill:#10B981,stroke:#059669,color:#fff
    classDef obs fill:#3B82F6,stroke:#2563EB,color:#fff
    classDef rag fill:#F59E0B,stroke:#D97706,color:#fff
```

---

## 📐 Quality Dimensions

| Dimension | Requirement | Enforcement |
|-----------|-------------|-------------|
| Completeness | Every § has a note | Agent 02 + T5 |
| Accuracy | Based on textbook original | `## Textbook → [[§link]]` |
| Connectivity | ≥3 `[[links]]` per note | Agent 03 + T1 |
| Searchability | `**Keywords**` in every note | Agent 03 |
| Visualization | ≥1 diagram per note | Agent 03 |
| Testability | Feynman self-test questions | Template enforced |

---

## 🔗 Links

- GitHub: [https://github.com/3229218431/FeynFlow](https://github.com/3229218431/FeynFlow)
- Example: `examples/电磁场与电磁波/`

---

[English](README.en.md) | [中文](README.md) | [Español](README.es.md)
