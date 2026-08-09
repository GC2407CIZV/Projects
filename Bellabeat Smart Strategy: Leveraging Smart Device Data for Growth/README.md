# 🌿 Bellabeat Smart Device Usage Analysis

**Business Analytics · R · Exploratory Data Analysis · Marketing Strategy**

> **Project Context:** Google Data Analytics Professional Certificate Capstone — Bellabeat Case Study

Analyzed publicly available **Fitbit smart-device data** to identify activity, sleep, and calorie-use patterns that could inform marketing and product-positioning recommendations for Bellabeat’s **Leaf** wellness tracker.

Using **R, Tidyverse, lubridate, and ggplot2**, I cleaned and joined multiple activity and sleep datasets, explored behavioral relationships, and translated the results into business recommendations focused on sedentary behavior, personalization, sleep insights, and user engagement.

---

## ⭐ Key Highlights

- Worked with Fitbit datasets covering **30 users**, including daily, hourly, minute-level, sleep, heart-rate, and weight records.
- Built a reproducible analysis workflow in **R / R Markdown** using `tidyverse`, `dplyr`, `lubridate`, and `ggplot2`.
- Combined daily activity, calorie, intensity, step, and sleep data using user IDs and standardized date fields.
- Found that **sedentary time accounted for 73.2%** of the analyzed daily activity distribution, while lightly active time accounted for **22.3%**.
- Observed a **0.41 correlation between daily steps and calories burned** in the analyzed merged data.
- Found no strong linear relationship between **sleep duration and total active minutes**, and only a weak relationship between **daily steps and sleep duration**.
- Translated analytical findings into marketing and product recommendations for activity reminders, personalized insights, sleep support, gamification, and targeted messaging.

---

## 🎯 Problem & Objectives

Bellabeat is a wellness technology company whose products combine health tracking with consumer-focused design.

The business task was to use smart-device behavior data to answer three questions:

1. **What trends appear in smart-device usage?**
2. **How might those trends apply to Bellabeat customers?**
3. **How could those insights influence Bellabeat’s marketing strategy?**

The analysis focused on activity, sedentary time, sleep, calorie expenditure, and daily behavioral patterns, with the goal of converting descriptive data into practical recommendations for the **Leaf** product.

Because the source data comes from Fitbit users rather than Bellabeat customers, the recommendations are treated as **directional hypotheses to validate**, not definitive claims about Bellabeat’s user base.

---

## 🔄 Analytical Workflow

```text
Fitbit CSV Files
       ↓
Data Inspection
       ↓
Date / Time Standardization
       ↓
Cleaning & Column Reconciliation
       ↓
Dataset Joins
       ↓
Exploratory Data Analysis
       ↓
Correlation & Behavioral Analysis
       ↓
Visualization
       ↓
Business Interpretation
       ↓
Marketing & Product Recommendations
```

---

## 📊 Data

The project uses the publicly available **Fitbit Fitness Tracker Data** dataset.

The source files include multiple levels of granularity:

| Data Area | Example Scale |
| --- | ---: |
| Daily activity | **940 rows** |
| Daily sleep | **413 rows** |
| Hourly activity datasets | **22,099 rows** each |
| Minute-level activity datasets | **1,325,580 rows** each |
| Heart-rate measurements | **2,483,658 rows** |
| Minute-level sleep | **188,521 rows** |
| Weight logs | **67 rows** |

The analysis loaded data covering:

- daily activity
- calories
- intensity
- steps
- sleep
- heart rate
- hourly activity
- minute-level activity
- METs
- weight logs

The final behavioral analysis primarily used merged daily activity and sleep information.

### Important Data Limitations

The dataset contains only **30 Fitbit users**, and not every metric is available for every participant.

Additional limitations include:

- Fitbit users are not necessarily representative of Bellabeat customers;
- the sample is too small for broad population-level generalization;
- weight data is particularly sparse;
- some measurements may be user-entered;
- the dataset represents a limited observation period;
- observed relationships are correlational rather than causal.

---

## 🔧 Data Preparation & Methodology

### Date and Time Standardization

The source files used several different date/time columns and formats.

I standardized daily dates with `as.Date()` and parsed higher-frequency timestamps with `lubridate::mdy_hms()`.

This was necessary before combining activity and sleep records reliably.

### Resolving Column Conflicts

Several daily datasets contained overlapping fields such as activity minutes, distance, and calories.

Before joining the data, I renamed intensity-related variables to prevent ambiguous column collisions and explicitly selected or removed duplicate fields after the joins.

### Joining Daily Activity & Sleep Data

Daily activity, calories, intensity, and steps were joined using:

```text
User ID + Activity Date
```

Sleep data was then joined to the daily activity dataset using:

```text
User ID + Sleep Date
```

During this process, the merged dataset no longer retained the original `ActivityDate` name. I added logic to identify the available date field and normalize it before deriving weekday information.

### Exploratory Analysis

The analysis used:

- descriptive statistics
- histograms
- boxplots
- scatter plots
- linear trend lines
- correlation analysis
- stacked activity distributions
- weekday comparisons

The goal was not to build a predictive model, but to understand user behavior and translate patterns into business recommendations.

---

## 🔍 Key Findings

### 1. Sedentary Behavior Dominated the Day

In the analyzed activity distribution:

- **Sedentary:** 73.2%
- **Lightly active:** 22.3%
- Moderate and very active time represented only small proportions.

This suggests that reducing prolonged sedentary behavior may be a more useful engagement opportunity than focusing only on high-intensity exercise.

### 2. Steps & Calories Were Positively Related

Daily steps and calories burned showed a positive relationship.

**Observed correlation:** `0.41`

Higher step counts generally corresponded with higher calorie expenditure, although substantial variability remained at similar step levels.

This indicates that calorie expenditure is influenced by more than step count alone, including activity intensity and individual differences.

### 3. Sleep Patterns Varied Widely

Sleep durations ranged from **under one hour to more than 13 hours** in the available records, with a substantial portion falling between approximately **5 and 10 hours**.

The wide variation supports the idea that sleep-related guidance should be personalized rather than based on a single generic pattern.

### 4. Sleep & Activity Did Not Show a Strong Linear Relationship

The analysis found **no strong linear relationship** between sleep duration and total daily active minutes.

Likewise, daily steps showed only a weak or possibly negligible relationship with sleep duration.

This means Bellabeat should avoid presenting increased physical activity as a direct or guaranteed solution for longer sleep.

### 5. More Steps Were Generally Associated with Less Sedentary Time

The analysis showed a **moderate negative relationship** between daily steps and sedentary minutes.

However, there was considerable variation: even some relatively active users still accumulated substantial sedentary time.

This supports tracking both **movement and inactivity**, rather than treating step count as a complete measure of daily behavior.

### 6. Activity Varied Across the Week

Visual analysis suggested potential differences in activity levels across weekdays and weekends.

The report appropriately notes that **statistical testing would be needed** before treating these visual differences as confirmed effects.

---

## 💼 Business Recommendations

The analysis led to several recommendations for Bellabeat’s Leaf product and marketing strategy.

### Reduce Sedentary Behavior

Position the Leaf as a tool that supports consistent movement throughout the day through:

- inactivity reminders;
- personalized movement prompts;
- progress tracking;
- challenges designed to break up long sedentary periods.

### Emphasize Holistic Wellness

Rather than marketing the Leaf only around step counts, emphasize a broader combination of:

- activity;
- sedentary time;
- sleep;
- calorie expenditure;
- wellness patterns.

### Personalize User Guidance

High variability across users suggests that generalized recommendations may be less effective than personalized insights.

Potential personalization includes:

- individual activity goals;
- tailored reminders;
- sleep recommendations;
- behavior-specific wellness prompts.

### Avoid Overstating the Activity–Sleep Relationship

Because the analysis did not show a strong relationship between steps and sleep duration, marketing should avoid implying that more steps will automatically improve sleep.

Sleep-related messaging should instead emphasize holistic sleep support, sleep hygiene, stress management, and personalized tracking.

### Use Gamification & Segmented Engagement

Potential engagement strategies include:

- activity challenges;
- social features;
- day-specific campaigns;
- personalized goals;
- differentiated messaging for users with different activity and sleep patterns.

These recommendations should be validated through **Bellabeat-specific user research and experimentation** before broad implementation.

---

## 🧩 Challenges & How I Addressed Them

| Challenge | How I Addressed It | What It Taught Me |
| --- | --- | --- |
| **Multiple datasets with different time fields** | Standardized dates and timestamps before joining records | Data integration depends on consistent keys and temporal formats |
| **Overlapping columns across daily datasets** | Renamed conflicting variables and explicitly selected the required fields | Join logic needs to be controlled rather than left to default suffixes |
| **Date field changed after joining sleep and activity data** | Added defensive logic to identify and normalize the available date column before weekday analysis | Data pipelines should validate schemas after transformations |
| **Small, non-Bellabeat sample** | Treated findings as directional and documented limitations | Business recommendations should reflect the strength of the evidence |
| **Correlation could be mistaken for causation** | Framed relationships as associations and avoided claiming direct behavioral effects | Analytical communication is as important as calculation |
| **Turning descriptive analysis into business value** | Connected findings to specific product, messaging, and engagement ideas | Data analysis becomes useful when insights are translated into testable decisions |

---

## 🛠️ Technical Stack

| Area | Technologies & Methods |
| --- | --- |
| **Programming** | R |
| **Data Manipulation** | Tidyverse, dplyr, tidyr, readr |
| **Date / Time Processing** | lubridate |
| **Visualization** | ggplot2 |
| **Analysis** | EDA, descriptive statistics, correlation analysis |
| **Data Engineering** | CSV ingestion, schema inspection, joins, reshaping, date normalization |
| **Reporting** | R Markdown |
| **Environment** | RStudio / Posit environment |

---

## ⚠️ Limitations & Critical Evaluation

This analysis has several limitations that affect how strongly the results can be generalized.

- **Small sample:** only 30 Fitbit users were included.
- **Different target population:** Fitbit users are not Bellabeat users.
- **Sparse measurements:** weight data contains very few records compared with activity data.
- **Different data availability:** sleep and other metrics are available for fewer user-days than daily activity.
- **Short observation window:** the dataset captures only a limited period of behavior.
- **No causal design:** correlations between activity, sleep, sedentary time, and calories do not establish causation.
- **Weekday/weekend findings are exploratory:** visual differences were not confirmed with formal significance testing.

For a real business decision, I would treat this project as **hypothesis generation** and validate the findings with Bellabeat-specific data.

---

## 🔄 Future Improvements

If I revisited this project today, I would:

- use Bellabeat first-party customer data where available;
- increase sample size and observation duration;
- quantify missingness and participant coverage more explicitly;
- separate analyses based on which users have complete activity and sleep data;
- use statistical tests for weekday/weekend differences;
- segment users by behavior rather than relying only on global averages;
- add confidence intervals and effect-size reporting;
- examine time-of-day behavior using the hourly datasets;
- investigate whether heart-rate and intensity data improve behavioral segmentation;
- build an interactive dashboard for marketing stakeholders;
- validate recommendations through **A/B testing** and user research.

---

## 🧠 What I Learned

This project strengthened my understanding of the connection between **data analysis and business decision-making**.

The most important lessons were:

- real datasets often require substantial cleaning and schema reconciliation before analysis;
- joins need to be validated carefully when several files contain overlapping measures;
- a statistically visible relationship does not automatically imply a causal relationship;
- small samples require cautious interpretation;
- analytical findings should be converted into **specific, testable business actions**;
- good recommendations should include a plan for validation, not just a narrative based on historical data.

The project also reinforced the value of communicating uncertainty clearly. Rather than treating Fitbit behavior as proof of how Bellabeat customers behave, the analysis is more appropriately used to identify **hypotheses for future customer research and experimentation**.

---

## 💬 Interview Quick Reference

| Question | Quick Answer |
| --- | --- |
| **What was the project?** | An R-based business analytics case study using Fitbit data to inform Bellabeat Leaf marketing and product strategy |
| **What was the business goal?** | Identify smart-device usage trends and translate them into actionable marketing recommendations |
| **Main tools?** | R, Tidyverse, dplyr, lubridate, ggplot2, R Markdown |
| **What data did you use?** | Public Fitbit data from 30 users covering activity, steps, calories, sleep, heart rate, and other wellness metrics |
| **Main finding?** | Sedentary time represented **73.2%** of the analyzed daily activity distribution |
| **Key correlation?** | Steps and calories showed an observed correlation of **0.41** |
| **Sleep finding?** | No strong linear relationship between sleep duration and total active minutes; steps also showed little relationship with sleep duration |
| **Biggest technical challenge?** | Combining multiple datasets with different date fields and overlapping columns |
| **How did you solve it?** | Standardized dates, renamed conflicting variables, controlled joins, and validated the resulting schema |
| **Biggest analytical limitation?** | Small Fitbit sample that is not directly representative of Bellabeat customers |
| **What business recommendations did you make?** | Movement reminders, personalized activity/sleep insights, holistic wellness positioning, gamification, and segmented messaging |
| **What would you improve today?** | Bellabeat first-party data, larger sample, statistical testing, behavioral segmentation, dashboarding, and A/B validation |
| **Main lesson?** | Strong business analytics requires both technical analysis and disciplined translation of evidence into testable decisions |

---

## 🎓 Project Context

This project was completed as the **capstone case study for the Google Data Analytics Professional Certificate**.

The Bellabeat case study follows a structured analytics process from defining the business task through data preparation, processing, analysis, communication, and action-oriented recommendations.

The project is retained in my portfolio because it demonstrates:

**R · Data Cleaning · Exploratory Data Analysis · Data Visualization · Business Analytics · Marketing Strategy · Data Communication**

---

## 👤 Author

**Gregory Charles**

Data Science · Machine Learning · Generative AI · Applied Software Development

[← Back to Main Projects Portfolio](../README.md)
