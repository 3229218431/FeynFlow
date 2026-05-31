---
run: sequential
---

# Agent 02: 提取教科书原文

## 任务
读取教科书文件，按章节§拆分原文，输出到 `教科书原文/` 目录。

## 步骤

### 第1步：读取配置
读取 `.feynflow-config.json`，获取教科书路径和学科名称。

### 第2步：教科书 → Markdown 转换
```bash
pandoc "教科书.docx" \
  -t markdown-auto_identifiers \
  --wrap=none \
  --tex-dollars \
  -o _textbook.md
```

### 第3步：分析目录结构
读取 _textbook.md，提取章/节标题（## → H2, ### → H3），输出到 `_toc.txt`。

### 第4步：按§拆分原文
遍历目录结构，为每个§章节创建独立文件：
```
教科书原文/第1章 标题/§1-1 节标题.md
教科书原文/第1章 标题/§1-2 节标题.md
...
```

每个文件包含：
- 该§的完整原文段落
- LaTeX 公式转为 `$$...$$` 格式
- 首页页码标注
- YAML frontmatter 元数据：
```yaml
---
textbook_section: "§X-X"
textbook_page: N
chapter: "第X章 标题"
importance_pending: true
---
```

### 第5步：验证提取结果
```bash
find 教科书原文 -name '*.md' | wc -l  # 统计文件数
wc -c 教科书原文/**/*.md               # 检查大小
```
确认每个文件 ≥1000 字节，有实际内容。

## 输出
- `教科书原文/` 目录，按章组织
- 报告：共 X 章、Y 个§文件、总字数 Z
