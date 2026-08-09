# 👥 Salifort Motors Employee Turnover Prediction

**HR Analytics · Machine Learning · XGBoost · Random Forest · A/B Testing**

> **Project Context:** Google Advanced Data Analytics Professional Certificate Capstone

Developed an end-to-end **employee-turnover prediction and HR analytics workflow** for Salifort Motors, using employee survey data to identify attrition risk, uncover major turnover drivers, compare multiple classification models, and translate model insights into actionable retention strategies.

Using **Python, Scikit-learn, XGBoost, statistical analysis, and the PACE framework**, I progressed from data quality assessment and exploratory analysis through model development, hyperparameter tuning, evaluation, feature-importance analysis, and simulated A/B testing of potential HR interventions.

---

## ⭐ Key Highlights

- Analyzed an HR dataset containing approximately **15,000 employee records** and 10 workforce-related variables.
- Identified and removed **3,008 duplicate records** and investigated **824 tenure outliers** during data-quality assessment.
- Explored turnover relationships across **satisfaction, workload, tenure, salary, department, evaluation scores, promotions, and workplace accidents**.
- Built and compared multiple classification approaches, including **Logistic Regression, Decision Tree, Random Forest, XGBoost, and SVM**.
- Evaluated models using metrics suited to an imbalanced classification problem, including **ROC AUC, F1-score, Balanced Accuracy, and Cohen's Kappa**.
- Tuned XGBoost to achieve a documented **ROC AUC of 0.9804** and **Cohen's Kappa of 0.9248**.
- Found **employee satisfaction, number of projects, tenure, evaluation score, and average monthly hours** among the strongest predictive signals.
- Conducted **simulated A/B tests** to explore the potential effects of mentorship, flexible work, salary changes, and training initiatives.
- Incorporated **fairness, privacy, transparency, human oversight, and model-monitoring considerations** into the proposed HR deployment strategy.

---

## 🎯 Problem & Objectives

Salifort Motors is a fictional global alternative-energy vehicle manufacturer facing high employee turnover.

Employee attrition creates business costs through:

- recruitment and onboarding;
- training and professional development;
- productivity disruption;
- loss of institutional knowledge;
- reduced workforce stability and morale.

The project addressed three core questions:

1. **What factors are associated with employees leaving the company?**
2. **Can employee turnover be predicted accurately enough to support proactive retention efforts?**
3. **What HR interventions should the organization investigate or test based on the analysis?**

The intended stakeholders were **Salifort Motors' senior leadership team and HR department**.

---

## 🔄 Project Workflow

The project followed Google's **PACE — Plan, Analyze, Construct, Execute — framework**.

```text
Business Problem
       ↓
PLAN
Define stakeholders, objectives,
scope, metrics & ethical considerations
       ↓
ANALYZE
Data inspection → cleaning → EDA
→ correlations → turnover patterns
       ↓
CONSTRUCT
Feature preparation → model training
→ comparison → XGBoost tuning
       ↓
EVALUATE
ROC AUC → F1 → Balanced Accuracy
→ Cohen's Kappa → feature importance
       ↓
EXECUTE
Business interpretation → simulated A/B tests
→ HR recommendations → deployment considerations
```

This structure kept the technical work connected to the original business objective rather than treating model performance as the only measure of success.

---

## 📊 Data

The dataset contains employee survey and workforce information with the following variables:

| Feature | Description |
| --- | --- |
| `satisfaction_level` | Employee-reported job satisfaction score |
| `last_evaluation` | Most recent performance evaluation score |
| `number_project` | Number of projects assigned |
| `average_monthly_hours` | Average hours worked per month |
| `time_spend_company` | Employee tenure in years |
| `work_accident` | Whether the employee experienced a workplace accident |
| `left` | **Target:** whether the employee left the company |
| `promotion_last_5years` | Whether the employee received a promotion in the previous five years |
| `department` | Employee department |
| `salary` | Salary category |

The target variable, `left`, is binary:

```text
0 → Employee stayed
1 → Employee left
```

### Data Quality Assessment

Initial inspection identified:

- **no missing values**;
- **3,008 duplicate rows**, which were removed;
- **824 observations flagged as tenure outliers**;
- a mixture of numerical and categorical variables;
- **class imbalance** in the turnover target.

These findings influenced both preprocessing and model evaluation.

---

## 🔍 Exploratory Data Analysis

EDA combined descriptive statistics with visual analysis to understand employee behavior before modeling.

Techniques included:

- histograms;
- count plots;
- box plots;
- correlation heatmaps;
- pair plots;
- categorical comparisons;
- duplicate and missing-value checks;
- outlier analysis.

The analysis focused particularly on the relationships between turnover and:

- satisfaction;
- salary;
- number of projects;
- average monthly hours;
- tenure;
- department.

### Key Behavioral Patterns

The analysis indicated that turnover was associated with several interacting factors rather than a single variable.

Important patterns included:

- **lower satisfaction** among employees who left;
- workload differences involving **project count and working hours**;
- meaningful turnover patterns across **employee tenure**;
- differences associated with **salary levels**;
- variation across departments.

The results suggested that employee attrition is a **non-linear, multivariate problem**, making tree-based ensemble methods particularly appropriate.

---

## 🧠 Modeling Strategy

The project compared several classification algorithms rather than selecting a model in advance.

### Models Explored

- Logistic Regression
- Decision Tree
- Random Forest
- XGBoost
- Support Vector Machine (SVM)

Categorical variables were encoded for modeling, and scaling was applied where appropriate.

### Why Multiple Metrics?

Accuracy alone can be misleading when the target classes are imbalanced.

The models were therefore evaluated using:

| Metric | Why It Matters |
| --- | --- |
| **ROC AUC** | Measures the model's ability to distinguish employees who leave from those who stay across classification thresholds |
| **F1-score** | Balances precision and recall |
| **Balanced Accuracy** | Accounts for unequal representation of the target classes |
| **Cohen's Kappa** | Measures predictive agreement beyond what could occur by chance |
| **Precision / Recall** | Helps evaluate the operational cost of false positives and false negatives |

For this business problem, **false negatives are particularly important**: failing to identify an employee who subsequently leaves can result in replacement costs, lost knowledge, and operational disruption.

At the same time, excessive false positives could waste retention resources or cause employees to feel unfairly targeted.

---

## 🏆 Model Performance

Tree-based models substantially outperformed the linear baseline.

The strongest documented model was the **tuned XGBoost classifier**.

### Tuned XGBoost

| Metric | Documented Result |
| --- | ---: |
| **ROC AUC** | **0.9804** |
| **Cohen's Kappa** | **0.9248** |

The strong ROC AUC indicates excellent discrimination between employees who stayed and employees who left, while the high Kappa score indicates strong agreement beyond chance.

### Why XGBoost Performed Well

The turnover problem contains:

- non-linear relationships;
- interactions between workload, satisfaction, tenure, and other variables;
- categorical effects;
- class imbalance;
- complex decision boundaries.

Tree-based ensemble models can capture these patterns more effectively than a simple linear decision boundary.

Hyperparameter tuning further improved XGBoost's predictive performance.

---

## 📈 Feature Importance & Business Interpretation

Feature-importance analysis from the tuned XGBoost model highlighted several major predictive signals.

The strongest features included:

1. **Satisfaction level**
2. **Number of projects**
3. **Tenure**
4. **Last evaluation**
5. **Average monthly hours**

Additional signals included workplace accidents, salary levels, promotion history, and department-related features.

These findings reinforce an important business interpretation:

> Employee turnover appears to reflect a combination of **employee experience, workload, career stage, and compensation factors**, rather than any single isolated cause.

Feature importance is predictive rather than causal. A variable being important to the model does **not** prove that changing that variable alone will cause turnover to decrease.

---

## 🧪 Simulated A/B Testing

Beyond prediction, the project explored how HR could evaluate potential interventions through experimentation.

Simulated A/B tests examined scenarios involving:

| Intervention | Simulated Outcome |
| --- | --- |
| **Mentorship programs** | Reduced employee turnover |
| **Flexible working hours** | Increased employee satisfaction |
| **Salary increases** | Improved performance ratings |
| **Enhanced training** | Increased employee skill levels |

These simulations illustrate how predictive analytics can be paired with **experimental thinking**.

However, simulated results are not evidence that the interventions would produce the same effects in a real organization.

The appropriate next step would be carefully designed **real-world pilots or controlled experiments**.

---

## 💼 Business Recommendations

### 1. Use Predictive Risk as Decision Support

The tuned XGBoost model could be used to identify patterns associated with elevated turnover risk.

Predictions should trigger **further HR review**, not automatic decisions about individual employees.

### 2. Prioritize Employee Satisfaction

Because satisfaction emerged as the strongest predictive signal, Salifort Motors should investigate the underlying drivers of dissatisfaction through:

- employee surveys;
- manager feedback;
- exit interviews;
- team-level analysis.

### 3. Review Workload Distribution

Project count and monthly working hours were important predictors.

HR and operational managers should investigate whether some employee groups experience:

- excessive project loads;
- prolonged high working hours;
- workload imbalance;
- insufficient recovery time.

### 4. Examine Tenure & Career Progression

Tenure was also a strong model feature.

Rather than assuming tenure itself causes attrition, the company should investigate what occurs at different career stages, including:

- promotion opportunities;
- compensation progression;
- role stagnation;
- professional development;
- management responsibilities.

### 5. Evaluate Compensation & Department-Level Patterns

Salary and departmental signals warrant deeper investigation.

These variables may reflect broader organizational conditions and should not automatically be interpreted as causal drivers.

### 6. Test Retention Interventions

Promising strategies such as mentorship and flexible work should be tested through controlled pilots or real-world A/B tests before company-wide deployment.

### 7. Build an HR Monitoring System

A future HR dashboard could combine:

- turnover trends;
- model risk scores;
- workload indicators;
- employee satisfaction;
- department-level patterns;
- intervention outcomes.

---

## ⚖️ Responsible AI & HR Analytics

Predictive HR systems require more caution than many ordinary classification applications because model outputs can directly affect people.

This project therefore considered:

- **employee privacy and confidentiality**;
- **bias across employee groups**;
- **fairness in model application**;
- **transparent communication of limitations**;
- **human oversight**;
- **periodic model audits**;
- **continuous performance monitoring**.

The model should be used to support employee retention and improve working conditions — **not to justify layoffs, punitive treatment, or automated employment decisions**.

### False Positives

If the model predicts that an employee will leave but the employee actually stays:

- retention resources may be spent unnecessarily;
- HR teams may waste time;
- employees could feel unfairly targeted.

### False Negatives

If the model predicts that an employee will stay but the employee leaves:

- institutional knowledge may be lost;
- recruitment and training costs increase;
- teams and projects may be disrupted.

The appropriate classification threshold therefore depends on the organization's **relative cost of these two error types**.

---

## 🧩 Challenges & How I Addressed Them

| Challenge | How I Addressed It | What It Demonstrated |
| --- | --- | --- |
| **3,008 duplicate records** | Identified and removed duplicates before modeling | Data-quality validation |
| **Tenure outliers** | Investigated 824 flagged observations rather than assuming all unusual values were invalid | Context-aware outlier analysis |
| **Class imbalance** | Used ROC AUC, F1, Balanced Accuracy, Kappa, precision, and recall instead of relying only on accuracy | Appropriate model evaluation |
| **Categorical HR variables** | Encoded department and salary features for machine-learning models | Feature preprocessing |
| **Multicollinearity** | Identified high VIF among encoded department variables and recognized its impact on linear modeling | Statistical diagnostics |
| **Linear-model limitations** | Compared Logistic Regression with tree-based models capable of learning non-linear interactions | Model-selection reasoning |
| **Model optimization** | Tuned XGBoost hyperparameters and compared performance | Hyperparameter optimization |
| **Prediction vs. causation** | Used model results to generate hypotheses and paired them with experimental thinking | Responsible business interpretation |
| **Sensitive HR use case** | Incorporated privacy, fairness, transparency, auditing, and human oversight | Responsible AI practice |

---

## 🛠️ Technical Stack

| Area | Technologies & Methods |
| --- | --- |
| **Programming** | Python |
| **Data Manipulation** | Pandas, NumPy |
| **Visualization** | Matplotlib, Seaborn |
| **Machine Learning** | Scikit-learn, XGBoost |
| **Models** | Logistic Regression, Decision Tree, Random Forest, XGBoost, SVM |
| **Model Evaluation** | ROC AUC, F1-score, Precision, Recall, Balanced Accuracy, Cohen's Kappa |
| **Preprocessing** | Duplicate removal, categorical encoding, scaling, outlier analysis |
| **Diagnostics** | Correlation analysis, VIF / multicollinearity assessment |
| **Experimentation** | Simulated A/B testing |
| **Methodology** | PACE — Plan, Analyze, Construct, Execute |
| **Environment** | Jupyter Notebook |

---

## ⚠️ Limitations & Critical Evaluation

Several limitations should be considered before interpreting the project as a deployable HR system.

### Dataset Provenance

Salifort Motors is a fictional company and the dataset represents a capstone scenario. Results therefore demonstrate analytical methodology rather than validated performance in a real organization.

### Observational Data

Feature importance and correlations identify predictive relationships, **not causal effects**.

For example, satisfaction may strongly predict turnover without proving that a specific satisfaction intervention will directly reduce attrition.

### Class Imbalance

The target distribution is imbalanced, which makes naïve accuracy an insufficient evaluation metric and affects the relative frequency of classification errors.

### Multicollinearity

One-hot encoded department variables produced high VIF values, creating problems for linear-model interpretation.

This is less problematic for tree-based models but remains relevant when comparing approaches.

### Simulated Experiments

The A/B tests were **simulations**, not real randomized controlled experiments.

Their outcomes should therefore be treated as demonstrations of experimental methodology and hypothesis generation.

### Generalization

A production system would require validation on:

- new employees;
- later time periods;
- different business units;
- potentially different organizations.

---

## 🔄 Future Improvements

If I extended this project today, I would:

- create a strict **train / validation / holdout test** framework;
- use stratified cross-validation throughout model selection;
- optimize classification thresholds based on HR intervention costs;
- calibrate predicted turnover probabilities;
- compare XGBoost with additional boosting frameworks;
- use **SHAP** for local and global model explanations;
- perform fairness testing across appropriate employee groups;
- create an explicit model card documenting intended and prohibited uses;
- add temporal validation to detect concept drift;
- investigate department-specific models or hierarchical effects;
- integrate exit-interview and career-development data;
- build an interactive **HR analytics dashboard**;
- calculate the ROI of retention interventions;
- conduct controlled real-world pilots before deployment;
- establish continuous monitoring for model performance, drift, and bias.

---

## 🧠 What I Learned

This project reinforced several important lessons about applied machine learning.

First, **model selection must reflect the structure of the problem**. Logistic Regression provided an interpretable baseline, but tree-based ensemble models were substantially better suited to the non-linear patterns present in employee turnover.

Second, **evaluation metrics must reflect business costs**. In an imbalanced HR classification problem, accuracy alone does not adequately describe performance. Recall, precision, F1, ROC AUC, Balanced Accuracy, and Cohen's Kappa provide a more complete picture.

Third, **prediction and intervention are different problems**. A model can identify employees with patterns associated with turnover, but it cannot establish which HR policy will cause those employees to stay. That requires experimentation and causal evidence.

Finally, HR analytics requires a particularly strong focus on **responsible model use**. A technically accurate model can still create harm if its predictions are interpreted as definitive judgments about individual employees.

---

## 💬 Interview Quick Reference

| Question | Quick Answer |
| --- | --- |
| **What was the project?** | An end-to-end HR analytics and machine-learning project predicting employee turnover at Salifort Motors |
| **Project context?** | Google Advanced Data Analytics Professional Certificate capstone |
| **Business goal?** | Predict attrition risk, identify major turnover drivers, and recommend retention strategies |
| **Dataset size?** | Approximately 15,000 employee records before cleaning |
| **Main data-quality issue?** | 3,008 duplicate rows; 824 tenure observations were also flagged as outliers |
| **Models compared?** | Logistic Regression, Decision Tree, Random Forest, XGBoost, and SVM |
| **Best model?** | Tuned XGBoost |
| **Best documented ROC AUC?** | **0.9804** |
| **Documented Cohen's Kappa?** | **0.9248** |
| **Why not use accuracy alone?** | The target is imbalanced, so accuracy can hide poor performance on employees who leave |
| **Important predictors?** | Satisfaction, project count, tenure, evaluation score, and monthly hours |
| **Why did XGBoost perform well?** | It captured non-linear relationships and interactions better than the linear baseline |
| **What was the A/B testing component?** | Simulated experiments exploring mentorship, flexible work, salary, and training interventions |
| **Main business recommendation?** | Use predictive risk to support proactive retention while investigating satisfaction, workload, career progression, and compensation |
| **Main ethical concern?** | Employee predictions must support human decision-making rather than automate employment decisions |
| **What would you improve today?** | SHAP explainability, fairness testing, probability calibration, threshold optimization, temporal validation, real-world experiments, and continuous monitoring |
| **Main lesson?** | Predictive performance is only one part of a useful HR analytics system; business interpretation, experimentation, and responsible deployment are equally important |

---

## 📁 Repository Contents

```text
.
├── Salifort Motors project lab.ipynb
├── HR_capstone_dataset.csv
├── PACE strategy document.pdf
├── Executive summary.pdf
├── Project Overview.pdf
└── README.md
```

### `Salifort Motors project lab.ipynb`

Primary analysis notebook containing:

- data inspection and preprocessing;
- exploratory data analysis;
- visualization;
- model development;
- model comparison;
- XGBoost tuning;
- evaluation;
- feature-importance analysis;
- simulated A/B testing;
- business interpretation.

### `PACE strategy document.pdf`

Documents the project from **Plan → Analyze → Construct → Execute**, including business objectives, analytical decisions, evaluation strategy, ethics, and recommendations.

### `Executive summary.pdf`

Stakeholder-oriented summary of the business problem, predictive solution, major findings, HR recommendations, and proposed next steps.

### `Project Overview.pdf`

Defines the business scenario, objectives, expected deliverables, value proposition, and project scope.

---

## 🎓 Project Context

This project was completed as the **capstone for the Google Advanced Data Analytics Professional Certificate**.

It demonstrates the integration of:

**Python · EDA · Statistical Thinking · Machine Learning · Model Evaluation · XGBoost · Hyperparameter Tuning · A/B Testing · Business Analytics · Responsible AI · Stakeholder Communication**

The project is retained in my portfolio because it goes beyond training a classifier: it connects predictive modeling with **business decision-making, experimentation, model risk, and responsible use in a people-focused domain**.

---

## 👤 Author

**Gregory Charles**

Data Science · Machine Learning · Generative AI · Applied Software Development

[← Back to Main Projects Portfolio](../README.md)
