# 🏙️ NYC Housing Price Prediction

**Regression · Geospatial Analysis · Ensemble Learning · Feature Engineering**

> **Project Context:** IBM & University of London — *Data Science Foundations Specialization Capstone*

Built and evaluated a machine-learning pipeline for predicting **New York City housing prices** using property characteristics, categorical information, and geographic features.

The project progressed from exploratory data analysis and preprocessing through linear baselines and non-linear ensemble models. **Random Forest Regressor achieved the best performance with an RMSE of approximately $1,214,838**, substantially outperforming Linear Regression and Ridge Regression and narrowly outperforming Gradient Boosting.

The analysis also showed that **bathrooms, property square footage, and location** were among the most important predictors of housing price, highlighting the strongly non-linear and geographically dependent nature of the NYC real-estate market.

---

## ⭐ Key Highlights

- Completed as the **capstone project** for the IBM & University of London *Data Science Foundations Specialization*.
- Explored NYC housing-price distributions, property characteristics, outliers, and geographic patterns.
- Integrated property-location data with **NYC borough boundary data** for geospatial analysis.
- Cleaned missing values and extreme observations before modeling.
- Engineered and processed numerical, categorical, and geographic features.
- Compared **Linear Regression, Ridge Regression, Random Forest, and Gradient Boosting**.
- Demonstrated a major performance gap between linear and non-linear ensemble models.
- Achieved the best RMSE of approximately **$1.215M with Random Forest Regressor**.
- Identified **bathrooms, property square footage, latitude/longitude, and Manhattan locality** as important price predictors.
- Evaluated model behavior using RMSE and actual-vs.-predicted visualizations.
- Translated model results into practical conclusions about real-estate valuation and future modeling improvements.

---

## 🎯 Business Problem & Objectives

Real-estate valuation in New York City is difficult because housing prices depend on a complex combination of:

- property size;
- number of bedrooms and bathrooms;
- property type;
- geographic location;
- borough and locality;
- market structure;
- extreme high-value properties.

The central question was:

> **Can historical property characteristics and location information be used to predict NYC housing prices with machine learning?**

The project addressed five main objectives:

1. **Explore the housing dataset** to understand price distributions and property characteristics.
2. **Prepare and clean the data**, including missing values and extreme observations.
3. **Investigate geographic patterns** in NYC property prices.
4. **Train and compare multiple regression models** with different assumptions and complexity.
5. **Evaluate model performance and identify the strongest predictors** of housing prices.

The project therefore combined exploratory analytics, geospatial reasoning, preprocessing, supervised machine learning, and model evaluation in a single end-to-end capstone workflow.

---

## 🔄 Data Science Workflow

```text
NYC Housing Data
        ↓
Data Inspection
        ↓
Exploratory Data Analysis
        ↓
Outlier & Missing-Value Analysis
        ↓
Geospatial Analysis
        ↓
Feature Engineering & Preprocessing
        ↓
Train/Test Preparation
        ↓
┌───────────────────────────────┐
│ Regression Models             │
│                               │
│ • Linear Regression           │
│ • Ridge Regression            │
│ • Random Forest Regressor     │
│ • Gradient Boosting Regressor │
└───────────────────────────────┘
        ↓
Model Evaluation
        ↓
RMSE + Actual vs. Predicted
        ↓
Feature Importance Analysis
        ↓
Final Model Comparison
```

This structure made it possible to move from raw property data to a defensible comparison of several regression approaches.

---

## 📊 Exploratory Data Analysis

Exploratory analysis showed that NYC housing prices do not follow a simple normal distribution.

### Price Distribution

The target variable contained:

- substantial right skew;
- high-value properties;
- significant outliers;
- large differences across segments of the housing market.

This matters because extreme property prices can strongly affect regression models and error metrics such as RMSE.

### Property Characteristics

The analysis examined relationships between price and features such as:

- property square footage;
- bedrooms;
- bathrooms;
- property type;
- locality;
- latitude;
- longitude.

Property size and bathroom count showed meaningful relationships with price, although these relationships were not adequately represented by simple linear assumptions alone.

### Geographic Patterns

Housing prices also varied geographically.

The project used latitude and longitude together with NYC borough-boundary information to investigate the spatial distribution of properties.

This reinforced an important real-estate principle:

> **Location is not simply descriptive metadata; it is a major predictive feature.**

---

## 🗺️ Geospatial Analysis

The project incorporated geographic information to better understand the relationship between property location and price.

The analysis included:

- property-location scatterplots;
- latitude and longitude;
- NYC borough boundaries;
- locality information;
- geographic visualization of properties.

Conceptually:

```text
Housing Records
      ↓
Latitude / Longitude
      ↓
NYC Borough Boundaries
      ↓
Geospatial Visualization
      ↓
Location-Based Price Patterns
```

The analysis showed that geographic features contributed meaningful predictive information.

In particular, **`LOCALITY_New York County`**, corresponding to Manhattan, emerged as an important categorical predictor.

This demonstrates why housing-price models benefit from explicitly representing location rather than relying only on structural property characteristics.

---

## 🧹 Data Preparation

Real-estate datasets frequently contain missing values, extreme prices, heterogeneous property types, and categorical variables that require transformation before modeling.

The preprocessing workflow included:

```text
Raw Housing Data
       ↓
Inspect Missing Values
       ↓
Analyze Outliers
       ↓
Clean / Filter Data
       ↓
Engineer Features
       ↓
Encode Categorical Variables
       ↓
Prepare Modeling Dataset
```

### Missing Values

Missing observations were identified and handled before model training so that the algorithms received usable feature matrices.

### Outliers

Housing prices contained substantial extreme values.

Outlier analysis was therefore an important part of the workflow rather than a purely cosmetic visualization step.

### Categorical Features

Categorical property and locality information was transformed into model-compatible features.

This allowed location and property categories to contribute to prediction alongside continuous numerical variables.

### Geographic Features

Latitude and longitude were retained as predictive variables, allowing the models to learn spatial price patterns directly from geographic coordinates.

---

## 🧠 Regression Models

The project compared four regression approaches.

| Model | Type | Purpose |
| --- | --- | --- |
| **Linear Regression** | Linear baseline | Establish a simple benchmark |
| **Ridge Regression** | Regularized linear model | Test whether regularization improves the linear baseline |
| **Random Forest Regressor** | Ensemble / tree-based | Capture complex non-linear relationships |
| **Gradient Boosting Regressor** | Ensemble / boosting | Build sequential trees to improve prediction error |

### Linear Regression

Linear Regression provided a baseline for understanding whether housing prices could be represented adequately as a linear combination of the available features.

The model performed poorly relative to the ensemble methods.

This suggested that the underlying relationships between property characteristics, location, and price were substantially more complex than a simple linear model could capture.

### Ridge Regression

Ridge Regression adds L2 regularization to the linear model.

It can reduce instability when predictors are correlated and can improve generalization when ordinary linear regression overfits.

In this project, Ridge Regression produced only a small improvement over Linear Regression.

This indicated that the primary limitation was not simply coefficient instability or overfitting—it was the inability of a linear functional form to represent the underlying relationships effectively.

### Random Forest Regressor

Random Forest combines many decision trees and averages their predictions.

This allows the model to capture:

- non-linear relationships;
- feature interactions;
- threshold effects;
- heterogeneous market segments.

The Random Forest Regressor produced the best performance among the evaluated models.

### Gradient Boosting Regressor

Gradient Boosting builds trees sequentially, with each new model attempting to correct errors made by the previous ensemble.

Its performance was very close to Random Forest and dramatically stronger than the linear models.

This provided additional evidence that **non-linear ensemble methods were much better suited to the structure of this housing dataset**.

---

## ⚙️ Model Evaluation

The primary model-comparison metric was **Root Mean Squared Error (RMSE)** on the original price scale.

RMSE is defined conceptually as:

```text
Prediction Errors
       ↓
Square Errors
       ↓
Average Squared Error
       ↓
Square Root
       ↓
RMSE
```

Because errors are squared before averaging, RMSE penalizes large prediction errors strongly.

This is particularly relevant for NYC housing data because high-value properties can generate very large absolute errors.

The project also used **actual-vs.-predicted plots** to visually inspect model behavior.

---

## 📈 Model Performance

| Model | RMSE — Original Scale |
| --- | ---: |
| Linear Regression | $18,583,888 |
| Ridge Regression | $18,482,892 |
| **Random Forest Regressor** | **$1,214,838** |
| Gradient Boosting Regressor | $1,228,725 |

The difference between the linear and ensemble models was substantial.

### Linear Models

Linear Regression and Ridge Regression both produced RMSE values above **$18 million**.

The small improvement from Linear Regression to Ridge Regression indicates that regularization alone could not solve the core modeling problem.

### Ensemble Models

Random Forest and Gradient Boosting reduced RMSE to approximately **$1.2 million**.

The best result was:

> **Random Forest Regressor — RMSE ≈ $1,214,838**

Gradient Boosting was close behind at approximately **$1,228,725**.

The performance gap strongly suggests that the dataset contains important **non-linear effects and feature interactions**.

---

## 🏆 Model Selection

### Random Forest — Best Overall Performance

The **Random Forest Regressor** achieved the lowest RMSE:

**RMSE ≈ $1,214,838**

It therefore provided the strongest predictive performance among the four models evaluated.

### Why Random Forest Performed Better

Housing prices are influenced by interacting factors.

For example, additional square footage may have a different effect depending on:

- location;
- property type;
- number of bathrooms;
- market segment.

A linear model assumes a comparatively simple additive structure.

Random Forest can instead partition the feature space into many regions and learn different relationships within those regions.

Conceptually:

```text
Property Features
       ↓
Many Decision Trees
       ↓
Different Non-Linear Partitions
       ↓
Aggregate Predictions
       ↓
Final Housing Price Estimate
```

This flexibility likely explains much of the large performance advantage over the linear models.

---

## 🔍 Feature Importance

The model analysis identified several important price drivers.

### Bathrooms

The number of bathrooms was among the strongest predictors.

Bathroom count can capture not only property functionality but also aspects of overall property size, quality, and market segment.

### Property Square Footage

`PROPERTYSQFT` was another major predictor.

Larger properties generally command higher prices, although the relationship is not necessarily linear across all NYC market segments.

### Geographic Location

Latitude and longitude contributed predictive information, confirming that spatial location matters even after other property characteristics are considered.

### Manhattan / New York County

`LOCALITY_New York County` was an important categorical feature.

This reflects the strong location premium associated with Manhattan within the broader NYC housing market.

The feature-importance analysis therefore supports a combination of:

```text
Property Characteristics
          +
Property Size
          +
Geographic Location
          ↓
     Housing Price
```

---

## 💼 Practical Interpretation

A housing-price prediction model can support several real-estate use cases.

### Automated Valuation

Property characteristics can be converted into approximate market-value predictions.

### Comparative Market Analysis

Predictions can provide an additional quantitative reference when comparing properties.

### Market Segmentation

Feature relationships can help identify how different property and geographic characteristics influence valuation.

### Investment Screening

Predictive models can potentially help identify properties whose observed prices differ materially from model-estimated values.

### Decision Support

The model should be treated as a decision-support system rather than a replacement for professional valuation.

Important information may be missing from the dataset, including:

- renovation quality;
- exact neighborhood characteristics;
- building condition;
- floor level;
- views;
- amenities;
- proximity to transportation;
- current market conditions.

---

## 🧩 Challenges & How I Addressed Them

| Challenge | How I Addressed It | What It Demonstrated |
| --- | --- | --- |
| **Highly skewed housing prices** | Analyzed the target distribution and investigated extreme values | Exploratory-data reasoning |
| **Significant outliers** | Used distribution and boxplot analysis as part of preprocessing decisions | Robust data preparation |
| **Missing data** | Inspected and handled missing observations before modeling | Data-quality management |
| **Geographic dependence** | Incorporated latitude, longitude, locality, and borough-boundary analysis | Geospatial analytics |
| **Categorical property information** | Converted categorical variables into model-compatible features | Feature preprocessing |
| **Complex price relationships** | Compared linear models with tree-based ensemble methods | Model-selection reasoning |
| **Very poor linear-model performance** | Tested non-linear Random Forest and Gradient Boosting models | Iterative modeling |
| **Model comparison** | Evaluated all models using RMSE on the original price scale | Consistent evaluation |
| **Interpretability** | Examined feature importance to identify major price drivers | Model interpretation |

---

## 🛠️ Technical Stack

| Area | Technologies & Methods |
| --- | --- |
| **Programming** | Python |
| **Data Processing** | Pandas, NumPy |
| **Geospatial Analysis** | GeoPandas |
| **Machine Learning** | Scikit-learn |
| **Models** | Linear Regression, Ridge Regression, Random Forest, Gradient Boosting |
| **Evaluation** | RMSE, Actual vs. Predicted Analysis |
| **Visualization** | Matplotlib, Seaborn |
| **Geographic Features** | Latitude, Longitude, Borough Boundaries |
| **Environment** | Jupyter Notebook |

---

## ⚠️ Limitations & Critical Evaluation

### High Absolute Prediction Error

Although Random Forest dramatically outperformed the linear models, an RMSE of approximately **$1.2 million remains large in absolute terms**.

This reflects both the difficulty of NYC property valuation and limitations in the available features.

The result should therefore not be interpreted as production-grade appraisal accuracy.

### Extreme Price Distribution

NYC contains unusually expensive properties.

Because RMSE strongly penalizes large errors, a relatively small number of extreme observations can materially influence the metric.

Alternative target transformations, segmentation strategies, and robust evaluation metrics could provide additional insight.

### Limited Location Representation

Latitude, longitude, and locality provide useful spatial information, but they do not fully describe neighborhood context.

Housing valuation can depend strongly on factors such as:

- subway accessibility;
- school quality;
- crime rates;
- walkability;
- parks;
- commercial districts;
- waterfront access;
- neighborhood desirability.

### Limited Property Detail

Important property characteristics may not be represented adequately in the dataset.

Two properties with similar square footage and room counts can have very different market values because of condition, renovation, building quality, views, or amenities.

### Temporal Effects

Housing prices change over time.

A stronger production model would need to explicitly account for:

- sale date;
- market cycle;
- mortgage rates;
- inventory;
- broader economic conditions.

### Model Validation

The project compared models using RMSE and diagnostic visualizations.

A production system would benefit from stronger validation procedures, including cross-validation, segment-level evaluation, temporal validation, and monitoring.

---

## 🔄 Future Improvements

If I extended this project today, I would:

- experiment with **XGBoost, LightGBM, and CatBoost**;
- evaluate a logarithmic transformation of housing prices;
- compare RMSE with **MAE, median absolute error, and R²**;
- engineer richer neighborhood-level geographic features;
- calculate distances to subway stations, schools, parks, and commercial centers;
- incorporate external datasets such as school quality, crime statistics, and neighborhood amenities;
- model different price segments separately;
- investigate more robust outlier-treatment strategies;
- perform systematic cross-validation and hyperparameter optimization;
- test spatially aware validation to reduce geographic leakage;
- incorporate transaction dates and broader market conditions;
- use SHAP or similar techniques for more detailed model interpretation;
- create an interactive geospatial dashboard;
- package the final model behind an API for property valuation;
- monitor prediction error across boroughs and property segments.

---

## 🧠 What I Learned

This capstone brought together several foundational areas of data science in one end-to-end problem:

**data exploration → cleaning → visualization → geospatial analysis → feature engineering → modeling → evaluation → interpretation**

One of the clearest lessons was that **model complexity should reflect the structure of the problem**.

Linear Regression and Ridge Regression performed similarly and both produced very high RMSE values. Random Forest and Gradient Boosting reduced prediction error dramatically.

That comparison showed that simply regularizing a weak functional assumption does not necessarily solve the problem. When the underlying relationships are strongly non-linear and interaction-heavy, a model capable of representing those relationships may be more appropriate.

The project also reinforced that:

- outlier analysis can materially affect modeling decisions;
- geography is central to real-estate prediction;
- feature engineering is often as important as algorithm selection;
- categorical and spatial information can add substantial predictive value;
- model evaluation should consider the scale and distribution of the target;
- the lowest RMSE does not mean the problem has been fully solved;
- machine-learning predictions should be interpreted in the context of missing real-world information.

The key progression was from:

**"Can I fit a regression model to housing data?"**

to:

**"What structure does the housing market contain, and which modeling approach can represent it most effectively?"**

---

## 💬 Interview Quick Reference

| Question | Quick Answer |
| --- | --- |
| **What was the project?** | An end-to-end machine-learning project predicting NYC housing prices |
| **Project context?** | Capstone for the IBM & University of London Data Science Foundations Specialization |
| **What type of ML problem?** | Supervised regression |
| **Models compared?** | Linear Regression, Ridge Regression, Random Forest, and Gradient Boosting |
| **Best model?** | **Random Forest Regressor** |
| **Best RMSE?** | Approximately **$1,214,838** |
| **Gradient Boosting RMSE?** | Approximately **$1,228,725** |
| **Why did ensemble models perform better?** | Housing prices contain non-linear relationships and interactions that linear models could not represent effectively |
| **Important features?** | Bathrooms, property square footage, latitude/longitude, and Manhattan locality |
| **How was geography used?** | Latitude/longitude, locality features, and NYC borough-boundary visualization |
| **Primary evaluation metric?** | RMSE on the original price scale |
| **Main challenge?** | Highly skewed prices, major outliers, and complex geographic relationships |
| **Why was Ridge not enough?** | Regularization slightly improved the linear model, but the core relationships remained strongly non-linear |
| **Important limitation?** | Even the best model had an RMSE around $1.2M and lacked many real-world valuation factors |
| **What would you improve today?** | Richer location features, external datasets, advanced boosting models, stronger validation, and temporal modeling |
| **Main lesson?** | Model choice must reflect the structure of the data rather than relying on a single default regression approach |

---

## 📁 Repository Contents

The repository includes the housing dataset, geographic boundary data, analysis notebook(s), and generated visualizations where licensing and file-size constraints permit.

```text
.
├── README.md
├── NY-House-Dataset.csv
├── Borough_Boundaries_20250509.csv
├── *.ipynb
├── distribution_price.png
├── boxplot_outlier_price.png
├── boxplot_price_vs_type.png
├── scatterplot_propertysqft.png
├── geograph_scatterplot.png
├── property_borough_map.png
├── correlation_matrix.png
└── actual_vs_predicted_*.png
```

The analysis covers:

- data loading and inspection;
- exploratory data analysis;
- price-distribution analysis;
- missing-value handling;
- outlier analysis;
- feature engineering;
- geographic processing and visualization;
- categorical preprocessing;
- regression modeling;
- model evaluation;
- feature-importance analysis;
- actual-vs.-predicted visualization.

---

## 🎓 Project Context

This project was completed as the **capstone project** for:

**IBM & University of London — *Data Science Foundations Specialization***

It demonstrates the integration of:

**Python · Pandas · NumPy · GeoPandas · Scikit-learn · Exploratory Data Analysis · Geospatial Analysis · Feature Engineering · Regression · Random Forest · Gradient Boosting · Model Evaluation · Data Visualization**

It is included in my portfolio because it demonstrates an end-to-end applied data-science workflow combining conventional tabular machine learning with geographic analysis.

The project also demonstrates the ability to move from raw data through exploration and preprocessing to model comparison, interpretation, and critical evaluation rather than treating model training as an isolated step.

---

## 📄 License & Educational Use

This repository is intended for **educational and portfolio purposes**.

The project demonstrates data-science and machine-learning work completed as part of the IBM & University of London learning program. Any original course materials, datasets, or instructional content remain subject to their respective ownership and usage terms.

---

## 👤 Author

**Gregory Charles**

Data Science · Machine Learning · Generative AI · Data Visualization · Applied Software Development

[← Back to Main Projects Portfolio](../README.md)
