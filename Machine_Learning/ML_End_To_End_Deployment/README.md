# 🧠 Happiness Predictor Web Application

A lightweight, interactive web application built using **Flask** and **scikit-learn** that predicts an individual's happiness score based on their income. This application utilizes a simple **Linear Regression** model and is fully deployable on **Render**.

---

## ✨ Features

- 🔍 Predict happiness based on income
- 🧠 Machine Learning model built with `scikit-learn`
- 🌐 Frontend using HTML and CSS
- ⚙️ Backend using Flask
- ☁️ Cloud deployment ready (Render-compatible)

---

## 📊 Demo

> Add a screenshot or a live link here if available  
> Example: `https://happiness-predictor.onrender.com`

---

## 📁 Project Structure

```

happiness-predictor/
│
├── app.py                 # Main Flask application
├── model.pkl              # Pre-trained Linear Regression model
├── requirements.txt       # Python dependencies
├── render.yaml            # Deployment configuration for Render
│
├── templates/
│   └── index.html         # Frontend HTML
│
└── static/
└── style.css          # CSS styling

````

---

## ⚙️ Getting Started

Follow the instructions below to set up and run the project locally.

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/happiness-predictor.git
cd happiness-predictor
````

### 2. Set Up Virtual Environment

```bash
python -m venv venv
# Windows
venv\Scripts\activate
```

### 3. Install Dependencies

```bash
pip install -r requirements.txt
```

### 4. Run the Application

```bash
python app.py
```

Navigate to `http://127.0.0.1:5000` in your browser to use the app.

---

## 🧠 Model Overview

This project uses a simple **Linear Regression** model trained on synthetic data to predict happiness scores based on income.


---

## ☁️ Deployment on Render

### 1. Create `render.yaml`

```yaml
services:
  - type: web
    name: happiness-predictor
    env: python
    buildCommand: ""
    startCommand: gunicorn app:app
    plan: free
    region: oregon
```

### 2. Create a GitHub Repository

* Push your local project to GitHub.

### 3. Deploy to Render

* Go to [https://render.com](https://render.com)
* Click "New Web Service"
* Connect your GitHub repo
* Fill in the details:

  * **Start command**: `gunicorn app:app`
  * **Environment**: Python
  * **Build command**: (optional) `pip install -r requirements.txt`
* Render will automatically build and deploy your app.

---

## ✅ Requirements

Your `requirements.txt` should include:

```txt
Flask==2.3.3
gunicorn==21.2.0
scikit-learn==1.4.2
numpy==1.26.4
```

---

## 🔒 Security Notes

* Input validation is handled minimally. Consider sanitizing inputs more rigorously in production.
* Avoid using `pickle` for untrusted data sources.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙋‍♂️ Author

Developed by **\[Sumer Pasha]**
GitHub: [@1sumer](https://github.com/1sumer)
LinkedIn: [Sumer Pasha](https://www.linkedin.com/in/sumer-pasha-70884a152/)


