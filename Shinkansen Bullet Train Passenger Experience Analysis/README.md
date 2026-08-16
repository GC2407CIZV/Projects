# 🚄 Shinkansen Passenger Experience Prediction

**Machine Learning · Binary Classification · Model Benchmarking ·
LightGBM · XGBoost · CatBoost · Ensemble Learning · Feature Engineering
· Hyperparameter Optimization**

> **Project Context:** MIT IDSS --- *Data Science and Machine Learning:
> Making Data-Driven Decisions*\
> **Hackathon Result:** **7th place out of 36 participants**\
> **Official Competition Score:** **0.9572777**\
> **Post-Hackathon Final Ensemble Test Accuracy:** **0.96101**\
> **Post-Hackathon Final Ensemble Test ROC AUC:** **0.994405**

An end-to-end machine-learning study for predicting **Shinkansen
passenger satisfaction** from passenger characteristics, journey
information, operational factors, and detailed service-feedback data.

The project developed in two distinct stages:

1.  an **MIT IDSS machine-learning hackathon**, preserved in
    `shinkansen_hackaton.ipynb`; and
2.  a substantially expanded **post-hackathon comparative
    machine-learning study**, implemented in
    `Shinkansen_Passenger_Experience_15_ML_Study.ipynb`.

The post-hackathon study goes beyond the original competition solution
by validating the data sources and merge, comparing **15 models across 8
model families**, testing feature representations, tuning shortlisted
models, evaluating ensemble strategies, and performing final
reserved-test evaluation and error analysis.

------------------------------------------------------------------------

## ⭐ Key Highlights

-   Placed **7th out of 36 participants** in the MIT IDSS hackathon.
-   Achieved an official external competition score of **0.9572777**.
-   Preserved the original hackathon notebook separately from the later
    independent study.
-   Combined passenger travel information with detailed service-feedback
    data using passenger `ID`.
-   Validated source structure, target definition, and the merged
    modeling dataset before model development.
-   Compared **15 classification models across 8 model families**.
-   Used **ROC AUC as the primary model-selection metric**, while also
    tracking Accuracy, Precision, Recall, and F1-score.
-   Identified **CatBoost** as the strongest untuned baseline with
    **0.993861 validation ROC AUC**.
-   Tuned the strongest candidate models using model-specific search
    strategies.
-   Achieved **0.994196 validation ROC AUC** with tuned LightGBM, the
    strongest individual validation candidate.
-   Tested engineered-feature representations rather than assuming that
    additional features would improve performance.
-   Found that the full engineered representation **did not outperform
    the simpler original-variable representation** in the controlled
    LightGBM ablation.
-   Tested target encoding and rejected it because the gain was
    negligible: approximately **+0.000059 validation ROC AUC**.
-   Compared multiple ensemble strategies.
-   Selected a simple probability-average ensemble of **LightGBM +
    XGBoost + CatBoost** as the final predictor.
-   Achieved **0.96101 accuracy** and **0.994405 ROC AUC** on the
    reserved internal test subset.
-   Final positive-class metrics: **0.97041 precision**, **0.95788
    recall**, and **0.96410 F1-score**.
-   Correctly classified **13,605 of 14,157** reserved-test
    observations.
-   Final confusion-matrix errors: **326 false negatives** and **226
    false positives**.
-   Performed feature-importance analysis and structured error analysis.
-   Explicitly documented negative results, leakage considerations,
    computational trade-offs, and limitations.
-   Kept the **official external hackathon result** separate from the
    **post-hackathon internal evaluation**.

------------------------------------------------------------------------

## 🎯 Business Problem

Passenger-experience surveys contain information about service quality,
operational performance, travel context, and passenger characteristics.
Looking at individual survey variables in isolation does not reveal
which combinations of factors are most useful for predicting overall
passenger satisfaction.

The central modeling question was:

> **Can machine learning predict whether a passenger will report a
> positive overall experience using passenger characteristics, journey
> information, operational factors, and service ratings?**

The project also asks:

-   Which model families perform best on this structured classification
    problem?
-   Do engineered features materially improve predictive performance?
-   Can alternative categorical encodings improve the strongest model?
-   Can an ensemble improve on the best individual models?
-   Which variables are most strongly associated with the model's
    predictions?
-   What types of errors remain after selecting a high-performing model?

The target variable is:

``` text
Overall_Experience
```

The task is formulated as binary classification:

``` text
Passenger Characteristics
          +
Journey Information
          +
Operational Factors
          +
Service Feedback
          ↓
   Classification Model
          ↓
 Overall_Experience
        0 or 1
```

A model of this type could support deeper analysis of
passenger-experience patterns, service priorities, operational pain
points, and groups or journeys that may warrant further investigation.

------------------------------------------------------------------------

## 🏆 Stage 1 --- MIT IDSS Hackathon

The project originated in a machine-learning hackathon associated with:

**MIT Institute for Data, Systems, and Society (IDSS)**\
**Data Science and Machine Learning: Making Data-Driven Decisions**

The original competition-stage work is preserved in:

``` text
shinkansen_hackaton.ipynb
```

The submitted prediction file achieved an official external competition
score of:

``` text
0.9572777
```

with a final placement of:

``` text
7th out of 36 participants
```

### Why the Hackathon Score Is Reported Separately

The competition score came from an **external evaluation procedure**. It
is therefore different from the validation and reserved-test metrics
generated inside the later post-hackathon study.

``` text
Hackathon Notebook
        ↓
Competition Submission
        ↓
External Evaluation
        ↓
Score: 0.9572777
Rank: 7 / 36
```

The post-hackathon notebook uses its own internal data split and
model-selection procedure.

For that reason:

> **The external score of 0.9572777 must not be directly compared with
> the later 0.96101 internal test accuracy as though they were
> measurements from the same evaluation framework.**

------------------------------------------------------------------------

## 🔄 Stage 2 --- Expanded Post-Hackathon ML Study

After the competition, I rebuilt and extended the project as a broader
machine-learning study rather than simply continuing to tune the
original competition model.

The expanded work is implemented in:

``` text
Shinkansen_Passenger_Experience_15_ML_Study.ipynb
```

The post-hackathon study expands the project across the full modeling
lifecycle:

``` text
Source Validation
      ↓
Data Integration
      ↓
Exploratory Analysis
      ↓
Preprocessing Decisions
      ↓
Feature Experiments
      ↓
15-Model Benchmark
      ↓
Candidate Shortlisting
      ↓
Model-Specific Tuning
      ↓
Representation / Encoding Tests
      ↓
Ensemble Comparison
      ↓
Final Reserved-Test Evaluation
      ↓
Feature Interpretation + Error Analysis
```

This changed the project from a competition-focused modeling exercise
into a more systematic comparative ML study.

------------------------------------------------------------------------

## 🗂️ Dataset

The project combines two complementary sources of passenger information.

### Travel Data

Travel-related variables include:

-   `Gender`
-   `Customer_Type`
-   `Age`
-   `Type_Travel`
-   `Travel_Class`
-   `Travel_Distance`
-   `Departure_Delay_in_Mins`
-   `Arrival_Delay_in_Mins`

### Survey Data

Passenger service evaluations include variables such as:

-   Seat Comfort
-   Departure / Arrival Convenience
-   Catering
-   Platform Location
-   Onboard Wi-Fi Service
-   Onboard Entertainment
-   Online Support
-   Ease of Online Booking
-   Onboard Service
-   Leg Room Service
-   Baggage Handling
-   Check-in Service
-   Cleanliness
-   Online Boarding

### Target

``` text
Overall_Experience
```

The travel and survey sources are combined using passenger `ID`.

The post-hackathon notebook validates the data sources and merge before
proceeding with modeling so that model results are not interpreted
without first checking the structure of the underlying analytical
dataset.

------------------------------------------------------------------------

## 🔍 Exploratory Data Analysis

The exploratory stage examines:

-   dataset structure;
-   target distribution;
-   missingness;
-   numerical distributions;
-   categorical distributions;
-   passenger demographics;
-   journey characteristics;
-   delay behavior;
-   service ratings;
-   outliers;
-   relationships between candidate predictors and `Overall_Experience`.

The analysis treats EDA as part of model development rather than as a
purely descriptive step.

### Passenger and Journey Context

Variables such as:

-   customer type;
-   type of travel;
-   travel class;
-   age;
-   travel distance;

provide contextual information that can interact with service
evaluations and operational conditions.

### Delays

Departure and arrival delays are highly skewed and related to one
another. This motivates both preprocessing investigation and derived
delay features.

### Service Ratings

Multiple service variables contain strong predictive signal. The project
therefore evaluates satisfaction as a combination of passenger context,
journey conditions, operational performance, and service quality rather
than assuming that punctuality alone determines overall experience.

------------------------------------------------------------------------

## 🧹 Data Preparation & Leakage Awareness

The post-hackathon study distinguishes between:

1.  **data understanding and representation experiments**; and
2.  **supervised model selection and final evaluation**.

A dedicated train / validation / reserved-test design is used for
supervised model comparison.

### Missing Values

The project evaluates the missingness present in the source data and
uses model-appropriate handling rather than assuming one universal
strategy is optimal for every algorithm.

### Extreme Values

Long-tailed numerical variables---particularly travel distance and delay
variables---are examined for extreme observations.

Percentile-based capping is used in the expanded representation
experiments to reduce the influence of unusually large values without
automatically deleting complete passenger records.

### Important Methodological Limitation

Some data-derived transformations used during exploratory/representation
work, including percentile-based capping and portions of unsupervised
feature construction, occur before the final supervised split.

The reserved test **labels** are not used for supervised model
selection, but a stricter production workflow would fit every
data-derived transformation using training data only and then apply the
learned transformation to validation and test data.

This is retained as an explicit limitation rather than hidden.

------------------------------------------------------------------------

## 🧠 Feature Engineering & Representation Experiments

The project investigates whether alternative representations of the raw
data improve generalization.

Examples of engineered information include:

### Total Delay

``` text
Total_Delay =
    Departure_Delay_in_Mins
  + Arrival_Delay_in_Mins
```

### Grouped Variables

Alternative categorical representations are explored for variables such
as:

-   age;
-   travel distance;
-   departure delay;
-   arrival delay.

### Derived / Interaction Features

The expanded study also investigates derived and interaction-style
information intended to expose relationships not represented directly by
individual raw variables.

### Controlled Feature-Representation Ablation

A key result is that **more feature engineering did not automatically
produce a better model**.

The full engineered representation was compared with the simpler
original-variable representation under a controlled LightGBM experiment.

The engineered representation **did not outperform** the simpler
representation.

That negative result was retained because it changes the modeling
decision:

> **Additional complexity should be justified by measured generalization
> improvement, not by the number of engineered features.**

This is one of the most important lessons from the post-hackathon study.

------------------------------------------------------------------------

## 🔤 Target-Encoding Experiment

The study also tests target encoding as an alternative way to represent
categorical information.

The experiment produced only an approximately:

``` text
+0.000059
```

increase in validation ROC AUC.

That improvement was considered too small to justify adopting the more
complex representation.

The experiment therefore demonstrates a deliberate model-development
decision:

> **A technically measurable gain is not necessarily a practically
> meaningful gain.**

The simpler representation was retained for the final modeling path.

------------------------------------------------------------------------

## 🤖 Model Benchmark --- 15 Models Across 8 Families

The post-hackathon study broadens the model comparison substantially
beyond the original competition work.

### Linear / Probabilistic Models

1.  Logistic Regression
2.  SGD Classifier
3.  Gaussian Naive Bayes

### Distance-Based Models

4.  K-Nearest Neighbors

### Tree Models

5.  Decision Tree

### Bagging / Randomized Tree Ensembles

6.  Bagging Classifier
7.  Random Forest
8.  Extra Trees

### Boosting Models

9.  AdaBoost
10. Gradient Boosting
11. HistGradientBoosting
12. XGBoost
13. LightGBM
14. CatBoost

### Kernel Models

15. RBF Support Vector Machine

This broader benchmark provides evidence for model selection rather than
beginning with the assumption that one particular boosting library must
be best.

------------------------------------------------------------------------

## 📏 Evaluation Strategy

The project uses multiple classification metrics:

-   Accuracy
-   Precision
-   Recall
-   F1-score
-   ROC AUC

### Primary Selection Metric

**ROC AUC** is used as the primary metric for model selection because it
evaluates ranking/discrimination performance across classification
thresholds.

Accuracy, precision, recall, and F1-score remain important complementary
measures.

### Data Roles

The supervised modeling workflow separates data into:

``` text
Training Data
     ↓
Fit candidate models

Validation Data
     ↓
Compare models
Tune candidates
Test feature/encoding decisions
Compare ensembles

Reserved Test Data
     ↓
Final evaluation after model selection
```

This is stronger than repeatedly choosing models based on the final test
result.

------------------------------------------------------------------------

## 🥇 Baseline Model Comparison

Among the untuned baseline models, **CatBoost** produced the strongest
validation ROC AUC:

``` text
CatBoost Validation ROC AUC: 0.993861
```

This confirmed that modern gradient-boosting models were especially well
suited to the structured passenger-experience data.

However, the project did not stop at the strongest baseline.

Several high-performing candidates were shortlisted for model-specific
tuning and further comparison.

------------------------------------------------------------------------

## ⚙️ Model-Specific Hyperparameter Optimization

Rather than applying the same search strategy blindly to every
algorithm, the expanded study focuses tuning effort on the strongest
candidate models.

Shortlisted models include:

-   CatBoost
-   XGBoost
-   LightGBM
-   HistGradientBoosting
-   Random Forest

The tuning experiments investigate model-specific hyperparameters and
compare the tuned candidates on validation ROC AUC and supporting
classification metrics.

### Important Result: Tuning Helped Selectively

Hyperparameter optimization did **not** improve every strong baseline
automatically.

For example, the first CatBoost tuning round slightly underperformed the
already-strong untuned CatBoost baseline.

This is an important practical result:

> **Hyperparameter tuning is an experiment, not a guarantee of
> improvement.**

The strongest individual validation candidate after tuning was:

``` text
Tuned LightGBM
Validation ROC AUC: 0.994196
```

This also changed the earlier project narrative: the strongest
individual post-hackathon candidate was no longer simply "the most
heavily tuned CatBoost."

------------------------------------------------------------------------

## 🧩 Ensemble Modeling

Because LightGBM, XGBoost, and CatBoost were all strong but not
identical models, the study evaluates whether combining their
probability estimates can improve generalization.

Multiple ensemble strategies are compared.

The final selected model is a simple probability-average ensemble of:

``` text
LightGBM
   +
XGBoost
   +
CatBoost
```

Conceptually:

``` text
P(final) =
    [P(LightGBM) + P(XGBoost) + P(CatBoost)]
    / 3
```

The simple average was selected because it provided the strongest final
validation case among the ensemble approaches tested without adding
unnecessary ensemble complexity.

------------------------------------------------------------------------

## 🏁 Final Reserved-Test Performance

After model and ensemble selection, the final LightGBM + XGBoost +
CatBoost probability-average ensemble was evaluated on the reserved
internal test subset.

### Final Metrics

  Metric                               Reserved-Test Result
  ---------------------------------- ----------------------
  **Accuracy**                                  **0.96101**
  **ROC AUC**                                  **0.994405**
  **Precision --- positive class**              **0.97041**
  **Recall --- positive class**                 **0.95788**
  **F1-score --- positive class**               **0.96410**

### Classification Counts

``` text
Reserved-test observations: 14,157
Correct predictions:         13,605
Incorrect predictions:          552
False negatives:                326
False positives:                226
```

The final result therefore combines:

-   high overall classification accuracy;
-   very strong ranking/discrimination performance;
-   strong precision and recall;
-   explicit accounting for the remaining error types.

------------------------------------------------------------------------

## 📊 Hackathon vs. Post-Hackathon Results

The two stages should be interpreted separately.

  ------------------------------------------------------------------------
  Stage                                       Result Evaluation Context
  --------------------- ---------------------------- ---------------------
  **MIT IDSS                              **7 / 36** Competition placement
  Hackathon**                                        

  **MIT IDSS                           **0.9572777** External competition
  Hackathon**                                        score

  **Post-Hackathon              **0.993861 ROC AUC** Best untuned
  Baseline**                                         validation model ---
                                                     CatBoost

  **Post-Hackathon              **0.994196 ROC AUC** Best individual
  Tuned Individual                                   validation candidate
  Model**                                            --- tuned LightGBM

  **Post-Hackathon              **0.96101 accuracy** Reserved internal
  Final Ensemble**                                   test

  **Post-Hackathon              **0.994405 ROC AUC** Reserved internal
  Final Ensemble**                                   test
  ------------------------------------------------------------------------

> **The 0.9572777 external competition score and 0.96101 internal test
> accuracy are not directly comparable metrics from the same evaluation
> procedure.**

The correct interpretation is that the project has both:

1.  an **externally evaluated hackathon result**, and
2.  a later **independent internal ML study** with a stronger
    experimental design and broader model comparison.

------------------------------------------------------------------------

## 🔎 Feature Importance & Interpretation

Feature-importance analysis is used to investigate which variables
contribute strongly to predictions made by the high-performing
tree/boosting models.

Important predictive groups include service and passenger-context
variables associated with areas such as:

-   seat comfort;
-   onboard entertainment;
-   online/digital services;
-   customer type;
-   travel purpose;
-   travel class;
-   check-in experience;
-   journey characteristics.

The analysis indicates that passenger experience contains substantial
predictive information beyond operational delay alone.

A useful conceptual summary is:

``` text
Passenger Context
       +
Journey Conditions
       +
Operational Reliability
       +
Physical Comfort
       +
Onboard Services
       +
Digital Experience
       ↓
Overall Passenger Experience
```

### Predictive Importance Is Not Causation

Feature importance identifies variables that are useful to a predictive
model.

It does **not** prove that changing one feature will directly cause an
equivalent improvement in passenger satisfaction.

Any causal service-improvement claim would require a different study
design.

------------------------------------------------------------------------

## 🔬 Error Analysis

The final reserved-test evaluation does not stop at a single headline
metric.

The final ensemble produced:

``` text
False negatives: 326
False positives: 226
```

This matters because different error types may carry different
operational consequences.

For example:

-   a **false negative** could represent a passenger whose positive
    experience was not recognized by the model;
-   a **false positive** could represent a passenger predicted to have a
    positive experience despite reporting a negative one.

A production decision-support system would need to determine whether
these errors have different business costs and, if so, whether the
classification threshold should be adjusted accordingly.

------------------------------------------------------------------------

## 💼 Potential Business Applications

This is a portfolio/educational ML study rather than a deployed railway
system, so the following are **potential applications**, not measured
production outcomes.

### Passenger Experience Analysis

Identify combinations of passenger, journey, operational, and service
characteristics associated with positive or negative experience.

### Service Prioritization

Use predictive interpretation to identify service dimensions that
warrant deeper investigation.

### Passenger-Group Analysis

Examine whether predictive patterns differ across customer types, travel
purposes, classes, or demographic groups.

### Proactive Experience Management

With appropriate real-time data and production validation, similar
models could potentially help identify journeys or passenger groups at
elevated risk of dissatisfaction.

### Operational Decision Support

Combine model probabilities with operational metrics and business rules
to prioritize investigation or intervention.

### Experiment Design

Use predictive findings to generate hypotheses that can later be tested
through controlled service experiments rather than treating feature
importance as causal evidence.

------------------------------------------------------------------------

## 🧩 Challenges & What They Demonstrated

  ------------------------------------------------------------------------
  Challenge               Approach                 What It Demonstrated
  ----------------------- ------------------------ -----------------------
  Separate travel and     Validated and joined     Data integration
  survey sources          records using passenger  
                          `ID`                     

  Mixed numerical and     Used model-appropriate   Data preparation
  categorical data        preprocessing and        
                          representation           

  Missing information     Investigated missingness Model-aware
                          and model-specific       preprocessing
                          handling                 

  Extreme delay/distance  Evaluated                Robustness analysis
  values                  percentile-based capping 

  Many plausible          Benchmarked 15 models    Broad model comparison
  algorithms              across 8 families        

  Computationally heavier Evaluated feasibility    Computational judgment
  algorithms              rather than excluding    
                          them automatically       

  Feature-engineering     Performed controlled     Evidence-based feature
  uncertainty             representation ablation  decisions

  Alternative categorical Tested target encoding   Encoding
  representation          and measured its         experimentation
                          incremental value        

  Strong baseline models  Tuned only shortlisted   Efficient optimization
                          candidates               

  Tuning did not always   Retained negative tuning Experimental discipline
  improve results         outcomes                 

  Several similarly       Compared ensemble        Ensemble learning
  strong boosting models  strategies               

  Need for unbiased final Reserved a test subset   Evaluation discipline
  reporting               for final evaluation     

  Competition vs. later   Kept external and        Claim accuracy
  study                   internal metrics         
                          separate                 

  High aggregate          Performed                Error awareness
  performance             confusion-matrix/error   
                          analysis                 

  Interpreting model      Avoided causal claims    Responsible
  importance                                       interpretation
  ------------------------------------------------------------------------

------------------------------------------------------------------------

## 🛠️ Technical Stack

  -----------------------------------------------------------------------
  Area                                Technologies & Methods
  ----------------------------------- -----------------------------------
  **Programming**                     Python

  **Environment**                     Jupyter Notebook, Google Colab

  **Data Manipulation**               Pandas, NumPy

  **Visualization**                   Matplotlib, Seaborn

  **Machine Learning**                Scikit-learn

  **Linear / Probabilistic Models**   Logistic Regression, SGD
                                      Classifier, Gaussian Naive Bayes

  **Distance-Based Models**           K-Nearest Neighbors

  **Tree / Bagging Models**           Decision Tree, Bagging Classifier,
                                      Random Forest, Extra Trees

  **Boosting Models**                 AdaBoost, Gradient Boosting,
                                      HistGradientBoosting, XGBoost,
                                      LightGBM, CatBoost

  **Kernel Models**                   RBF SVM

  **Preprocessing**                   Missing-value analysis/treatment,
                                      categorical encoding, scaling,
                                      percentile-based capping

  **Feature Engineering**             Delay aggregation, grouped
                                      variables, derived and
                                      interaction-style features

  **Encoding Experiment**             Target encoding

  **Optimization**                    Model-specific hyperparameter
                                      tuning / search

  **Ensembling**                      Probability averaging and ensemble
                                      comparison

  **Evaluation**                      Accuracy, Precision, Recall,
                                      F1-score, ROC AUC, confusion matrix

  **Interpretability**                Feature importance

  **Analysis**                        EDA, representation ablation, model
                                      comparison, error analysis
  -----------------------------------------------------------------------

------------------------------------------------------------------------

## ⚠️ Limitations & Critical Evaluation

### 1. External and Internal Results Are Not Directly Comparable

The hackathon score of **0.9572777** came from an external competition
evaluation.

The later **0.96101 accuracy / 0.994405 ROC AUC** came from the
post-hackathon notebook's reserved internal test subset.

They represent different evaluation procedures.

### 2. Internal Reserved Test Is Not External Production Validation

The post-hackathon test subset was held back from supervised model
selection, but it still comes from the same underlying project dataset.

A production model would require validation across different time
periods, routes, operating conditions, and passenger populations.

### 3. Some Transformations Precede the Final Split

Although test labels are reserved from supervised model selection, some
data-derived transformations used during representation experiments are
performed before the final split.

A stricter production pipeline would fit all learned transformations
using training data only.

### 4. Feature Importance Is Not Causal Evidence

High feature importance means a variable contributes predictive
information to the model. It does not prove that changing that service
dimension will cause passenger satisfaction to change.

### 5. Small Metric Gains Need Practical Justification

The target-encoding experiment improved validation ROC AUC by only
approximately **0.000059**.

The experiment was therefore rejected rather than adopting additional
complexity for a negligible gain.

### 6. Feature Engineering Did Not Automatically Help

The complete engineered representation did not outperform the simpler
original-variable representation in the controlled LightGBM comparison.

This is an important negative result and a reminder that additional
features must be validated empirically.

### 7. Ensemble Improvement Is Incremental

The final ensemble improves on already strong individual boosting
models, but the improvement is small.

In production, that gain would need to be weighed against additional
inference, maintenance, and monitoring complexity.

### 8. Threshold Selection Is Not Cost-Optimized

The final classification uses a standard decision threshold.

A deployed system should select thresholds based on the relative
operational cost of false positives and false negatives.

### 9. Model Explainability Can Be Extended

Global feature importance provides useful information but does not fully
explain individual predictions.

Methods such as SHAP could provide richer global and local explanations.

------------------------------------------------------------------------

## 🔄 Future Improvements

If I extended the project further, I would:

-   implement all preprocessing inside reproducible train-fitted
    pipelines;
-   preserve a fully untouched final holdout or external validation set;
-   use repeated or nested stratified cross-validation where
    computationally appropriate;
-   compare probability calibration across the strongest models;
-   optimize classification thresholds against explicit operational
    costs;
-   perform systematic subgroup-performance analysis;
-   investigate fairness metrics appropriate to the available passenger
    attributes;
-   use **SHAP** for global and individual explanations;
-   evaluate ensemble calibration as well as discrimination;
-   test model stability across time periods, routes, and operational
    conditions;
-   perform drift monitoring;
-   package the final model/ensemble behind an API;
-   develop an analytical dashboard for model probabilities, errors, and
    feature explanations;
-   test whether predictive insights translate into causal service
    improvements through controlled experiments.

------------------------------------------------------------------------

## 🧠 What I Learned

This project became substantially more valuable after the hackathon
because the objective changed.

During the competition, the practical question was:

> **How can I build a strong submission under hackathon constraints?**

The later study asked a broader question:

> **What happens when I treat the same problem as a structured
> comparative machine-learning investigation rather than a leaderboard
> exercise?**

Several lessons emerged.

### 1. Benchmark Broadly Before Committing to One Model

The expanded study compares 15 models rather than assuming that the
strongest competition model must remain the best approach.

CatBoost was the strongest untuned baseline, but tuned LightGBM became
the strongest individual validation candidate.

### 2. More Features Do Not Automatically Mean Better Features

The engineered representation did not outperform the simpler
representation in the controlled LightGBM experiment.

This reinforced the importance of ablation testing.

### 3. Tiny Improvements May Not Justify Complexity

Target encoding produced a measurable but negligible validation
improvement.

Rejecting it was as important as testing it.

### 4. Hyperparameter Tuning Is Not Guaranteed to Improve a Model

Some tuning experiments did not improve the already-strong baseline.

Optimization should therefore be evaluated rather than assumed to be
beneficial.

### 5. Strong Models Can Still Benefit From Diversity

LightGBM, XGBoost, and CatBoost were individually strong.

Combining their probabilities produced the final selected ensemble and
slightly improved the overall result.

### 6. A Headline Metric Is Not Enough

The final study reports not only accuracy and ROC AUC but also
precision, recall, F1-score, the number of correct predictions, false
negatives, and false positives.

### 7. Negative Results Are Useful Results

Feature engineering that does not help, target encoding that adds
negligible value, and tuning that fails to beat a baseline all provide
information that improves the final modeling decision.

### 8. Evaluation Context Must Be Preserved

The externally evaluated hackathon score and the internally evaluated
post-hackathon model answer different questions.

Keeping them separate makes the project more credible, not less.

------------------------------------------------------------------------

## 💬 Interview Quick Reference

  -----------------------------------------------------------------------
  Question                            Quick Answer
  ----------------------------------- -----------------------------------
  **What was the project?**           Predicting Shinkansen passenger
                                      satisfaction from passenger,
                                      journey, operational, and
                                      service-feedback data

  **Project origin?**                 MIT IDSS machine-learning
                                      hackathon, followed by a
                                      substantially expanded independent
                                      ML study

  **Hackathon placement?**            **7th out of 36 participants**

  **Official competition score?**     **0.9572777**

  **Can that score be compared        No. The hackathon score is an
  directly with the later 0.96101     external competition result;
  accuracy?**                         0.96101 is an internal
                                      reserved-test accuracy from the
                                      later study

  **How large was the later model     **15 models across 8 model
  benchmark?**                        families**

  **Primary model-selection metric?** **ROC AUC**

  **Best untuned baseline?**          CatBoost --- **0.993861 validation
                                      ROC AUC**

  **Best tuned individual validation  LightGBM --- **0.994196 validation
  candidate?**                        ROC AUC**

  **Final model?**                    Probability-average ensemble of
                                      **LightGBM + XGBoost + CatBoost**

  **Final reserved-test accuracy?**   **0.96101**

  **Final reserved-test ROC AUC?**    **0.994405**

  **Positive-class precision?**       **0.97041**

  **Positive-class recall?**          **0.95788**

  **Positive-class F1?**              **0.96410**

  **How many reserved-test            **13,605 / 14,157**
  observations were correct?**        

  **False negatives / false           **326 / 226**
  positives?**                        

  **Did feature engineering improve   Not as a complete representation;
  the final model?**                  the controlled LightGBM ablation
                                      favored the simpler representation

  **Did target encoding help?**       Only negligibly: about **+0.000059
                                      validation ROC AUC**, so it was
                                      rejected

  **Did tuning always help?**         No. Some tuned configurations
                                      failed to beat strong baselines

  **Why ensemble the boosting         They were individually strong but
  models?**                           sufficiently different for
                                      probability averaging to provide a
                                      small additional gain

  **Main methodological limitation?** Some data-derived transformations
                                      precede the final split; a stricter
                                      production pipeline would fit every
                                      learned transformation on training
                                      data only

  **Main interpretation limitation?** Feature importance is predictive
                                      association, not causation

  **What makes the project            It combines an externally evaluated
  valuable?**                         hackathon result with a broader
                                      independent study demonstrating
                                      benchmarking, tuning, ablation,
                                      ensembling, final evaluation, and
                                      critical methodological analysis
  -----------------------------------------------------------------------

------------------------------------------------------------------------

## 📁 Repository Structure

``` text
.
├── README.md
├── shinkansen_hackaton.ipynb
├── Shinkansen_Passenger_Experience_15_ML_Study.ipynb
├── submissions/
│   └── S6_0.9572777.csv
└── data/
    ├── Traveldata_train.csv
    ├── Surveydata_train.csv
    ├── Traveldata_test.csv
    └── Surveydata_test.csv
```

### Key Files

**`shinkansen_hackaton.ipynb`**\
Original competition-stage notebook associated with the MIT IDSS
hackathon solution. It is retained as the historical reference for the
competition work.

**`Shinkansen_Passenger_Experience_15_ML_Study.ipynb`**\
Expanded post-hackathon comparative machine-learning study covering
source validation, EDA, preprocessing decisions, representation
experiments, 15-model benchmarking, model-specific tuning,
target-encoding evaluation, ensemble selection, reserved-test
evaluation, feature interpretation, and error analysis.

**`S6_0.9572777.csv`**\
Prediction submission associated with the official **0.9572777 external
competition score**.

> Dataset files should only be included publicly where permitted by the
> original course or challenge terms.

------------------------------------------------------------------------

## ▶️ Running the Project

The notebooks were developed in a Jupyter / Google Colab environment.

Typical requirements include:

``` text
Python
pandas
numpy
matplotlib
seaborn
scikit-learn
xgboost
lightgbm
catboost
```

Open either notebook depending on the purpose:

-   use `shinkansen_hackaton.ipynb` to review the historical
    hackathon-stage work;
-   use `Shinkansen_Passenger_Experience_15_ML_Study.ipynb` for the
    expanded post-hackathon study.

Dataset paths may need to be adjusted depending on the local or Colab
directory structure.

------------------------------------------------------------------------

## 🎓 Project Context

This project originated in connection with:

**MIT Institute for Data, Systems, and Society (IDSS)**\
**Data Science and Machine Learning: Making Data-Driven Decisions**

The original competition work was subsequently extended independently.

The project demonstrates applied experience in:

**Python · Pandas · NumPy · EDA · Data Integration · Data Preprocessing
· Feature Engineering · Classification · Linear Models · Tree Models ·
Bagging · Gradient Boosting · XGBoost · LightGBM · CatBoost · SVM · KNN
· Hyperparameter Optimization · Model Benchmarking · Ablation Testing ·
Target Encoding · Ensemble Learning · ROC AUC · Precision · Recall · F1
· Confusion-Matrix Analysis · Feature Importance · Error Analysis ·
Business Interpretation**

Its portfolio value comes from demonstrating both:

1.  **performance under externally evaluated hackathon constraints**,
    and
2.  **continued independent development into a broader comparative
    machine-learning study**.

------------------------------------------------------------------------

## 📄 Educational & Portfolio Use

This repository is intended for **educational and portfolio purposes**.

The hackathon-stage work was developed in connection with the MIT IDSS
learning program. The expanded comparative ML study was developed
independently afterward.

Any original datasets, course materials, challenge materials, or other
third-party content remain subject to their respective ownership and
usage terms.

------------------------------------------------------------------------

## 👤 Author

**Gregory Charles**

Data Science · Machine Learning · Generative AI · Data Visualization ·
Applied Software Development

[← Back to Main Projects Portfolio](../README.md)
