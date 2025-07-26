# **Pandas** - a powerful data analysis and manipulation library for Python

## Main Features
### Here are just a few of the things that pandas does well:
  - Easy handling of missing data in floating point as well as non-floating
    point data.
  - Size mutability: columns can be inserted and deleted from DataFrame and
    higher dimensional objects
  - Automatic and explicit data alignment: objects can be explicitly aligned
    to a set of labels, or the user can simply ignore the labels and let
    `Series`, `DataFrame`, etc. automatically align the data for you in
    computations.
  - Powerful, flexible group by functionality to perform split-apply-combine
    operations on data sets, for both aggregating and transforming data.
  - Make it easy to convert ragged, differently-indexed data in other Python
    and NumPy data structures into DataFrame objects.
  - Intelligent label-based slicing, fancy indexing, and subsetting of large
    data sets.
  - Intuitive merging and joining data sets.
  - Flexible reshaping and pivoting of data sets.
  - Hierarchical labeling of axes (possible to have multiple labels per tick).
  - Robust IO tools for loading data from flat files (CSV and delimited),
    Excel files, databases, and saving/loading data from the ultrafast HDF5
    format.
  - Time series-specific functionality: date range generation and frequency
    conversion, moving window statistics, date shifting and lagging.


# **🐼 Pandas Methods Reference**

---

## Installation & Documentation

| Method               | Description                           | Syntax                |
| -------------------- | ------------------------------------- | --------------------- |
| Install Pandas       | Install via pip                       | `pip install pandas`  |
| Import Pandas        | Import as pd                          | `import pandas as pd` |
| `pd.__doc__`         | View top-level documentation          | `print(pd.__doc__)`   |
| `pd.show_versions()` | Show all package versions (debugging) | `pd.show_versions()`  |

---

## Core Data Structures

| Object             | Description               | Syntax                             |
| ------------------ | ------------------------- | ---------------------------------- |
| `pd.Series`        | 1D labeled array          | `s = pd.Series(data)`              |
| `pd.DataFrame`     | 2D labeled table          | `df = pd.DataFrame(data)`          |
| `pd.Index`         | Immutable index object    | `i = pd.Index(['a', 'b', 'c'])`    |
| `pd.DatetimeIndex` | Index for datetime values | `pd.DatetimeIndex(['2024-01-01'])` |
| `pd.Categorical`   | Category dtype            | `pd.Categorical(['a', 'b', 'a'])`  |

---

## Input Functions (Read)

| Method             | Description            | Syntax                                     |
| ------------------ | ---------------------- | ------------------------------------------ |
| `read_csv()`       | Load CSV               | `pd.read_csv('file.csv')`                  |
| `read_excel()`     | Load Excel file        | `pd.read_excel('file.xlsx')`               |
| `read_sql()`       | Load from SQL database | `pd.read_sql('SELECT * FROM table', conn)` |
| `read_json()`      | Load JSON file         | `pd.read_json('file.json')`                |
| `read_html()`      | Parse HTML tables      | `pd.read_html('url_or_file')`              |
| `read_clipboard()` | Load from clipboard    | `pd.read_clipboard()`                      |
| `read_parquet()`   | Load Parquet file      | `pd.read_parquet('file.parquet')`          |

---

## Output Functions (Write)

| Method           | Description         | Syntax                          |
| ---------------- | ------------------- | ------------------------------- |
| `to_csv()`       | Save to CSV         | `df.to_csv('file.csv')`         |
| `to_excel()`     | Save to Excel       | `df.to_excel('file.xlsx')`      |
| `to_sql()`       | Save to SQL         | `df.to_sql('table_name', conn)` |
| `to_json()`      | Save to JSON        | `df.to_json('file.json')`       |
| `to_html()`      | Save as HTML table  | `df.to_html('file.html')`       |
| `to_markdown()`  | Convert to Markdown | `df.to_markdown()`              |
| `to_clipboard()` | Copy to clipboard   | `df.to_clipboard()`             |
| `to_parquet()`   | Save as Parquet     | `df.to_parquet('file.parquet')` |

---

## Data Exploration

| Method       | Description               | Syntax                       |
| ------------ | ------------------------- | ---------------------------- |
| `head(n)`    | First `n` rows            | `df.head(10)`                |
| `tail(n)`    | Last `n` rows             | `df.tail(5)`                 |
| `info()`     | Column types, nulls, etc. | `df.info()`                  |
| `shape`      | Rows and columns          | `df.shape`                   |
| `size`       | Total number of elements  | `df.size`                    |
| `columns`    | List of column names      | `df.columns`                 |
| `dtypes`     | Data types of columns     | `df.dtypes`                  |
| `describe()` | Summary statistics        | `df.describe(include='all')` |
| `sample(n)`  | Random sample of rows     | `df.sample(5)`               |

---

## Indexing, Access, and Slicing

| Method           | Description            | Syntax                  |
| ---------------- | ---------------------- | ----------------------- |
| `df.loc[]`       | Access by label        | `df.loc['row', 'col']`  |
| `df.iloc[]`      | Access by position     | `df.iloc[0, 1]`         |
| Slicing          | Slice rows/columns     | `df[1:5]`               |
| Boolean Indexing | Filter by condition    | `df[df['col'] > 10]`    |
| `query()`        | SQL-like row filtering | `df.query('col > 10')`  |
| `isin()`         | Membership check       | `df['col'].isin([1,2])` |

---

## Handling Missing & Duplicates

| Method                | Description       | Syntax                 |
| --------------------- | ----------------- | ---------------------- |
| `isnull()` / `isna()` | Check for nulls   | `df.isnull()`          |
| `notnull()`           | Non-null check    | `df.notnull()`         |
| `fillna(value)`       | Fill missing      | `df.fillna(0)`         |
| `dropna()`            | Drop missing      | `df.dropna()`          |
| `duplicated()`        | Detect duplicates | `df.duplicated()`      |
| `drop_duplicates()`   | Remove duplicates | `df.drop_duplicates()` |

---

## String Methods (`.str`)

| Method                | Description       | Syntax                                |
| --------------------- | ----------------- | ------------------------------------- |
| `contains()`          | Substring match   | `df['col'].str.contains('abc')`       |
| `split()`             | Split string      | `df['col'].str.split(',')`            |
| `get()`               | Get split part    | `df['col'].str.split(',').str.get(0)` |
| `startswith()`        | Begins with       | `df['col'].str.startswith('A')`       |
| `endswith()`          | Ends with         | `df['col'].str.endswith('Z')`         |
| `upper()` / `lower()` | Case conversion   | `df['col'].str.upper()`               |
| `replace()`           | Replace substring | `df['col'].str.replace('a', 'b')`     |

---

## Aggregation and Statistics

| Method              | Description         | Syntax                     |
| ------------------- | ------------------- | -------------------------- |
| `sum()`             | Sum values          | `df.sum()`                 |
| `min()` / `max()`   | Min/Max             | `df.min()`                 |
| `mean()`            | Mean                | `df.mean()`                |
| `median()`          | Median              | `df.median()`              |
| `mode()`            | Most frequent       | `df.mode()`                |
| `std()` / `var()`   | Std / Var           | `df.std()`                 |
| `count()`           | Non-null count      | `df.count()`               |
| `unique()`          | Unique values       | `df['col'].unique()`       |
| `nunique()`         | Count of unique     | `df['col'].nunique()`      |
| `value_counts()`    | Frequency of values | `df['col'].value_counts()` |
| `nlargest(n, col)`  | Top `n` largest     | `df.nlargest(5, 'col')`    |
| `nsmallest(n, col)` | Top `n` smallest    | `df.nsmallest(5, 'col')`   |

---

## Transformation & Modification

| Method           | Description           | Syntax                             |
| ---------------- | --------------------- | ---------------------------------- |
| `astype(dtype)`  | Convert dtype         | `df['col'].astype(float)`          |
| `rename()`       | Rename cols/index     | `df.rename(columns={'old':'new'})` |
| `replace()`      | Replace values        | `df.replace(0, np.nan)`            |
| `apply(func)`    | Apply function        | `df['col'].apply(np.sqrt)`         |
| `applymap(func)` | Element-wise function | `df.applymap(str.lower)`           |
| `pipe(func)`     | Chainable operation   | `df.pipe(my_func)`                 |

---

## Merge, Join, Concat

| Method            | Description               | Syntax                        |
| ----------------- | ------------------------- | ----------------------------- |
| `merge()`         | Merge by keys             | `pd.merge(df1, df2, on='id')` |
| `join()`          | Join on index             | `df1.join(df2)`               |
| `concat()`        | Concatenate               | `pd.concat([df1, df2])`       |
| `combine_first()` | Fill missing from another | `df1.combine_first(df2)`      |

---

## DateTime Handling

| Method          | Description         | Syntax                                        |
| --------------- | ------------------- | --------------------------------------------- |
| `to_datetime()` | Convert to datetime | `pd.to_datetime(df['col'])`                   |
| `.dt` accessor  | Extract parts       | `df['col'].dt.year`, `dt.month`, `dt.weekday` |
| `date_range()`  | Create date range   | `pd.date_range('2024-01-01', periods=10)`     |
| `Timedelta()`   | Time differences    | `pd.Timedelta('2 days')`                      |
| `resample()`    | Time-based grouping | `df.resample('M').mean()`                     |

---

## Pivoting & Crosstab

| Method          | Description             | Syntax                                                           |
| --------------- | ----------------------- | ---------------------------------------------------------------- |
| `pivot_table()` | Create pivot table      | `df.pivot_table(values='sales', index='region', columns='year')` |
| `crosstab()`    | Frequency table         | `pd.crosstab(df['gender'], df['purchased'])`                     |
| `melt()`        | Unpivot columns         | `pd.melt(df, id_vars=['id'])`                                    |
| `stack()`       | Pivot levels to rows    | `df.stack()`                                                     |
| `unstack()`     | Pivot levels to columns | `df.unstack()`                                                   |
