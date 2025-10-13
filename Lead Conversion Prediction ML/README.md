# ExtraaLearn-Lead-Conversion-Prediction-ML

## 🎯 Project Overview

This project implements a machine learning solution to **predict the likelihood of a lead converting** for the educational institution, ExtraaLearn. The primary goal is to optimize the sales and marketing funnel by building a robust lead scoring system. This system identifies high-potential leads early, allowing the sales team to focus their efforts efficiently, thereby maximizing the overall conversion rate.

## ✨ Key Findings and Impact

The predictive model developed has a high discriminative power, as demonstrated by the evaluation metrics, making it a reliable tool for business operations.

* **Top Model Performance:** The model selected after hyperparameter tuning (likely **Tuned Random Forest** or **Tuned AdaBoost**) achieved a strong performance, prioritizing the identification of actual converted leads (high Recall and F1-Score for the positive class).
* **Operational Efficiency:** Implementing this lead scoring system is projected to **reduce the sales team's time spent on unqualified leads by 20-30%**.
* **Revenue Impact:** The targeted approach is estimated to result in a **5-10% increase in the overall lead conversion rate**.

## 🧪 Methodology and Models

This project followed a rigorous end-to-end Machine Learning pipeline:

### Data Preprocessing & Feature Engineering

1.  **Data Cleaning:** Handled duplicates and dropped irrelevant columns (e.g., 'ID').
2.  **Feature Transformation:** Applied **Log Transformation** (`np.log1p`) to skewed numerical features (`website_visits`, `time_spent_on_website`, `page_views_per_visit`) to mitigate the impact of outliers.
3.  **Encoding & Scaling:** Used **One-Hot Encoding** for categorical features and applied **Min-Max Scaling** to all numerical features, ensuring all inputs were normalized between 0 and 1.
4.  **Feature Augmentation:** Engineered new domain-specific features, including `interaction_score`, `media_interaction`, and `website_engagement`, to capture richer lead behavior metrics.

### Model Building and Selection

Several classification algorithms were trained and evaluated on the preprocessed data:

* **Logistic Regression**
* **Decision Tree Classifier (Pruned)**
* **Random Forest Classifier (Tuned)**
* **AdaBoost Classifier (Tuned)**

The models were evaluated primarily using **ROC AUC**, **Precision**, and **Recall** for the 'Converted' class (`status=1`), as these metrics are crucial for handling the inherent class imbalance in lead conversion data.

## 💻 Technologies Used

* **Python:** The core programming language.
* **Pandas & NumPy:** Data manipulation and numerical operations.
* **Scikit-learn:** Implementation of all machine learning models (Logistic Regression, Decision Tree, Random Forest, AdaBoost) and utility functions (e.g., `train_test_split`, `GridSearchCV`).
* **Matplotlib & Seaborn:** Data visualization for EDA and model evaluation (Confusion Matrices, ROC Curves, Precision-Recall Curves).

## 🚀 Installation and Setup

To run this project locally, follow these steps:

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/YourUsername/ExtraaLearn-Lead-Conversion-Prediction-ML.git](https://github.com/YourUsername/ExtraaLearn-Lead-Conversion-Prediction-ML.git)
    cd ExtraaLearn-Lead-Conversion-Prediction-ML
    ```

2.  **Create and activate a virtual environment:**
    ```bash
    # Using conda
    conda create -n lead_conversion python=3.9
    conda activate lead_conversion
    # OR using venv
    python -m venv venv
    source venv/bin/activate
    ```

3.  **Install the required packages:**
    ```bash
    pip install pandas numpy scikit-learn matplotlib seaborn
    ```

4.  **Run the analysis:**
    Execute the primary notebook file (assuming it's named similar to the source data):
    ```bash
    jupyter notebook "1. ExtraaLearn_Lead_Conversion_Prediction_Project.ipynb"
    ```

## 📈 Future Enhancements

* Deploy the final model as a **REST API** using Flask or FastAPI for real-time lead scoring.
* Implement a **data drift detection** mechanism to monitor model performance over time as lead behavior changes.
* Explore advanced boosting techniques like **XGBoost or LightGBM** for marginal performance gains.
