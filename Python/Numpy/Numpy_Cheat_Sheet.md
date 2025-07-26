# **NumPy** – The Fundamental Package for Numerical Computing in Python

## Main Features

### Here are some of the key capabilities that NumPy offers:

* **N-Dimensional Arrays**:
  Central object is the `ndarray`, a fast, flexible container for large datasets in Python.

* **Broadcasting and Vectorization**:
  Eliminate the need for explicit loops with fast element-wise operations and broadcasting rules.

* **Mathematical Functions**:
  Provides a wide range of mathematical operations, including trigonometric, statistical, logarithmic, and algebraic.

* **Linear Algebra**:
  Includes powerful linear algebra capabilities through `numpy.linalg`, including matrix multiplication, decompositions, solving systems of equations, etc.

* **Random Number Generation**:
  Tools for generating random numbers from uniform, normal, binomial, and other distributions using `numpy.random`.

* **Date and Time Handling**:
  Powerful tools for working with dates, durations, and time series using `np.datetime64` and `np.timedelta64`.

* **Fourier Transform and Signal Processing**:
  Fast Fourier Transforms (FFT) available via `numpy.fft`.

* **Efficient I/O**:
  Read/write support for binary files (`.npy`, `.npz`), text files (`.csv`, `.txt`), and memory mapping large datasets.

* **Interoperability**:
  Works seamlessly with other scientific libraries like SciPy, Pandas, scikit-learn, and Matplotlib.

* **Integration with C/C++/Fortran**:
  Easy integration for high-performance computing and legacy code with low-level data buffer access.

* **Tools for Creating Arrays**:
  Many built-in functions to create arrays: zeros, ones, identity, arange, linspace, etc.

* **Flexible Shape Manipulation**:
  Easily reshape, transpose, flatten, or slice arrays without data copying.

* **Universal Functions (ufuncs)**:
  Fast element-wise operations with broadcasting support like `np.add`, `np.sqrt`, etc.

* **Statistical & Aggregation Support**:
  Summaries like mean, median, variance, standard deviation, percentiles, etc.

* **Set Operations on Arrays**:
  Perform union, intersection, difference, and membership testing efficiently.

* **Seeding for Reproducibility**:
  Control random number generation for consistent results using `np.random.seed()`.

---

# **NumPy Array Methods**

---

## Array Creation

| Method                | Description                              | Syntax                                 |
| --------------------- | ---------------------------------------- | -------------------------------------- |
| `np.array()`          | Create array from lists or tuples        | `np.array([1, 2, 3])`                  |
| `np.arange()`         | Create evenly spaced values in range     | `np.arange(0, 10, 2)`                  |
| `np.linspace()`       | Evenly spaced values between two numbers | `np.linspace(0, 1, 5)`                 |
| `np.ones()`           | Create array of ones                     | `np.ones((2, 3))`                      |
| `np.zeros()`          | Create array of zeros                    | `np.zeros((3, 4))`                     |
| `np.full()`           | Create array with a constant value       | `np.full((2, 2), 7)`                   |
| `np.eye()`            | Identity matrix with diagonal offset     | `np.eye(3, k=0)`                       |
| `np.identity()`       | Identity matrix (square)                 | `np.identity(3)`                       |
| `np.diag()`           | Diagonal from or into array              | `np.diag([1, 2, 3])`                   |
| `np.empty()`          | Create uninitialized array               | `np.empty((2, 2))`                     |
| `np.random.rand()`    | Uniform random numbers in \[0, 1)        | `np.random.rand(2, 3)`                 |
| `np.random.randn()`   | Standard normal distribution             | `np.random.randn(3, 3)`                |
| `np.random.randint()` | Random integers                          | `np.random.randint(0, 10, (2, 3))`     |
| `np.random.uniform()` | Random floats in range                   | `np.random.uniform(1, 5, size=(2, 2))` |
| `np.random.choice()`  | Random sample from array                 | `np.random.choice([1, 2, 3], 2)`       |
| `np.random.seed()`    | Set seed for reproducibility             | `np.random.seed(42)`                   |

---

## Array Conversion & Data Types

| Method         | Description                        | Syntax               |
| -------------- | ---------------------------------- | -------------------- |
| `astype()`     | Change data type                   | `arr.astype(float)`  |
| `np.asarray()` | Convert list to array (avoid copy) | `np.asarray([1, 2])` |
| `np.copy()`    | Create a copy of array             | `np.copy(arr)`       |
| `arr.dtype`    | Get data type                      | `arr.dtype`          |
| `arr.itemsize` | Bytes per element                  | `arr.itemsize`       |
| `arr.nbytes`   | Total bytes                        | `arr.nbytes`         |

---

## Array Attributes

| Attribute                    | Description               | Syntax                        |
| ---------------------------- | ------------------------- | ----------------------------- |
| `arr.shape`                  | Dimensions of array       | `arr.shape`                   |
| `arr.size`                   | Total elements            | `arr.size`                    |
| `arr.ndim`                   | Number of dimensions      | `arr.ndim`                    |
| `arr.T` or `arr.transpose()` | Transpose array           | `arr.T`                       |
| `arr.ravel()`                | Flatten (view)            | `arr.ravel()`                 |
| `arr.flatten()`              | Flatten (copy)            | `arr.flatten()`               |
| `np.expand_dims()`           | Add axis                  | `np.expand_dims(arr, axis=0)` |
| `np.squeeze()`               | Remove single-dim entries | `np.squeeze(arr)`             |
| `np.swapaxes()`              | Swap axes                 | `np.swapaxes(arr, 0, 1)`      |
| `arr.reshape()`              | Reshape array             | `arr.reshape(2, 3)`           |

---

## Mathematical Operations

| Method                    | Description               | Syntax                  |
| ------------------------- | ------------------------- | ----------------------- |
| `np.add()`                | Add arrays                | `np.add(a, b)`          |
| `np.subtract()`           | Subtract arrays           | `np.subtract(a, b)`     |
| `np.multiply()`           | Multiply arrays           | `np.multiply(a, b)`     |
| `np.divide()`             | Element-wise division     | `np.divide(a, b)`       |
| `np.floor_divide()`       | Floor division            | `np.floor_divide(a, b)` |
| `np.mod()`                | Modulo                    | `np.mod(a, b)`          |
| `np.power()` / `np.pow()` | Exponentiation            | `np.power(a, b)`        |
| `np.exp()`                | Exponential function      | `np.exp(a)`             |
| `np.sqrt()`               | Square root               | `np.sqrt(a)`            |
| `np.abs()`                | Absolute value            | `np.abs(a)`             |
| `np.clip()`               | Limit between min and max | `np.clip(a, 0, 10)`     |
| `np.round()`              | Round values              | `np.round(a, 2)`        |
| `np.floor()`              | Floor                     | `np.floor(a)`           |
| `np.ceil()`               | Ceil                      | `np.ceil(a)`            |
| `np.cumsum()`             | Cumulative sum            | `np.cumsum(a)`          |
| `np.cumprod()`            | Cumulative product        | `np.cumprod(a)`         |

---

## Logical & Conditional Operations

| Method             | Description               | Syntax                         |
| ------------------ | ------------------------- | ------------------------------ |
| `np.logical_and()` | Logical AND               | `np.logical_and(a > 1, b < 5)` |
| `np.logical_or()`  | Logical OR                | `np.logical_or(a, b)`          |
| `np.logical_not()` | Logical NOT               | `np.logical_not(a)`            |
| `np.logical_xor()` | Logical XOR               | `np.logical_xor(a, b)`         |
| `np.where()`       | Choose based on condition | `np.where(a > 0, 1, -1)`       |
| `np.isin()`        | Check membership          | `np.isin(a, [1, 2])`           |
| `np.equal()`       | a == b                    | `np.equal(a, b)`               |
| `np.greater()`     | a > b                     | `np.greater(a, b)`             |
| `np.less()`        | a < b                     | `np.less(a, b)`                |
| `np.any()`         | Any True?                 | `np.any(arr)`                  |
| `np.all()`         | All True?                 | `np.all(arr)`                  |
| `np.isfinite()`    | Finite values             | `np.isfinite(arr)`             |
| `np.isnan()`       | Check for NaNs            | `np.isnan(arr)`                |
| `np.isinf()`       | Check for inf             | `np.isinf(arr)`                |

---

## Statistics & Aggregation

| Method            | Description         | Syntax                   |
| ----------------- | ------------------- | ------------------------ |
| `np.sum()`        | Sum of elements     | `np.sum(arr)`            |
| `np.prod()`       | Product of elements | `np.prod(arr)`           |
| `np.mean()`       | Mean                | `np.mean(arr)`           |
| `np.median()`     | Median              | `np.median(arr)`         |
| `np.std()`        | Standard deviation  | `np.std(arr)`            |
| `np.var()`        | Variance            | `np.var(arr)`            |
| `np.max()`        | Max value           | `np.max(arr)`            |
| `np.min()`        | Min value           | `np.min(arr)`            |
| `np.argmax()`     | Index of max        | `np.argmax(arr)`         |
| `np.argmin()`     | Index of min        | `np.argmin(arr)`         |
| `np.percentile()` | Percentile          | `np.percentile(arr, 50)` |
| `np.quantile()`   | Quantile            | `np.quantile(arr, 0.25)` |
| `np.ptp()`        | Range (max - min)   | `np.ptp(arr)`            |

---

## Logarithmic & Exponential

| Method       | Description | Syntax          |
| ------------ | ----------- | --------------- |
| `np.log()`   | Natural log | `np.log(arr)`   |
| `np.log10()` | Base-10 log | `np.log10(arr)` |
| `np.log1p()` | Log(1 + x)  | `np.log1p(arr)` |
| `np.expm1()` | exp(x) - 1  | `np.expm1(arr)` |

---

## Set Operations

| Method             | Description          | Syntax                 |
| ------------------ | -------------------- | ---------------------- |
| `np.unique()`      | Unique values        | `np.unique(arr)`       |
| `np.union1d()`     | Union                | `np.union1d(a, b)`     |
| `np.intersect1d()` | Intersection         | `np.intersect1d(a, b)` |
| `np.setdiff1d()`   | A not in B           | `np.setdiff1d(a, b)`   |
| `np.setxor1d()`    | Symmetric difference | `np.setxor1d(a, b)`    |

---

## Indexing & Iteration

| Method           | Description            | Syntax                           |
| ---------------- | ---------------------- | -------------------------------- |
| Indexing         | Access elements        | `arr[1]`, `arr[1,2]`             |
| Slicing          | Slice ranges           | `arr[1:5]`                       |
| Fancy Indexing   | Index with list        | `arr[[0, 2]]`                    |
| Boolean Indexing | Index with bool array  | `arr[arr > 3]`                   |
| `np.nditer()`    | Efficient iteration    | `for x in np.nditer(arr)`        |
| `np.ndindex()`   | Multi-dimensional loop | `for i in np.ndindex(arr.shape)` |

---

## Sorting, Reversing, Modifying

| Method         | Description     | Syntax                         |
| -------------- | --------------- | ------------------------------ |
| `np.sort()`    | Sort array      | `np.sort(arr)`                 |
| `np.argsort()` | Indices to sort | `np.argsort(arr)`              |
| `np.flip()`    | Reverse array   | `np.flip(arr)`                 |
| `np.append()`  | Append elements | `np.append(arr, [4,5])`        |
| `np.delete()`  | Delete elements | `np.delete(arr, index)`        |
| `np.insert()`  | Insert elements | `np.insert(arr, index, value)` |

---

## Concatenation & Splitting

| Method             | Description          | Syntax                           |
| ------------------ | -------------------- | -------------------------------- |
| `np.concatenate()` | Join arrays          | `np.concatenate([a, b], axis=0)` |
| `np.stack()`       | Stack along new axis | `np.stack([a, b], axis=0)`       |
| `np.hstack()`      | Horizontal stack     | `np.hstack((a, b))`              |
| `np.vstack()`      | Vertical stack       | `np.vstack((a, b))`              |
| `np.dstack()`      | Depth-wise stack     | `np.dstack((a, b))`              |
| `np.split()`       | Split array          | `np.split(arr, 2)`               |
| `np.hsplit()`      | Horizontal split     | `np.hsplit(arr, 2)`              |
| `np.vsplit()`      | Vertical split       | `np.vsplit(arr, 2)`              |

---

## File Input/Output

| Method         | Description          | Syntax                           |
| -------------- | -------------------- | -------------------------------- |
| `np.save()`    | Save to `.npy`       | `np.save('data.npy', arr)`       |
| `np.load()`    | Load `.npy` file     | `arr = np.load('data.npy')`      |
| `np.savez()`   | Save multiple arrays | `np.savez('data.npz', a=a, b=b)` |
| `np.loadtxt()` | Load text file       | `np.loadtxt('data.txt')`         |
| `np.savetxt()` | Save to text file    | `np.savetxt('file.txt', arr)`    |
