import pandas as pd
import statsmodels.api as sm
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score
import joblib

data = pd.read_csv(r"D:\Python-SQL-Repository\Dataset\income.data.csv").drop('Unnamed: 0', axis=1)
data.head()

# Assuming you have a DataFrame named 'data' with columns 'income' and 'happiness'
X = data[['income']]
y = data['happiness']

# Split data into training and testing sets (80% train, 20% test)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Initialize and train the linear regression model
model = LinearRegression()
model.fit(X_train, y_train)

# Make predictions on the test set
y_pred = model.predict(X_test)

mse = mean_squared_error(y_test, y_pred) # Cost function
r2 = r2_score(y_test, y_pred) # cost function

print(f"Mean Squared Error (MSE): {mse:.2f}")
print(f"R-squared (R²): {r2:.4f}")

# Save the model using joblib
#joblib.dump(model, 'linear_regression_model.pkl')