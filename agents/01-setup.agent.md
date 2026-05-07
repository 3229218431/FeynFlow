# Agent 01: 环境准备 + 搜索辅助材料

## 目的
为新学科项目准备环境、搜索费曼学习法资料、确定笔记标准。

## 输入
- 教科书路径（用户提供）
- 学科名称（用户提供）

## 输出
- .claude/settings.json
- Templates/ 复制到项目
- 辅助材料摘要

## 前提条件（必须）

### Pandoc 安装
FeynFlow 依赖 Pandoc 将教科书（DOCX/PDF等）转换为 Markdown 格式。

**Windows：**
```bash
winget install pandoc
# 或从 https://pandoc.org/installing.html 下载安装包
```

**macOS：**
```bash
brew install pandoc
```

**Linux：**
```bash
sudo apt install pandoc  # Ubuntu/Debian
sudo dnf install pandoc  # Fedora
```

安装后验证：`pandoc --version`

### 其他依赖
- Claude Code CLI
- Node.js（可选，用于公式校验）

## 步骤
1. 检查 Pandoc 是否已安装 → 未安装则提示用户安装
2. 创建项目目录结构（参考 skeleton/）
3. 复制 templates/ 到项目
4. 搜索费曼学习法要点（4步法、认知科学原理）
5. 搜索该学科的学习指南/策略（如有）
6. 搜索绘图工具对比（Mermaid/PlantUML/WaveDrom/Graphviz/Vega-Lite）
7. 询问用户：
   - 教科书文件路径（DOCX/PDF/TXT/MD）
   - 笔记字数偏好（★基础级 / ★★进阶级 / ★★★精通级）
   - 考试范围（选填）
   - 学习周期（选填）

## 输出示例
```
项目初始化完成：
- 学科：[学科名称]
- 教科书：[路径]
- 笔记级别：★★（进阶级，6000-10000字节）
- 考试范围：第1章~第X章
- 辅助材料：已搜索并纳入配置
```
