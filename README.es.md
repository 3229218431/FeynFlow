[English](README.en.md) | [中文](README.md) | [Español](README.es.md)

---

# FeynFlow — Feynman + Workflow

> Feynman + Workflow: Claude Code genera base de conocimiento Obsidian → Cherry Studio RAG → Tutor AI Feynman

## Origen

> Descubrí que los prompts de IA con el método Feynman son muy efectivos: primero analogías cotidianas, luego preguntas para hacerte pensar, luego diagramas según mis respuestas. Cuando tuve dificultades con mi curso de campos electromagnéticos, pensé: ¿puede la IA ayudarme a aprender sistemáticamente? La solución: Claude Code genera notas Obsidian desde el libro de texto → Cherry Studio las lee como base de conocimiento → modelos de embedding locales (casi gratis) → tutor IA Feynman enseña interactivamente.

## Flujo de Trabajo

```mermaid
flowchart LR
    A[Texto Original] --> B[Claude Code Agents]
    B --> C[Notas Obsidian Feynman]
    C --> D[Cherry Studio RAG]
    D --> E[Embedding Local<br>Qwen3-Embedding-8B]
    E --> F[Tutor IA Feynman<br>Enseñanza Interactiva]
    
    F -->|"Concepto → Analogía → Prueba"| G[Comprensión]
    G -->|"¿Aún atascado?"| H[Volver a Prerrequisitos]
    H --> B
```

## En Una Línea

Convierte cualquier libro de texto en una base de conocimiento para un tutor IA Feynman.

## Contenido

| Componente | Propósito |
|-----------|-----------|
| `agents/` | 4 agentes: setup, extraer, construir, verificar |
| `templates/` | 7 plantillas para notas Obsidian |
| `hooks/` | Hooks para Claude Code |
| `examples/` | Proyecto ejemplo completo (campos electromagnéticos) |

## Requisitos

**Pandoc es necesario** (convierte libros de texto a Markdown):

| SO | Comando |
|----|---------|
| Windows | `winget install pandoc` o descargar de [pandoc.org](https://pandoc.org/installing.html) |
| macOS | `brew install pandoc` |
| Linux | `sudo apt install pandoc` (Ubuntu) / `sudo dnf install pandoc` (Fedora) |

Verificar: `pandoc --version`

## Uso Rápido

```bash
git clone https://github.com/[tu-usuario]/FeynFlow.git
cd FeynFlow
# Copiar a nuevo proyecto
cp -r skeleton/* ../mi-nuevo-tema/
cd ../mi-nuevo-tema
# Ejecutar agentes
claude agents/01-setup.agent.md
claude agents/02-extract.agent.md
claude agents/03-build.agent.md
claude agents/04-verify.agent.md
```
