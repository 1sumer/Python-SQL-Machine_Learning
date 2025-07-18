from flask import Flask, request, render_template
import numpy as np
import pickle

app = Flask(__name__)

# Load the trained model (ensure model.pkl exists)
model = pickle.load(open('model.pkl', 'rb'))

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/predict', methods=['POST'])
def predict():
    try:
        income = float(request.form['income'])
        prediction = model.predict(np.array([[income]]))[0]
        return render_template('index.html', prediction_text=f'Predicted Happiness: {prediction:.2f}')
    except:
        return render_template('index.html', prediction_text="Invalid input.")

if __name__ == "__main__":
    app.run(debug=True)
