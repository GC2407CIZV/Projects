# 🏅 Olympic Dataset Analysis for SportsStats

**Sports Analytics · Exploratory Data Analysis · Data Preparation · Machine Learning**

> **Project Context:** UC Davis — *Learn SQL Basics for Data Science* Capstone

Analyzed **271,116 Olympic athlete-event records** spanning approximately **120 years** to explore gender representation, athlete demographics, medal patterns, country and sport performance, and sport-specific physical profiles.

The project covers the analytical workflow from **data cleaning and missing-value treatment to exploratory analysis, visualization, feature engineering, aggregation, and predictive modeling**. A retrospective review also identified target leakage in the original Random Forest experiment—an important lesson in model validation and experimental design.

---

## ⭐ Key Highlights

- Analyzed **271,116 athlete-event records** across approximately 120 years of Olympic history.
- Created an **~180,685 athlete-year dataset** to reduce distortion from repeated event participation.
- Designed variable-specific strategies for substantial missing Age, Height, and Weight data.
- Analyzed historical trends across **gender, demographics, medals, countries, and sports**.
- Female participation increased from near zero in the earliest Games to approximately **44% in the 2010s**.
- Used **Python, Pandas, NumPy, Matplotlib, Seaborn, and Scikit-learn**.
- Retrospectively identified **target leakage** in the original Random Forest experiment and documented how the experiment should be redesigned.

---

## 🎯 Problem & Objectives

The original project was framed around helping SportsStats derive useful
insights from historical Olympic data.

The analysis focused on five broad areas:

1.  **Gender Representation** --- investigate how participation changed
    over time and across sports.
2.  **Age and Medal Performance** --- examine medal-winning age
    distributions and differences by sex.
3.  **Athlete Demographics** --- analyze changes in age, height, and
    weight across Olympic history.
4.  **Country, Sport & Physical Profiles** --- explore medal
    distributions and sport-specific athlete characteristics.
5.  **Predictive Experiments** --- test introductory regression and
    classification approaches.

The project is primarily an **exploratory sports-analytics study**.
Observed relationships are treated as associations within the historical
dataset rather than causal evidence.

---

## 🔄 Analytical Workflow

```text
Raw Olympic Data
        ↓
Data Inspection & Cleaning
        ↓
Missing-Value Treatment
        ↓
NOC / Region Integration
        ↓
Feature Engineering
        ↓
Athlete-Year Aggregation
        ↓
EDA & Visualization
        ↓
Predictive Modeling
        ↓
Critical Evaluation
```

---

## 📊 Dataset

The project uses two primary files:

- `athlete_events.csv`
- `noc_regions.csv`

| Attribute | Value |
| --- | ---: |
| Participation records | **271,116** |
| Variables | **15** |
| Temporal coverage | ~120 years |
| Medal outcome | Gold / Silver / Bronze / No Medal |
| Athlete ID | Available |
| Age | Partially missing |
| Height | Partially missing |
| Weight | Partially missing |

Important variables include `ID`, `Name`, `Sex`, `Age`, `Height`,
`Weight`, `Team`, `NOC`, `Games`, `Year`, `Season`, `City`, `Sport`,
`Event`, and `Medal`.

The NOC dataset provides regional information used to enrich the athlete
records.

---

## 🗃️ Conceptual Data Model

The project conceptualizes the data around three main entities:

- **Athlete:** ID, Name, Age, Sex, Height, Weight
- **Event:** Event, Sport, Year, Season, City, Medal
- **Team:** Team, NOC, Region

Athletes can participate in multiple events, while team and NOC
information connect participation records to geographic regions.

---

## 🔧 Data Preparation & Methodology

## 1. Data Inspection

The first stage examined dataset dimensions, data types, missing values,
descriptive statistics, duplicate records, and categorical
distributions.

## 2. Missing-Value Treatment

The raw dataset contained substantial missing demographic information:

| Variable | Missing Values |
| --- | ---: |
| Age | **9,474** |
| Height | **60,171** |
| Weight | **62,875** |

Rather than deleting all incomplete records, different strategies were
used according to the meaning of each variable.

For **height and weight**, the process used increasingly broad reference
groups: information from the same athlete where available, event-and-sex
averages, and sex-level averages as a fallback.

For **age**, a different strategy was required because age changes over
time. Where an athlete had a known age in another Olympic appearance,
missing age values could be estimated using the difference between
Olympic years. Records still lacking usable age information were
removed.

## 3. Dataset Integration

Athlete records were merged with the NOC reference dataset to add
standardized regional information. Missing region information was
supplemented using corresponding team information where possible.

## 4. Feature Engineering

Separate binary indicators were created for Gold, Silver, and Bronze
medals to support aggregation and exploratory analysis.

BMI was calculated as:

```text
BMI = Weight (kg) / Height (m)²
```

BMI was treated cautiously because it does not distinguish between
muscle mass and body fat.

## 5. Athlete-Year Aggregation

One athlete may appear several times during the same Games when
competing in multiple events. For athlete-level analyses, this can
overrepresent multi-event competitors.

An additional dataset was therefore created by grouping records by
**Athlete ID + Olympic Year** and aggregating the relevant information.
This produced approximately **180,685 athlete-year records**.

---

## 🔍 Key Findings

## Gender Representation Over Time

One of the clearest historical patterns is the long-term increase in
female Olympic participation.

| Period | Female Participation |
| --- | ---: |
| 1890s | ~0% |
| 1920s | ~6% |
| 1940s | ~11% |
| 1960s | ~14% |
| 1980s | ~24% |
| 1990s | ~32% |
| 2000s | ~40% |
| 2010s | ~44% |

Summer and Winter Olympic participation were also examined separately.

**Key insight:** The dataset shows a major historical convergence in
male and female participation, although participation had not reached
complete parity by the end of the analyzed period.

## Medal Performance & Age

Medal-winning records are strongly concentrated among athletes in their
**20s**, although distributions differ by sex and by sport.

This is a historical distribution and should not be interpreted as
evidence that age alone determines medal probability.

## Athlete Demographics

| Metric | Female | Male |
| --- | ---: | ---: |
| Mean age | **24.41 years** | **26.28 years** |
| Mean height | **169.02 cm** | **179.45 cm** |
| Mean weight | **61.45 kg** | **76.90 kg** |

The project also tracked average age, height, and weight across Olympic
history. These are descriptive trends; the dataset alone cannot
determine their causes.

## Gender Distribution Across Sports

Participation percentages were calculated by sport and sex, revealing
historically female-dominated, male-dominated, and increasingly balanced
disciplines.

The dataset establishes participation patterns. Social, cultural,
regulatory, or institutional explanations require additional evidence.

## Country & Sport Performance

The project analyzed leading countries by medals, Gold medals, medal
distributions across sports, country-specific strengths, and leading
Gold-medal sports by country.

An important consideration was **team-event multiplicity**: one team
medal may appear once for every team member, requiring careful
aggregation.

## Athlete Physical Profiles

Age, height, and weight were analyzed jointly across sports. A 3D
visualization highlighted substantial sport-specific differences.

**Key insight:** There is no single "optimal Olympic athlete" profile.
Physical characteristics need to be interpreted within the demands of
individual sports and events.

---

## 🤖 Predictive Modeling

## Linear Regression

A Linear Regression experiment explored medal-count prediction using
selected athlete and competition features.

**Documented MSE:** **0.2222**

This served as an introductory predictive experiment rather than a
production forecasting system.

## Random Forest Classification

A Random Forest classifier was tested for predicting medal outcomes and
initially returned **100% test accuracy**.

A later methodological review identified **target leakage**: the feature
matrix included `Gold`, `Silver`, and `Bronze` indicators while the
target was derived from `Medal`. Those variables directly encode
information about the outcome.

The 100% accuracy therefore **must not be interpreted as valid
predictive performance**.

A corrected experiment would remove all outcome-derived variables before
training and use leakage-safe validation.

---

## 🧩 Challenges & How I Addressed Them

## Challenge 1 --- Extensive Missing Historical Data

**Challenge:** The dataset contained 9,474 missing age values, 60,171
missing height values, and 62,875 missing weight values. Dropping all
incomplete rows would remove a substantial amount of historical
information.

**Approach:** I used variable-specific hierarchical strategies. Height
and weight were reconstructed using athlete-level information where
possible, followed by event/sex and sex-level averages. Age was treated
separately and reconstructed from other known appearances when possible.

**Lesson:** Missing-data treatment should reflect what a variable
represents rather than applying one generic strategy to every feature.

## Challenge 2 --- Repeated Athlete Records Could Distort Results

**Challenge:** The raw dataset is organized at the athlete-event level,
so athletes competing in several events can appear multiple times in the
same Games.

**Approach:** I created a separate athlete-year representation for
analyses intended to describe athletes rather than event participation.

**Lesson:** The unit of observation must match the analytical question.

## Challenge 3 --- Team Events Can Inflate Medal Counts

**Challenge:** A team medal appears for multiple team members,
potentially exaggerating country-level medal totals.

**Approach:** For country/sport comparisons, I considered team-event
multiplicity and used aggregation intended to avoid treating every
athlete record as a separate national medal.

**Lesson:** Before aggregating data, it is essential to understand what
one row actually represents.

## Challenge 4 --- A Model Result Was Too Good to Be True

**Challenge:** The Random Forest experiment achieved 100% test accuracy.

**Approach:** Reviewing the feature construction showed that
medal-derived indicators were being used to predict the medal target. I
identified this retrospectively as **target leakage** and do not present
the score as valid model performance.

**Lesson:** A high metric does not guarantee a good model. Experimental
design and feature validity must be checked before interpreting
performance.

## Challenge 5 --- Separating Observation from Explanation

**Challenge:** Historical data showed clear changes in participation and
demographics, but the dataset did not directly explain why those changes
occurred.

**Approach:** I distinguish observed patterns from possible explanations
and avoid presenting historical associations as causal conclusions.

**Lesson:** Correlation and historical association should not be
presented as causation without supporting evidence.

---

## 🛠️ Technical Stack

  -----------------------------------------------------------------------
  Area                                Technologies & Methods
  ----------------------------------- -----------------------------------
  **Programming**                     Python

  **Data Manipulation**               Pandas, NumPy

  **Data Preparation**                Missing-value analysis,
                                      hierarchical imputation,
                                      aggregation, feature engineering

  **Exploratory Analysis**            Descriptive statistics,
                                      longitudinal analysis, correlation
                                      analysis

  **Visualization**                   Matplotlib, Seaborn, 2D and 3D
                                      visualizations

  **Machine Learning**                Scikit-learn

  **Models**                          Linear Regression, Random Forest

  **Environment**                     Jupyter Notebook
  -----------------------------------------------------------------------

---

## 📊 Selected Visualizations

## Top Gold Medal Sports by Country

Shows the sports accounting for the most Gold medals among leading
Olympic countries while considering team-event multiplicity.

![Top Gold Medal Sports by
Country](images/top_gold_medals_by_country.png)

## 3D Athlete Attribute Analysis

Compares average athlete age, height, and weight across sports and sex.

![3D Visualization of Athlete
Attributes](images/3d_athlete_attributes.png)

## Predicted Medal Count Correlations

Explores relationships among medal-count variables generated during the
predictive-analysis stage.

![Predicted Medal Count
Correlations](images/medal_count_correlations.png)

---

## ⚠️ Limitations & Critical Evaluation

- **Historical dataset bias:** Early Olympic participation was smaller
    and less globally representative than modern participation.
- **Missing measurements:** Imputation preserves more records but
    introduces estimated demographic values.
- **Changing Olympic program:** Sports and events changed throughout
    Olympic history, affecting aggregate trends.
- **Team medal representation:** Athlete-event records require careful
    aggregation for country-level medal analysis.
- **BMI limitations:** BMI is a limited body-composition measure for
    elite athletes.
- **Correlation vs. causation:** Observed relationships do not
    establish causal effects.
- **Predictive target leakage:** The original Random Forest experiment
    cannot be treated as a valid estimate of generalization performance.

---

## 🔄 Future Improvements

If I revisited this project today, I would focus on methodological rigor
rather than simply adding more complex models:

- rebuild medal prediction using leakage-safe pre-event features;
- use cross-validation and appropriate baseline models;
- apply time-aware train/test splitting where appropriate;
- investigate class imbalance;
- evaluate precision, recall, F1, ROC-AUC, and confusion matrices;
- develop sport-specific models;
- introduce statistical significance testing;
- improve team-medal normalization;
- incorporate population or economic variables for country
    comparisons;
- use feature-importance or SHAP analysis;
- extend the dataset beyond 2016;
- build an interactive analytical dashboard;
- implement a more explicit relational/SQL analytical pipeline.

---

## 🧠 What I Learned

This project reinforced that a large part of data science happens
**before model training**.

Working with more than 270,000 historical participation records required
understanding missing data, repeated observations, aggregation, variable
meaning, and the appropriate unit of analysis.

The project highlighted several principles that became increasingly
important in my later work:

- preprocessing decisions can materially change analytical
    conclusions;
- different variables require different missing-data strategies;
- the structure of the dataset must match the question being asked;
- visual patterns require careful interpretation;
- association should not be confused with causation;
- impressive model metrics must be checked for leakage and
    experimental validity;
- model complexity is less important than sound analytical design.

The retrospective discovery of target leakage in the original
classification experiment is particularly important: **critical
evaluation of a model is as important as building the model itself**.

---

## 💬 Interview Quick Reference

  -----------------------------------------------------------------------
  Interview Question                  Quick Answer
  ----------------------------------- -----------------------------------
  **What was the project?**           An end-to-end analysis of 271,116
                                      Olympic athlete-event records
                                      spanning approximately 120 years.

  **What was the objective?**         Explore historical participation,
                                      demographics, medal patterns,
                                      physical profiles, country/sport
                                      performance, and introductory
                                      predictive modeling.

  **What was your role?**             Data inspection, cleaning,
                                      imputation, integration,
                                      aggregation, feature engineering,
                                      EDA, visualization, modeling, and
                                      interpretation.

  **What was the biggest data         Extensive missing historical age,
  challenge?**                        height, and weight information.

  **How did you address it?**         Variable-specific hierarchical
                                      imputation and age reconstruction
                                      from other athlete appearances
                                      where possible.

  **What structural challenge did you Repeated athlete-event records,
  encounter?**                        addressed by creating an
                                      athlete-year dataset for
                                      athlete-level analyses.

  **What was the main modeling        Target leakage in the original
  issue?**                            Random Forest medal classifier.

  **What did that teach you?**        Feature validity and experimental
                                      design matter more than an
                                      impressive headline metric.

  **What was a major finding?**       Female participation increased from
                                      near zero in the earliest Games to
                                      approximately 44% in the 2010s in
                                      the analyzed data.

  **What would you improve today?**   Leakage-safe modeling, stronger
                                      validation, sport-specific
                                      analysis, statistical testing, and
                                      a more explicit SQL/relational
                                      workflow.

  **Main takeaway?**                  Data quality, analytical design,
                                      and correct interpretation matter
                                      more than headline model
                                      performance.
  -----------------------------------------------------------------------

---

## 📁 Project Structure

```text
Olympic Dataset Analysis for SportsStats/
├── data/
│   ├── athlete_events.csv
│   └── noc_regions.csv
├── images/
│   ├── top_gold_medals_by_country.png
│   ├── 3d_athlete_attributes.png
│   └── medal_count_correlations.png
├── notebooks / analysis files
├── project proposal
└── README.md
```

> Repository structure may vary depending on the original course
> submission layout.

---

## 🎓 Project Context

This project was developed as a capstone within the **UC Davis Learn SQL
Basics for Data Science** curriculum.

The original capstone used a fictional consultancy scenario in which a
data scientist selected a dataset, defined client-oriented questions and
hypotheses, prepared and analyzed the data, and communicated the
findings.

The project is retained in this portfolio as evidence of development in:

**data preparation · exploratory analysis · visualization · analytical
reasoning · introductory machine learning · critical model evaluation**

It also provides a useful reference point for how my approach to data
science methodology and model validation has developed since the
original project.

---

## 👤 Author

**Gregory Charles**

Data Science · Machine Learning · Generative AI · Applied Software
Development

[← Back to Main Projects Portfolio](../README.md)
