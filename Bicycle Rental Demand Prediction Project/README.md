# 🚲 Bicycle Rental Demand Prediction

**Data Science · Regression · Feature Engineering · Time-Aware Analysis**

> **Project Context:** IBM & University of London — *Data Science Foundations Specialization* Capstone

Built a regression-based demand forecasting workflow to predict **daily bicycle rental volume** from historical rental, weather, and calendar data.

Using **Python, Pandas, NumPy, Matplotlib, and Scikit-learn**, I progressed from exploratory analysis and a simple regression baseline to multivariable models and temporal feature engineering. The most important improvement came from incorporating recent rental history: adding a **previous-7-day average rental feature** reduced validation RMSE from **2,186.29 to 1,047.97**, a reduction of approximately **52.1%**.

---

## ⭐ Key Highlights

- Analyzed the daily bicycle-rental dataset containing **731 days** and **16 variables**.
- Explored relationships between demand, temperature, weather, humidity, working-day status, and other temporal factors.
- Identified an approximately **0.631 correlation** between normalized apparent temperature (`atemp`) and total daily rentals (`cnt`).
- Built a **simple Linear Regression** baseline before progressing to multivariable regression.
- Evaluated an initial multivariable model with a validation **RMSE of 2,186.29**.
- Added wind speed and reduced validation RMSE to **2,139.20**.
- Engineered a **previous-7-day average rental-demand feature** to capture recent temporal behavior.
- Reduced validation RMSE to **1,047.97** after incorporating the engineered temporal feature.
- Demonstrated quantitatively that **feature engineering had a much larger impact than simply adding another weather variable**.
- Used RMSE consistently to compare model iterations on held-out validation data.

---

## 🎯 Problem & Objectives

Bicycle-sharing systems need to anticipate demand so that operators can plan capacity, bicycle availability, redistribution, and other operational resources.

The central modeling question was:

> **Can daily bicycle rental demand be predicted from weather, calendar, and recent historical rental information?**

The project had four main objectives:

1. Explore the factors associated with daily bicycle rental demand.
2. Establish a simple regression baseline.
3. Test whether additional predictors improve performance.
4. Engineer a temporal feature that captures recent demand patterns and evaluate its impact.

The target variable was:

```text
cnt → total number of bicycle rentals for the day
```

---

## 🔄 Modeling Workflow

```text
Daily Bicycle Rental Data
        ↓
Data Inspection
        ↓
Exploratory Data Analysis
        ↓
Simple Linear Regression
        ↓
Initial Multivariable Regression
        ↓
Validation with RMSE
        ↓
Add Windspeed
        ↓
Re-evaluate
        ↓
Engineer Previous-7-Day Demand Feature
        ↓
Final Multivariable Regression
        ↓
Compare Model Performance
        ↓
Interpret Results & Limitations
```

The project intentionally used an incremental modeling strategy so that the effect of each change could be measured rather than jumping directly to a more complex model.

---

## 📊 Data

The repository contains two bicycle-sharing datasets:

| Dataset | Granularity | Rows | Columns |
| --- | --- | ---: | ---: |
| `day.csv` | Daily | **731** | **16** |
| `hour.csv` | Hourly | **17,379** | **17** |

The documented predictive analysis uses **`day.csv`**.

The hourly dataset is included in the repository but was not used in the final modeling workflow documented in the notebook.

### Daily Dataset Features

| Feature | Description |
| --- | --- |
| `instant` | Record index |
| `dteday` | Date |
| `season` | Season |
| `yr` | Year indicator |
| `mnth` | Month |
| `holiday` | Whether the day is a holiday |
| `weekday` | Day of the week |
| `workingday` | Whether the day is a working day |
| `weathersit` | Weather situation |
| `temp` | Normalized temperature |
| `atemp` | Normalized apparent / feeling temperature |
| `hum` | Normalized humidity |
| `windspeed` | Normalized wind speed |
| `casual` | Number of casual rentals |
| `registered` | Number of registered rentals |
| `cnt` | **Total bicycle rentals — prediction target** |

The target is defined as:

```text
cnt = casual + registered
```

Because `casual` and `registered` directly compose the target, they should not be used as predictors for `cnt`.

---

## 🔍 Exploratory Data Analysis

Before modeling, I inspected the dataset and explored relationships between bicycle demand and potential predictors.

The analysis focused on factors such as:

- apparent temperature;
- weather conditions;
- humidity;
- working-day status;
- wind speed;
- historical demand.

### Apparent Temperature & Rental Demand

Normalized apparent temperature (`atemp`) showed a meaningful positive relationship with daily rental demand.

**Observed correlation with `cnt`: approximately 0.631**

This made apparent temperature a useful starting feature for the regression analysis.

However, the relationship also demonstrated an important limitation of single-feature modeling: rental demand is affected by many factors simultaneously, so temperature alone cannot explain the full variation in daily rentals.

---

## 🤖 Modeling Strategy

### 1. Simple Linear Regression

The first model used a single predictor to establish a basic relationship between apparent temperature and bicycle rental demand.

Conceptually:

```text
Rental Demand = β₀ + β₁(Apparent Temperature)
```

This provided an interpretable baseline and demonstrated the mechanics of regression before introducing additional variables.

### 2. Initial Multivariable Regression

The next model incorporated several predictors:

- apparent temperature;
- working-day status;
- humidity;
- weather situation.

The data was divided into training and validation sets so that performance could be evaluated on observations not used to fit the model.

### 3. Adding Windspeed

Wind speed was then added to determine whether another weather-related predictor materially improved performance.

This produced a modest improvement.

### 4. Temporal Feature Engineering

The most important modeling step was creating a feature representing **recent bicycle rental demand**.

For each day, I calculated a historical average based on the preceding seven days.

Conceptually:

```text
Previous 7-Day Average =
mean(rentals during the previous seven days)
```

This feature captures information that weather variables alone cannot represent, including recent usage patterns and short-term demand persistence.

---

## 🧪 Model Comparison

The models were compared using **Root Mean Squared Error (RMSE)** on validation data.

Lower RMSE indicates better predictive performance.

| Model | Validation RMSE | Change vs. Initial Multivariable Model |
| --- | ---: | ---: |
| Initial multivariable regression | **2,186.29** | Baseline |
| + Windspeed | **2,139.20** | **−2.15%** |
| + Previous-7-day average | **1,047.97** | **−52.07%** |

### Main Result

Adding wind speed improved the model only slightly:

```text
2,186.29 → 2,139.20
```

By contrast, incorporating recent rental history produced a much larger improvement:

```text
2,186.29 → 1,047.97
```

That represents an RMSE reduction of approximately:

**52.1%**

This was the central modeling result of the project.

---

## 💡 Key Finding: Feature Engineering Mattered Most

The largest performance gain did not come from changing the regression algorithm.

It came from creating a **more informative feature**.

Weather variables describe environmental conditions on a particular day, but bicycle demand also contains temporal structure.

Recent rental activity can implicitly capture patterns related to:

- seasonality;
- recent demand levels;
- recurring user behavior;
- short-term trends;
- conditions not represented directly by the selected weather variables.

The project therefore illustrates an important data-science principle:

> **Better features can improve a simple model more than adding complexity without additional signal.**

---

## 🧩 Challenges & How I Addressed Them

| Challenge | How I Addressed It | What It Demonstrated |
| --- | --- | --- |
| **A single predictor could not explain demand sufficiently** | Progressed from simple to multivariable regression | Iterative model development |
| **Weather variables captured only part of the demand pattern** | Tested additional predictors rather than assuming the initial feature set was sufficient | Evidence-based feature selection |
| **Adding windspeed produced only a small improvement** | Compared validation RMSE before and after adding the feature | Quantitative model comparison |
| **Demand contains temporal dependencies** | Engineered a previous-7-day average rental feature | Feature-engineering reasoning |
| **Need to compare models consistently** | Used RMSE on held-out validation data across model iterations | Model evaluation discipline |
| **Potential target leakage from rental components** | Treated `cnt` as the target and avoided using `casual` and `registered` as explanatory predictors | Target-definition awareness |
| **Daily and hourly files were both available** | Kept the documented modeling workflow focused on the daily dataset | Scope control |
| **Historical features require careful construction** | Derived the rolling feature from prior rental observations rather than treating it as an ordinary static variable | Time-aware feature design |

---

## 🛠️ Technical Stack

| Area | Technologies & Methods |
| --- | --- |
| **Programming** | Python |
| **Data Manipulation** | Pandas, NumPy |
| **Visualization** | Matplotlib |
| **Machine Learning** | Scikit-learn |
| **Modeling** | Simple Linear Regression, Multiple Linear Regression |
| **Feature Engineering** | Historical / rolling demand features |
| **Evaluation** | Root Mean Squared Error (RMSE) |
| **Analysis** | EDA, correlation analysis, model comparison |
| **Environment** | Jupyter Notebook |

---

## ⚠️ Limitations & Critical Evaluation

### Linear Regression Assumptions

The project uses linear regression, which assumes that predictor effects can be represented adequately through a linear model.

Bicycle demand may contain:

- non-linear weather effects;
- interactions;
- seasonal structure;
- trend;
- threshold effects.

More flexible algorithms may capture these relationships better.

### Limited Feature Set

The final model does not use all potentially useful variables available in the dataset.

Additional features such as:

- season;
- month;
- weekday;
- year;
- holiday status;

could provide additional predictive information.

### Temporal Validation

Because this is time-dependent data, a random train/validation split can be less realistic than a chronological split.

For a production forecasting problem, I would preserve time order and train only on observations occurring **before** the validation period.

### Rolling Feature Construction

Historical demand features must be constructed carefully.

A rolling statistic should use **only information available before the prediction date**. Using future observations, directly or indirectly, would introduce data leakage.

### Dataset Size

The daily dataset contains only **731 observations**, representing approximately two years of data.

That limits the range of seasonal cycles and unusual events available for model training.

### External Factors

Demand may also depend on information not represented in the dataset, such as:

- public events;
- transit disruptions;
- tourism;
- infrastructure changes;
- pricing;
- bicycle availability;
- extreme weather.

---

## 🔄 Future Improvements

If I revisited this project today, I would:

- use a **chronological train/validation/test split**;
- implement walk-forward or time-series cross-validation;
- compare the baseline against **Random Forest, Gradient Boosting, and XGBoost**;
- investigate dedicated time-series approaches;
- engineer lag features for multiple horizons;
- create rolling averages over several windows;
- encode cyclical calendar variables such as month and weekday;
- examine interaction effects between weather and season;
- separate casual and registered demand into related forecasting tasks;
- use the hourly dataset to model intraday demand;
- evaluate MAE alongside RMSE for easier business interpretation;
- inspect residuals systematically;
- tune hyperparameters using time-aware validation;
- build a simple forecasting dashboard or API;
- quantify prediction intervals to communicate uncertainty.

---

## 🧠 What I Learned

This project reinforced that predictive modeling is an **iterative process**.

The initial regression model established a baseline. Adding another conventional weather variable produced only a small improvement. The major performance gain occurred only after reconsidering the structure of the problem and recognizing that bicycle demand depends partly on **recent historical behavior**.

That taught me an important lesson:

**Feature engineering requires understanding the process that generated the data, not simply adding more columns to a model.**

The project also strengthened my understanding of:

- simple versus multiple linear regression;
- train/validation evaluation;
- RMSE;
- correlation versus predictive usefulness;
- incremental experimentation;
- temporal dependencies;
- data leakage risks.

Looking back at the project also highlights how I would now improve the experimental design. For time-dependent forecasting, preserving chronology during validation is essential for estimating how a model would perform on genuinely future observations.

---

## 💬 Interview Quick Reference

| Question | Quick Answer |
| --- | --- |
| **What was the project?** | A regression-based project predicting daily bicycle rental demand from weather, calendar, and recent historical information |
| **Project context?** | IBM & University of London — Data Science Foundations Specialization capstone |
| **Main dataset?** | `day.csv` — **731 daily observations and 16 variables** |
| **Was the hourly dataset used?** | It is included in the repository, but the documented predictive workflow uses the daily dataset |
| **Target variable?** | `cnt`, the total number of daily bicycle rentals |
| **Main tools?** | Python, Pandas, NumPy, Matplotlib, Scikit-learn, Jupyter |
| **Initial approach?** | Simple Linear Regression followed by multivariable regression |
| **Useful EDA finding?** | Apparent temperature had an approximately **0.631 correlation** with daily rental demand |
| **Initial multivariable RMSE?** | **2,186.29** |
| **What happened when you added windspeed?** | RMSE improved slightly to **2,139.20** |
| **Most important feature engineering?** | A previous-7-day average rental-demand feature |
| **Final documented RMSE?** | **1,047.97** |
| **How much did RMSE improve?** | Approximately **52.1%** relative to the initial multivariable model |
| **Main technical lesson?** | A well-designed feature can improve a simple model more than adding another weak predictor |
| **Main modeling limitation?** | The forecasting setup should ideally use chronological rather than random validation |
| **Leakage concern?** | Historical features must contain only information available before the prediction date |
| **What would you improve today?** | Time-aware validation, richer lag/rolling features, tree-based models, hourly forecasting, residual analysis, and uncertainty estimates |

---

## 📁 Repository Contents

```text
.
├── README.md
├── Bikes.ipynb
├── day.csv
└── hour.csv
```

### `Bikes.ipynb`

Primary notebook containing:

- data loading and inspection;
- exploratory analysis;
- visualization;
- simple regression;
- multivariable regression;
- feature additions;
- temporal feature engineering;
- validation;
- RMSE comparison.

### `day.csv`

Daily bicycle-sharing dataset used for the documented predictive analysis.

### `hour.csv`

Hourly version of the bicycle-sharing dataset, included in the repository and available for more granular future analysis.

---

## 🎓 Project Context

This project was completed as the **capstone for the IBM & University of London _Data Science Foundations Specialization_**.

The project demonstrates the integration of:

**Python · Pandas · Exploratory Data Analysis · Regression · Feature Engineering · Model Evaluation · Temporal Data · Scikit-learn**

It is included in my portfolio because it captures an important stage in my development as a data scientist: moving beyond simply fitting a model toward **iteratively testing features, measuring their contribution, and recognizing the importance of temporal structure in predictive problems**.

---

## 👤 Author

**Gregory Charles**

Data Science · Machine Learning · Generative AI · Data Visualization · Applied Software Development

[← Back to Main Projects Portfolio](../README.md)
