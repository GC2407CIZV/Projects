# Salifort Motors Employee Turnover Prediction Project

[![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)](https://www.python.org/)
[![Pandas](https://img.shields.io/badge/Pandas-150458?style=flat-square&logo=pandas&logoColor=white)](https://pandas.pydata.org/)
[![NumPy](https://img.shields.io/badge/NumPy-013243?style=flat-square&logo=numpy&logoColor=white)](https://numpy.org/)
[![Scikit-learn](https://img.shields.io/badge/Scikit_learn-F7931E?style=flat-square&logo=scikit-learn&logoColor=white)](https://scikit-learn.org/stable/)
[![Matplotlib](https://img.shields.io/badge/Matplotlib-348EBB?style=flat-square&logo=matplotlib&logoColor=white)](https://matplotlib.org/)
[![Seaborn](https://img.shields.io/badge/Seaborn-4CB5AA?style=flat-square&logo=seaborn&logoColor=white)](https://seaborn.pydata.org/)
[![XGBoost](https://img.shields.io/badge/XGBoost-82C092?style=flat-square&logo=xgboost&logoColor=white)](https://xgboost.readthedocs.io/en/stable/)

This repository contains the analysis and predictive modeling for employee turnover at Salifort Motors, a fictional consulting firm. This project aims to provide data-driven insights to the Human Resources (HR) department to improve employee retention.

## Project Overview

The HR department at Salifort Motors is concerned about high employee turnover rates. They seek to understand the key factors contributing to this issue and develop effective retention strategies. This project utilizes employee survey data to build predictive models and identify actionable insights.

## Files

* **`Salifort Motors project lab.ipynb`**: Jupyter Notebook containing the complete data analysis, model building, and evaluation process.
* **`PACE strategy document.pdf`**: PDF document detailing the project's planning, analysis, construction, evaluation, and execution stages using the PACE methodology.
* **`Executive summary.pdf`**: PDF document summarizing the project's findings, recommendations, and actionable steps for stakeholders.
* **`HR_capstone_dataset.csv`**: The dataset used for analysis, containing employee survey data.
* **`Project Overview.pdf`**: Overview of the activity and the project scope.
* **`README.md`**: This file, providing an overview of the project.

## Methodology

This project follows the PACE (Plan, Analyze, Construct, Evaluate, Execute) methodology:

1.  **Plan:** Define the problem, stakeholders, goals, and initial data observations.
2.  **Analyze:** Perform exploratory data analysis (EDA), clean the data, and identify key relationships and patterns.
3.  **Construct:** Build and train predictive models (Logistic Regression, Decision Tree, XGBoost, Random Forest, SVM).
4.  **Evaluate:** Evaluate model performance using relevant metrics (accuracy, precision, recall, F1-score, AUC-ROC, Cohen's Kappa).
5.  **Execute:** Interpret model results, provide actionable recommendations, and conduct simulated A/B testing.

## Data

The dataset (`HR_capstone_dataset.csv`) contains 15,000 rows and 10 columns:

* `satisfaction_level`: Employee-reported job satisfaction level [0–1]
* `last_evaluation`: Score of employee's last performance review [0–1]
* `number_project`: Number of projects employee contributes to
* `average_monthly_hours`: Average number of hours employee worked per month
* `time_spend_company`: How long the employee has been with the company (years)
* `Work_accident`: Whether or not the employee experienced an accident while at work
* `left`: Whether or not the employee left the company
* `promotion_last_5years`: Whether or not the employee was promoted in the last 5 years
* `Department`: The employee's department
* `salary`: The employee's salary (U.S. dollars)

## Key Findings

* XGBoost (tuned) and Random Forest models demonstrated the best performance in predicting employee turnover.
* Key factors influencing turnover include employee satisfaction, workload (number of projects, average monthly hours), tenure, and salary.
* Simulated A/B tests suggest that mentorship programs, flexible work hours, and enhanced training can significantly improve employee retention and satisfaction.
* Logistic Regression showed poor performance due to class imbalance and multicollinearity.

## Recommendations

* Implement the tuned XGBoost model for proactive identification of at-risk employees.
* Focus on improving employee satisfaction, managing workloads, and ensuring competitive salaries.
* Develop targeted retention strategies for high-turnover departments.
* Conduct real-world A/B testing to evaluate the effectiveness of HR interventions.
* Enhance data collection and monitoring systems.
* Prioritize ethical considerations and transparency in model usage.

## Getting Started

1.  Clone this repository to your local machine.
2.  Ensure you have Python and the required libraries installed. You can install them using `pip install pandas numpy scikit-learn matplotlib seaborn xgboost`.
3.  Open and run the `Salifort Motors project lab.ipynb` Jupyter Notebook to reproduce the analysis and modeling.
4.  Review the `PACE strategy document.pdf` and `Executive summary.pdf` for detailed insights and recommendations.

## Author

Gregory Charles

