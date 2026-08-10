# 🎯 ExtraaLearn Lead Conversion Prediction

**Machine Learning · Classification · Ensemble Learning · Lead Scoring · Business Analytics**

> **Project Context:** MIT IDSS — *Data Science and Machine Learning: Making Data-Driven Decisions*

Built an end-to-end machine learning workflow to predict which prospective learners were most likely to convert into paying customers, transforming lead prioritization into a data-driven classification problem.

After comparing and tuning multiple classification models, the strongest candidates achieved a **test ROC AUC of 0.931 with Tuned XGBoost** and an **F1-score of 0.784 with Tuned AdaBoost**. Feature analysis highlighted website engagement, profile completion, referral source, and occupation as important signals associated with conversion.

---

## ⭐ Key Highlights

- Developed an end-to-end **binary classification workflow** for lead conversion prediction.
- Compared multiple tree-based and ensemble-learning models.
- Applied **hyperparameter tuning** to improve predictive performance and generalization.
- Achieved **0.931 ROC AUC** with Tuned XGBoost on the test set.
- Achieved **0.784 F1-score** and **0.774 recall** with Tuned AdaBoost.
- Evaluated models using **accuracy, precision, recall, F1-score, and ROC AUC** rather than relying on accuracy alone.
- Identified behavioral and demographic characteristics associated with conversion.
- Translated predictive outputs into a practical **lead-scoring and sales-prioritization framework**.

---

## 🎯 Business Problem & Objectives

ExtraaLearn is an EdTech organization seeking to improve how prospective learners are prioritized by its sales team.

Rather than treating every lead equally, this project frames lead prioritization as a **supervised machine learning classification problem**: using demographic, behavioral, and engagement data to estimate which leads are most likely to convert into paying customers.

The project addressed three main objectives:

1. **Build a machine learning model** capable of identifying leads that are more likely to convert.
2. **Identify the factors associated with conversion** to better understand lead behavior.
3. **Develop a profile of high-potential leads** that could support more efficient allocation of sales resources.

> **Can historical lead and engagement data be used to identify which prospects are most likely to convert?**

---

## 🔄 Data Science Workflow

```text
Business Problem
       ↓
Data Understanding
       ↓
Exploratory Data Analysis
       ↓
Data Cleaning & Preparation
       ↓
Feature Transformation
       ↓
Categorical Encoding & Scaling
       ↓
Model Development
       ↓
Ensemble Learning
       ↓
Hyperparameter Tuning
       ↓
Model Evaluation
       ↓
Feature Analysis
       ↓
Lead Scoring
       ↓
Business Recommendations
```

---

## 📊 Data

The dataset combines demographic information with behavioral and engagement data.

| Feature | Description |
| --- | --- |
| `ID` | Unique identifier for each lead |
| `age` | Age of the lead |
| `current_occupation` | Professional, Unemployed, or Student |
| `first_interaction` | Website or Mobile App |
| `profile_completed` | Percentage of the lead's profile completed |
| `website_visits` | Number of website visits |
| `time_spent_on_website` | Total time spent on the website |
| `page_views_per_visit` | Average pages viewed per visit |
| `last_activity` | Most recent interaction with ExtraaLearn |
| `print_media_type1` | Print-media acquisition indicator |
| `print_media_type2` | Second print-media acquisition indicator |
| `digital_media` | Digital-media acquisition indicator |
| `educational_channels` | Educational-channel acquisition indicator |
| `referral` | Referral acquisition indicator |
| `status` | **Target:** whether the lead converted |

---

## 🧠 Machine Learning Problem

The project is a **binary classification task**:

```text
status
0 → Lead did not convert
1 → Lead converted into a paid customer
```

| Metric | Why It Matters |
| --- | --- |
| **Accuracy** | Overall proportion of correct predictions |
| **Precision** | How many predicted converters actually converted |
| **Recall** | How many actual converters were identified |
| **F1-score** | Balance between precision and recall |
| **ROC AUC** | Ability to distinguish converters from non-converters across thresholds |

For lead scoring, the relative importance of these metrics depends on the business objective. If missing a high-potential lead is costly, recall becomes particularly important; for probability-based ranking, ROC AUC is especially useful.

---

## 🔍 Exploratory Data Analysis

EDA investigated:

- numerical distributions;
- skewness and potential outliers;
- categorical distributions;
- website engagement;
- acquisition channels;
- profile completion;
- occupation;
- behavioral differences between converted and non-converted leads.

The purpose was both to prepare the data for modeling and to understand the **business characteristics associated with conversion**.

---

## 🔧 Data Preprocessing & Feature Engineering

### Data Cleaning

The lead identifier (`ID`) was removed because it does not provide meaningful predictive information. Duplicate observations were examined and removed where appropriate.

### Numerical Transformation

Skewed numerical variables were transformed using:

```python
np.log1p()
```

### Feature Scaling

Numerical features were normalized using **Min-Max Scaling**.

### Categorical Encoding

Categorical variables were transformed using **One-Hot Encoding**.

---

## 🤖 Model Development

The project compared several tree-based and ensemble-learning approaches:

- Decision Tree
- Random Forest
- AdaBoost
- XGBoost

The workflow progressed from baseline tree models toward tuned ensembles capable of capturing more complex relationships in the lead data.

---

## ⚙️ Ensemble Learning & Hyperparameter Tuning

### Decision Tree
An interpretable baseline. Pruning was used to improve generalization.

### Random Forest
Combines multiple trees to reduce the variance and instability of a single tree.

### AdaBoost
Sequentially emphasizes observations that earlier weak learners classified incorrectly.

### XGBoost
Uses gradient-boosted decision trees with regularization and optimization for high-performance structured-data classification.

Hyperparameter tuning was used to identify stronger configurations before final test-set comparison.

---

## 📈 Model Performance

| Model | Accuracy | Precision | Recall | F1-score | ROC AUC | Training Time |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| **Tuned XGBoost** | 0.865 | 0.801 | 0.756 | 0.778 | **0.931** | 0.45 s |
| **Tuned Random Forest** | 0.858 | 0.800 | 0.725 | 0.761 | 0.928 | 1.75 s |
| **Tuned AdaBoost** | **0.867** | 0.796 | **0.774** | **0.784** | 0.927 | 2.98 s |
| **Pruned Decision Tree** | 0.861 | **0.807** | 0.728 | 0.766 | 0.919 | **0.03 s** |

> **There is no single best model independent of the business objective.**

### Tuned XGBoost — Strongest Discrimination

**ROC AUC = 0.931**

This makes XGBoost a strong candidate for ranking leads by predicted conversion potential.

### Tuned AdaBoost — Strongest F1 & Recall

- **Accuracy:** 0.867
- **Precision:** 0.796
- **Recall:** 0.774
- **F1-score:** 0.784
- **ROC AUC:** 0.927

Its higher recall may be valuable when missing a genuine converter is particularly costly.

| Objective | Strong Candidate |
| --- | --- |
| Rank leads by conversion potential | **Tuned XGBoost** |
| Maximize overall discrimination | **Tuned XGBoost** |
| Identify more actual converters | **Tuned AdaBoost** |
| Balance precision and recall | **Tuned AdaBoost** |
| Prioritize interpretability and speed | **Pruned Decision Tree** |

---

## 🔎 Key Conversion Drivers

Feature analysis highlighted several characteristics associated with stronger conversion potential:

1. **Website engagement** — higher `time_spent_on_website`.
2. **First interaction** — leads first interacting through the `Website`.
3. **Profile completion** — Medium or High completion.
4. **Referral** — referral-acquired leads.
5. **Occupation** — `Professional` leads.

These are **predictive associations**, not proof of causation.

---

## 💼 From Prediction to Lead Scoring

A classifier can generate a **conversion probability** for each lead:

```text
Lead Data
    ↓
Preprocessing
    ↓
Trained Classification Model
    ↓
Conversion Probability
    ↓
Lead Ranking
    ↓
Sales Prioritization
```

| Lead | Predicted Conversion Probability | Priority |
| --- | ---: | --- |
| Lead A | 0.92 | High |
| Lead B | 0.81 | High |
| Lead C | 0.57 | Medium |
| Lead D | 0.31 | Low |
| Lead E | 0.12 | Low |

Priority thresholds would need to reflect actual sales capacity, lead economics, and error costs.

---

## 💡 Business Recommendations

### 1. Prioritize Highly Engaged Leads
Use engagement signals such as time spent on the website to support prioritization.

### 2. Use Conversion Probability Instead of Uniform Outreach
Rank prospects so limited sales resources can focus on stronger predicted opportunities.

### 3. Use Profile Completion as an Intent Signal
Medium and highly completed profiles can contribute useful information to lead scoring.

### 4. Investigate Referral Acquisition
Evaluate the cost and scalability of referral channels relative to other acquisition sources.

### 5. Match the Model to the Business Cost
Consider AdaBoost when recall is especially important and XGBoost when probability-based ranking/discrimination is the priority.

### 6. Validate the Model in the Sales Workflow
Before production deployment, test whether model-based prioritization improves actual conversion rate, contact efficiency, revenue per lead, and customer acquisition cost.

---

## 🧩 Challenges & How I Addressed Them

| Challenge | How I Addressed It | What It Demonstrated |
| --- | --- | --- |
| Different feature types | Applied transformations, scaling, and encoding according to feature type | Data preprocessing |
| Skewed numerical variables | Used log transformation where appropriate | Distribution-aware preparation |
| Categorical business data | Converted categories into model-ready features | Feature engineering |
| Potential tree-model overfitting | Used pruning, ensembles, and tuning | Generalization awareness |
| Several strong candidate models | Compared multiple evaluation metrics | Multi-metric evaluation |
| Different costs of classification errors | Considered recall and discrimination alongside accuracy | Business-oriented model selection |
| Turning predictions into operational value | Framed probabilities as a lead-ranking mechanism | Model-to-business translation |
| Interpreting feature importance | Treated importance as predictive rather than causal evidence | Analytical discipline |

---

## 🛠️ Technical Stack

| Area | Technologies & Methods |
| --- | --- |
| **Programming** | Python |
| **Data Manipulation** | Pandas, NumPy |
| **Visualization** | Matplotlib, Seaborn |
| **Machine Learning** | Scikit-learn, XGBoost |
| **Models** | Decision Tree, Random Forest, AdaBoost, XGBoost |
| **Preprocessing** | Log transformation, Min-Max Scaling, One-Hot Encoding |
| **Optimization** | Hyperparameter tuning, tree pruning |
| **Evaluation** | Accuracy, Precision, Recall, F1-score, ROC AUC |
| **Business Application** | Lead scoring, sales prioritization |
| **Environment** | Jupyter Notebook |

---

## ⚠️ Limitations & Critical Evaluation

### Predictive Performance ≠ Business Impact
The test-set metrics demonstrate predictive performance, but they do not establish a specific increase in revenue, conversion rate, or sales-team productivity.

### Feature Importance ≠ Causation
Important predictors can help forecast conversion without necessarily causing it.

### Classification Threshold
A production threshold should reflect sales capacity, lead value, contact cost, and false-positive/false-negative costs.

### Probability Calibration
If probabilities are used directly as lead scores, calibration should be evaluated.

### Changing Customer Behavior
Marketing channels, products, and lead behavior can change over time, requiring monitoring and periodic retraining.

---

## 🔄 Future Improvements

If I extended this project today, I would:

- perform stratified cross-validation throughout model selection;
- evaluate probability calibration;
- optimize classification thresholds using explicit sales costs;
- create lift and cumulative-gains charts;
- calculate precision and recall at different sales-capacity levels;
- use SHAP for global and individual explanations;
- investigate feature interactions more systematically;
- build an API or batch-scoring pipeline;
- create a lead-scoring dashboard;
- monitor feature and prediction drift;
- establish scheduled retraining;
- run a controlled experiment comparing model-prioritized outreach with the existing sales process;
- measure actual conversion lift, acquisition cost, and sales-team efficiency.

---

## 🧠 What I Learned

This project strengthened my understanding of how machine learning connects to **business decision-making**.

The Tuned XGBoost and Tuned AdaBoost models illustrate why model evaluation cannot be reduced to accuracy: XGBoost achieved the strongest ROC AUC, while AdaBoost achieved stronger recall and F1 performance. The appropriate model depends on what the organization is trying to optimize.

The project also reinforced that:

- preprocessing choices can materially affect model quality;
- ensemble methods can capture complex patterns in structured business data;
- hyperparameter tuning should be judged by generalization;
- feature importance must be interpreted carefully;
- predicted probabilities can be more useful operationally than hard classifications;
- strong offline metrics do not automatically guarantee business impact.

The key progression was from:

**“Which model predicts best?”**

to:

**“How can the model support a better decision?”**

---

## 💬 Interview Quick Reference

| Question | Quick Answer |
| --- | --- |
| **What was the project?** | An end-to-end ML project predicting which ExtraaLearn leads were most likely to convert |
| **Project context?** | MIT IDSS — Data Science and Machine Learning: Making Data-Driven Decisions |
| **Problem type?** | Binary classification |
| **Target?** | `status`: whether a lead converted |
| **Models compared?** | Decision Tree, Random Forest, AdaBoost, XGBoost |
| **Best ROC AUC?** | **0.931 — Tuned XGBoost** |
| **Best F1-score?** | **0.784 — Tuned AdaBoost** |
| **Best recall?** | **0.774 — Tuned AdaBoost** |
| **Why not accuracy alone?** | Missed converters and unnecessary contacts have different business costs |
| **Important conversion signals?** | Website engagement, first interaction, profile completion, referrals, and occupation |
| **Why XGBoost?** | Strongest overall class discrimination and well suited to structured tabular relationships |
| **Why AdaBoost?** | Strongest recall and F1 among the compared tuned models |
| **How does it create business value?** | Conversion probabilities can rank leads for sales prioritization |
| **Main challenge?** | Selecting among models with different metric trade-offs and translating predictions into an operational strategy |
| **Important limitation?** | Strong test metrics do not prove real-world conversion or revenue improvement |
| **What would you improve today?** | Calibration, threshold optimization, lift analysis, SHAP, deployment monitoring, and controlled business validation |
| **Main lesson?** | The best model is the one whose performance characteristics align with the decision it supports |

---

## 📁 Repository Contents

```text
.
├── README.md
├── ExtraaLearn_Lead_Conversion_Prediction_Project.ipynb
└── data/
```

> Update the filenames above if the repository uses different names.

The primary notebook contains the end-to-end workflow, including EDA, preprocessing, model development, ensemble learning, hyperparameter tuning, evaluation, feature analysis, and business interpretation.

---

## 🎓 Project Context

This project was completed as part of:

**MIT IDSS — *Data Science and Machine Learning: Making Data-Driven Decisions***

The project demonstrates the integration of:

**Python · Exploratory Data Analysis · Data Preprocessing · Classification · Decision Trees · Random Forest · AdaBoost · XGBoost · Ensemble Learning · Hyperparameter Tuning · Model Evaluation · Lead Scoring · Business Analytics**

It is included in my portfolio because it demonstrates an important aspect of applied data science: moving beyond model training to connect **predictive performance, model-selection trade-offs, customer behavior, and business decision-making**.

---

## 📄 License & Educational Use

This repository is intended for **educational and portfolio purposes**.

The project demonstrates analytical and machine learning work completed as part of the MIT IDSS learning program. Any original course materials, datasets, or instructional content remain subject to their respective ownership and usage terms.

---

## 👤 Author

**Gregory Charles**

Data Science · Machine Learning · Generative AI · Data Visualization · Applied Software Development

[← Back to Main Projects Portfolio](../README.md)
