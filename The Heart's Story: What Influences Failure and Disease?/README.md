# ❤️ The Heart's Story: Visualizing Cardiovascular Risk Factors

**Tableau · Data Visualization · Dashboard Design · Data Storytelling · Audience-Centered Analytics**

> **Project Context:** UC Davis — *Data Visualization with Tableau Specialization* Capstone

An interactive **Tableau data story exploring factors associated with heart disease and heart failure**, designed to translate a large, multidimensional cardiovascular dataset into visual information that a non-technical audience can explore and understand.

The project covers the full visualization workflow: **audience definition, project scoping, data-quality assessment, Tableau data preparation, calculated fields, dashboard design, interactive filtering, visual storytelling, and iterative refinement**.

Rather than building a dashboard for analysts alone, I designed the final story around a specific general-public persona and deliberately simplified the visual language, chart selection, navigation, and interaction model.

---

## ⭐ Project Highlights

- Built an interactive **multi-dashboard Tableau Story** around cardiovascular health.
- Worked with a synthetic dataset of approximately **250,000 patient records** and **26 variables**.
- Explored demographic, physiological, lifestyle, medical-history, medication, and laboratory factors.
- Designed dashboards covering **age, BMI, smoking, physical activity, blood pressure, cholesterol, triglycerides, diabetes, kidney disease, anemia, ECG abnormalities, medication use, stress, sleep, and other factors**.
- Built an interactive **cardiovascular risk exploration dashboard** using Tableau filters and calculated fields.
- Designed the project around an explicit **audience persona** rather than treating visualization as chart production alone.
- Converted numerically encoded categorical fields into appropriate Tableau **Dimensions** to prevent misleading aggregation.
- Used **bar charts, scatter plots, line charts, box plots, highlight-style comparisons, filters, and story points** according to the communication task.
- Iteratively reduced the original three-audience scope to a single primary audience to improve clarity and usability.
- Applied UC Davis data-storytelling principles involving **audience, context, story structure, visual hierarchy, simplicity, and truthful representation of data**.

---

## 🎯 Project Goal

Cardiovascular health data contains many interacting variables. Presenting all of them simultaneously can quickly overwhelm a non-specialist audience.

The central design question was therefore:

> **How can complex cardiovascular data be transformed into an interactive visual story that helps a general audience understand patterns associated with heart disease and heart failure?**

The project was designed to make relationships between health outcomes and potential risk indicators easier to explore without requiring advanced statistical or medical knowledge.

---

## 👥 Audience-Centered Design

The original project proposal considered three stakeholder personas:

| Persona | Intended Need |
| --- | --- |
| **General resident** | Understand personal cardiovascular risk factors in clear, accessible language |
| **Healthcare professional** | Explore indicators useful for patient education and preventive-health discussions |
| **Public-health policymaker** | Investigate population patterns and potential areas for intervention |

During development, I recognized that attempting to serve all three audiences within one Tableau story made the design too broad.

I therefore refined the final product around the **general-resident persona**.

### Primary Persona

The final story was designed around **Akari Yamaguchi**, a fictional 58-year-old working professional with limited medical knowledge who wants to understand factors potentially relevant to her cardiovascular health.

This affected the dashboard design directly:

- straightforward chart types were prioritized;
- technical terminology was minimized;
- titles and annotations were written for non-specialists;
- navigation followed a progressive narrative;
- consistent visual cues were used across dashboards;
- interactivity focused on personally understandable factors;
- a dedicated risk-exploration interface was added.

This was an important design lesson: **a visualization becomes more useful when it is designed for a specific decision context and audience rather than for everyone simultaneously.**

---

## 🔄 Visualization Workflow

```text
Define the Question
        ↓
Identify Stakeholders & Audience
        ↓
Design Personas
        ↓
Select / Prepare Dataset
        ↓
Validate Ranges & Data Types
        ↓
Configure Tableau Dimensions & Measures
        ↓
Explore Relationships
        ↓
Build Individual Worksheets
        ↓
Combine Worksheets into Dashboards
        ↓
Add Filters & Calculated Fields
        ↓
Create Tableau Story Points
        ↓
Review Visual Hierarchy & Clarity
        ↓
Refine Scope Around Primary Audience
        ↓
Publish to Tableau Public
```

The workflow reflects the principle that effective visualization starts **before the first chart is created**.

---

## 📊 Dataset

The final project uses a large synthetic cardiovascular dataset created to provide the range of variables needed for the story.

It contains approximately:

- **250,000 patient records**
- **26 variables**

The dataset includes several categories of information.

### Demographics

- Age
- Sex
- Ethnicity

### Body & Lifestyle

- BMI
- Smoking
- Alcohol consumption
- Diet quality
- Physical activity
- Stress level
- Sleep duration

### Cardiovascular Measures

- Systolic blood pressure
- Diastolic blood pressure
- Heart rate

### Laboratory Measures

- Cholesterol
- HDL cholesterol
- LDL cholesterol
- Triglycerides
- HbA1c
- Creatinine

### Medical History & Conditions

- Diabetes
- Family history
- Previous heart problems
- Kidney disease
- Anemia
- ECG abnormality

### Medication

- Hypertension medication
- Cholesterol medication

### Outcomes

- Heart failure
- Heart disease

Because the dataset is **synthetic**, the project should be interpreted as a demonstration of visualization, interaction design, and data-storytelling methodology rather than as clinical evidence.

---

## 🧹 Data Preparation

Before designing the dashboards, I performed an initial data-quality and range assessment directly in Tableau.

### Range Validation

Examples of reviewed ranges included:

| Variable | Approximate Range |
| --- | ---: |
| Age | 18–95 years |
| BMI | 15–55 |
| Systolic BP | 90–220 |
| Diastolic BP | 50–140 |
| Cholesterol | 100–400 |
| HDL Cholesterol | 20–100 |
| Triglycerides | 50–500 |
| Physical Activity | 0–300 min/week |
| Stress Level | 1–10 |
| Sleep Duration | 4–10 hours |
| Heart Rate | 40–120 bpm |

The initial inspection found no major missing-data or obvious range problems.

### Correcting Tableau Field Roles

A more subtle issue involved **categorical variables encoded numerically**.

Fields such as:

```text
Smoking
Diabetes
FamilyHistory
PreviousHeartProblems
KidneyDisease
Anemia
ECG_Abnormality
Medication_Hypertension
Medication_Cholesterol
Heart Failure
Heart Disease
```

could initially be interpreted by Tableau as numerical measures.

I explicitly converted these fields to **categorical Dimensions**.

For example:

```text
Smoking
0 → No
1 → Yes
```

and:

```text
Diabetes
0 → No diabetes
1 → Type 1
2 → Type 2
```

This prevents Tableau from performing meaningless numerical aggregation on category codes and ensures that the fields behave correctly in filters and visual comparisons.

---

## 🖥️ Tableau Story Architecture

The final Tableau story, **The Heart's Story: What Influences Failure and Disease?**, progresses from general context toward increasingly specific cardiovascular factors.

Major story sections include:

1. Introduction
2. Patient demographics
3. Cardiovascular risk exploration
4. Age distribution and cardiovascular outcomes
5. BMI and cardiovascular outcomes
6. Lifestyle factors
7. Smoking and age-related heart conditions
8. Physical activity and cardiovascular health
9. Blood pressure
10. Risk factors and medication
11. Lipid measures
12. Anemia, kidney disease, and cardiovascular health
13. Medication usage
14. Physiological markers
15. Indirectly contributing factors
16. Conclusion

This creates a narrative rather than presenting users with an isolated collection of charts.

---

## 🎛️ Interactive Cardiovascular Risk Explorer

One of the project's most ambitious elements is the interactive cardiovascular risk dashboard.

Users can explore the synthetic population by adjusting factors across several categories.

### Demographics

- Ethnicity
- Age group
- Sex

### Body & Lifestyle

- BMI category
- Diet quality
- Physical activity
- Smoking
- Alcohol consumption
- Sleep duration
- Stress level

### Cardiovascular Measures

- Cholesterol
- HDL cholesterol
- LDL cholesterol
- Triglycerides
- diastolic and systolic blood pressure
- ECG abnormality
- heart rate

### Medical History

- family history
- previous heart problems
- kidney disease
- anemia
- diabetes category

### Medication

- hypertension medication
- cholesterol medication

### Laboratory Results

- HbA1c
- creatinine
- ALT

The dashboard dynamically summarizes estimated cardiovascular outcomes for the selected subset of the synthetic dataset.

### Important Interpretation

This interface is a **data-exploration tool**, not a validated clinical prediction model.

Its outputs depend on the synthetic data and the selected filters. They should therefore not be interpreted as an individual's medically validated probability of developing disease.

That distinction is important when presenting health-related analytics responsibly.

---

## 📈 Visual Analysis

### Age

The age dashboards compare the distribution of heart disease and heart failure across age groups.

The visual progression makes the relationship between age and cardiovascular outcomes immediately visible without requiring statistical interpretation.

### BMI

BMI dashboards compare cardiovascular outcomes across body-mass-index values and categories.

Scatter-based views help expose the overall pattern while maintaining a relatively intuitive visual form.

### Lifestyle Factors

The story examines several behavioral variables, including:

- smoking;
- alcohol consumption;
- diet quality;
- physical activity.

These views allow users to compare outcome prevalence across lifestyle categories.

### Smoking × Age

A dedicated visualization examines smoking together with age rather than presenting smoking as an isolated variable.

This demonstrates an important visualization principle:

> **Risk factors should often be interpreted in context rather than independently.**

### Physical Activity

The physical-activity dashboard compares cardiovascular outcomes across increasing activity levels.

The visualization makes the broad pattern visible while retaining the individual activity categories.

### Blood Pressure

Separate views examine cardiovascular outcomes across:

- systolic blood pressure;
- diastolic blood pressure.

This makes it possible to compare how outcome prevalence changes across the two measures.

### Lipid Profile

The project includes a **lipid triad** dashboard covering:

- LDL cholesterol;
- HDL cholesterol;
- triglycerides.

Using coordinated visualizations makes it easier to compare the different lipid measures within one analytical context.

### Medical Conditions

Additional dashboards explore associations involving:

- diabetes;
- kidney disease;
- anemia;
- ECG abnormalities;
- previous heart problems;
- family history.

### Medication

Medication dashboards compare cardiovascular outcomes alongside:

- hypertension medication;
- cholesterol medication.

These views demonstrate an important interpretive challenge: medication usage can be associated with higher observed disease prevalence because medication is often prescribed **because an underlying condition already exists**.

Association therefore should not be interpreted as evidence that the medication causes the disease.

### Indirect Factors

The final analytical section explores relationships involving:

- alcohol and blood pressure;
- BMI and physical activity;
- cholesterol and diet quality;
- stress and sleep.

This extends the story beyond isolated risk factors toward the broader network of variables associated with cardiovascular health.

---

## 🎨 Visualization & UX Design Decisions

Three major design principles shaped the final Tableau story.

### 1. Simple Visual Encodings

For the primary general-public audience, I prioritized familiar visual forms such as:

- bar charts;
- line charts;
- scatter plots;
- straightforward comparisons;
- limited use of more analytical plots where useful.

The goal was not to demonstrate the maximum number of Tableau chart types.

The goal was to make the underlying relationships understandable.

### 2. Visual Hierarchy

I used:

- prominent titles;
- consistent outcome encoding;
- whitespace;
- grouped controls;
- logical dashboard sequencing;
- annotations where interpretation required guidance.

These elements help direct attention toward the intended analytical message.

### 3. Progressive Storytelling

The Tableau Story moves from:

```text
Who is represented?
        ↓
What outcomes are present?
        ↓
How do demographic factors relate?
        ↓
How do physiological factors relate?
        ↓
How do lifestyle factors relate?
        ↓
How do medical conditions relate?
        ↓
What broader patterns emerge?
```

This reduces the cognitive burden of presenting many variables at once.

---

## 🧠 Data Storytelling Principles Applied

Throughout the UC Davis **Data Visualization with Tableau Specialization**, the coursework emphasized that a strong data story requires more than technically correct charts.

I applied several of those principles directly.

### Who?

Identify:

- stakeholders;
- audience;
- subject-matter context.

### What?

Understand:

- available data;
- data quality;
- data timeliness;
- limitations.

### Why?

Define:

- the purpose of the story;
- the intended audience takeaway.

### How?

Select:

- appropriate visual formats;
- interaction mechanisms;
- presentation structure;
- level of detail.

The project also followed the storytelling principle of maintaining a clear **context → challenge → conclusion** structure.

---

## 🧩 Challenges & How I Addressed Them

| Challenge | Response | Skill Demonstrated |
| --- | --- | --- |
| **Large multidimensional dataset** | Divided the analysis into thematic dashboards and story points | Information architecture |
| **Numerically encoded categories** | Converted them to categorical Tableau Dimensions | Data preparation |
| **Mixed technical/non-technical concepts** | Used accessible titles, chart types, and explanations | Audience-centered communication |
| **Too many initial stakeholders** | Refined the final story around one primary persona | Scope management |
| **Many interacting risk factors** | Used separate dashboards plus coordinated comparisons | Analytical decomposition |
| **Complex navigation** | Structured dashboards into a progressive Tableau Story | UX and narrative design |
| **Potentially misleading associations** | Treated dashboard patterns as associations rather than causal conclusions | Analytical judgment |
| **Health-related interpretation risk** | Positioned the interactive dashboard as exploratory rather than diagnostic | Responsible visualization |
| **Synthetic dataset** | Treated findings as visualization demonstrations rather than clinical evidence | Data provenance awareness |

---

## 🛠️ Technical Skills Demonstrated

| Area | Skills |
| --- | --- |
| **BI / Visualization** | Tableau Public |
| **Data Preparation** | Field validation, data-type correction, categorical conversion |
| **Data Modeling** | Dimensions, Measures, calculated fields |
| **Dashboard Development** | Multi-view dashboards, layout, hierarchy |
| **Interactivity** | Filters, parameters / controls, interactive exploration |
| **Visualization** | Bar charts, line charts, scatter plots, box plots, comparative views |
| **Storytelling** | Tableau Story Points, narrative sequencing |
| **UX** | Persona-driven design, progressive disclosure, audience simplification |
| **Analytics** | Comparative analysis, segmentation, multivariable exploration |
| **Communication** | Non-technical health-data presentation |
| **Responsible Analytics** | Association vs. causation, synthetic-data limitations, non-diagnostic framing |

---

## ⚠️ Limitations & Critical Evaluation

### Synthetic Data

The final cardiovascular dataset is synthetic.

This allowed the project to include the variables needed for visualization practice, but the resulting relationships are not evidence about real-world cardiovascular populations.

### Clinical Validity

The project is **not a medical diagnostic tool**.

The interactive risk explorer has not undergone:

- clinical validation;
- external validation;
- calibration against real patient outcomes;
- prospective testing.

It should therefore be interpreted only as an interactive visualization of patterns within the project dataset.

### Association ≠ Causation

Many dashboards compare health outcomes with individual factors.

A visible relationship does not demonstrate that one factor caused another.

Confounding, reverse causality, selection effects, and interactions among variables may all influence the observed pattern.

### Audience Simplification

Designing primarily for a general audience improves accessibility but necessarily removes some statistical detail.

A professional clinical or epidemiological dashboard would require additional information such as:

- uncertainty;
- confidence intervals;
- sample sizes;
- adjusted estimates;
- model validation;
- clearer clinical definitions.

### Dashboard Density

Some later dashboards contain several charts and categories simultaneously.

A future redesign could reduce visual density and use progressive disclosure or dashboard actions to expose secondary detail only when requested.

---

## 🔄 What I Would Improve Today

If I rebuilt the project today, I would:

- replace synthetic data with a well-documented real-world public-health dataset where appropriate;
- clearly separate **exploratory prevalence dashboards** from any true predictive modeling;
- rename the risk calculator as a **Risk Factor Explorer** unless backed by a validated statistical model;
- display subgroup sample sizes alongside percentages;
- add confidence intervals or uncertainty where statistically appropriate;
- perform accessibility testing, including color-vision-deficiency checks;
- reduce the density of several dashboards;
- use dashboard actions and progressive disclosure instead of exposing every control simultaneously;
- optimize the layouts separately for desktop and mobile;
- conduct structured usability testing with representative users;
- add a dedicated methodology and data-provenance dashboard;
- create separate versions for general-public, clinical, and policy audiences rather than trying to serve all three with one interface;
- test whether users correctly interpret association versus causation;
- incorporate stronger annotation and explanatory tooltips;
- validate calculated fields and outcome logic through reproducible external analysis.

---

## 🧠 What I Learned

This project changed how I think about data visualization.

The most important lesson was that **the audience determines the visualization**.

A chart can be technically correct and still fail if it requires knowledge the intended user does not possess.

The second major lesson was the importance of **scope discipline**. My original proposal attempted to serve a general resident, healthcare professional, and policymaker simultaneously. During development, I recognized that their information needs were too different. Narrowing the final story to the general-public persona produced a more coherent design.

The project also reinforced that **data preparation matters even in visualization tools**. Tableau correctly importing a field does not mean it has correctly interpreted its analytical role. Explicitly converting encoded categorical variables from Measures to Dimensions was necessary to prevent meaningless aggregation.

Finally, I learned that interactive visualization creates additional responsibility. Once users can enter or filter personal characteristics, they may interpret the output as individualized advice. In health analytics, the interface therefore needs to communicate the difference between **exploration, statistical association, prediction, and clinical diagnosis**.

---

## 💬 Interview Quick Reference

| Question | Quick Answer |
| --- | --- |
| **What was the project?** | An interactive Tableau data story exploring factors associated with heart disease and heart failure |
| **Project context?** | UC Davis — Data Visualization with Tableau Specialization capstone |
| **Dataset size?** | Approximately 250,000 synthetic patient records with 26 variables |
| **Main goal?** | Translate complex cardiovascular data into an accessible interactive story for a non-technical audience |
| **Primary audience?** | A general-public persona with limited medical knowledge |
| **Why use a persona?** | To determine chart complexity, language, hierarchy, navigation, and interaction design |
| **What did you do in Tableau?** | Data preparation, field-role correction, calculated fields, worksheets, dashboards, filters, interactive exploration, and story points |
| **Important data-preparation issue?** | Numerically encoded categories initially behaved like Measures, so I converted them to Dimensions |
| **Main dashboard topics?** | Age, BMI, lifestyle, smoking, activity, blood pressure, lipids, medical history, medication, physiological markers, stress, and sleep |
| **Most important design decision?** | Reducing the project from three target personas to one primary audience |
| **What makes it more than a dashboard?** | It uses an intentional narrative sequence across multiple Tableau Story Points |
| **Is the risk explorer diagnostic?** | No. It explores patterns in synthetic data and is not a validated clinical prediction system |
| **Biggest limitation?** | Synthetic data prevents real-world clinical conclusions |
| **What would you improve?** | Real-world data, stronger uncertainty communication, accessibility testing, usability testing, progressive disclosure, and clearer separation of exploration from prediction |
| **Main lesson?** | Effective visualization depends as much on audience, context, and interpretation as on chart construction |

---

## 🌐 Tableau Public

Explore the interactive visualization:

**[The Heart's Story: What Influences Failure and Disease? — Tableau Public](https://public.tableau.com/app/profile/greg.charles/viz/ExploringFactorsInfluencingHeartFailureandHeartDisease/Story1)**

---

## 📁 Suggested Repository Structure

```text
.
├── README.md
├── data/
│   └── realistic_synthetic_heart_data_large.csv
├── documentation/
│   ├── Project Proposal.pdf
│   ├── Data Preparation Milestone 2.pdf
│   ├── Final Project and Reflection.pdf
│   └── Data Storytelling Design Checklist.pdf
└── images/
    ├── cardiovascular-risk-dashboard.png
    ├── age-distribution.png
    ├── bmi-cardiovascular-outcomes.png
    ├── lifestyle-factors.png
    ├── blood-pressure-risk.png
    └── lipid-triad.png
```

If the repository currently uses different filenames, the structure above can be adapted rather than changing the original project files.

---

## 🎓 Project Context

This project was completed as the **capstone project for the UC Davis _Data Visualization with Tableau Specialization_**.

The capstone brought together skills developed across the specialization, including data preparation, visual analysis, dashboard development, interactivity, audience-centered design, and data storytelling.

The work demonstrates the integration of:

**Tableau · Data Preparation · Interactive Dashboards · Data Visualization · Data Storytelling · Calculated Fields · Audience Analysis · Persona Design · UX Thinking · Analytical Communication**

It is included in my portfolio because it demonstrates a different part of the analytics workflow from my machine-learning projects: **turning multidimensional data into an interactive, audience-centered visual narrative that supports exploration and understanding**.

---

## 👤 Author

**Gregory Charles**

Data Science · Machine Learning · Generative AI · Data Visualization · Applied Software Development

[← Back to Main Projects Portfolio](../README.md)
