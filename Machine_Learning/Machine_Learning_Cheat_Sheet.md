# **Machine Learning**

## Main Features

### Machine Learning (ML) refers to the field of computer science where systems learn patterns from data to make predictions or decisions without being explicitly programmed.

---

## **Key Capabilities of Machine Learning**

* **Automated Pattern Recognition**
  ML models identify hidden patterns in data and generalize to unseen data.

* **Predictive Modeling**
  Train models on historical data to make future predictions (e.g., sales forecasting, price estimation, etc.).

* **Adaptive Systems**
  Models improve their performance over time as more data becomes available.

* **Works on Structured & Unstructured Data**
  ML can process tabular data, text, images, audio, video, and time series.

* **Scalable Algorithms**
  Many algorithms are designed to handle massive datasets using parallel and distributed systems.

* **Versatile Toolkits**
  Ecosystem of frameworks like Scikit-Learn, TensorFlow, PyTorch, XGBoost, etc.

---

## 🧠 **Types of Machine Learning**

| Type                | Description                                                     | Examples                             |
| ------------------- | --------------------------------------------------------------- | ------------------------------------ |
| **Supervised**      | Learn from labeled data (input → output mapping)                | Regression, Classification           |
| **Unsupervised**    | Discover patterns in unlabeled data                             | Clustering, Dimensionality Reduction |
| **Semi-supervised** | Combines small labeled and large unlabeled datasets             | Web content classification           |
| **Reinforcement**   | Learn by interacting with environment using rewards/punishments | Game playing, Robotics               |

---

## 🧰 **Common Machine Learning Tasks**

* **Regression**
  Predict continuous values (e.g., house price, temperature).

* **Classification**
  Categorize input into predefined classes (e.g., spam or not, cancer diagnosis).

* **Clustering**
  Group data points based on similarity without labels (e.g., customer segmentation).

* **Dimensionality Reduction**
  Reduce number of input variables (e.g., PCA, t-SNE) for visualization or noise removal.

* **Anomaly Detection**
  Detect outliers or rare events (e.g., fraud detection).

* **Recommendation Systems**
  Suggest items (e.g., movies, products) based on user preferences and behavior.

---

## 📦 **Popular ML Libraries & Tools**

| Library/Tool     | Language   | Use-Case                             |
| ---------------- | ---------- | ------------------------------------ |
| **Scikit-Learn** | Python     | General-purpose ML (easy API)        |
| **TensorFlow**   | Python     | Deep learning, production-ready      |
| **PyTorch**      | Python     | Research & deep learning flexibility |
| **Keras**        | Python     | High-level wrapper for TensorFlow    |
| **MLflow**       | Python     | Model lifecycle management           |

---

## **Common Evaluation Metrics**

| Task           | Metrics                                        |
| -------------- | ---------------------------------------------- |
| Regression     | MSE, RMSE, MAE, R² Score                       |
| Classification | Accuracy, Precision, Recall, F1-Score, ROC-AUC |
| Clustering     | Silhouette Score, Davies-Bouldin Index         |

---

## **Model Lifecycle**

1. **Data Collection** → Gather and store relevant data
2. **Preprocessing** → Clean, transform, and scale data
3. **Model Training** → Fit algorithm to data
4. **Model Evaluation** → Validate using appropriate metrics
5. **Model Tuning** → Improve using hyperparameter optimization
6. **Deployment** → Integrate model into production
7. **Monitoring & Retraining** → Track performance and retrain as needed

---

# **Machine Learning Cheat Sheet**

## **Preprocessing Techniques**

| **Technique**                                         | **Description**                                                         | **Purpose**                                                       | **Best Use-Cases**                                       | **Important Formula / Concept**                                 | **Major Libraries (Python)**                                  |
| ----------------------------------------------------- | ----------------------------------------------------------------------- | ----------------------------------------------------------------- | -------------------------------------------------------- | --------------------------------------------------------------- | ------------------------------------------------------------- |
| **Standardization (Z-score Scaling)**                 | Scales features to have **mean = 0** and **std = 1**.                   | Normalize feature ranges to improve ML model performance.         | Logistic Regression, SVM, KNN, PCA.                      | 𝑧 = (𝑥 - μ) / σ                                               | `sklearn.preprocessing.StandardScaler`                        |
| **Min-Max Scaling (Normalization)**                   | Scales features to a fixed range, usually **[0, 1]**.                   | Brings all features to a uniform scale.                           | Neural networks, distance-based models (e.g., k-NN).     | x_scaled = (x - min) / (max - min)                              | `sklearn.preprocessing.MinMaxScaler`                          |
| **Label Encoding**                                    | Converts categorical text labels to integer codes.                      | Handle categorical variables for ML models.                       | Ordinal categories (e.g., Low, Medium, High).            | Assign integer index to each unique category.                   | `sklearn.preprocessing.LabelEncoder`                          |
| **One-Hot Encoding**                                  | Converts categorical values to binary columns.                          | Handle nominal (unordered) categorical variables.                 | Country names, product types.                            | [0,1,0,...] vector representation for category.                 | `sklearn.preprocessing.OneHotEncoder`, `pandas.get_dummies()` |
| **Ordinal Encoding**                                  | Maps categories to ordered integers, respecting natural order.          | Preserve rank information of categorical features.                | Education level, satisfaction rating.                    | Category order → integer mapping (e.g., Low=1, Med=2, High=3).  | `sklearn.preprocessing.OrdinalEncoder`                        |
| **Missing Value Imputation**                          | Replaces missing data with mean, median, mode or model-based values.    | Handle incomplete data for robust training.                       | Medical datasets, survey data.                           | Mean: x̄ = ∑x/n; Median; Mode                                   | `sklearn.impute.SimpleImputer`, `pandas.fillna()`             |
| **Outlier Handling**                                  | Detects and removes or transforms extreme values.                       | Reduce model distortion from anomalies.                           | Financial fraud detection, sensor data cleaning.         | 𝑧 = (𝑥 - μ) / σ, IQR = Q3 - Q1                                | `scipy.stats.zscore`, `sklearn.preprocessing.RobustScaler`    |
| **Feature Selection**                                 | Selects most relevant features to reduce dimensionality.                | Improve model accuracy and reduce overfitting.                    | Text classification, genomics.                           | Techniques: Chi-squared test, mutual information                | `sklearn.feature_selection`, `SelectKBest`, `RFE`             |
| **Feature Extraction**                                | Derives new features from existing ones.                                | Capture important characteristics in new form.                    | Text mining (TF-IDF), image processing (HOG).            | TF-IDF = (Term Frequency) × log(1 + Inverse Document Frequency) | `sklearn.feature_extraction`, `TfidfVectorizer`               |
| **Random Upsampling**                                 | Duplicates minority class samples randomly until balance is achieved.   | Balance datasets by increasing minority class instances.          | Binary classification with imbalanced classes.           | Sampling with replacement of minority class.                    | `imblearn.over_sampling.RandomOverSampler`                    |
| **SMOTE (Synthetic Minority Oversampling Technique)** | Creates synthetic samples for minority class using nearest neighbors.   | Reduce class imbalance more effectively than random oversampling. | Fraud detection, medical diagnosis.                      | Synthetic sample = xi + (xj - xi) × δ (where δ ∈ [0,1])         | `imblearn.over_sampling.SMOTE`                                |
| **Random Downsampling**                               | Removes samples from majority class randomly until balance is achieved. | Balance datasets by reducing majority class size.                 | When dataset is very large and majority class dominates. | Random sampling without replacement from majority class.        | `imblearn.under_sampling.RandomUnderSampler`                  |


---

## **Supervised Learning Algorithms**

| **Algorithm**           | **Description**                                       | **Purpose**                            | **Best Use-Cases**                        | **Important Formula**                                                       | **Major Libraries**                                            |
|------------------------|-------------------------------------------------------|----------------------------------------|-------------------------------------------|---------------------------------------------------------------------------|---------------------------------------------------------------|
| **Linear Regression**   | Predicts continuous output based on input features.   | Predict continuous numerical outcomes  | House prices, sales forecast.             | 𝑦 = 𝛽₀ + 𝛽₁𝑥₁ + ... + 𝛽ₙ𝑥ₙ                                               | `sklearn.linear_model.LinearRegression`, `statsmodels`        |
| **Lasso Regression**    | Adds L1 penalty to regression for feature selection.  | Prevent overfitting, shrink weights    | Sparse datasets, high-dimensional data    | Loss = RSS + λ∑|βᵢ|                                                         | `sklearn.linear_model.Lasso`                                  |
| **Ridge Regression**    | Adds L2 penalty to regression to shrink coefficients. | Regularized regression                 | Multicollinearity problems                | Loss = RSS + λ∑βᵢ²                                                           | `sklearn.linear_model.Ridge`                                  |
| **Elastic Net**         | Combines L1 + L2 regularization.                      | Balanced feature selection & shrinkage | Correlated predictors                     | Loss = RSS + α(λ₁∑|βᵢ| + λ₂∑βᵢ²)                                            | `sklearn.linear_model.ElasticNet`                             |
| **Logistic Regression** | Predicts probability of class membership.             | Binary classification                  | Spam detection, purchase prediction       | 𝑝 = 1 / (1 + e^-(𝛽₀ + 𝛽₁𝑥₁ + ... + 𝛽ₙ𝑥ₙ))                                  | `sklearn.linear_model.LogisticRegression`                     |
| **Decision Tree**       | Splits data using features to form a tree structure.  | Classification or regression           | Customer segmentation, medical diagnosis  | Gini Index or Entropy for split: 𝐺 = 1 - ∑(pᵢ)²                             | `sklearn.tree.DecisionTreeClassifier`, `Regressor`            |
| **Random Forest**       | Combines multiple decision trees (ensemble).          | Boost accuracy, reduce variance        | Credit scoring, stock prediction          | Bagging-based voting or averaging of trees                                  | `sklearn.ensemble.RandomForestClassifier`                     |
| **SVM**                 | Finds optimal hyperplane between classes.             | Maximize margin                        | Image classification, OCR                 | f(x) = w·x + b; max margin = 2 / ||w||                                      | `sklearn.svm.SVC`, `LinearSVC`                                |
| **k-NN**                | Predicts label by k-nearest neighbors.                | Instance-based classification          | Recommendation systems, anomaly detection | Distance: Euclidean (√∑(xᵢ - yᵢ)²)                                          | `sklearn.neighbors.KNeighborsClassifier`                      |
| **Naive Bayes**         | Probabilistic classifier using Bayes' Theorem.        | Fast and simple classification         | Email spam, sentiment analysis            | P(y|x) ∝ P(x|y)P(y) / P(x)                                                   | `sklearn.naive_bayes.GaussianNB`, `MultinomialNB`            |
| **Ensemble Learning**   | Combines multiple models to improve performance.      | Boost accuracy and robustness          | Fraud detection, large-scale prediction   | Bagging (RF), Boosting: Final Prediction = ∑(αᵢ × hᵢ(x))                     | `sklearn.ensemble`, `xgboost.XGBClassifier`                   |


---

## **Unsupervised Learning Algorithms**

| **Algorithm**               | **Description**                                                       | **Purpose**                        | **Best Use-Cases**                       | **Important Formula / Concept**                                | **Major Libraries (Python)**         |
| --------------------------- | --------------------------------------------------------------------- | ---------------------------------- | ---------------------------------------- | -------------------------------------------------------------- | ------------------------------------ |
| **k-Means Clustering**      | Partitions data into **k** clusters based on distance from centroids. | Group similar data without labels  | Market segmentation, document clustering | WCSS = ∑ (xᵢ - μₖ)², Euclidean distance, update centroids      | `sklearn.cluster.KMeans`             |
| **PCA**                     | Projects data onto principal components to reduce dimensions.         | Dimensionality reduction           | Image compression, noise filtering       | Σ = (1/n)XᵀX, Eigen decomposition, select top-k eigenvectors   | `sklearn.decomposition.PCA`          |
| **DBSCAN**                  | Clusters based on density (core, border, noise points).               | Discover arbitrary shaped clusters | Spatial data, anomaly detection          | Epsilon neighborhood, minPts criteria                          | `sklearn.cluster.DBSCAN`             |
| **Hierarchical Clustering** | Builds nested clusters using bottom-up or top-down approach.          | Tree-like grouping                 | Gene expression, document clustering     | Dendrogram based, linkage criteria (single, complete, average) | `scipy.cluster.hierarchy`, `sklearn` |

---

## **Recommender Systems**

| **Algorithm**               | **Description**                                            | **Purpose**                         | **Best Use-Cases**            | **Important Formula / Concept**                  | **Major Libraries**                        |
| --------------------------- | ---------------------------------------------------------- | ----------------------------------- | ----------------------------- | ------------------------------------------------ | ------------------------------------------ |
| **Content-Based Filtering** | Recommends based on user history and item features.        | Personalized recommendations        | Product/movie recommendation  | Similarity = cosine(user\_profile, item\_vector) | `sklearn.metrics.pairwise`, `pandas`       |
| **Collaborative Filtering** | Recommends using interaction matrix among users and items. | Leverages behavior of similar users | Social networks, marketplaces | Matrix Factorization: R ≈ U·Vᵀ                   | `Surprise`, `LightFM`, `scipy.sparse`      |
| **Hybrid Recommendation**   | Combines both collaborative and content-based techniques.  | Improve accuracy                    | Netflix, Spotify, Amazon      | Weighted combination or stacking of both         | `LightFM`, `scikit-surprise`, `TensorFlow` |

---

## **Hyperparameter Tuning**

| **Technique**        | **Description**                                        | **Purpose**                     | **Best Use-Cases**                    | **Major Libraries**                          |
| -------------------- | ------------------------------------------------------ | ------------------------------- | ------------------------------------- | -------------------------------------------- |
| **Grid Search**      | Exhaustive search over specified parameter values.     | Best when search space is small | SVM, decision trees, etc.             | `sklearn.model_selection.GridSearchCV`       |
| **Random Search**    | Random combinations of parameters from distribution.   | Faster than grid search         | High-dimensional hyperparameter space | `sklearn.model_selection.RandomizedSearchCV` |
| **Cross-Validation** | Splits data into multiple train-test folds for tuning. | More robust evaluation          | Any model                             | `sklearn.model_selection.cross_val_score`    |
