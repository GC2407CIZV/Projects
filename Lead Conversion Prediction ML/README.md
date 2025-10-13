# ExtraaLearn Lead Conversion Prediction ML

## 🚀 Project Summary

This project delivers an end-to-end **Machine Learning (ML)** solution to build a robust **Lead Scoring System** for the educational institution, ExtraaLearn. The primary objective was to prioritize leads with the highest probability of conversion, enabling the sales team to shift from a high-volume, low-efficiency strategy to a **targeted, data-driven approach**.

The resulting predictive models (Tuned XGBoost and Tuned AdaBoost) provide a generalized and highly effective system for identifying high-potential prospects, directly impacting operational efficiency and revenue growth.

---

## ✨ Key Findings and Business Impact

The implementation of the chosen model is projected to yield significant, measurable business gains:

| Business Metric | Model Projection (Estimated Lift) |
| :--- | :--- |
| **Sales Team Efficiency** | **20-30%** reduction in time spent on low-potential leads. |
| **Overall Conversion Rate** | **5-10%** increase within the next quarter due to optimized prioritization. |
| **Workflow** | Establishes a **data-driven lead management workflow** for continuous optimization. |

### Top Performing Models

We evaluated several advanced classification models, and the **Tuned XGBoost Classifier** and **Tuned AdaBoost Classifier** emerged as the top performers on unseen data, demonstrating strong generalization and high predictive power.

| Model | Metric | Value (Test Set) | Business Justification |
| :--- | :--- | :--- | :--- |
| **Tuned XGBoost** | **ROC AUC** | **0.931** | Highest overall **discriminatory power** (ability to separate classes). |
| **Tuned AdaBoost** | **F1-Score (Converted)** | **0.784** | Superior ability in **correctly identifying actual converted leads** (minimizing false negatives). |

### Model Performance Comparison (Test Set)

The table below summarizes the key performance metrics on the independent test dataset:

| Model | Accuracy | Precision | Recall | **F1-score** | **ROC AUC** | Training Time (s) |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Tuned XGBoost** | 0.865 | 0.801 | 0.756 | 0.778 | **0.931** | 0.45 |
| **Tuned Random Forest** | 0.858 | 0.800 | 0.725 | 0.761 | 0.928 | 1.75 |
| **Tuned AdaBoost** | 0.867 | 0.796 | **0.774** | **0.784** | 0.927 | 2.98 |
| **Pruned Decision Tree** | 0.861 | 0.807 | 0.728 | 0.766 | 0.919 | 0.03 |
| Logistic Regression | 0.845 | 0.788 | 0.686 | 0.734 | 0.883 | 0.06 |

### Actionable Insights

Feature importance analysis consistently highlighted the most crucial factors driving lead conversion, which should guide marketing strategy:

* **Website Engagement:** High **`time_spent_on_website`** and **`first_interaction_Website`**.
* **Profile Completion:** **'High'** or **'Medium'** profile status.
* **Referral:** Leads acquired through **`Referral`** channels.
* **Occupation:** **'Professional'** leads.

---

## 🔬 Data Science Pipeline & Expertise

This project followed a rigorous, end-to-end data science methodology, demonstrating expertise in statistical analysis, feature engineering, and advanced machine learning modeling—key skills for a data science career.

### Specialized Techniques & Expertise

| Category | Technique Used | Rationale / Skill Demonstrated |
| :--- | :--- | :--- |
| **Modeling** | **XGBoost & AdaBoost** | Expertise in **Gradient Boosting** and **Ensemble Learning** to maximize predictive power. |
| **Optimization** | **Hyperparameter Tuning** | Systematically optimized models to achieve peak performance and prevent **overfitting**. |
| **Feature Engineering** | **`np.log1p` & Scaling** | Handled data **skewness** and **outliers** with Log Transformation; applied **Min-Max Scaling** for model readiness. |
| **Evaluation** | **ROC AUC, F1-Score** | Used advanced metrics to address **class imbalance** (lead conversion is rare) and ensure high business value. |
| **Data Integrity** | **Pruning/Regularization** | Successfully overcame **overfitting** observed in untuned models (Decision Tree, Random Forest). |

### Data Preprocessing & Feature Engineering

1.  **Cleaning:** Removed irrelevant columns (`ID`) and duplicate entries.
2.  **Transformation:** Applied **Log Transformation** to numerical features to mitigate skewness.
3.  **Scaling:** Applied **Min-Max Scaling** to normalize all numerical features (0 to 1).
4.  **Encoding:** Used **One-Hot Encoding** for all categorical variables.
5.  **Feature Augmentation:** Engineered custom behavioral features (e.g., **`interaction_score`**) to provide richer context to the models.

---

## 💻 Technologies Used

* **Python:** The core programming language.
* **Pandas & NumPy:** Data manipulation and numerical operations.
* **Scikit-learn:** Implementation of models and utilities (scaling, encoding, tuning).
* **XGBoost:** For the Tuned XGBoost Classifier model.
* **Matplotlib & Seaborn:** Data visualization for EDA and model evaluation.

---

## ⚙️ Installation and Setup

To run this project locally, follow these steps:

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/YourUsername/ExtraaLearn-Lead-Conversion-Prediction-ML.git](https://github.com/YourUsername/ExtraaLearn-Lead-Conversion-Prediction-ML.git)
    cd ExtraaLearn-Lead-Conversion-Prediction-ML
    ```

2.  **Create and activate a virtual environment** (recommended):
    ```bash
    # Using conda
    conda create -n lead_conversion python=3.9
    conda activate lead_conversion
    ```

3.  **Install the required packages:**
    ```bash
    pip install pandas numpy scikit-learn xgboost matplotlib seaborn
    ```

4.  **Run the analysis:**
    Execute the primary notebook file (e.g., `ExtraaLearn_Lead_Conversion_Prediction_Project.ipynb`) using Jupyter Notebook.
    
