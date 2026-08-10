# 👥 Customer Personality Segmentation

**Unsupervised Machine Learning · Customer Analytics · K-Means · PCA · Marketing Strategy**

> **Project Context:** MIT Institute for Data, Systems, and Society (IDSS) — *Data Science and Machine Learning: Making Data-Driven Decisions*

Developed an end-to-end **customer segmentation pipeline** for a retail business using demographic, household, purchasing, channel-engagement, and campaign-response data.

The project used extensive preprocessing and feature engineering before applying **K-Means clustering**. Although the highest Silhouette Score occurred at **K=2**, I selected **K=3** after considering the Elbow Method, cluster interpretability, and the business need for sufficiently granular customer segments.

The final solution identified **three actionable customer groups**: high-value engaged customers, lower-income family-focused customers, and mid-value households with stronger teenage-family representation. PCA was then used to visualize the segmentation, with the first two principal components explaining approximately **54% of the variance** in the selected feature space.

---

## ⭐ Key Highlights

- Completed as part of the **MIT IDSS Data Science and Machine Learning: Making Data-Driven Decisions** program.
- Analyzed **2,240 customers across 29 original variables** covering demographics, spending, purchasing channels, and marketing engagement.
- Engineered customer-level features including **Age, Customer Tenure, Total Spending, Total Campaign Acceptances, and Children at Home**.
- Imputed missing income values using **Education × Age group median income** rather than a simple global median.
- Regrouped sparse categorical levels to improve analytical robustness.
- Applied **Winsorization** to reduce the influence of extreme numerical values.
- Applied **log1p transformations** to strongly skewed spending and behavioral features.
- Used **one-hot encoding** and **StandardScaler** to prepare mixed data for distance-based clustering.
- Selected **27 features** for the final clustering analysis based on EDA and business relevance.
- Evaluated candidate cluster counts using both the **Elbow Method and Silhouette Score**.
- Compared **K=2, K=3, and K=4** rather than selecting K mechanically from a single metric.
- Selected **K=3** to balance statistical separation with business interpretability and actionable segmentation.
- Produced three reasonably balanced clusters containing **757, 861, and 622 customers**.
- Used **PCA** to visualize the clusters in two dimensions; the first two components explained **53.97%** of selected-feature variance.
- Converted cluster profiles into targeted **retention, value, channel, and campaign strategies**.

---

## 🎯 Business Problem

A growing retail company wanted to move beyond generic, one-size-fits-all marketing.

Its customer base differed across several dimensions:

- income;
- age;
- education;
- marital status;
- household composition;
- product spending;
- purchase channels;
- website activity;
- customer tenure;
- recency;
- campaign responsiveness.

The central business question was:

> **Can customers be grouped into meaningful behavioral and demographic segments that support more targeted marketing, retention, and resource-allocation decisions?**

The project therefore focused not simply on finding mathematically distinct clusters, but on finding segments that could be **interpreted and acted upon by the business**.

---

## 🎯 Objectives

The analysis was designed to:

1. understand customer demographics and purchasing behavior;
2. clean and transform the raw customer data;
3. engineer more informative behavioral and lifecycle features;
4. reduce the influence of skewness and extreme observations;
5. prepare mixed numerical and categorical data for distance-based clustering;
6. determine an appropriate number of customer segments;
7. apply K-Means clustering;
8. profile and interpret the resulting clusters;
9. visualize cluster structure using PCA;
10. translate the segmentation into actionable marketing recommendations.

---

## 🔄 Machine Learning Workflow

```text
Raw Customer Data
        ↓
Data Inspection & EDA
        ↓
Missing-Value Analysis
        ↓
Feature Engineering
        ↓
Categorical Regrouping
        ↓
Outlier Treatment
        ↓
Log Transformations
        ↓
Categorical Encoding
        ↓
Feature Scaling
        ↓
Business-Informed Feature Selection
        ↓
Elbow Method + Silhouette Analysis
        ↓
Compare K = 2 / 3 / 4
        ↓
K-Means Clustering (K = 3)
        ↓
Cluster Profiling
        ↓
PCA Visualization
        ↓
Business Recommendations
```

The project emphasizes that clustering is not simply an algorithmic step. The quality of the resulting segments depends heavily on **feature design, scaling, preprocessing, validation, interpretation, and business context**.

---

## 📊 Dataset

The original dataset contains:

- **2,240 customer records**
- **29 original variables**
- demographic information;
- household characteristics;
- product spending;
- purchase-channel behavior;
- web engagement;
- campaign-response information.

### Customer Information

Examples include:

- `Year_Birth`
- `Education`
- `Marital_Status`
- `Income`
- `Kidhome`
- `Teenhome`
- `Dt_Customer`
- `Recency`
- `Complain`

### Product Spending

Spending during the previous two years included:

- `MntWines`
- `MntFruits`
- `MntMeatProducts`
- `MntFishProducts`
- `MntSweetProducts`
- `MntGoldProds`

### Purchase & Channel Behavior

The dataset recorded:

- deal purchases;
- web purchases;
- catalog purchases;
- store purchases;
- monthly website visits.

### Campaign Engagement

Marketing responsiveness was represented by:

- `AcceptedCmp1`
- `AcceptedCmp2`
- `AcceptedCmp3`
- `AcceptedCmp4`
- `AcceptedCmp5`
- `Response`

This combination made the dataset well suited to segmentation because it represented both **who customers are** and **how they behave**.

---

## 🔍 Initial Data Assessment

The initial inspection identified several issues requiring preprocessing.

### Missing Income Values

`Income` contained:

**24 missing values — approximately 1.07% of the dataset**

Income is highly relevant to customer segmentation, so simply discarding it would remove potentially valuable information.

### Invalid / Extreme Birth Years

`Year_Birth` ranged as far back as **1893**, producing an implausible derived maximum age of **121 years** relative to the dataset timeframe.

### Extreme Income

Income contained a maximum value of:

**$666,666**

This was far above the central range of the data and could strongly influence a distance-based clustering algorithm.

### Constant Features

Two variables contained no variation:

```text
Z_CostContact = 3
Z_Revenue     = 11
```

Because constant features cannot distinguish customers, they were removed.

### Skewed Behavioral Variables

Many spending and purchase-frequency variables were strongly right-skewed.

This matters because K-Means relies on distance calculations. Features with extreme ranges or skewness can disproportionately affect the cluster solution.

---

## 🧠 Feature Engineering

A major part of the project involved converting raw fields into more meaningful customer-level features.

### Age

Rather than using raw birth year directly:

```text
Age = Reference Year − Year of Birth
```

The reference year was derived from the dataset timeframe rather than the current calendar year.

### Customer Tenure

Customer enrollment dates were converted to datetime and used to calculate:

```text
Customer_Tenure_Days
```

This provides a direct measure of how long the customer had been associated with the company.

### Enrollment Features

The enrollment date was also decomposed into:

- `Enrollment_Year`
- `Enrollment_Month`

### Total Spending

Six product-spending variables were aggregated:

```text
TotalSpending =
    Wines
  + Fruits
  + Meat
  + Fish
  + Sweets
  + Gold Products
```

This created an overall customer-value measure while retaining the individual product categories for preference analysis.

### Total Campaign Acceptance

Campaign-response variables were combined into:

```text
TotalAcceptedCmp
```

The resulting distribution showed that:

- **1,631 customers accepted no campaigns**
- 370 accepted one;
- 142 accepted two;
- 51 accepted three;
- 36 accepted four;
- 10 accepted five.

This created a compact measure of overall marketing responsiveness.

### Children at Home

```text
ChildrenAtHome = Kidhome + Teenhome
```

This provided a simple measure of household dependency while the original kid/teen distinctions remained useful for cluster interpretation.

---

## 🧹 Data Cleaning & Preprocessing

### Missing-Value Imputation

Missing income values were imputed using the **median income within Education × Age groups**.

Conceptually:

```text
Missing Income
      ↓
Find Similar Education + Age Group
      ↓
Calculate Group Median Income
      ↓
Impute Missing Value
```

This approach was more context-sensitive than replacing every missing value with the overall dataset median.

After imputation:

**0 missing values remained.**

### Sparse Category Regrouping

Very small categories were consolidated.

For `Marital_Status`:

```text
Alone  ┐
Absurd ├──→ Single
YOLO   ┘
```

For `Education`:

```text
Basic      ┐
2n Cycle   ├──→ Undergraduate
```

This reduced sparse categorical levels and improved interpretability.

### Removed Columns

The following fields were removed from the modeling dataset:

- `ID`
- `Year_Birth`
- `Dt_Customer`
- `Z_CostContact`
- `Z_Revenue`

They were either identifiers, replaced by engineered features, or contained no discriminatory information.

---

## ⚙️ Outlier Treatment

Because K-Means is distance-based, extreme values can pull centroids disproportionately toward unusual observations.

I therefore applied **Winsorization / percentile capping**.

### Income

Income was capped at both the:

- **1st percentile**
- **99th percentile**

The resulting range was approximately:

```text
$7,705.92 → $94,437.68
```

instead of the original extreme maximum of $666,666.

### Other Numerical Variables

Selected numerical variables were capped primarily at the **99th percentile**.

Examples included:

- product spending;
- purchase counts;
- web visits;
- age;
- total spending;
- total campaign acceptance.

For example:

```text
Age:
Original maximum → 121
Capped maximum   → 69
```

and:

```text
MntMeatProducts:
Original maximum → 1,725
Capped maximum   → 915
```

This retained observations while reducing their leverage on the clustering solution.

---

## 📐 Skewness Transformation

Several variables remained strongly right-skewed even after capping.

I applied:

```python
np.log1p(x)
```

to selected spending and behavioral variables.

Examples included:

- product spending;
- total spending;
- purchase-frequency variables;
- website visits;
- campaign acceptance;
- children at home.

`log1p` was appropriate because it can transform zero-valued features safely:

```text
log(1 + 0) = 0
```

The transformation compressed large values while preserving ordering and reduced the asymmetry of many behavioral variables.

---

## 🔢 Encoding & Scaling

### One-Hot Encoding

Categorical variables such as:

- Education
- Marital Status
- Kidhome
- Teenhome

were converted into model-compatible indicator variables.

### Standardization

Numerical features were standardized using:

**StandardScaler**

Conceptually:

```text
Different Feature Scales
        ↓
Subtract Feature Mean
        ↓
Divide by Standard Deviation
        ↓
Comparable Standardized Scale
```

This step is particularly important for K-Means because Euclidean distance is sensitive to scale.

Without scaling, a variable such as income could dominate smaller-range variables simply because of its units.

---

## 🎯 Feature Selection

The final clustering dataset contained **27 selected features**.

Selection was based on a combination of:

- EDA;
- business relevance;
- redundancy;
- interpretability;
- expected segmentation value.

Major feature groups included:

### Demographics

- Income
- Age
- Education indicators
- Marital-status indicators

### Household Structure

- Kidhome indicators
- Teenhome indicators

### Customer Relationship

- Recency
- Customer Tenure

### Customer Value

- Total Spending
- individual product-spending categories

### Channel Behavior

- monthly website visits;
- store purchases;
- catalog purchases.

### Marketing Responsiveness

- Total Accepted Campaigns
- Response to the most recent campaign

This preserved enough behavioral detail to identify meaningful segments while excluding several variables that were redundant or unlikely to improve the initial clustering solution.

---

## 🧮 K-Means Clustering

K-Means partitions observations into K groups by minimizing the distance between customers and their assigned cluster centroids.

Conceptually:

```text
Customer Feature Space
        ↓
Choose K Centroids
        ↓
Assign Customers to Nearest Centroid
        ↓
Recalculate Centroids
        ↓
Repeat Until Stable
        ↓
Customer Segments
```

Because the algorithm depends strongly on K, determining an appropriate number of clusters was a central modeling decision.

---

## 📉 Elbow Method

The Within-Cluster Sum of Squares (WCSS) was calculated for multiple values of K.

Selected results:

| K | WCSS |
| ---: | ---: |
| 1 | 37,409.53 |
| 2 | 23,991.28 |
| 3 | 21,316.91 |
| 4 | 20,095.99 |
| 5 | 19,097.96 |

The largest improvement occurred between **K=1 and K=2**.

Afterward, WCSS continued to decline but with diminishing gains.

The elbow was not perfectly sharp, but **K=3 and K=4** were reasonable candidates from the WCSS curve.

---

## 📏 Silhouette Analysis

The average Silhouette Scores were:

| K | Silhouette Score |
| ---: | ---: |
| **2** | **0.3003** |
| 3 | 0.1880 |
| 4 | 0.1615 |
| 5 | 0.1195 |

From a purely mathematical separation perspective:

> **K=2 produced the strongest Silhouette Score.**

However, selecting the number of customer segments requires more than maximizing a single metric.

A two-cluster solution risked reducing the customer base to an overly broad high-value/low-value split, while the three-cluster solution revealed an additional commercially meaningful middle segment.

---

## ⚖️ Why I Selected K=3

This was one of the most important analytical decisions in the project.

The evidence was not unanimous:

```text
Silhouette Score → favors K = 2
Elbow Method     → suggests K = 3 or K = 4
Business Need    → favors useful segment granularity
```

I therefore compared alternative cluster structures rather than treating the highest Silhouette Score as an automatic answer.

The final choice was:

> **K = 3**

because it provided a useful balance between:

- statistical structure;
- cluster size;
- interpretability;
- behavioral differentiation;
- marketing actionability.

This distinction is important:

> **The mathematically strongest cluster solution is not necessarily the most useful business segmentation.**

The K=3 solution should therefore be understood as a **business-informed analytical choice**, not as proof that three clusters are the uniquely correct natural structure of the data.

---

## 📊 Final Cluster Distribution

The K=3 model produced:

| Segment | Customers | Approx. Share |
| --- | ---: | ---: |
| **Segment 0** | 757 | 33.8% |
| **Segment 1** | 861 | 38.4% |
| **Segment 2** | 622 | 27.8% |
| **Total** | **2,240** | **100%** |

The segments were reasonably balanced.

No single cluster absorbed the overwhelming majority of customers, which made all three groups potentially useful for downstream marketing strategy.

---

## 👥 Customer Segment Profiles

### Segment 0 — High-Income, High-Spending, Engaged Customers

This segment represented the strongest customer-value profile.

Characteristics included:

- highest income;
- highest total spending;
- strongest spending across product categories;
- particularly strong Wine, Meat, and Gold spending;
- higher catalog and store purchasing;
- higher campaign responsiveness;
- fewer children living at home.

These customers represent a commercially important **high-value segment**.

### Segment 1 — Lower-Income, Low-Spending, Family-Focused Customers

This segment showed:

- lowest income;
- lowest total spending;
- low spending across product categories;
- lower purchase frequency;
- higher web visitation relative to purchasing;
- low campaign acceptance;
- stronger representation of households with young children.

This suggests a more **price-sensitive, family-oriented segment** with limited current customer value but potentially meaningful lifecycle opportunities.

### Segment 2 — Mid-Income, Mid-Spending, Family-Focused Customers

This group generally fell between Segments 0 and 1.

Characteristics included:

- moderate income;
- moderate overall spending;
- moderate purchase activity;
- moderate campaign responsiveness;
- stronger representation of households with teenagers;
- some households containing both younger children and teens;
- slightly stronger representation of higher education levels.

This segment represents a useful **middle-value customer group** that would have been less visible in a simpler two-cluster solution.

---

## 🔍 What Differentiated the Segments?

Cluster profiling showed that not every feature contributed equally to the business interpretation.

### Strong Differentiators

The clearest differences appeared in:

- **Income**
- **Total Spending**
- individual product spending
- catalog purchasing
- store purchasing
- children / teenagers at home
- campaign responsiveness

### Weaker Differentiators

Some variables showed more overlap:

- age;
- recency;
- marital status;
- customer tenure.

This is analytically useful because it prevents over-interpreting every available variable as an important segmentation driver.

---

## 🧭 PCA Visualization

To visualize the 27-dimensional clustering solution, I used **Principal Component Analysis (PCA)**.

The first two principal components explained:

**53.97% of the total variance**

This provided a useful two-dimensional projection of the customer space.

The visualization showed:

- Segment 1 was relatively well separated from Segment 0;
- Segments 0 and 2 showed more overlap;
- the clusters were discernible but not perfectly separated.

This result is consistent with the moderate Silhouette Score for K=3.

### Important Interpretation

PCA was used primarily for **visualization**, not as proof of perfect cluster separation.

Because the first two components retain only about 54% of the variance, the 2D plot necessarily omits part of the original 27-dimensional structure.

---

## 💼 Business Recommendations

The value of the project comes from converting unsupervised patterns into differentiated business actions.

### Segment 0 — Retain & Grow High-Value Customers

Recommended strategies:

- loyalty and retention programs;
- premium product recommendations;
- personalized cross-selling;
- VIP experiences;
- early access to promotions;
- exclusive campaigns;
- catalog and in-store engagement;
- premium Wine, Meat, and Gold offers.

The objective is primarily:

> **Protect customer lifetime value and expand wallet share.**

### Segment 1 — Value & Family Strategy

Recommended strategies:

- discounts and value-oriented offers;
- family bundles;
- essential-product promotions;
- cost-effective digital communication;
- targeted web offers;
- family-centric messaging;
- lifecycle marketing as household needs evolve.

The objective is:

> **Increase conversion and purchase frequency without relying on premium positioning.**

### Segment 2 — Develop the Middle-Value Segment

Recommended strategies:

- balanced value and mid-range offers;
- household products relevant to families with teenagers;
- multi-channel engagement;
- targeted promotions;
- personalized bundles;
- loyalty incentives designed to move customers toward higher-value behavior.

The objective is:

> **Increase engagement and gradually develop mid-value customers into stronger long-term customers.**

---

## 🧪 From Segmentation to Experimentation

The clusters should not be treated as the final business answer.

A stronger implementation would connect them to controlled experiments.

For example:

```text
Customer Segment
       ↓
Segment-Specific Offer
       ↓
A/B Test
       ↓
Measure Conversion / Revenue / Retention
       ↓
Refine Strategy
```

Potential experiments include:

- premium offer vs. standard offer for Segment 0;
- discount vs. bundle messaging for Segment 1;
- channel-specific campaigns for Segment 2;
- personalized vs. generic campaigns across all segments.

This converts clustering from descriptive analytics into a **testable decision-support system**.

---

## 🧩 Challenges & How I Addressed Them

| Challenge | How I Addressed It | What It Demonstrated |
| --- | --- | --- |
| **Missing income values** | Imputed using Education × Age median income | Context-aware missing-data treatment |
| **Implausible age / income extremes** | Applied percentile-based capping | Robust preprocessing for distance-based ML |
| **Strongly skewed spending variables** | Applied `log1p` transformation | Distribution-aware feature transformation |
| **Mixed numerical and categorical data** | One-hot encoded categories and standardized numerical features | Clustering data preparation |
| **Sparse categories** | Regrouped low-frequency education and marital-status levels | Categorical feature engineering |
| **Redundant raw variables** | Replaced dates/birth year with more useful engineered features | Feature design |
| **Large number of possible features** | Selected 27 features using EDA and business relevance | Business-informed feature selection |
| **No single obvious optimal K** | Combined Elbow, Silhouette, K comparison, and business interpretation | Model-selection judgment |
| **K=2 had better Silhouette Score** | Explicitly documented the trade-off and selected K=3 for actionable granularity | Avoiding metric-only decision making |
| **High-dimensional clusters difficult to inspect** | Used PCA for 2D visualization | Dimensionality reduction |
| **Clusters needed business meaning** | Profiled numerical, categorical, household, and campaign behavior | Translating ML output into decisions |

---

## 🛠️ Technical Stack

| Area | Technologies & Methods |
| --- | --- |
| **Programming** | Python |
| **Data Processing** | Pandas, NumPy |
| **Machine Learning** | Scikit-learn |
| **Clustering** | K-Means |
| **Dimensionality Reduction** | PCA |
| **Scaling** | StandardScaler |
| **Cluster Evaluation** | Elbow Method, WCSS, Silhouette Score |
| **Outlier Treatment** | Winsorization / percentile capping |
| **Transformations** | `log1p` |
| **Categorical Processing** | Regrouping, One-Hot Encoding |
| **Visualization** | Matplotlib, Seaborn |
| **Cluster Diagnostics** | Yellowbrick |
| **Environment** | Jupyter Notebook / Google Colab |

---

## ⚠️ Limitations & Critical Evaluation

### K=3 Was Not the Strongest Silhouette Solution

The most important limitation is that **K=2 achieved a higher Silhouette Score (0.3003) than K=3 (0.1880)**.

K=3 was selected because it provided a more useful level of customer differentiation and aligned better with the Elbow analysis and business objective.

This makes the segmentation defensible, but it should not be presented as mathematically definitive.

### Moderate Cluster Separation

A Silhouette Score of 0.188 indicates that the K=3 clusters are not extremely well separated.

This is common in behavioral customer data, where customers often exist on continuous spectra rather than in perfectly discrete groups.

### PCA Retained Only Part of the Variance

The first two PCA components explained approximately **54%** of the variance.

Therefore, overlap in the 2D visualization does not necessarily imply identical customers, but the visualization also cannot demonstrate full high-dimensional separation.

### K-Means Assumptions

K-Means works best when clusters are relatively compact and distance-based.

Real customer segments may:

- have irregular shapes;
- contain unequal densities;
- overlap;
- include mixed categorical structures that Euclidean distance represents imperfectly.

### Preprocessing Influences the Result

Cluster assignments depend on:

- feature selection;
- scaling;
- encoding;
- outlier treatment;
- transformations.

Different defensible preprocessing choices could produce different segment structures.

### Business Labels Are Interpretations

Names such as **High-Value** or **Family-Focused** are interpretations derived after clustering.

K-Means itself does not discover semantic customer personas; those labels come from profiling the resulting groups.

### Historical Behavior Does Not Guarantee Future Behavior

The segmentation is descriptive.

It does not prove that a specific marketing strategy will increase conversion, retention, or revenue.

Those claims require experimental validation.

---

## 🔄 Future Improvements

If I extended this project today, I would:

- validate cluster stability across multiple random seeds and resampled datasets;
- calculate additional internal clustering metrics such as **Davies-Bouldin** and **Calinski-Harabasz** scores;
- test **Hierarchical Clustering**;
- test **Gaussian Mixture Models** for probabilistic segment membership;
- explore **DBSCAN / HDBSCAN** where density-based structure is plausible;
- investigate **K-Prototypes** or Gower-distance approaches for mixed numerical and categorical data;
- compare clustering with and without selected engineered features;
- use systematic cluster-stability analysis rather than relying primarily on one fitted solution;
- examine segment-specific customer lifetime value;
- incorporate transaction timing and RFM-style features;
- analyze product affinity within each segment;
- create a model for assigning **new customers** to established segments;
- integrate segment labels into a CRM workflow;
- build an interactive customer-segmentation dashboard;
- monitor segment migration over time;
- validate segment-specific campaigns through controlled **A/B testing**.

---

## 🧠 What I Learned

This project strengthened my understanding of **unsupervised machine learning as a decision-making problem rather than simply an algorithm-selection problem**.

The most important lesson came from the disagreement between the evaluation methods.

The Silhouette Score favored:

**K = 2**

while the Elbow Method suggested that:

**K = 3 or K = 4**

could also be reasonable.

A purely metric-driven workflow would have selected K=2 automatically. But customer segmentation has a business objective: the segments must also provide enough granularity to support differentiated action.

That required asking a more useful question:

> **Which clustering solution provides a defensible balance between statistical structure and business usefulness?**

The project also reinforced that:

- preprocessing can fundamentally change distance-based clustering;
- scaling is essential when features use different units;
- skewness and extreme values can distort Euclidean distance;
- feature engineering can make customer behavior easier to interpret;
- cluster labels must be derived through careful profiling;
- unsupervised models require more interpretive judgment than supervised models with a known target;
- visualization helps explain clusters but should not substitute for quantitative validation;
- business recommendations should ultimately be tested experimentally.

The progression was therefore from:

**"How do I run K-Means?"**

to:

**"How do I build, validate, interpret, and operationalize a customer segmentation that is statistically defensible and commercially useful?"**

---

## 💬 Interview Quick Reference

| Question | Quick Answer |
| --- | --- |
| **What was the project?** | An unsupervised ML project segmenting retail customers for targeted marketing |
| **Project context?** | MIT IDSS — Data Science and Machine Learning: Making Data-Driven Decisions |
| **Dataset size?** | 2,240 customers and 29 original variables |
| **Main algorithm?** | K-Means clustering |
| **Final number of clusters?** | **3** |
| **Cluster sizes?** | 757, 861, and 622 customers |
| **Why K=3?** | It balanced Elbow evidence, interpretability, and business usefulness |
| **Which K had the highest Silhouette Score?** | **K=2, with 0.3003** |
| **K=3 Silhouette Score?** | **0.1880** |
| **Why not automatically choose K=2?** | K=3 revealed an actionable middle-value segment that a simpler split could obscure |
| **Main engineered features?** | Age, customer tenure, total spending, total accepted campaigns, children at home |
| **How did you handle missing income?** | Median imputation within Education × Age groups |
| **How did you handle outliers?** | Percentile-based Winsorization / capping |
| **How did you handle skewness?** | `log1p` transformation |
| **Why scaling?** | K-Means uses distance, so differently scaled features would contribute unequally |
| **How many features entered final clustering?** | 27 selected features |
| **How did you visualize clusters?** | PCA reduced the selected features to two dimensions |
| **PCA variance explained?** | Approximately **53.97%** by the first two components |
| **Segment 0?** | High-income, high-spending, highly engaged customers |
| **Segment 1?** | Lower-income, low-spending, family-focused customers |
| **Segment 2?** | Mid-income, mid-spending households with stronger teen-family representation |
| **Main business value?** | Different retention, value, channel, and campaign strategies for each segment |
| **Biggest limitation?** | K=3 has only moderate separation and was selected partly for business actionability |
| **What would you improve today?** | Cluster stability testing, alternative clustering algorithms, CRM deployment, and A/B validation |
| **Main lesson?** | In unsupervised ML, statistical metrics and business usefulness must be evaluated together |

---

## 📁 Repository Contents

Typical repository structure:

```text
.
├── README.md
├── Customer_Personality_Segmentation.csv
└── *.ipynb
```

The notebook contains the complete analytical workflow, including:

- data inspection;
- descriptive statistics;
- missing-value analysis;
- feature engineering;
- categorical regrouping;
- missing-value imputation;
- outlier treatment;
- log transformations;
- categorical encoding;
- feature scaling;
- feature selection;
- Elbow analysis;
- Silhouette analysis;
- K-Means clustering;
- comparison of alternative K values;
- cluster profiling;
- PCA visualization;
- business recommendations.

---

## 🎓 Project Context

This project was completed as part of:

**MIT Institute for Data, Systems, and Society (IDSS)**  
**Data Science and Machine Learning: Making Data-Driven Decisions**

It demonstrates applied competence in:

**Python · Pandas · NumPy · Scikit-learn · Exploratory Data Analysis · Feature Engineering · Data Preprocessing · K-Means · PCA · Unsupervised Learning · Customer Analytics · Business Interpretation**

It is included in my portfolio because it demonstrates an important area not captured by supervised classification and regression projects: **discovering useful structure when no target label exists**.

The project also shows the ability to move beyond algorithm output and critically evaluate the tension between quantitative metrics and real business objectives.

---

## 📄 License & Educational Use

This repository is intended for **educational and portfolio purposes**.

The analysis demonstrates work completed as part of the MIT IDSS learning program. Any original course materials, datasets, or instructional content remain subject to their respective ownership and usage terms.

---

## 👤 Author

**Gregory Charles**

Data Science · Machine Learning · Generative AI · Data Visualization · Applied Software Development

[← Back to Main Projects Portfolio](../README.md)
