---
tags: [电磁场, 恒定电流场, 电流密度]
chapter: "第4章"
textbook_section: "§4-1"
textbook_page: "108"
type: core-concept
importance: 🔴
exam_frequency: ★★★
exam_type: 计
difficulty: basic
level: ★
created: 2026-04-28
---
# 电流密度J的定义
**关键词**：电流密度, J=σE, 欧姆定律, 恒定电流场

📌 **一句话本质**：电流密度J描述单位面积流过的电流——矢量，方向就是正电荷运动方向

🏷️ **重要度**：🔴 | 考试：★★★ | 题型：计

## 教科书原文

> 📖 参见：[[§4-1 电流与电流密度]]

## 可视化图表

```vega-lite
{
  "$schema": "https://vega.github.io/schema/vega-lite/v5.json",
  "description": "圆柱导体径向电流密度分布 J=σE 均匀导体vs趋肤效应",
  "width": 400,
  "height": 300,
  "mark": "line",
  "encoding": {
    "x": {"field": "radius", "type": "quantitative", "title": "导体径向位置 r/a"},
    "y": {"field": "J_norm", "type": "quantitative", "title": "J/J₀ 归一化电流密度"},
    "color": {"field": "condition", "type": "nominal", "scale": {
      "domain": ["直流/低频 均匀", "交流 趋肤效应(d=δ)", "交流 强趋肤(d=δ/2)"],
      "range": ["#2ecc71", "#e67e22", "#e74c3c"]
    }, "title": "条件"}
  },
  "data": {
    "values": [
      {"radius": 0.0, "J_norm": 1.0, "condition": "直流/低频 均匀"},
      {"radius": 0.2, "J_norm": 1.0, "condition": "直流/低频 均匀"},
      {"radius": 0.4, "J_norm": 1.0, "condition": "直流/低频 均匀"},
      {"radius": 0.6, "J_norm": 1.0, "condition": "直流/低频 均匀"},
      {"radius": 0.8, "J_norm": 1.0, "condition": "直流/低频 均匀"},
      {"radius": 1.0, "J_norm": 1.0, "condition": "直流/低频 均匀"},
      {"radius": 0.0, "J_norm": 0.37, "condition": "交流 趋肤效应(d=δ)"},
      {"radius": 0.2, "J_norm": 0.41, "condition": "交流 趋肤效应(d=δ)"},
      {"radius": 0.4, "J_norm": 0.55, "condition": "交流 趋肤效应(d=δ)"},
      {"radius": 0.6, "J_norm": 0.72, "condition": "交流 趋肤效应(d=δ)"},
      {"radius": 0.8, "J_norm": 0.90, "condition": "交流 趋肤效应(d=δ)"},
      {"radius": 1.0, "J_norm": 1.0, "condition": "交流 趋肤效应(d=δ)"},
      {"radius": 0.0, "J_norm": 0.05, "condition": "交流 强趋肤(d=δ/2)"},
      {"radius": 0.2, "J_norm": 0.07, "condition": "交流 强趋肤(d=δ/2)"},
      {"radius": 0.4, "J_norm": 0.13, "condition": "交流 强趋肤(d=δ/2)"},
      {"radius": 0.6, "J_norm": 0.27, "condition": "交流 强趋肤(d=δ/2)"},
      {"radius": 0.8, "J_norm": 0.55, "condition": "交流 强趋肤(d=δ/2)"},
      {"radius": 1.0, "J_norm": 1.0, "condition": "交流 强趋肤(d=δ/2)"}
    ]
  },
  "title": "电流密度径向分布: 均匀 vs 趋肤效应 §4-3"
}

```

## 🔧 工程场景

PCB走线载流量计算——铜箔截面35μm×1mm，J_max通常取35A/mm²。若设计电流密度超出此值（例如紧凑布局中走线宽度减半），铜箔温升超40°C，FR-4基板玻璃化转变温度被超越，层间分层失效。

## 🧠 类比与直觉

**类比：高速公路的车流密度**。J的模就像高速公路上每车道每小时通过的车辆数——截面积是车道数，I是总车流量，J=I/S就是单车道密度。"车流密度"超过一定值就堵车（导体发热）。J的方向就是车流方向——正电荷运动的方向。

**口诀**：J=I/S方向随正电荷，电流密度每平米安培数

## ✂️ 可跳过

> 本节是电流密度J的定义入门，若已掌握J=I/S、J=nqv和J矢量方向为正电荷运动方向的三种表述，可直接跳至下一个概念。
