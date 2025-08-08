# **Exploratory Data Analysis (EDA) – Complete Structured Guide**

---

## **1. Understand the Problem Statement**

Before touching the dataset:

* **Goal**: Identify what you’re trying to achieve (e.g., detect fraud, predict prices, classify customers).
* **Problem type**: Classification, regression, clustering, or descriptive analysis.
* **Business context**: Why is this problem important? What decisions will be based on the insights?
* **Target variable**: Identify the dependent variable if supervised learning is involved.
* **Data source**: File (CSV, Excel), database, API, or cloud storage.
* **Constraints**: Time, cost, domain-specific rules.

---

## **2. Import Necessary Libraries**

```python
# Data handling
import pandas as pd
import numpy as np

# Visualization
import matplotlib.pyplot as plt
import seaborn as sns

# Statistics
from scipy import stats

# Optional
import datetime as dt
```

---

## **3. Data Exploration**

### **Data Loading**

Load the dataset using:

```python
df = pd.read_csv('file.csv')           # CSV file
df = pd.read_excel('file.xlsx')        # Excel file
```

Other sources:

* **SQL Queries**
* **APIs**
* **Cloud platforms** (AWS S3, Google BigQuery)

✅ **Check**:

* File encoding, delimiters, column headers
* `df.head()` and `df.tail()` to preview
* `df.shape` → dimensions
* `df.info()` → data types & null counts
* `df.dtypes` → column data types
* Numerical vs categorical features

---

## **4. Data Cleaning**

Bad data = bad insights.

### **a. Handling Missing Values**

* **Detection**:

```python
df.isnull().sum()
```

* **Strategies**:

  * Drop rows: `df.dropna()`
  * Fill:

    * Mean: `df['col'].fillna(df['col'].mean())`
    * Median: `df['col'].fillna(df['col'].median())`
    * Mode: `df['col'].fillna(df['col'].mode()[0])`
  * Domain-specific imputation

---

### **b. Fixing Data Types**

* Convert formats:

```python
df['date'] = pd.to_datetime(df['date'])
df['age'] = df['age'].astype(int)
```

* Examples:

  * `"25"` → integer
  * `"2023-05-01"` → datetime

---

### **c. Handling Duplicates**

* **Check**:

```python
df.duplicated().sum()
```

* **Remove**:

```python
df.drop_duplicates(inplace=True)
```

---

### **d. Standardizing Categories**

* Remove spaces & unify case:

```python
df['Gender'] = df['Gender'].str.strip().str.capitalize()
```

Example: `"Male"`, `"male"`, `" MALE "` → `"Male"`

---

### **e. Outlier Detection**

#### **Z-Score Method**:

If |z| > 3 → outlier
Formula:

$$
Z = \frac{X - \mu}{\sigma}
$$

```python
z = np.abs(stats.zscore(df['col']))
df[z > 3]
```

#### **IQR Method**:

$$
IQR = Q3 - Q1
$$

Outlier range:

$$
[Q1 - 1.5 \cdot IQR, Q3 + 1.5 \cdot IQR]
$$

```python
Q1 = df['col'].quantile(0.25)
Q3 = df['col'].quantile(0.75)
IQR = Q3 - Q1
df[(df['col'] < Q1 - 1.5*IQR) | (df['col'] > Q3 + 1.5*IQR)]
```

✅ **Use boxplots to visualize**.

---

### **f. Data Entry Errors**

* Impossible values:

  * Age = 200
  * Negative prices
* Typos:

  * `"yes"`, `"Yes"`, `"yees"`
* Clean using:

  * Conditional replacements
  * Domain expertise

---

## **5. Feature Engineering**

* **Create new features**:

  * Date parts:

```python
df['year'] = df['date'].dt.year
```

* Ratios:

```python
df['price_per_unit'] = df['price'] / df['units']
```

* **Encoding categorical data**:

  * One-hot encoding:

```python
df = pd.get_dummies(df, columns=['category'])
```

* Label encoding (sklearn)
* **Transformations**:

  * Log transform:

```python
df['log_value'] = np.log1p(df['value'])
```

* **Binning**:

```python
df['age_group'] = pd.cut(df['age'], bins=[0,18,35,60,100], labels=['Child','Youth','Adult','Senior'])
```

---

## **6. Data Visualization**

### **a. Univariate Analysis**

#### Numerical:

* Histogram:

```python
sns.histplot(df['col'], kde=True)
```

* Boxplot:

```python
sns.boxplot(x=df['col'])
```

#### Categorical:

* Bar chart:

```python
sns.countplot(x='col', data=df)
```

* Pie chart (use cautiously):

```python
df['col'].value_counts().plot.pie(autopct='%1.1f%%')
```

---

### **b. Bivariate Analysis**

#### Numerical vs Numerical:

* Scatter plot:

```python
sns.scatterplot(x='col1', y='col2', data=df)
```

* Correlation matrix:

```python
sns.heatmap(df.corr(), annot=True)
```

#### Numerical vs Categorical:

* Boxplot:

```python
sns.boxplot(x='category', y='value', data=df)
```

* Violin plot:

```python
sns.violinplot(x='category', y='value', data=df)
```

#### Categorical vs Categorical:

* Cross-tab:

```python
pd.crosstab(df['cat1'], df['cat2'])
```

* Stacked bar plots

---

### **c. Multivariate Analysis**

* Pairplot:

```python
sns.pairplot(df)
```

* Faceted plots for segmented visual analysis
* Heatmaps for correlation patterns

---

## **7. EDA Reporting**

### **a. Visual Summaries**

* Must include:

  * Histograms
  * Boxplots
  * Scatter plots
  * Heatmaps
  * Outlier visuals

### **b. Insights**

* Distribution type: Normal or skewed?
* Category dominance
* Strong correlations
* Missing/duplicate/unusable data
* Presence of anomalies

### **c. Recommendations**

* Transform skewed variables
* Drop irrelevant or redundant features
* Engineer new relevant features
* Suggest further data collection for missing points

---

## **Summary Diagram**

| Step              | Tools / Methods                 | Key Insights               |
| ----------------- | ------------------------------- | -------------------------- |
| Data Loading      | pandas, SQL                     | Correct formats, structure |
| Data Cleaning     | isnull(), dropna(), astype()    | Clean and consistent data  |
| Summary Stats     | describe(), value\_counts()     | Central tendency, spread   |
| Univariate        | Histogram, Boxplot              | Shape, spread, outliers    |
| Bivariate         | Scatterplot, Boxplot, Cross-tab | Relationships              |
| Multivariate      | Heatmaps, Faceted plots         | Higher-level interactions  |
| Anomaly Detection | Z-score, IQR, domain checks     | Outliers and errors        |
| Reporting         | Plots + text                    | Tell a clear, visual story |

