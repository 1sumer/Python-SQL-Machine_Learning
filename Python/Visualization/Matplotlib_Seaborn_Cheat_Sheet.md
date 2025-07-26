# **Matplotlib** – Comprehensive Library for Static, Animated, and Interactive Visualizations in Python

## Main Features

### Here are some of the key capabilities of Matplotlib:

* **2D Plotting**:
  Create line plots, scatter plots, bar charts, histograms, error charts, pie charts, and more.

* **Full Control of Plot Appearance**:
  Customize every aspect of a plot: titles, labels, tick marks, grids, colors, linestyles, markers, fonts, figure size, DPI, etc.

* **Multiple Output Formats**:
  Export plots as PNG, SVG, PDF, EPS, and other formats with publication-quality.

* **Subplots and Layouts**:
  Create multi-panel layouts using `subplot()`, `subplots()`, and `gridspec`.

* **Object-Oriented and Pyplot APIs**:
  Use either the MATLAB-style `pyplot` interface or the more flexible object-oriented API with `Figure` and `Axes`.

* **Animations and Interactive Plots**:
  Create animated charts using `FuncAnimation` and interactive visualizations in notebooks or GUIs.

* **Axes and Coordinates Control**:
  Fine-tuned control of axes scaling, limits, aspect ratio, ticks, and labels.

* **Colormaps and Colorbars**:
  Visualize data using color gradients and legends using built-in or custom colormaps.

* **Integration with Pandas and NumPy**:
  Directly plot Series and DataFrames; handles NumPy arrays natively.

* **3D Plotting Support** *(via mpl\_toolkits.mplot3d)*:
  Plot 3D surfaces, scatter plots, wireframes, and bar charts.

* **Extensibility**:
  Extend with third-party toolkits like Basemap, Cartopy, and Seaborn for advanced functionality.

---

# **Seaborn** – Statistical Data Visualization Based on Matplotlib

## Main Features

### Seaborn builds on Matplotlib and adds powerful features for visualizing structured data:

* **Statistical Visualization**:
  Easily visualize distributions, regressions, categories, and time series with built-in statistical functions.

* **Built-in Themes and Styles**:
  High-level API with beautiful default aesthetics. Functions like `set_theme()` and palettes improve appearance.

* **Simplified Plotting Functions**:
  One-liners for complex plots: `sns.histplot()`, `sns.boxplot()`, `sns.violinplot()`, `sns.heatmap()` etc.

* **DataFrame Support**:
  Seamlessly handles Pandas DataFrames and variable names (no need to extract columns manually).

* **Categorical Plotting**:
  Specialized functions for categorical data: `catplot()`, `stripplot()`, `swarmplot()`, etc.

* **Multi-Plot Grids**:
  Easily create subplots using `FacetGrid`, `pairplot()`, and `lmplot()` for exploring multidimensional data.

* **Regression Visualization**:
  Automatically plot regression lines and confidence intervals using `sns.regplot()` or `sns.lmplot()`.

* **Heatmaps and Correlations**:
  Powerful correlation plots using `sns.heatmap()` with annotation, colormaps, and masks.

* **Customization**:
  Supports all Matplotlib functionalities for fine-tuning plot appearance.

* **Tight Integration with Matplotlib**:
  Access underlying Matplotlib objects for full control and customization.

---

# **Visualization with `matplotlib.pyplot` and `seaborn`**

---

## **Plot Styling & Configuration (Matplotlib)**

| Function                        | Description                                    | Syntax Example                                |
| ------------------------------- | ---------------------------------------------- | --------------------------------------------- |
| `plt.style.use()`               | Apply a predefined plotting style              | `plt.style.use('ggplot')`                     |
| `plt.figure()`                  | Create a new figure                            | `plt.figure(figsize=(8, 6))`                  |
| `plt.subplot()`                 | Create subplot layout                          | `plt.subplot(2, 2, 1)`                        |
| `plt.grid()`                    | Display or customize grid lines                | `plt.grid(linestyle='--', linewidth=1.2)`     |
| `plt.ticklabel_format()`        | Format tick labels (e.g., scientific notation) | `plt.ticklabel_format(style='sci', axis='x')` |
| `plt.xlim()` / `plt.ylim()`     | Set x or y axis limits                         | `plt.xlim(0, 100)` , `plt.ylim(0, 100)`         |
| `plt.xticks()` / `plt.yticks()` | Set tick positions, labels or rotate them      | `plt.xticks(rotation=45, fontsize=12)` ,`plt.xticks(rotation=45, fontsize=12)`       |

---

## **Annotations, Labels & Saving (Matplotlib)**

| Function         | Description               | Syntax Example                                                                     |
| ---------------- | ------------------------- | ---------------------------------------------------------------------------------- |
| `plt.title()`    | Add title to plot         | `plt.title("Distribution", size=14)`                                               |
| `plt.xlabel()`   | Label x-axis              | `plt.xlabel("Time (s)", size=12)`                                                  |
| `plt.ylabel()`   | Label y-axis              | `plt.ylabel("Value")`                                                              |
| `plt.annotate()` | Add annotation with arrow | `plt.annotate("Peak", xy=(1, 5), xytext=(2, 6), arrowprops={'facecolor':'black'})` |
| `plt.legend()`   | Show legend               | `plt.legend(loc='best')`                                                           |
| `plt.savefig()`  | Save current figure       | `plt.savefig("output.png")`                                                        |
| `plt.show()`     | Display the plot          | `plt.show()`                                                                       |

---

## **Plot Types (Matplotlib)**

| Function                             | Description                           | Syntax Example                                                       |
| ------------------------------------ | ------------------------------------- | -------------------------------------------------------------------- |
| `plt.plot(x, y)`                     | Line plot of x vs y.                  | `plt.plot(x, y, color='red', linestyle='--')`                        |
| `plt.scatter(x, y)`                  | Scatter plot.                         | `plt.scatter(x, y, c='blue', marker='o')`                            |
| `plt.bar(x, height)`                 | Vertical bar plot.                    | `plt.bar(x, height, color='green')`                                  |
| `plt.barh(y, width)`                 | Horizontal bar plot.                  | `plt.barh(y, width, color='purple')`                                 |
| `plt.hist(data, bins, **kwargs)`     | Histogram.                            | `plt.hist(data, bins=10, color='orange', edgecolor='black')`         |
| `plt.boxplot(data, **kwargs)`        | Box plot (for distribution analysis). | `plt.boxplot(df['col'], vert=False, showfliers=True)`                |
| `plt.pie(values, labels, **kwargs)`  | Pie chart.                            | `plt.pie(values, labels=labels, autopct='%1.1f%%', explode=explode)` |
| `plt.bar_label(container, **kwargs)` | Adds labels to bars in bar chart.     | `plt.bar_label(bars, label_type='center', rotation=90, fmt='%.1f')`  |

---

## **seaborn Visualization Methods**

| **Function**                    | **Description**                                | **Syntax Example**                                            |
| ------------------------------- | ---------------------------------------------- | ------------------------------------------------------------- |
| `sns.scatterplot()`             | Scatter plot with aesthetic control.           | `sns.scatterplot(x='x', y='y', data=df)`                      |
| `sns.lineplot()`                | Line plot with confidence intervals.           | `sns.lineplot(x='x', y='y', data=df)`                         |
| `sns.barplot()`                 | Bar plot with aggregation (mean by default).   | `sns.barplot(x='category', y='value', data=df)`               |
| `sns.countplot()`               | Bar plot showing counts of unique categories.  | `sns.countplot(x='column', data=df)`                          |
| `sns.histplot()`                | Histogram with optional KDE.                   | `sns.histplot(data=df['col'], bins=10, kde=True)`             |
| `sns.kdeplot()`                 | Kernel Density Estimation curve.               | `sns.kdeplot(data=df['col'], fill=True)`                      |
| `sns.distplot()` *(deprecated)* | Combines histogram and KDE (older versions).   | `sns.distplot(df['total_bill'], bins=10, kde=True)`           |
| `sns.boxplot()`                 | Box plot for visualizing spread and outliers.  | `sns.boxplot(x='category', y='value', data=df)`               |
| `sns.violinplot()`              | Combines boxplot and KDE for distributions.    | `sns.violinplot(x='category', y='value', data=df)`            |
| `sns.stripplot()`               | Scatter plot for categorical axis with jitter. | `sns.stripplot(x='day', y='total_bill', data=df, marker='*')` |
| `sns.swarmplot()`               | Non-overlapping scatter plot for categories.   | `sns.swarmplot(x='day', y='total_bill', data=df, marker='*')` |
| `sns.heatmap()`                 | Heatmap for matrix-like data.                  | `sns.heatmap(df.corr(), annot=True, cmap='coolwarm')`         |
| `sns.pairplot()`                | Pairwise relationships for numeric columns.    | `sns.pairplot(df, hue='target')`                              |
| `sns.jointplot()`               | Combined scatter + hist + KDE (multiplot).     | `sns.jointplot(x='x', y='y', data=df, kind='hex')`            |
| `sns.regplot()`                 | Regression line with scatter plot.             | `sns.regplot(x='x', y='y', data=df)`                          |

---

## **Styling and Themes**

| Function                  | Description                      | Syntax Example                      |
| ------------------------- | -------------------------------- | ----------------------------------- |
| `plt.style.use('ggplot')` | Changes global matplotlib style. | `plt.style.use('seaborn-darkgrid')` |
| `sns.set_style()`         | Sets Seaborn visual style.       | `sns.set_style('whitegrid')`        |
| `sns.set_context()`       | Sets context for scale of plots. | `sns.set_context('talk')`           |
| `sns.set_palette()`       | Sets color palette for plots.    | `sns.set_palette('pastel')`         |
