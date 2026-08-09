# 🚀 Winning the Space Race with Data Science

**Data Science · Machine Learning · SQL · Interactive Analytics**

> **Project Context:** IBM Data Science Professional Certificate Capstone

An end-to-end data science project investigating whether **Falcon 9 first-stage landing success** can be predicted from historical launch characteristics.

The project combines **REST API data collection, web scraping, data wrangling, SQL, exploratory data analysis, Folium geospatial visualization, Plotly Dash, and machine learning**. Four classification algorithms were compared, with **KNN achieving the strongest documented test accuracy of 83.3%**.

---

## ⭐ Key Highlights

- Built an **end-to-end data science workflow** from external data acquisition through predictive modeling.
- Collected Falcon 9 launch data using both the **SpaceX REST API** and **Wikipedia web scraping**.
- Used **Python and SQL** for data preparation, exploratory analysis, and targeted analytical queries.
- Created interactive geospatial analysis with **Folium** and an exploratory dashboard with **Plotly Dash**.
- Compared **Logistic Regression, SVM, Decision Tree, and KNN** classifiers.
- Tuned model hyperparameters systematically using **GridSearchCV**.
- Best documented held-out result: **KNN — 83.3% test accuracy**.
- Demonstrated a workflow spanning **data acquisition, wrangling, EDA, visualization, application development, and machine learning**.

---

## 🎯 Problem & Objectives

The project was designed to investigate Falcon 9 landing performance from several complementary perspectives:

1. Collect historical Falcon 9 launch data from multiple sources.
2. Clean and transform the collected data into an analysis-ready dataset.
3. Explore relationships between launch characteristics and landing outcomes.
4. Query launch data using SQL to answer targeted analytical questions.
5. Visualize launch sites and outcomes geographically.
6. Build an interactive dashboard for exploring launch performance.
7. Train and tune multiple classification algorithms.
8. Compare their ability to predict first-stage landing success.

Rather than focusing only on model training, the project demonstrates the broader workflow required to move from **raw external data to analysis, visualization, and predictive modeling**.

---

## 🔄 Analytical Workflow

```text
SpaceX REST API ───────┐
                       ├──► Data Collection
Wikipedia Scraping ────┘
                              │
                              ▼
                       Data Wrangling
                              │
                ┌─────────────┴─────────────┐
                ▼                           ▼
          SQL Analysis                     EDA
                │                           │
                └─────────────┬─────────────┘
                              ▼
                   Interactive Analysis
                    ┌─────────┴─────────┐
                    ▼                   ▼
                Folium Maps        Plotly Dash
                    └─────────┬─────────┘
                              ▼
                      Feature Engineering
                              │
                              ▼
                     Model Development
                              │
                              ▼
                       GridSearchCV
                              │
                              ▼
                     Model Evaluation
```

---

## 🛠️ Technical Stack

### Programming & Data Analysis

- Python
- Pandas
- NumPy
- SQL

### Data Collection

- REST APIs
- Requests
- BeautifulSoup
- Web scraping

### Visualization

- Matplotlib
- Seaborn
- Plotly
- Folium

### Dashboard Development

- Plotly Dash

### Machine Learning

- Scikit-learn
- Logistic Regression
- Support Vector Machine
- Decision Tree
- K-Nearest Neighbors
- GridSearchCV

---

## 🔍 Methodology

## 1. Data Collection

Historical Falcon 9 launch information was collected through two complementary approaches.

### SpaceX REST API

The SpaceX API was used to retrieve structured launch information programmatically.

The collected data included launch-related variables such as:

- flight information,
- payload characteristics,
- launch sites,
- orbit information,
- booster-related attributes,
- and landing outcomes.

API responses were processed and converted into a structured dataset suitable for analysis.

### Web Scraping

A second dataset was constructed by scraping Falcon 9 launch records from Wikipedia using **BeautifulSoup**.

This stage demonstrated how information from an HTML source can be:

1. retrieved,
2. parsed,
3. extracted from tables,
4. cleaned,
5. and transformed into structured data.

Using both approaches provided experience working with **structured API data and semi-structured web data**.

---

## 2. Data Wrangling

The raw launch data required preprocessing before analysis and modeling.

The wrangling process included:

- inspecting missing values,
- selecting relevant Falcon 9 records,
- cleaning inconsistent fields,
- transforming landing outcomes,
- preparing categorical variables,
- and constructing the target variable used for classification.

Landing outcomes were converted into a binary representation indicating whether the first-stage landing was successful.

Categorical features required for machine learning were subsequently transformed using **one-hot encoding**.

This stage converted raw launch records into a consistent analytical dataset.

---

## 3. Exploratory Data Analysis

Exploratory Data Analysis (EDA) was used to investigate how different mission characteristics related to first-stage landing success.

Variables examined included:

- flight number,
- payload mass,
- launch site,
- orbit,
- and launch year.

Visual analysis was used to identify patterns that would be difficult to observe from raw tables alone.

Particular attention was given to the relationship between:

```text
Launch Characteristics
        │
        ├── Flight Number
        ├── Payload Mass
        ├── Launch Site
        ├── Orbit
        └── Launch Year
        │
        ▼
Landing Success / Failure
```

The analysis indicated that landing outcomes were associated with several interacting mission characteristics rather than a single explanatory variable.

---

## 4. SQL Analysis

SQL was used as a complementary analytical tool for querying the launch dataset.

Queries were designed to extract targeted information such as:

- launch-site activity,
- payload statistics,
- mission characteristics,
- landing outcomes,
- and other aggregated launch metrics.

This stage demonstrates the use of **SQL alongside Python-based analysis** within the same data science workflow.

---

## 5. Geospatial Analysis with Folium

Launch-site performance was explored geographically using **Folium**.

Interactive maps were created to visualize:

- Falcon 9 launch-site locations,
- successful and unsuccessful launches,
- surrounding infrastructure,
- and geographic relationships around launch facilities.

Markers and map-based visualizations made it possible to investigate launch performance from a spatial perspective rather than relying solely on tables and charts.

This part of the project demonstrates the use of **geospatial visualization for exploratory data analysis**.

---

## 6. Interactive Dashboard with Plotly Dash

An interactive dashboard was developed using **Plotly Dash** to allow users to explore Falcon 9 launch data dynamically.

The dashboard includes functionality for:

### Launch-Site Selection

Users can examine:

- all launch sites together,
- or an individual launch site.

### Landing Success Visualization

A dynamic pie chart displays the relationship between successful and unsuccessful launches based on the selected site.

### Payload Filtering

A payload-range control allows users to restrict the analysis to missions within selected payload ranges.

### Payload vs. Landing Outcome

An interactive scatter plot explores the relationship between:

- payload mass,
- booster version,
- launch site,
- and landing outcome.

The dashboard transforms the analysis from a collection of static charts into an **interactive exploratory tool**.

---

## 🤖 Machine Learning

## Feature Preparation

Before training the models, categorical launch characteristics were converted into numerical features using one-hot encoding.

The feature set included information derived from variables such as:

- orbit,
- launch site,
- landing pad,
- booster-related characteristics,
- and other mission attributes.

The resulting feature matrix was standardized where required before model training and evaluation.

---

## Models Evaluated

Four supervised classification algorithms were compared.

| Model | Purpose |
|---|---|
| **Logistic Regression** | Establish a linear classification baseline |
| **Support Vector Machine** | Model more complex decision boundaries |
| **Decision Tree** | Capture nonlinear feature interactions |
| **K-Nearest Neighbors** | Classify launches based on similar historical observations |

Rather than assuming one algorithm would perform best, the project compared several different modeling approaches.

---

## Hyperparameter Optimization

Model parameters were tuned using **GridSearchCV**.

This allowed combinations of hyperparameters to be evaluated systematically using cross-validation rather than manually selecting a single configuration.

The workflow followed the general pattern:

```text
Training Data
     │
     ▼
Candidate Model
     │
     ▼
Parameter Grid
     │
     ▼
GridSearchCV
     │
     ▼
Best Parameters
     │
     ▼
Test Evaluation
```

This provided a more systematic basis for comparing model performance.

---

## 📊 Results & Key Findings

## Model Performance

The classification models were evaluated on held-out test data after hyperparameter tuning.

The strongest documented test result in the completed analysis was:

> **K-Nearest Neighbors (KNN): 83.3% test accuracy**

The result shows that historical launch characteristics contained useful predictive information about Falcon 9 first-stage landing outcomes.

Because the dataset used in the capstone is relatively small, the result should be interpreted as a demonstration of the predictive workflow rather than evidence of a production-ready landing prediction system.

---

## Analytical Findings

The exploratory analysis revealed several notable patterns.

### 📈 Landing Success Improved Over Time

Later Falcon 9 launches generally demonstrated higher landing success than earlier missions.

This is consistent with an evolving launch system in which operational experience and reusable-launch capabilities developed over successive flights.

---

### 🛰️ Launch Site and Mission Characteristics Matter

Landing success was not distributed uniformly across launch sites.

Sites differed in:

- number of launches,
- mission characteristics,
- payload ranges,
- and observed landing outcomes.

However, these differences should not automatically be interpreted as evidence that the launch site itself causes better landing performance, because launch site is associated with other mission variables.

---

### ⚖️ Payload Has a Nonlinear Relationship with Success

Payload mass showed a relationship with landing outcomes, but the exploratory analysis did not support treating payload weight as a simple independent predictor of success.

Payload interacts with other factors such as:

- orbit,
- launch site,
- mission profile,
- and booster configuration.

This makes landing prediction a **multivariable classification problem** rather than a simple payload-based rule.

---

### 🌍 Orbit Is Associated with Landing Outcomes

Landing success also varied across orbit categories.

Different orbital missions involve different mission profiles and constraints, which means orbit type provides useful information when examining historical landing outcomes.

As with launch site and payload, the relationship should be interpreted as an **observed association within the dataset**, rather than proof that orbit type alone determines landing success.

---


## 🧩 Challenges & How I Addressed Them

| Challenge | How I Addressed It | What It Taught Me |
| --- | --- | --- |
| **Working with different external data sources** | Collected structured data through the SpaceX API and supplementary tabular data through web scraping, then transformed both into analysis-ready formats | Real data science often begins with heterogeneous data acquisition rather than a clean dataset |
| **Preparing categorical launch data for modeling** | Cleaned mission variables, constructed the binary landing target, applied one-hot encoding, and standardized features where required | Model performance depends on a reproducible preprocessing pipeline |
| **Understanding a multivariable landing problem** | Examined payload, orbit, launch site, flight history, and other mission characteristics together rather than relying on a single-variable explanation | Exploratory patterns need to be interpreted in the context of interacting features |
| **Comparing different classifier families fairly** | Evaluated Logistic Regression, SVM, Decision Tree, and KNN and used GridSearchCV for systematic hyperparameter tuning | Model selection should be comparative and evidence-based |
| **Interpreting results from a relatively small historical dataset** | Treated the 83.3% KNN result as a capstone evaluation result rather than claiming production-ready predictive performance | Evaluation metrics need to be interpreted in light of dataset size, sampling, and deployment context |
| **Communicating the analysis beyond notebooks** | Added Folium maps and a Plotly Dash application so launch patterns could be explored interactively | Data science includes communicating results through usable analytical interfaces |

---

## 🧠 What This Project Demonstrates

Although the final stage involves machine learning, the project covers substantially more than predictive modeling.

It demonstrates experience with:

### Data Acquisition
- REST API integration
- HTTP requests
- web scraping
- HTML parsing

### Data Engineering & Preparation
- data cleaning
- missing-value handling
- feature preparation
- categorical encoding

### Data Analysis
- Pandas
- SQL
- exploratory data analysis
- statistical summaries

### Data Visualization
- Matplotlib
- Seaborn
- Plotly

### Geospatial Analysis
- Folium
- interactive map markers
- spatial exploration

### Application Development
- Plotly Dash
- interactive filters
- callbacks
- dynamic visualizations

### Machine Learning
- classification
- feature preprocessing
- cross-validation
- hyperparameter optimization
- model comparison
- confusion-matrix analysis

The project therefore represents an **end-to-end applied data science workflow**, from external data acquisition through interactive analytics and predictive modeling.

---


## 🧠 What I Learned

This project was valuable because it connected individual data science techniques into a single workflow.

The most important lessons were:

- external data often requires substantial collection and preparation before modeling begins;
- APIs and web scraping require different extraction and cleaning strategies;
- SQL and Python can complement each other within the same analytical workflow;
- interactive maps and dashboards can make analytical findings easier to explore than static notebooks alone;
- categorical preprocessing and feature preparation are essential parts of machine-learning pipelines;
- comparing several model families is more informative than assuming one algorithm will perform best;
- cross-validation and hyperparameter tuning help make model selection more systematic;
- a test-set accuracy such as **83.3%** must be interpreted in the context of dataset size and historical coverage;
- observed relationships between launch characteristics and landing outcomes should not be presented as causal effects.

If I rebuilt the project today, I would place even greater emphasis on **temporal validation, model stability, class balance, explainability, and reproducible preprocessing**.

---

## ⚠️ Limitations

Several limitations should be considered when interpreting the results.

### Dataset Size

The historical Falcon 9 dataset used for the capstone is relatively small compared with datasets typically used to develop production machine-learning systems.

### Historical Data

The model learns from historical launch conditions. Falcon 9 operations, hardware, procedures, and recovery performance have continued to evolve.

### Feature Availability

The model is restricted to the variables available in the project dataset. Real landing outcomes may depend on additional operational, environmental, engineering, and mission-specific factors that are not represented.

### Correlation vs. Causation

Patterns discovered through EDA identify associations within the dataset. They do not establish that variables such as payload mass, orbit, or launch site directly cause landing success or failure.

### Model Evaluation

The reported accuracy reflects performance on the project's test split. A more robust production evaluation would require substantially more data, repeated validation, and careful investigation of class balance and model stability.

---

## 🔄 Future Improvements

Several extensions could build on the existing work.

### Expand the Dataset

Incorporate additional and more recent launch records to determine whether patterns identified in the original dataset remain stable over time.

### Temporal Validation

Train models on earlier launches and evaluate them on later launches to better simulate prediction of future missions.

### Additional Features

Where reliable data is available, investigate variables such as:

- weather conditions,
- booster reuse history,
- mission-specific characteristics,
- landing method,
- and additional vehicle configuration data.

### Feature Importance & Explainability

Apply model interpretation techniques to investigate which variables contribute most strongly to predictions.

### Additional Ensemble Models

Compare the existing classifiers with algorithms designed for structured tabular data, such as:

- Random Forest,
- Gradient Boosting,
- XGBoost,
- or CatBoost.

These approaches would be a more natural extension of the existing tabular classification problem than introducing deep learning solely for additional model complexity.

---

## 📁 Project Structure

The repository contains the notebooks and application files used across the different stages of the IBM capstone project.

```text
.
├── data collection / API notebooks
├── web scraping notebooks
├── data wrangling notebooks
├── exploratory data analysis
├── SQL analysis
├── Folium geospatial analysis
├── Plotly Dash application
├── machine learning classification
└── final presentation
```

Together, these components document the progression from raw launch data to the final predictive analysis.

---


## 💬 Interview Quick Reference

| Question | Quick Answer |
| --- | --- |
| **What was the project?** | An end-to-end IBM capstone investigating whether Falcon 9 first-stage landing success could be predicted from historical launch characteristics |
| **What made it end-to-end?** | API + web scraping → wrangling → SQL/EDA → Folium → Plotly Dash → feature engineering → ML |
| **What data sources did you use?** | SpaceX REST API and supplementary Wikipedia launch data |
| **Which models did you compare?** | Logistic Regression, SVM, Decision Tree, and KNN |
| **How did you tune them?** | GridSearchCV with cross-validation |
| **Best documented result?** | KNN with **83.3% held-out test accuracy** |
| **Main analytical challenge?** | Converting heterogeneous launch data into a consistent feature set while interpreting interacting mission variables |
| **How did you communicate results?** | Static EDA, SQL analysis, Folium geospatial maps, and a Plotly Dash dashboard |
| **Important limitation?** | The historical capstone dataset is relatively small and launch technology/operations evolve over time |
| **What would you improve today?** | More recent data, temporal validation, stronger stability/class-balance analysis, explainability, and ensemble models |
| **Main lesson?** | A useful data science project spans acquisition, preparation, analysis, communication, modeling, and critical evaluation—not just model training |

---

## 🎓 Project Context

This project was completed as the capstone project for the **IBM Data Science Professional Certificate**.

The course provided the project framework and learning objectives, while the implementation demonstrates practical application of the tools and techniques covered throughout the program, including:

**Python · APIs · Web Scraping · SQL · Data Wrangling · EDA · Data Visualization · Folium · Plotly Dash · Scikit-learn · Machine Learning**

The project is retained in this portfolio as evidence of the development of an end-to-end data science workflow and as a foundation for later machine learning and AI projects.

---

## 🙏 Acknowledgements

- **IBM / Coursera** — for the Data Science Professional Certificate curriculum and capstone framework.
- **SpaceX** — for publicly accessible launch data used in the analysis.
- **Wikipedia contributors** — for supplementary historical launch information used during the web-scraping component.

---

## 👤 Author

**Gregory Charles**

Data Science · Machine Learning · Applied AI · Generative AI

For additional projects, see my main GitHub portfolio.
