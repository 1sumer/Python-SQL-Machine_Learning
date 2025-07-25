## **NumPy Array Methods**

---

## Array Creation

| Method                               | Description                                         |
| ------------------------------------ | --------------------------------------------------- |
| `np.array(object)`                   | Create array from lists, tuples, or other sequences |
| `np.arange(start, stop, step)`       | Evenly spaced values within a given range           |
| `np.linspace(start, stop, num)`      | Evenly spaced values between two numbers            |
| `np.ones(shape)`                     | Array of ones                                       |
| `np.zeros(shape)`                    | Array of zeros                                      |
| `np.full(shape, fill_value)`         | Array filled with a specific value                  |
| `np.eye(N, M=None, k=0)`             | Identity matrix with optional offset diagonal       |
| `np.identity(n)`                     | Identity matrix (square)                            |
| `np.diag(v)`                         | Extract/create a diagonal or diagonal matrix        |
| `np.empty(shape)`                    | Uninitialized array (fast but random values)        |
| `np.random.rand(d0, d1, ...)`        | Uniform random floats in `[0, 1)`                   |
| `np.random.randn(d0, d1, ...)`       | Standard normal random values                       |
| `np.random.randint(low, high, size)` | Random integers in given range                      |
| `np.random.uniform(low, high, size)` | Random floats in given range                        |
| `np.random.choice(a, size)`          | Random sample from a given array                    |
| `np.random.seed(n)`                  | Set seed for reproducibility                        |

---

## Array Conversion & Data Types

| Method                | Description                                         |
| --------------------- | --------------------------------------------------- |
| `astype(dtype)`       | Convert array to another data type                  |
| `np.asarray(object)`  | Convert list/tuple to array (no copy if not needed) |
| `np.copy(a)`          | Return a copy of the array                          |
| `np.ndarray.itemsize` | Bytes per array element                             |
| `np.ndarray.nbytes`   | Total memory in bytes                               |
| `np.ndarray.dtype`    | Data type of elements                               |

---

## Array Attributes

| Attribute/Method               | Description                       |
| ------------------------------ | --------------------------------- |
| `shape`                        | Tuple of array dimensions         |
| `reshape(new_shape)`           | New shape without changing data   |
| `size`                         | Total number of elements          |
| `ndim`                         | Number of dimensions              |
| `T` / `transpose()`            | Transpose axes                    |
| `ravel()`                      | Flatten (view)                    |
| `flatten()`                    | Flatten (copy)                    |
| `np.expand_dims(a, axis)`      | Add a dimension                   |
| `np.squeeze(a)`                | Remove single-dimensional entries |
| `np.swapaxes(a, axis1, axis2)` | Swap axes                         |

---

## Mathematical Operations

| Method                      | Description                      |
| --------------------------- | -------------------------------- |
| `add(x, y)`                 | Element-wise addition            |
| `subtract(x, y)`            | Element-wise subtraction         |
| `multiply(x, y)`            | Element-wise multiplication      |
| `divide(x, y)`              | Element-wise division            |
| `mod(x, y)`                 | Element-wise modulus             |
| `floor_divide(x, y)`        | Floor division                   |
| `exp(x)`                    | Exponential                      |
| `sqrt(x)`                   | Square root                      |
| `power(x, y)` / `pow(x, y)` | Exponentiation                   |
| `abs(x)`                    | Absolute values                  |
| `clip(x, min, max)`         | Limit values between min and max |
| `round(x, decimals)`        | Round to decimals                |
| `floor(x)`                  | Floor values                     |
| `ceil(x)`                   | Ceiling values                   |
| `cumsum()`                  | Cumulative sum                   |
| `cumprod()`                 | Cumulative product               |

---

## Logical & Conditional Operations

| Method                             | Description                                   |
| ---------------------------------- | --------------------------------------------- |
| `logical_and(x, y)`                | Element-wise AND                              |
| `logical_or(x, y)`                 | Element-wise OR                               |
| `logical_not(x)`                   | Element-wise NOT                              |
| `logical_xor(x, y)`                | Element-wise XOR                              |
| `where(cond, x, y)`                | Choose from `x` or `y` depending on condition |
| `np.isin(elements, test_elements)` | Check membership                              |
| `np.any()`                         | Check if any `True`                           |
| `np.all()`                         | Check if all `True`                           |
| `np.isfinite(x)`                   | Test for finite values                        |
| `np.isnan(x)`                      | Test for NaNs                                 |
| `np.isinf(x)`                      | Test for infinities                           |
| `np.equal(x, y)`                   | Compare equal values                          |
| `np.greater(x, y)`                 | Greater-than comparison                       |
| `np.less(x, y)`                    | Less-than comparison                          |

---

## Statistical & Aggregation Functions

| Method             | Description               |
| ------------------ | ------------------------- |
| `sum()`            | Sum of array elements     |
| `prod()`           | Product of array elements |
| `mean()`           | Arithmetic mean           |
| `median()`         | Median                    |
| `std()`            | Standard deviation        |
| `var()`            | Variance                  |
| `max()`            | Maximum                   |
| `min()`            | Minimum                   |
| `argmax()`         | Index of maximum value    |
| `argmin()`         | Index of minimum value    |
| `percentile(x, q)` | q-th percentile           |
| `quantile(x, q)`   | q-th quantile             |
| `ptp()`            | Peak-to-peak (max - min)  |

---

## Logarithmic & Exponential Functions

| Method     | Description                      |
| ---------- | -------------------------------- |
| `log(x)`   | Natural log (ln)                 |
| `log10(x)` | Log base 10                      |
| `log1p(x)` | Log(1 + x), accurate for small x |
| `exp(x)`   | e^x                              |
| `expm1(x)` | exp(x) - 1, accurate for small x |

---

## Set Operations

| Method              | Description                                   |
| ------------------- | --------------------------------------------- |
| `union1d(x, y)`     | Unique elements from both                     |
| `intersect1d(x, y)` | Common elements                               |
| `setdiff1d(x, y)`   | Elements in `x` not in `y`                    |
| `setxor1d(x, y)`    | Elements in one, not both                     |
| `unique(x)`         | Unique elements sorted                        |
| `unique_counts(x)`  | Count of each unique element *(NumPy ≥ 1.24)* |

---

## Indexing, Slicing, Iteration

| Method                   | Description                       |
| ------------------------ | --------------------------------- |
| `array[index]`           | Access elements                   |
| `array[start:stop:step]` | Slice                             |
| `fancy indexing`         | Index with array of indices       |
| `boolean indexing`       | Index with boolean array          |
| `np.nditer(array)`       | Iterate efficiently over elements |
| `np.ndindex(dimensions)` | Multi-index iteration             |

---

## Sort, Reverse, Append, Delete

| Method                           | Description           |
| -------------------------------- | --------------------- |
| `sort()`                         | Sort array            |
| `argsort()`                      | Indices to sort array |
| `flip()`                         | Reverse array         |
| `append(a, values, axis)`        | Append values         |
| `delete(arr, obj, axis)`         | Delete subarray       |
| `insert(arr, obj, values, axis)` | Insert values         |

---

## Concatenation & Splitting

| Method                                | Description          |
| ------------------------------------- | -------------------- |
| `concatenate((a, b), axis)`           | Join arrays          |
| `stack((a, b), axis)`                 | Stack along new axis |
| `hstack((a, b))`                      | Horizontal stack     |
| `vstack((a, b))`                      | Vertical stack       |
| `dstack((a, b))`                      | Depth-wise stack     |
| `hsplit(a, sections)`                 | Split horizontally   |
| `vsplit(a, sections)`                 | Split vertically     |
| `split(a, indices_or_sections, axis)` | General split        |

---

## File Input/Output

| Method                        | Description                           |
| ----------------------------- | ------------------------------------- |
| `save('file.npy', arr)`       | Save binary `.npy` file               |
| `load('file.npy')`            | Load from `.npy`                      |
| `savez('file.npz', a=a, b=b)` | Save multiple arrays                  |
| `load('file.npz')`            | Load multiple arrays                  |
| `savetxt('file.txt', arr)`    | Save to text file                     |
| `loadtxt('file.txt')`         | Load from text file                   |
