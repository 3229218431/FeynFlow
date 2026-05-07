---
run: sequential
---

# Agent 04: 测试验证

## 任务
运行全部6项质量测试(T1-T6)，修复未达标项，输出报告。循环直至全部通过。

## 步骤

### 第1步：T1 链接完整性测试
```bash
# 检查无链接的孤立笔记
for f in $(find . -name '*.md' ! -path './.git/*' ! -path '*/Templates/*'); do
  grep -q '\[\[' "$f" || echo "孤立: $f"
done

# 检查死链（[[链接]]指向的文件不存在）
for f in $(find . -name '*.md'); do
  for link in $(grep -oP '\[\[\K[^\]]+' "$f" 2>/dev/null); do
    target=$(find . -name "${link}.md" 2>/dev/null)
    [ -z "$target" ] && echo "死链: $f → [[$link]]"
  done
done
```
修复：孤立→添加概念导航，死链→修正或重定向。

### 第2步：T2 公式渲染测试
```bash
# 检查数学符号是否在 $$ 中（排除 Mermaid 代码块）
grep -rn '\\nabla\|\\alpha\|\\mu\|\\sigma' --include='*.md' . | grep -v '教科书原文' | grep -v '```'
```
修复：sed 包裹 `$$...$$`。

### 第3步：T3 图表语法测试
- Mermaid：检查 `flowchart TD` / `sequenceDiagram` 等关键字
- PlantUML：检查 `@startuml`/`@enduml`
- WaveDrom：检查 JSON 格式完整性

### 第4步：T4 内容完整性
```bash
# 检查每篇笔记的必要板块
for f in $(find . -name '*.md'); do
  grep -q '**关键词**' "$f" || echo "缺关键词: $f"
  grep -q '## 自己理解' "$f" || echo "缺自己理解: $f"
  grep -q '## 费曼检验' "$f" || echo "缺费曼检验: $f"
done
```
修复：从模板补充缺失板块。

### 第5步：T5 教科书覆盖率
对照 `教科书原文/` 的 §文件列表与笔记文件夹，确认每节都有对应概念笔记。

### 第6步：T6 知识图谱连通性
确认每个笔记被至少1篇其他笔记引用，总览文件引用所有 MOC。

### 第7步：生成报告
输出最终质量报告：
```
FeynFlow 质量报告
=================
总笔记: N
≥5000B: N  ✅/❌
无孤立: N  ✅/❌
公式OK: N  ✅/❌
覆盖率: N  ✅/❌
```

## 循环
若有测试项未通过 → 自动修复 → 返回第1步重新测试。全部通过后停止。
