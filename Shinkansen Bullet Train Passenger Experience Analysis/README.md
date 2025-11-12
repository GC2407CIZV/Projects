# Shinkansen Bullet Train Passenger Experience Analysis

## Project Overview

This project presents an **enhanced machine learning analysis** aimed at predicting and understanding passenger satisfaction with the Shinkansen Bullet Train. Building upon an initial hackathon submission (which achieved 7th place out of 36 participants), this version focuses on robust data preprocessing, extensive feature engineering, and rigorous hyperparameter tuning to develop a highly accurate and interpretable predictive model.

**Goal**: To identify key factors influencing passenger satisfaction and build a robust predictive model, providing actionable insights to improve the Shinkansen travel experience.

## Table of Contents

- [Project Overview](#project-overview)
- [Key Features & Methodology](#key-features--methodology)
- [Dataset Description](#dataset-description)
- [Data Preprocessing](#data-preprocessing)
- [Exploratory Data Analysis (EDA) Highlights](#exploratory-data-analysis-eda-highlights)
- [Model Training & Evaluation](#model-training--evaluation)
- [Feature Importance](#feature-importance)
- [Conclusion & Future Work](#conclusion--future-work)
- [Technical Stack](#technical-stack)
- [How to Run This Project](#how-to-run-this-project)
- [Contact](#contact)

## Key Features & Methodology

This project demonstrates proficiency in several advanced data science techniques:

*   **Comprehensive Data Preprocessing**: Ensured consistent application of preprocessing steps (feature engineering, outlier capping) across both training and test datasets.
*   **Intelligent Missing Value Handling**: Leveraged the native ability of advanced boosting models (XGBoost, CatBoost) to handle `NaN` values, avoiding premature imputation that could bias results.
*   **Outlier Management**: Employed a robust capping strategy at the 95th percentile for critical numerical features (`Departure_Delay_in_Mins`, `Arrival_Delay_in_Mins`, `Travel_Distance`).
*   **Extensive Feature Engineering**: Created impactful new features such as `Total_Delay`, `Age_Group`, `Travel_Distance_Group`, `Departure_Delay_Group`, and `Arrival_Delay_Group`. Advanced interaction terms (e.g., `Customer_Type_x_Type_Travel`, `Customer_Type_Loyal Customer_x_Seat_Comfort_*`) and polynomial features (`Age_Squared`) were also engineered.
*   **Advanced Encoding**: Applied One-Hot Encoding to categorical features, meticulously managing the resulting high-dimensional space.
*   **Scalable Model Training**: Implemented and evaluated a suite of classification algorithms, focusing on high-performance tree-based and boosting methods (Decision Tree, Random Forest, XGBoost, LightGBM, CatBoost).
*   **Rigorous Hyperparameter Tuning**: Conducted extensive hyperparameter optimization on top-performing models using a variety of sophisticated methods:
    *   **GridSearchCV**
    *   **RandomizedSearchCV**
    *   **Hyperopt** (Bayesian Optimization)
    *   **Optuna** (Automated Hyperparameter Optimization Framework)
    *   **Manual Random, Grid, Iterative, and Sequential Searches** for fine-grained control and understanding.
*   **Performance Evaluation**: Utilized a comprehensive set of metrics including Accuracy, F1-score, Recall, Precision, and ROC AUC, with a strong focus on test set performance to ensure generalization.
*   **Interpretability**: Performed Feature Importance analysis on the best model to extract actionable insights into passenger satisfaction drivers.

## Dataset Description

The project utilizes two primary datasets, `Traveldata_train.csv` and `Surveydata_train.csv`, merged on a common `ID` column:

*   **`travel_df`**: Contains passenger demographics (`Gender`, `Customer_Type`, `Age`), travel details (`Type_Travel`, `Travel_Class`, `Travel_Distance`), and delay information (`Departure_Delay_in_Mins`, `Arrival_Delay_in_Mins`).
*   **`survey_df`**: Includes the target variable `Overall_Experience` (binary: 0 for negative, 1 for positive) and various categorical feedback ratings for services (e.g., `Seat_Comfort`, `Catering`, `Onboard_Wifi_Service`, `Online_Support`, `Cleanliness`).

An equivalent pair of test datasets (`Traveldata_test.csv` and `Surveydata_test.csv`) was used for final model prediction and submission.

## Data Preprocessing

1.  **Dataset Merging**: `travel_df` and `survey_df` were merged into a single `merged_df` using the `ID` column.
2.  **Missing Value Strategy**: Instead of imputation, missing values were kept as `NaN` to leverage the internal handling capabilities of chosen boosting models (XGBoost, CatBoost).
3.  **Outlier Handling**: Outliers in `Departure_Delay_in_Mins`, `Arrival_Delay_in_Mins`, and `Travel_Distance` were capped at their respective 95th percentiles to mitigate their impact on model performance.
4.  **Feature Engineering**:
    *   `Total_Delay`: Sum of departure and arrival delays.
    *   `Age_Group`: Categorical bins for passenger ages (Youth, Young Adult, Middle-aged, Senior).
    *   `Travel_Distance_Group`: Categorical bins for travel distances (Short, Medium, Long, Very Long).
    *   `Departure_Delay_Group` & `Arrival_Delay_Group`: Categorical bins for delay minutes (No Delay, Short Delay, Medium Delay, Long Delay).
    *   **Enhanced Features**: Interaction terms (e.g., `Customer_Type_x_Seat_Comfort`), a polynomial feature (`Age_Squared`), and a binary `Has_Delay` feature were created to capture more complex relationships.
5.  **Categorical Encoding**: All categorical features, including the newly engineered ones, were transformed using One-Hot Encoding.
6.  **Numerical Scaling**: Numerical features were scaled using `StandardScaler` to ensure consistent data ranges.
7.  **Data Splitting**: The preprocessed data was split into 80% training and 20% testing sets.

## Exploratory Data Analysis (EDA) Highlights

*   **Target Variable Distribution**: `Overall_Experience` was found to be relatively balanced, indicating suitability for classification without severe class imbalance issues.
*   **Feature Distributions**: `Age` was approximately normally distributed, `Travel_Distance` was right-skewed, and `Customer_Type` showed a strong dominance of 'Loyal Customers'. Delays were heavily skewed towards zero.
*   **Multivariate Relationships**: Significant relationships were observed between feedback features (e.g., `Seat_Comfort`, `Onboard_Entertainment`) and `Overall_Experience`. Higher delays correlated with negative experiences, and 'Business Travel' customers tended to have more positive experiences.
*   **Correlations**: A strong positive correlation between `Departure_Delay_in_Mins` and `Arrival_Delay_in_Mins` was noted, as expected.

## Model Training & Evaluation

Several classification models were trained and evaluated on the preprocessed data:

*   Decision Tree Classifier
*   Random Forest Classifier
*   Extreme Gradient Boosting (XGBoost)
*   Light Gradient Boosting Machine (LightGBM)
*   CatBoost

The initial evaluation showed that **CatBoost** and **XGBoost** were the top performers. Extensive hyperparameter tuning was then applied to CatBoost using various methods:

*   GridSearchCV
*   RandomizedSearchCV
*   Hyperopt
*   Optuna
*   Manual Random Search
*   Manual Grid Search
*   Manual Iterative Search
*   Manual Sequential Search

The **CatBoost (Tuned - Manual Sequential)** model emerged as the best performer, achieving the highest test accuracy:

| Model                                  | Accuracy (Test) | F1-score (Test) | Recall (Test) | Precision (Test) | ROC AUC (Test) |
| :------------------------------------- | :-------------- | :-------------- | :------------ | :--------------- | :------------- |
| **CatBoost (Tuned - Manual Sequential)** | **0.9597**      | **0.9634**      | **0.9593**    | **0.9676**       | **0.9943**     |

This significant performance highlights the effectiveness of rigorous preprocessing, feature engineering, and advanced hyperparameter tuning.

## Feature Importance

The feature importance analysis from the best CatBoost model revealed that the most influential factors in predicting passenger satisfaction were:

1.  **Seat Comfort**: Various ratings (Excellent, Extremely Poor, Good, Poor, Needs Improvement, Acceptable).
2.  **Onboard Entertainment**: Ratings like 'Excellent', 'Good'.
3.  **Type of Travel**: 'Personal Travel' and 'Business Travel'.
4.  **Age**
5.  **Customer Type**: 'Disloyal Customer' and 'Loyal Customer'.

Other important features included `Ease of Online Booking_Good`, `Gender_Female`, `Travel_Class_Business`, `CheckIn_Service_Excellent`, `Travel_Distance`, `Online_Support_Excellent`, and `Platform_Location_Convenient`.

These findings underscore the critical role of in-flight comfort and entertainment, along with customer demographics and travel purpose, in shaping the overall passenger experience.

## Conclusion & Future Work

The project successfully developed a highly accurate predictive model for Shinkansen passenger satisfaction, with the **tuned CatBoost model** demonstrating exceptional performance. The detailed feature importance analysis provides clear, actionable insights for service improvements.

**Future work could include**:

*   Exploring more advanced ensemble techniques or stacking models.
*   Investigating non-linear relationships or more complex interaction terms.
*   Further expanding the search space and increasing `n_trials`/`max_evals` for hyperparameter optimization, given sufficient computational resources.
*   Deployment of the model for real-time predictions.

## Technical Stack

*   **Python** (3.x)
*   **Data Manipulation**: `pandas`, `numpy`
*   **Data Visualization**: `matplotlib`, `seaborn`
*   **Machine Learning**: `scikit-learn` (for preprocessing, model selection, evaluation, Decision Tree, Random Forest), `xgboost`, `lightgbm`, `catboost`
*   **Hyperparameter Optimization**: `optuna`, `hyperopt`, `scipy.stats` (for distributions in `RandomizedSearchCV`)

## How to Run This Project

1.  **Clone the repository**:
    ```bash
    git clone <your-repo-link>
    cd shinkansen-passenger-experience
    ```
2.  **Install dependencies**:
    ```bash
    pip install -r requirements.txt
    ```
    (A `requirements.txt` file listing `pandas`, `numpy`, `matplotlib`, `seaborn`, `scikit-learn`, `xgboost`, `lightgbm`, `catboost`, `optuna`, `hyperopt` should be created).
3.  **Download the datasets**: Ensure `Traveldata_train_(1).csv`, `Surveydata_train_(1).csv`, `Traveldata_test_(1).csv`, and `Surveydata_test_(1).csv` are placed in the `/content/` directory or update the file paths in the notebook.
4.  **Run the Jupyter Notebook**:
    Open `Shinkansen_Bullet_Train_Passenger_Experience_Analysis.ipynb` in a Jupyter environment (e.g., Google Colab, Jupyter Lab) and execute the cells sequentially.

## Contact

Feel free to connect with me for questions or collaboration:

*   **LinkedIn**: [Gregory Charles](https://www.linkedin.com/in/gregory-charles-7a460550/)
