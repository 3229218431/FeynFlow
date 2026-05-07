# FeynFlow — Feynman + Workflow

> Feynman + Workflow: Claude Code → Obsidian Knowledge Base → Cherry Studio RAG → AI Feynman Tutor

## Origin Story

> I found the Feynman-method AI prompts incredibly effective: first life analogies, then questions to make you think, then diagrams to explain based on my responses. When I struggled with my electromagnetic fields course, I wondered: can AI help me learn systematically? The solution: Claude Code generates Obsidian notes from the textbook → Cherry Studio reads it as a knowledge base → local embedding models (nearly free) → AI Feynman tutor teaches interactively.

## One-Line

Turn any textbook into an AI Feynman tutor knowledge base — Claude Code processes the original text → generates Obsidian notes → Cherry Studio reads as RAG knowledge base → AI teaches with the Feynman method.

## Tool Chain

```mermaid
flowchart LR
    A[Textbook Original Text] --> B[Claude Code Agents]
    B --> C[Obsidian Feynman Notes]
    C --> D[Cherry Studio RAG Knowledge Base]
    D --> E[Local Embedding Model<br>Qwen3-Embedding-8B]
    E --> F[AI Feynman Tutor<br>Interactive Teaching]
    
    F -->|"Concept → Analogy → Blind Spot Check"| G[User Understanding]
    G -->|"Still stuck?"| H[Backtrack to Prerequisites<br>via Concept Navigation]
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

## Package Contents

| Component | Purpose |
|-----------|---------|
| `agents/01-setup.agent.md` | Environment setup + web search for supporting materials |
| `agents/02-extract.agent.md` | Extract textbook → split into §-level original text files |
| `agents/03-build.agent.md` | Build skeleton + write Feynman concept notes + add diagrams |
| `agents/04-verify.agent.md` | Quality check + fix issues + generate report |
| `templates/` | 7 Obsidian note templates (concept/MOC/exercise/journal/MATLAB/AI) |
| `hooks/` | Claude Code lifecycle hooks |
| `examples/电磁场与电磁波/` | **Full working example** (45 commits, 398 notes, 64 textbook files, 250+ diagrams) |

## Quick Start

### Prerequisites

**Pandoc is required** (converts textbooks from DOCX/PDF to Markdown):

| OS | Command |
|----|---------|
| Windows | `winget install pandoc` or download from [pandoc.org](https://pandoc.org/installing.html) |
| macOS | `brew install pandoc` |
| Linux | `sudo apt install pandoc` (Ubuntu) / `sudo dnf install pandoc` (Fedora) |

Verify: `pandoc --version`

### Install
```bash
git clone https://github.com/[your-username]/FeynFlow.git
cd FeynFlow
cp -r skeleton/* ../my-new-subject/
cd ../my-new-subject
```

### Run Agents
```bash
claude agents/01-setup.agent.md
claude agents/02-extract.agent.md
claude agents/03-build.agent.md
claude agents/04-verify.agent.md
```

### Cherry Studio Setup
1. Create knowledge base → Select `Qwen3-Embedding-8B`
2. Add folder → Select your knowledge base directory
3. System prompt → Paste `templates/AI导师系统指令.md` content
