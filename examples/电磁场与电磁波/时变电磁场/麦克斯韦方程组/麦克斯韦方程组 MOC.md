---
tags: [MOC, 电磁场, 时变电磁场, 麦克斯韦方程组, ★★★核心]
chapter: "第7章"
textbook_section: "§7-2"
textbook_page: "174-176"
type: moc
difficulty: advanced
created: 2026-04-27
updated: 2026-04-28
---

# 麦克斯韦方程组 MOC

## 教科书原文

> 📖 参见：[[§7-2 麦克斯韦方程]]

## 概念定义

麦克斯韦方程组就像一套四个"规则卡片"，完整地规定了电磁场如何随时间和空间变化。想象你在玩一个沙盒游戏，里面有"电荷""电流""电场""磁场"四种东西。麦克斯韦方程组告诉你：规则1——电流和变化的电场能产生漩涡状的磁场；规则2——变化的磁场能产生漩涡状的电场；规则3——磁场永远是闭合的，没有起点也没有终点（没有磁单极子）；规则4——电场从正电荷出发，终止于负电荷。就这么四条规则，加上介质特性（$$D=\varepsilon E, B=\mu H, J=\sigma E$$），就能描述从静电复印到手机信号到太阳光的一切电磁现象。

## 类比与直觉

1. **交响乐团的四个声部**：麦克斯韦方程组就像一个交响乐谱的四个声部——每个方程是一个声部，分别规定了电场的旋度来源（全电流）、磁场的旋度来源（变化电场负号）、磁场的散度（永远为零）、电场的散度（来自电荷）。单独一个声部听不出旋律，四个声部一起演奏，就是完整的电磁交响曲——从静电场到光波，无所不包。

2. **四条交通规则**：想象一个城市只有四条交通规则就能管理所有车辆。规则1：车辆（磁场漩涡）由车流密度（电流）和变化中的拥堵（位移电流）产生。规则2：变化中的车辆密度产生新的交通波。规则3：任何路口车辆总数守恒（没有车辆凭空消失）。规则4：所有车辆从停车场（正电荷）出发，必须到达目的地（负电荷）。四条规则，管理一切交通——这就是麦克斯韦方程组的优雅。

## 核心公式详释

**微分形式（完整版）**：
$$\nabla \times \mathbf{H} = \mathbf{J} + \frac{\partial \mathbf{D}}{\partial t} \quad \text{全电流定律}$$
$$\nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t} \quad \text{法拉第电磁感应定律}$$
$$\nabla \cdot \mathbf{B} = 0 \quad \text{磁通连续性原理}$$
$$\nabla \cdot \mathbf{D} = \rho \quad \text{高斯定律}$$

**本构关系（介质特性方程）**：
$$\mathbf{D} = \varepsilon \mathbf{E}, \quad \mathbf{B} = \mu \mathbf{H}, \quad \mathbf{J} = \sigma \mathbf{E} + \mathbf{J}'$$

| 符号 | 含义 | 单位 | 类型 |
|------|------|------|------|
| $\mathbf{E}$ | 电场强度 | V/m | 场量 |
| $\mathbf{D}$ | 电通密度 | C/m² | 场量 |
| $\mathbf{H}$ | 磁场强度 | A/m | 场量 |
| $\mathbf{B}$ | 磁通密度 | T (Wb/m²) | 场量 |
| $\mathbf{J}$ | 电流密度 | A/m² | 源量 |
| $\rho$ | 电荷密度 | C/m³ | 源量 |
| $\varepsilon$ | 介电常数 | F/m | 介质参数 |
| $\mu$ | 磁导率 | H/m | 介质参数 |
| $\sigma$ | 电导率 | S/m | 介质参数 |

**方程独立性与自洽性**：
- 由 $$\nabla \cdot (\nabla \times \mathbf{H}) = 0$$ 和电荷守恒可导出 $$\nabla \cdot \mathbf{D} = \rho$$
- 由 $$\nabla \cdot (\nabla \times \mathbf{E}) = 0$$ 可导出 $$\nabla \cdot \mathbf{B} = 0$$
- 四个方程中只有两个旋度方程是独立的！两个散度方程可作为初始条件

## 推导脉络

```mermaid
flowchart TD
    subgraph 四大实验基础
        E1["库仑定律\n1785"] --> G["高斯定律\n∇·D = ρ"]
        E2["安培定律\n1820"] --> A["安培环路\n∇×H = J"]
        E3["法拉第实验\n1831"] --> F["电磁感应\n∇×E = -∂B/∂t"]
        E4["无磁单极子"] --> M["磁通连续\n∇·B = 0"]
    end
    
    subgraph 麦克斯韦修正1864
        A --> DILEMMA["电容器充电悖论\n安培定律不自洽"]
        DILEMMA --> DISP["位移电流\nJd = ∂D/∂t\n天才创造！"]
        DISP --> FULL["全电流定律\n∇×H = J + ∂D/∂t"]
    end
    
    subgraph 完整麦克斯韦方程组
        FULL --> MAX1["方程1: ∇×H = J + ∂D/∂t"]
        F --> MAX2["方程2: ∇×E = -∂B/∂t"]
        M --> MAX3["方程3: ∇·B = 0"]
        G --> MAX4["方程4: ∇·D = ρ"]
    end
    
    subgraph 伟大推论
        MAX1 --> WAVE["波动方程\n∇²E - με∂²E/∂t² = 0"]
        MAX2 --> WAVE
        WAVE --> SPEED["v = 1/√(με) ≈ c!\n光就是电磁波！"]
        WAVE --> PREDICT["预言电磁波的存在\n1888赫兹实验验证"]
        WAVE --> RADIO["无线电、雷达、微波..."]
    end
```

## 常见误区

1. **四个方程完全独立**：错误。只有两个旋度方程是真正独立的。对全电流定律取散度，结合电荷守恒定律，可以直接导出高斯定律。对法拉第定律取散度可以直接导出磁通连续性原理。四个方程是冗余的——这种冗余恰恰保证了方程组的自洽性。

2. **麦克斯韦方程组只在真空中成立**：错误。加上本构关系（$$D=\varepsilon E, B=\mu H, J=\sigma E$$）后，适用于任何线性、各向同性介质。对非线性介质（如铁磁体）需要更复杂的本构关系。

3. **静态场是麦克斯韦方程组的特例**：这句话本身正确，但需要注意的是——静态场中 $$\partial/\partial t = 0$$，此时电场和磁场完全解耦，成为两个独立的问题。麦克斯韦的核心贡献恰恰是发现了它们在时变情况下的耦合关系。

4. **麦克斯韦只是"归纳"了前人的方程**：严重低估。麦克斯韦做的关键一步是加入位移电流项 $$\partial D/\partial t$$——这不只是归纳，而是创造性的大胆假设。没有这一项，方程组数学上不自洽，物理上无法预言电磁波。

## 费曼检验

1. 写出麦克斯韦四个方程的微分形式。如果 $$\partial/\partial t = 0$$（静态场），这些方程如何退化？电场和磁场是否还存在耦合？
2. 证明从全电流定律和电荷守恒定律可以导出高斯定律。这个推导说明了什么关于方程组独立性的问题？
3. 如果一个区域中 $$\mathbf{J} = 0, \rho = 0$$（无源区），且 $$\frac{\partial}{\partial t} = 0$$（静态），那么该区域中的电磁场是什么样的？
4. 为什么说 $$\nabla \cdot \mathbf{B} = 0$$ 等价于"不存在磁单极子"？如果存在磁单极子，这个方程应该如何修改？

## 概念导航

- **前置概念**：[[位移电流 MOC]]、[[法拉第电磁感应定律]]、[[高斯定律]]、[[安培环路定律]]
- **后续概念**：[[时谐电磁场 MOC]]、[[波动方程与平面波解 MOC]]、[[时变电磁场的边界条件 MOC]]
- **关联概念**：[[电磁波]]、[[对偶性原理]]、[[本构关系]]、[[标量位与矢量位 MOC]]
- **历史脉络**：[[从四大实验到四大方程的故事线]]

## 自己理解

麦克斯韦方程组之美在于它的"少即是多"——四条方程（实际上两条独立旋度方程加初始条件），配合三个本构关系，就能描述宇宙中一切经典电磁现象。从静电复印机到太阳发出的光，从手机信号到银河系的磁场，全部包含在这几条线里面。更令人惊叹的是，方程组中隐含的对称性——电场和磁场在方程中几乎是对称的（只是差了符号和磁单极子的缺失），这种对称性启发了爱因斯坦去思考相对论。麦克斯韦在1864年写下这些方程时，他不可能预见到GPS、WiFi或微波炉——但所有这些技术都只是这些方程的不同解而已。这就像发现了一个宇宙的源代码。

> 📖 参见：[[§7-2 麦克斯韦方程]]

## 可视化图表

```dot
digraph Ch7_FormulaDependency {
    rankdir=TB;
    bgcolor="#FEFEFE";
    fontname="Arial";
    node [fontname="Arial", shape=box, style=filled];
    
    // 源方程
    charge [label="电荷守恒\n∇·J = -∂ρ/∂t", fillcolor=lightyellow];
    gauss [label="高斯定律\n∇·D = ρ", fillcolor=lightyellow];
    faraday [label="法拉第定律\n∇×E = -∂B/∂t", fillcolor=lightyellow];
    ampere_static [label="安培环路(静态)\n∇×H = J", fillcolor=lightyellow];
    
    // 核心概念
    disp_curr [label="位移电流密度\nJd = ∂D/∂t\n§7-1", fillcolor=lightblue];
    full_current [label="全电流定律\n∇×H = J + ∂D/∂t\n§7-1", fillcolor=lightblue];
    maxwell [label="麦克斯韦方程组\n4个方程\n§7-2", fillcolor=lightgreen];
    boundary [label="边界条件\n6条\n§7-3", fillcolor=lightgreen];
    
    // 位函数
    potentials [label="标量位φ+矢量位A\nB=∇×A\n§7-4", fillcolor=lightsalmon];
    lorenz [label="洛伦兹条件\n∇·A=-με∂φ/∂t\n§7-4", fillcolor=lightsalmon];
    wave_eq [label="波动方程\n∇²A-με∂²A/∂t²=-μJ\n§7-4", fillcolor=lightsalmon];
    retarded [label="推迟位(滞后位)\nφ(r,t)=∫ρ(t-R/v)/4πεR dV\n§7-5", fillcolor=lightsalmon];
    
    // 能量
    energy [label="能量密度\nw=½(εE²+μH²)\n§7-6", fillcolor=lightcoral];
    poynting [label="坡印亭矢量\nS=E×H\n§7-6", fillcolor=lightcoral];
    energy_theorem [label="能量定理\n-∂/∂t∫wdV=∮S·dS+∫pldV\n§7-6", fillcolor=lightcoral];
    
    // 时谐
    time_harmonic [label="时谐电磁场\nE(r,t)=Re[Em(r)e^{jωt}]\n§7-8", fillcolor=mediumpurple];
    complex_maxwell [label="复麦克斯韦方程\n∇×H=J+jωD\n§7-9", fillcolor=mediumpurple];
    helmholtz [label="亥姆霍兹方程\n∇²E+k²E=0\n§7-10", fillcolor=mediumpurple];
    complex_poynting [label="复坡印亭矢量\nSc=E×H*\nRe[Sc]=Sav\n§7-11", fillcolor=mediumpurple];
    
    // 唯一性
    uniqueness [label="惟一性定理\n初始+边界→唯一解\n§7-7", fillcolor=wheat];
    
    // Edges
    charge -> disp_curr;
    gauss -> disp_curr;
    disp_curr -> full_current;
    ampere_static -> full_current;
    faraday -> maxwell;
    full_current -> maxwell;
    gauss -> maxwell;
    
    maxwell -> boundary;
    maxwell -> potentials;
    potentials -> lorenz;
    lorenz -> wave_eq;
    wave_eq -> retarded;
    
    maxwell -> energy;
    energy -> poynting;
    poynting -> energy_theorem;
    
    maxwell -> time_harmonic;
    time_harmonic -> complex_maxwell;
    complex_maxwell -> helmholtz;
    helmholtz -> complex_poynting;
    
    maxwell -> uniqueness;
    
    // 电磁辐射
    radiation [label="电磁辐射\nv=1/√(με)=c\n§7-5", fillcolor=gold];
    retarded -> radiation;
    
    // Applications
    eddy [label="涡流效应\n§7-12", fillcolor=palegreen];
    shielding [label="电磁屏蔽\n§7-12", fillcolor=palegreen];
    
    boundary -> eddy;
    boundary -> shielding;
    energy -> eddy;
}

```
