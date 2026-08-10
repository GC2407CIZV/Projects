# 🚄 Shinkansen Passenger Experience Prediction

**Machine Learning · Classification · CatBoost · XGBoost · LightGBM · Feature Engineering · Hyperparameter Optimization**

> **Project Context:** MIT IDSS — *Data Science and Machine Learning: Making Data-Driven Decisions*  
> **Hackathon Result:** **7th place out of 36 participants**  
> **Official Competition Score:** **0.9572777**  
> **Post-Hackathon Best Internal Accuracy:** **0.9601**  
> **Post-Hackathon ROC AUC:** **0.9944**

An end-to-end machine learning project for predicting **Shinkansen passenger satisfaction** from passenger characteristics, journey information, delays, and service-feedback data.

The project originated as an **MIT IDSS machine learning hackathon submission** and was subsequently expanded after the competition through additional feature engineering, model experimentation, and extensive CatBoost hyperparameter optimization.

---

## ⭐ Key Highlights

- Placed **7th out of 36 participants** in the MIT IDSS hackathon.
- Achieved an official external competition score of **0.9572777**.
- Combined passenger travel information with detailed service-feedback data.
- Performed exploratory analysis, missing-value treatment, outlier handling, encoding, scaling, and feature engineering.
- Compared **Decision Tree, Random Forest, XGBoost, LightGBM, and CatBoost**.
- Identified boosting models—particularly **CatBoost and XGBoost**—as the strongest approaches.
- Experimented with multiple CatBoost optimization strategies:
  - GridSearchCV
  - RandomizedSearchCV
  - Hyperopt
  - Optuna
  - Manual Random Search
  - Manual Grid Search
  - Manual Iterative Search
  - Manual Sequential Search
- Continued developing the project after the hackathon.
- Reached approximately **96.01% internal holdout accuracy** and **0.9944 ROC AUC** with the later enhanced CatBoost model.
- Used feature importance to investigate the service and passenger characteristics most associated with overall satisfaction.
- Kept **competition performance** and **internal model evaluation** explicitly separate.

---

## 🎯 Business Problem

Passenger-experience surveys contain valuable information about operational performance and service quality, but individual survey responses do not directly reveal which combinations of factors are most useful for predicting overall satisfaction.

The central problem was:

> **Can machine learning predict whether a passenger will report a positive overall experience based on travel characteristics, operational factors, and individual service ratings?**

A reliable model could support analysis of:

- passenger satisfaction patterns;
- service-quality priorities;
- operational pain points;
- differences among passenger groups;
- areas requiring further investigation.

The target variable was:

```text
Overall_Experience
```

with the problem formulated as binary classification:

```text
Passenger + Journey + Service Data
                  ↓
         Machine Learning Model
                  ↓
       Overall_Experience
             0 or 1
```

---

## 🏆 Hackathon Result

The project originated in a machine learning hackathon associated with:

**MIT IDSS — Data Science and Machine Learning: Making Data-Driven Decisions**

My submitted prediction file achieved an external competition score of:

**0.9572777**

and placed:

**7th out of 36 participants**

The preserved competition-stage work is associated with the `S6.ipynb` iteration and its corresponding prediction submission.

### Why the Competition Score Matters

The **0.9572777** score is different from the model's internal validation metrics.

It represents performance on the competition's external evaluation data rather than on my own train/test split.

```text
Internal Validation
        ↓
Model development and comparison

External Competition Score
        ↓
Performance on unseen hackathon evaluation data
```

For that reason, **0.9572777 is the primary externally evaluated hackathon result** reported for this project.

---

## 🔄 Post-Hackathon Development

I continued working on the project after the hackathon rather than treating the competition submission as the final version.

The later `Final.ipynb` iteration expanded the modeling and optimization workflow and investigated whether further improvements could be obtained.

This included:

- additional CatBoost optimization;
- broader and refined parameter searches;
- Hyperopt experimentation;
- Optuna experimentation;
- comparison among optimization strategies;
- further model evaluation.

The strongest documented post-hackathon configuration achieved approximately:

| Metric | Internal Holdout Result |
| --- | ---: |
| **Accuracy** | **0.9601** |
| **ROC AUC** | **0.9944** |

The strongest later configuration used **CatBoost with refined Optuna optimization**.

### Important Evaluation Distinction

The following numbers should **not** be interpreted as a direct before-and-after leaderboard comparison:

| Stage | Result | Evaluation |
| --- | ---: | --- |
| **Hackathon Submission** | **0.9572777** | External competition evaluation |
| **Post-Hackathon Model** | **0.9601 accuracy** | Internal holdout evaluation |
| **Post-Hackathon Model** | **0.9944 ROC AUC** | Internal holdout evaluation |

The later results demonstrate continued model development, but they were obtained under a different evaluation framework.

---

## 🗂️ Dataset

The project combines two complementary sources of passenger information.

### Travel Data

Travel-related variables include:

- `Gender`
- `Customer_Type`
- `Age`
- `Type_Travel`
- `Travel_Class`
- `Travel_Distance`
- `Departure_Delay_in_Mins`
- `Arrival_Delay_in_Mins`

### Survey Data

Passenger service evaluations include variables such as:

- Seat Comfort
- Departure / Arrival Convenience
- Catering
- Platform Location
- Onboard Wi-Fi Service
- Onboard Entertainment
- Online Support
- Ease of Online Booking
- Onboard Service
- Leg Room Service
- Baggage Handling
- Check-in Service
- Cleanliness
- Online Boarding

The target variable is:

```text
Overall_Experience
```

The travel and survey datasets were combined using the passenger `ID`.

---

## 🔍 Exploratory Data Analysis

The exploratory stage examined:

- target distribution;
- missing values;
- numerical and categorical distributions;
- passenger demographics;
- travel behavior;
- delay patterns;
- service ratings;
- outliers;
- relationships with overall passenger experience.

### Delays

Departure and arrival delays were strongly right-skewed and closely related, suggesting that delay information could benefit from additional transformation and aggregation.

### Travel Distance

Travel distance was also right-skewed and contained extreme observations.

### Passenger Characteristics

Variables such as customer type, travel purpose, travel class, and age showed useful relationships with passenger experience.

### Service Ratings

Several service variables were strongly associated with `Overall_Experience`, particularly those related to the onboard and digital passenger experience.

This suggested that overall satisfaction depended on a combination of:

```text
Passenger Characteristics
          +
Travel Context
          +
Operational Performance
          +
Service Quality
          ↓
Overall Passenger Experience
```

---

## 🧹 Data Preprocessing

The project required preprocessing because the source data contained numerical and categorical information as well as missing and extreme values.

### Missing Values

Different project iterations explored appropriate treatment of missing data.

The competition-stage workflow retained missing values where supported by tree-based boosting algorithms such as CatBoost and XGBoost.

The expanded analysis also experimented with explicit imputation strategies depending on feature characteristics:

- mean imputation for suitable numerical variables;
- median imputation for skewed numerical variables;
- mode / most-frequent-category imputation for categorical variables.

This experimentation helped assess how preprocessing decisions interact with modern tree-based models.

### Outlier Treatment

Several continuous variables contained long-tailed distributions, particularly:

```text
Departure_Delay_in_Mins
Arrival_Delay_in_Mins
Travel_Distance
```

The expanded workflow experimented with percentile-based capping to reduce the influence of unusually extreme observations without automatically discarding complete passenger records.

---

## 🧠 Feature Engineering

Feature engineering was used to expose potentially useful relationships not represented directly by the original variables.

### Total Delay

Departure and arrival delays were combined:

```text
Total_Delay =
    Departure_Delay_in_Mins
  + Arrival_Delay_in_Mins
```

### Age Groups

Passenger age was transformed into age bands to capture potentially non-linear relationships between age and satisfaction.

### Travel-Distance Groups

Travel distance was grouped into interpretable journey-length categories.

### Delay Groups

Delay variables were transformed into categorical ranges such as:

```text
No Delay
Short Delay
Medium Delay
Long Delay
```

### Interaction & Derived Features

Later experimentation also explored derived and interaction-style features designed to represent relationships among passenger characteristics, travel conditions, and service evaluations.

---

## 🤖 Model Development

Multiple classification algorithms were compared.

| Model | Role |
| --- | --- |
| **Decision Tree** | Interpretable tree-based baseline |
| **Random Forest** | Bagged ensemble model |
| **XGBoost** | Gradient-boosting model |
| **LightGBM** | Efficient gradient-boosting model |
| **CatBoost** | High-performance boosting model for structured data |

The boosting approaches substantially outperformed the simpler baseline models.

CatBoost emerged as the primary model for deeper optimization.

---

## ⚙️ CatBoost Hyperparameter Optimization

One of the most extensive parts of the project was the comparison of multiple optimization strategies.

### Automated Methods

- **GridSearchCV**
- **RandomizedSearchCV**
- **Hyperopt**
- **Optuna**

### Custom Search Methods

- **Manual Random Search**
- **Manual Grid Search**
- **Manual Iterative Search**
- **Manual Sequential Search**

Parameters investigated included:

```text
iterations
depth
learning_rate
l2_leaf_reg
```

This allowed comparison not only of model configurations, but also of different approaches to the optimization process itself.

---

## 📊 Model Evaluation

Classification performance was evaluated using multiple metrics:

- Accuracy
- Precision
- Recall
- F1-score
- ROC AUC

This was important because accuracy alone does not describe every aspect of classification quality.

### Competition Performance

```text
External Hackathon Score: 0.9572777
Final Placement:          7 / 36
```

### Enhanced Post-Hackathon Model

The strongest documented later model achieved approximately:

```text
Internal Accuracy:  0.9601
Internal ROC AUC:   0.9944
```

The ROC AUC indicates very strong ranking ability within the project's internal evaluation framework.

---

## 🔬 What the Optimization Experiments Showed

An important lesson from the project was that increasingly sophisticated hyperparameter optimization did **not** necessarily produce dramatic improvements.

Several CatBoost configurations converged on very similar performance.

This suggested that once CatBoost reached a strong region of its parameter space:

> **Data preparation, feature representation, and model family mattered at least as much as increasingly exhaustive hyperparameter search.**

This demonstrates the importance of considering the **cost-benefit trade-off of model optimization**, rather than simply reporting the largest metric obtained.

---

## 🔎 Feature Importance

Feature-importance analysis was used to understand which variables contributed most strongly to the model's predictions.

Important groups included variables associated with:

- seat comfort;
- onboard entertainment;
- online services;
- customer type;
- travel purpose;
- travel class;
- check-in experience;
- travel distance;
- passenger characteristics.

### Business Interpretation

The analysis suggested that passenger satisfaction was not determined solely by punctuality.

Service-quality variables—particularly those associated with the onboard experience—provided substantial predictive information.

```text
Operational Reliability
        +
Physical Comfort
        +
Onboard Services
        +
Digital Experience
        +
Customer Support
        +
Passenger Context
        ↓
Overall Experience
```

However, feature importance represents **predictive association, not causation**.

A feature being important to the model does not prove that changing that feature alone will cause an equivalent improvement in satisfaction.

---

## 💼 Potential Business Applications

A model of this type could support several analytical applications.

### Passenger Experience Analysis

Identify combinations of characteristics associated with positive and negative passenger experiences.

### Service Prioritization

Use model interpretation to identify service dimensions that deserve deeper investigation.

### Customer Segmentation

Analyze whether different passenger groups respond differently to service conditions.

### Proactive Experience Management

With appropriate real-time data and production validation, similar models could potentially help identify journeys or passenger groups at higher risk of dissatisfaction.

### Operational Decision Support

Combine predictions with business rules and service metrics to support more targeted investigation and resource allocation.

---

## 🧩 Challenges & How I Addressed Them

| Challenge | How I Addressed It | What It Demonstrated |
| --- | --- | --- |
| **Separate travel and survey datasets** | Joined records using passenger ID | Data integration |
| **Mixed data types** | Used appropriate numerical and categorical preprocessing | Data preparation |
| **Missing information** | Explored native boosting support and explicit imputation approaches | Model-aware preprocessing |
| **Highly skewed delays** | Investigated outlier treatment and derived delay features | Robust feature engineering |
| **Complex non-linear relationships** | Compared tree ensembles and gradient-boosting models | Model selection |
| **Choosing the strongest model family** | Benchmarked Decision Tree, Random Forest, XGBoost, LightGBM, and CatBoost | Experimental comparison |
| **CatBoost optimization** | Compared automated and custom search strategies | Hyperparameter tuning |
| **Multiple performance objectives** | Evaluated Accuracy, Precision, Recall, F1, and ROC AUC | Multi-metric evaluation |
| **Competition vs. local results** | Kept external leaderboard performance separate from internal validation | Evaluation discipline |
| **Interpreting a high-performing model** | Analyzed feature importance while avoiding causal claims | Responsible model interpretation |
| **Competition time constraints** | Continued investigating and improving the project after the hackathon | Iterative problem solving |

---

## 🛠️ Technical Stack

| Area | Technologies & Methods |
| --- | --- |
| **Programming** | Python |
| **Data Manipulation** | Pandas, NumPy |
| **Visualization** | Matplotlib, Seaborn |
| **Machine Learning** | Scikit-learn |
| **Models** | Decision Tree, Random Forest, XGBoost, LightGBM, CatBoost |
| **Boosting Libraries** | XGBoost, LightGBM, CatBoost |
| **Preprocessing** | Missing-value treatment, outlier handling, encoding, scaling |
| **Feature Engineering** | Delay aggregation, grouping, derived and interaction features |
| **Optimization** | GridSearchCV, RandomizedSearchCV, Hyperopt, Optuna, custom searches |
| **Evaluation** | Accuracy, Precision, Recall, F1-score, ROC AUC |
| **Interpretability** | Feature Importance |
| **Environment** | Jupyter Notebook / Google Colab |

---

## ⚠️ Limitations & Critical Evaluation

### Competition and Internal Metrics Are Not Directly Comparable

The official hackathon score of **0.9572777** came from an external competition evaluation.

The later **0.9601 internal accuracy** was obtained using the project's own evaluation framework.

Therefore:

> **0.9601 should not be described as an improvement of the external leaderboard score from 0.9572777.**

It demonstrates stronger internal performance after further development, but the evaluation conditions differ.

### Predictive Association Is Not Causation

Feature importance identifies variables useful for prediction. It does not establish that changing those variables will directly cause passenger satisfaction to improve.

### Validation

The later headline metrics are based on an internal holdout evaluation.

A production model would require stronger validation across different time periods, routes, passenger populations, and operational conditions.

### Hyperparameter Search Has Diminishing Returns

Many optimized CatBoost configurations produced similar performance.

A production workflow should consider whether small metric improvements justify additional computational cost and complexity.

### Model Explainability

Feature importance provides useful global information but cannot fully explain individual passenger predictions.

More advanced interpretability methods could improve transparency.

---

## 🔄 Future Improvements

If I extended the project today, I would:

- create a strict **training / validation / final holdout** architecture;
- use stratified cross-validation consistently during model selection;
- package preprocessing and modeling into reproducible pipelines;
- perform systematic feature-engineering ablation studies;
- compare native CatBoost handling of missing/categorical data against explicit preprocessing;
- evaluate probability calibration;
- optimize decision thresholds based on operational costs;
- use **SHAP** for global and individual prediction explanations;
- test model stability across passenger groups;
- investigate appropriate fairness metrics;
- validate performance across routes and time periods;
- implement drift monitoring;
- develop an API or analytical dashboard;
- investigate whether model insights correspond to causal service improvements through controlled experiments.

---

## 🧠 What I Learned

This project was particularly valuable because it developed in **two stages**.

The hackathon required building a competitive machine-learning solution under constrained conditions. That work resulted in an external score of **0.9572777** and a **7th-place finish among 36 participants**.

After the competition, I continued working on the problem.

That second stage shifted the objective from:

> **"How can I produce the strongest competition submission within the available time?"**

toward:

> **"What else can I learn about this model, the optimization process, and the underlying passenger-experience problem?"**

Several lessons emerged:

- **Strong models still benefit from investigation.** CatBoost was already highly effective, but continued experimentation helped clarify how sensitive performance was to different hyperparameter configurations.
- **More tuning does not guarantee meaningful improvement.** Several optimization methods converged on similar results, demonstrating diminishing returns once a strong model is near a performance plateau.
- **Feature engineering matters.** Representing delays and passenger characteristics in alternative ways allowed the models to capture relationships beyond the raw variables.
- **External evaluation is especially valuable.** The hackathon score provided an evaluation on data outside my own model-development process.
- **Metrics need context.** A higher number is not automatically a better result if it comes from a different evaluation procedure.
- **Machine learning does not end at the leaderboard.** The post-hackathon work reinforced that a competition result can be the beginning of deeper experimentation rather than the end of the project.

---

## 💬 Interview Quick Reference

| Question | Quick Answer |
| --- | --- |
| **What was the project?** | Predicting Shinkansen passenger satisfaction using travel and service-feedback data |
| **Project context?** | MIT IDSS — Data Science and Machine Learning: Making Data-Driven Decisions hackathon |
| **Hackathon placement?** | **7th out of 36 participants** |
| **Official competition score?** | **0.9572777** |
| **What did you do after the hackathon?** | Continued developing the project with additional experimentation and CatBoost optimization |
| **Best later internal accuracy?** | Approximately **0.9601** |
| **Best later ROC AUC?** | Approximately **0.9944** |
| **Can 0.9601 be directly compared with 0.9572777?** | No. The first is an internal holdout metric; the second is an external competition score |
| **Models compared?** | Decision Tree, Random Forest, XGBoost, LightGBM, CatBoost |
| **Strongest model family?** | CatBoost |
| **Optimization methods?** | GridSearchCV, RandomizedSearchCV, Hyperopt, Optuna, plus several manual search strategies |
| **Feature engineering?** | Total delay, age groups, travel-distance groups, delay groups, and additional derived features |
| **Important predictors?** | Seat comfort, onboard entertainment, travel purpose, customer characteristics, and other service variables |
| **Interesting optimization lesson?** | Different CatBoost tuning strategies converged on similar performance, demonstrating diminishing returns |
| **Main modeling limitation?** | Strong predictive performance does not establish causal relationships |
| **What would you improve today?** | Stronger validation, reproducible pipelines, SHAP, calibration, threshold optimization, ablation testing, and drift monitoring |
| **What makes the project valuable?** | It combines an externally evaluated competition result with continued independent model development |

---

## 📁 Repository Structure

A clean repository structure would be:

```text
.
├── README.md
├── S6.ipynb
├── Final.ipynb
├── submissions/
│   └── S6_0.9572777.csv
└── data/
    ├── Traveldata_train.csv
    ├── Surveydata_train.csv
    ├── Traveldata_test.csv
    └── Surveydata_test.csv
```

### Key Files

**`S6.ipynb`**  
Competition-stage notebook associated with the hackathon solution.

**`S6_0.9572777.csv`**  
Prediction submission associated with the **0.9572777 external competition score**.

**`Final.ipynb`**  
Later post-hackathon development containing additional experimentation and optimization.

> Dataset files should only be included publicly where permitted by the original course or challenge terms.

---

## 🎓 Project Context

This project was developed in connection with:

**MIT Institute for Data, Systems, and Society (IDSS)**  
**Data Science and Machine Learning: Making Data-Driven Decisions**

It demonstrates applied experience in:

**Python · Pandas · NumPy · Exploratory Data Analysis · Data Preprocessing · Feature Engineering · Classification · Ensemble Learning · Gradient Boosting · XGBoost · LightGBM · CatBoost · Hyperparameter Optimization · Hyperopt · Optuna · Model Evaluation · Feature Importance · Business Analytics**

The project is particularly useful in my portfolio because it demonstrates both:

1. **performance under competitive hackathon constraints**, and
2. **continued independent experimentation after the competition**.

---

## 📄 Educational & Portfolio Use

This repository is intended for **educational and portfolio purposes**.

The project demonstrates machine-learning work developed in connection with the MIT IDSS learning program and subsequently expanded through additional experimentation.

Any original datasets, course materials, challenge materials, or other third-party content remain subject to their respective ownership and usage terms.

---

## 👤 Author

**Gregory Charles**

Data Science · Machine Learning · Generative AI · Data Visualization · Applied Software Development

[← Back to Main Projects Portfolio](../README.md)
