# 🎯 ExtraaLearn Lead Conversion Prediction

**Machine Learning · Classification · Ensemble Learning · Lead Scoring · Business Analytics**

> **Project Context:** MIT IDSS — *Data Science and Machine Learning: Making Data-Driven Decisions*

## 🚀 Project Overview

ExtraaLearn is an EdTech organization seeking to improve how prospective learners are prioritized by its sales team.

Rather than treating every lead equally, this project frames lead prioritization as a **supervised machine learning classification problem**: using demographic, behavioral, and engagement data to estimate which leads are most likely to convert into paying customers.

The project covers the complete data science workflow—from exploratory analysis and preprocessing to model development, hyperparameter tuning, evaluation, and interpretation.

Multiple classification and ensemble-learning approaches were compared. The strongest tuned models achieved:

- **ROC AUC: 0.931** — Tuned XGBoost
- **F1-score: 0.784** — Tuned AdaBoost
- **Recall: 0.774** — Tuned AdaBoost
- **Accuracy: 0.867** — Tuned AdaBoost

Beyond predictive performance, the analysis identified characteristics associated with higher conversion probability, providing a foundation for a **data-driven lead-scoring strategy**.

---

## 🎯 Business Problem

ExtraaLearn receives leads from multiple channels, but not every prospective learner has the same probability of becoming a paying customer.

When sales resources are limited, contacting every lead with equal priority can result in significant effort being spent on prospects with relatively low conversion potential.

The central question therefore becomes:

> **Can historical lead and engagement data be used to identify which prospects are most likely to convert?**

A successful predictive model could help the organization:

1. identify high-potential leads;
2. understand the factors associated with conversion;
3. create profiles of leads with higher conversion probability; and
4. support more targeted allocation of sales resources.

---

## 🧠 Machine Learning Problem

The project is formulated as a **binary classification task**.

**Target variable:** `status`

| Value | Meaning |
| :---: | --- |
| `0` | Lead did not convert |
| `1` | Lead converted into a paid customer |

The objective is not simply to maximize overall accuracy.

For lead scoring, the model must also effectively distinguish between converted and non-converted leads while correctly identifying a useful proportion of actual converters.

For this reason, model evaluation considers several complementary metrics:

- **Accuracy** — overall proportion of correct predictions
- **Precision** — proportion of predicted converters that actually converted
- **Recall** — proportion of actual converters successfully identified
- **F1-score** — balance between precision and recall
- **ROC AUC** — ability of the model to discriminate between the two classes across classification thresholds

---

## 📊 Dataset

The dataset contains demographic information about prospective learners together with information describing how they interacted with ExtraaLearn.

### Data Dictionary

| Feature | Description |
| --- | --- |
| `ID` | Unique identifier for each lead |
| `age` | Age of the lead |
| `current_occupation` | Current occupation: Professional, Unemployed, or Student |
| `first_interaction` | Whether the first interaction occurred through the Website or Mobile App |
| `profile_completed` | Percentage of the user's profile that has been completed |
| `website_visits` | Number of visits to the website |
| `time_spent_on_website` | Total time spent on the website |
| `page_views_per_visit` | Average number of pages viewed during each visit |
| `last_activity` | Most recent interaction between the lead and ExtraaLearn |
| `print_media_type1` | Whether the lead encountered the organization through one type of print media |
| `print_media_type2` | Whether the lead encountered the organization through another type of print media |
| `digital_media` | Whether the lead encountered advertising through digital media |
| `educational_channels` | Whether the lead heard about ExtraaLearn through educational channels |
| `referral` | Whether the lead was acquired through a referral |
| `status` | **Target variable:** whether the lead converted into a paid customer |

The dataset therefore combines several types of potential predictive signals:

- demographic characteristics;
- acquisition channels;
- website engagement;
- profile completion;
- recent activity; and
- referral information.

---

## 🔍 Exploratory Data Analysis

Exploratory analysis was used to investigate the distribution of the available variables and examine how different lead characteristics relate to conversion.

Particular attention was given to:

- numerical feature distributions;
- skewness and potential outliers;
- categorical feature distributions;
- relationships between engagement variables and conversion;
- acquisition channels;
- profile completion;
- occupation; and
- behavioral differences between converted and non-converted leads.

The purpose of the EDA was not only to prepare the dataset for modeling, but also to understand the **business characteristics associated with successful conversion**.

---

## 🛠️ Data Preprocessing

The data was prepared for machine learning through a structured preprocessing workflow.

### Data Cleaning

The lead identifier (`ID`) was removed because it does not provide meaningful predictive information.

Duplicate observations were also examined and removed where appropriate.

### Numerical Transformation

Numerical variables exhibiting skewness were transformed using:

```python
np.log1p()
