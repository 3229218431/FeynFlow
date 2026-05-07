---
tags: [MOC, 电磁场, 矢量分析, 点积, 叉积]
chapter: "第1章"
textbook_section: "§1-3"
textbook_page: "3"
type: moc
difficulty: basic
created: 2026-04-27
---

# 矢量的标积和矢积 MOC

## 教科书原文

> 📖 参见：[[§1-3 矢量的标积和矢积]]

## 费曼深度讲解

标量积（点积）和矢量积（叉积）是向量代数的两条腿——没有其中任何一条，电磁场理论都无法站立。点积$A\cdot B = |A||B|\cos\theta$衡量两个向量"在同方向上的一致性"——当两向量平行时最大（功$W=F\cdot d$最大），垂直时为零（洛伦兹力不做功$F_{mag}\cdot v = 0$，因为磁场力总是垂直于速度）。叉积$A\times B = |A||B|\sin\theta \mathbf{n}$衡量两个向量"张成的平行四边形面积和定向"——当两向量垂直时最大，平行时为零。

为什么在电磁场中功的计算用点积而磁场力用叉积？这源自物理本质：电场力沿电场方向做功（$W=qE\cdot d$），是点积计算——因为能量是标量。磁场力始终垂直于运动方向（$F=qv\times B$），不做功——是叉积的自然结果，因为洛伦兹力的方向和运动方向垂直，功$F\cdot v = (qv\times B)\cdot v = 0$。大自然用点积描述能量（标量），用叉积描述方向性力（矢量），这是极其优雅的分工。

三阶行列式与叉积的关系：$A\times B = \begin{vmatrix} \mathbf{e}_x & \mathbf{e}_y & \mathbf{e}_z \ A_x & A_y & A_z \ B_x & B_y & B_z \end{vmatrix}$。按第一行展开：$A\times B = \mathbf{e}_x(A_y B_z - A_z B_y) - \mathbf{e}_y(A_x B_z - A_z B_x) + \mathbf{e}_z(A_x B_y - A_y B_x)$。这个行列式表达不仅方便记忆，还揭示了叉积的本质——它是三个面积（在yz面、xz面、xy面上的投影面积）组合成的向量。

## 跨章关联

点积在电磁场中用于计算功（$W=qE\cdot d$）、电通量（$\Phi_E = \int E\cdot dS$）、功耗（$P=J\cdot E$）。叉积用于洛伦兹力（$F=qv\times B$）、坡印亭矢量（$S=E\times H$）、比奥-萨伐尔定律（$dB=\frac{\mu_0}{4\pi}\frac{Idl\times e_R}{R^2}$）。可以说，点积贯穿能量的计算，叉积贯穿力的计算——这是电磁场理论两条最基本的应用线。

## 更多费曼检验

1. 点积和叉积的交换性有何不同？$A\cdot B = B\cdot A$（交换律成立），$A\times B = -B\times A$（反交换律）。能否各举一个电磁场例子说明？

2. 为什么坡印亭矢量用叉积$S=E\times H$而不是点积？如果$E\parallel H$（平行传播），坡印亭矢量的大小和方向如何？

