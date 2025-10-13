# ExtraaLearn Lead Conversion Prediction ML

## 🚀 Project Summary

This project delivered an end-to-end **Machine Learning (ML)** solution to build a robust **Lead Scoring System** for the educational institution, ExtraaLearn. The primary objective was to prioritize leads with the highest probability of conversion, enabling the sales team to shift from a high-volume, low-efficiency strategy to a **targeted, data-driven approach**.

The resulting predictive models (Tuned XGBoost and Tuned AdaBoost) provide a generalized and highly effective system for identifying high-potential prospects, directly impacting operational efficiency and revenue growth.

---

## 💡 Project Context & Objective

### Context

The online EdTech market is experiencing rapid growth (projected to be worth **$286.62bn by 2023**). With many new companies entering the space, identifying and efficiently prioritizing high-value leads is crucial for competitive advantage. ExtraaLearn, an initial stage startup, faces the challenge of a large volume of leads with limited resources, necessitating a smart, predictive solution.

### Objective

1.  **Analyze and build an ML model** to help identify which leads are more likely to convert to paid customers.
2.  **Find the factors driving** the lead conversion process.
3.  **Create a profile** of the leads which are likely to convert to efficiently allocate sales resources.

---

## ✨ Key Findings and Business Impact

The implementation of the chosen model is projected to yield significant, measurable business gains:

| Business Metric | Model Projection (Estimated Lift) |
| :--- | :--- |
| **Sales Team Efficiency** | **20-30%** reduction in time spent on low-potential leads. |
| **Overall Conversion Rate** | **5-10%** increase within the next quarter due to optimized prioritization. |
| **Workflow** | Establishes a **data-driven lead management workflow** for continuous optimization. |

### Top Performing Models

The **Tuned XGBoost Classifier** and **Tuned AdaBoost Classifier** emerged as the top performers, demonstrating strong generalization and high predictive power on unseen data.

| Model | Metric | Value (Test Set) | Business Justification |
| :--- | :--- | :--- | :--- |
| **Tuned XGBoost** | **ROC AUC** | **0.931** | Highest overall **discriminatory power** (ability to separate classes). |
| **Tuned AdaBoost** | **F1-Score (Converted)** | **0.784** | Superior ability in **correctly identifying actual converted leads** (minimizing false negatives). |

### Model Performance Comparison (Test Set)

| Model | Accuracy | Precision | Recall | **F1-score** | **ROC AUC** | Training Time (s) |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Tuned XGBoost** | 0.865 | 0.801 | 0.756 | 0.778 | **0.931** | 0.45 |
| **Tuned Random Forest** | 0.858 | 0.800 | 0.725 | 0.761 | 0.928 | 1.75 |
| **Tuned AdaBoost** | 0.867 | 0.796 | **0.774** | **0.784** | 0.927 | 2.98 |
| **Pruned Decision Tree** | 0.861 | 0.807 | 0.728 | 0.766 | 0.919 | 0.03 |

### Actionable Insights (Profile of Likely Converters)

Feature importance analysis consistently highlighted the characteristics of high-potential leads:

* **High Engagement:** Leads who spend significant **`time_spent_on_website`** and initially interacted through the **`Website`**.
* **High Intent:** Leads with **'High'** or **'Medium'** profile completion status.
* **Valuable Source:** Leads acquired through **`Referral`** channels.
* **Professional Status:** Leads with **'Professional'** occupation.

---

## 🔬 Data Science Pipeline & Expertise

This project demonstrates expertise in statistical analysis, feature engineering, and advanced machine learning modeling—key skills for a data science career.

### Specialized Techniques & Expertise

| Category | Technique Used | Rationale / Skill Demonstrated |
| :--- | :--- | :--- |
| **Modeling** | **XGBoost & AdaBoost** | Expertise in **Gradient Boosting** and **Ensemble Learning** to maximize predictive power. |
| **Optimization** | **Hyperparameter Tuning** | Systematically optimized models to achieve peak performance and prevent **overfitting**. |
| **Feature Engineering** | **`np.log1p` & Scaling** | Handled data **skewness** and **outliers**; applied **Min-Max Scaling** for model readiness. |
| **Evaluation** | **ROC AUC, F1-Score** | Used advanced metrics to address **class imbalance** and ensure high business value. |

### Data Preprocessing & Feature Engineering

1.  **Cleaning:** Removed irrelevant columns (`ID`) and duplicate entries.
2.  **Transformation:** Applied **Log Transformation** to numerical features to mitigate skewness.
3.  **Scaling:** Applied **Min-Max Scaling** to normalize all numerical features.
4.  **Encoding:** Used **One-Hot Encoding** for all categorical variables.
5.  **Feature Augmentation:** Engineered custom behavioral features (e.g., **`interaction_score`**) to provide richer context to the models.

---

## 📚 Data Dictionary

The data contains the different attributes of leads and their interaction details with ExtraaLearn:

| Feature Name | Description | Values |
| :--- | :--- | :--- |
| **ID** | ID of the lead | N/A |
| **age** | Age of the lead | Numeric |
| **current_occupation** | Current occupation of the lead. | 'Professional', 'Unemployed', 'Student' |
| **first_interaction** | How the lead first interacted with ExtraaLearn. | 'Website', 'Mobile App' |
| **profile_completed** | Percentage of profile filled by the lead. | Low (0-50%), Medium (50-75%), High (75-100%) |
| **website_visits** | Number of times a lead has visited the website. | Numeric |
| **time_spent_on_website** | Total time spent on the website. | Numeric |
| **page_views_per_visit** | Avg. number of pages on the website viewed during visits. | Numeric |
| **last_activity** | Last interaction between the lead and ExtraaLearn. | Email, Phone, or Website Activity details |
| **print_media_type1/2** | Flag indicating if the lead saw the ad in Newspaper/Magazine. | Binary Flag |
| **digital_media** | Flag indicating if the lead saw the ad on digital platforms. | Binary Flag |
| **educational_channels** | Flag indicating if the lead heard about ExtraaLearn in education channels (forums, etc.). | Binary Flag |
| **referral** | Flag indicating if the lead heard about ExtraaLearn through reference. | Binary Flag |
| **status** | **Target Variable:** Flag indicating whether the lead was converted to a paid customer. | Binary Flag (0 or 1) |

---

## 💻 Technologies Used

* **Python**
* **Pandas & NumPy**
* **Scikit-learn**
* **XGBoost**
* **Matplotlib & Seaborn**

---

## ⚙️ Installation and Setup

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/YourUsername/ExtraaLearn-Lead-Conversion-Prediction-ML.git](https://github.com/YourUsername/ExtraaLearn-Lead-Conversion-Prediction-ML.git)
    cd ExtraaLearn-Lead-Conversion-Prediction-ML
    ```

2.  **Install the required packages:**
    ```bash
    pip install pandas numpy scikit-learn xgboost matplotlib seaborn
    ```

3.  **Run the analysis:**
    Execute the primary notebook file (e.g., `ExtraaLearn_Lead_Conversion_Prediction_Project.ipynb`) using Jupyter Notebook.
