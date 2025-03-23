# Olympic Dataset Analysis for SportsStats

## Project Overview

This project analyzes the Olympic Games dataset, spanning 120 years of data, to provide actionable insights for SportsStats. It explores athlete demographics, medal distribution, and gender representation, uncovering meaningful patterns and trends.

## Table of Contents

- [Project Overview](#project-overview)
- [Project Proposal](#project-proposal)
  - [Questions to Answer](#questions-to-answer)
  - [Initial Hypotheses](#initial-hypotheses)
  - [Analysis Approach](#analysis-approach)
- [Project Setup](#project-setup)
  - [Dataset Selection](#1-dataset-selection)
  - [Data Import and Cleaning](#2-data-import-and-cleaning)
  - [Initial Exploration](#3-initial-exploration)
  - [Proposed ERD](#4-proposed-erd)
- [Data Import and Cleaning Code](#data-import-and-cleaning-code)
- [Data Visualization and Analysis](#data-visualization-and-analysis)
    - [Top Gold Medal Sports by Country](#top-gold-medal-sports-by-country)
    - [3D Visualization of Athlete Attributes](#3d-visualization-of-athlete-attributes)
    - [Predicted Medal Count Correlations](#predicted-medal-count-correlations)
    - [Athlete Profile Analysis](#athlete-profile-analysis)
- [Conclusion](#conclusion)

## Project Proposal

### Questions to Answer

1.  How has gender representation evolved in the Olympics over the decades?
2.  What is the age distribution of medal-winning athletes, and are there gender-specific trends?
3.  Which sports or events exhibit significant gender disparities?
4.  How have athlete demographics (age, height, weight) changed over time?
5.  Is there a correlation between a country's BMI and its medal count?
6.  Can we predict medal counts or medal types based on athlete attributes?
7.  What are the optimal athlete profiles for medal performance?

### Initial Hypotheses

1.  **Gender Representation:** Gender representation has improved significantly in recent decades.
2.  **Age and Medals:** Athletes in their 20s are most likely to win Olympic medals, with distinct trends for males and females.
3.  **Gender Disparity in Sports:** Certain sports or events are predominantly male or female, with a significant gender disparity in participation and achievement.
4.  **Evolution of Athlete Demographics:** Athlete demographics (age, height, weight) have evolved over time due to advancements in sports science.
5.  **BMI and Medal Count:** Countries with a better BMI (Body Mass Index) tend to win more medals, suggesting a possible correlation between physical size and athletic success.
6.  **Predictive Modeling:** Athlete attributes can be used to predict medal counts and medal types.
7.  **Optimal Athlete Profiles:** Correlations exist between age, height, weight, and medal performance.

### Analysis Approach

1.  **Gender Representation:**
    * Group athletes by decade and gender.
    * Calculate and visualize the proportion of male and female athletes over time using stacked area charts.
    * Separate summer and winter olympics.
    * Plot male and female participation by year in Summer and Winter Olympics.

2.  **Age and Medals:**
    * Analyze the age distribution of medal-winning athletes.
    * Compare age trends between male and female athletes using histograms and box plots.

3.  **Gender Disparity in Sports:**
    * Identify sports or events with significant gender disparities using bar charts and pie charts.
    * Calculate the percentage of male and female participants in each sport.

4.  **Evolution of Athlete Demographics:**
    * Analyze trends in age, height, and weight over time using line plots.
    * Investigate the impact of sports science advancements on athlete demographics.

5.  **BMI and Medal Count:**
    * Calculate the BMI for each athlete.
    * Aggregate medal counts by country.
    * Analyze the correlation between average BMI and medal counts using scatter plots and correlation coefficients.
    * Visualize top 20 countries by medal count and gold medal count.
    * Visualize medal distribution across different sports for top countries.
    * Compare average BMI and height in specific sports across countries.

6.  **Predictive Modeling:**
    * Use Linear Regression to predict medal counts based on athlete attributes.
    * Use Random Forest Classifier to predict medal types based on athlete attributes.
    * Evaluate model performance using Mean Squared Error, Classification Report, and Confusion Matrix.

7.  **Optimal Athlete Profiles:**
    * Visualize relationships between athlete attributes and medal distribution using pair plots.
    * Identify correlations between age, height, weight, and medal performance.

## Project Setup

### 1. Dataset Selection

* **Dataset:** Olympics Dataset (120 years of data).
* **Reason:** This dataset is ideal for practicing data science skills due to its comprehensive nature, big data characteristics, real-world relevance, machine learning potential, and data visualization opportunities.

### 2. Data Import and Cleaning

* Imported the dataset using pandas.
* Handled missing values for Age, Height, and Weight using imputation techniques.
* Merged the athlete and NOC datasets to resolve inconsistencies.
* Removed duplicate entries.
* Previewed the cleaned data.

### 3. Initial Exploration

* Calculated descriptive statistics for Age, Height, and Weight.
* Visualized missing data using heatmaps.
* Displayed the cleaned data using pandas dataframes.

### 4. Proposed ERD
* Athlete (ID, Name, Age, Sex, Height, Weight)
* Event (Event, Sport, Year, Season, City, NOC, Medal)
* Team (Team, NOC, Region)

## Data Visualization and Analysis

### Top Gold Medal Sports by Country

This visualization showcases the top sports where each country has won the most gold medals, excluding team event multiplicity.

![Top Gold Medal Sports by Country](![image](https://github.com/user-attachments/assets/517d8845-c942-464f-98bb-5f0cff95d148)
)  *(Replace `your_image_path/top_gold_medals_by_country.png` with the actual path or URL to your image)*

### 3D Visualization of Athlete Attributes

This 3D plot visualizes the average age, height, and weight of athletes, colored by sex, across various sports.

![3D Visualization of Athlete Attributes](your_image_path/3d_athlete_attributes.png)  *(Replace `your_image_path/3d_athlete_attributes.png` with the actual path or URL to your image)*

### Predicted Medal Count Correlations

This heatmap displays the correlation between predicted medal counts (Gold, Silver, Bronze), providing insights into how the model distributes medals.

![Predicted Medal Count Correlations](your_image_path/medal_count_correlations.png)  *(Replace `your_image_path/medal_count_correlations.png` with the actual path or URL to your image)*

### Athlete Profile Analysis

The analysis explores the relationship between age, height, and weight across male and female athletes in various sports, highlighting athletic profiles and performance insights.

**Athletic Profiles:**

* **Basketball, Beach Volleyball, Water Polo (Male):** Taller and heavier athletes.
* **Endurance Sports (Biathlon, Aeronautics, Female):** Shorter, leaner athletes.
* **Weightlifting and Wrestling (Male):** Shorter, heavier athletes.
* **Power and Agility Sports (Female):** Higher average heights and weights.
* **Precision and Longevity Sports (Archery, Art Competitions, Male and Female):** Older athletes.

**Age Trends:**

* **Intensive Physical Demands (Bobsleigh, Alpine Skiing, Wrestling, Weightlifting, Male):** Athletes peak in late 20s to early 30s.
* **Water Polo (Male):** Athletes in mid-20s.
* **Precision and Longevity Sports (Male and Female):** Older athletes.

**Performance Insights:**

* **Strength and Stamina Sports (Basketball, Baseball, Beach Volleyball, Wrestling, Male):** Consistent height and weight patterns.
* **Water Polo (Male):** Robust athletic profiles.
* **Weightlifting (Male):** High weight averages.
* **Endurance Sports (Female):** Optimized physical attributes.

**Notable Observations:**

* Statistical outliers in precision sports.
* Dynamic profiles in Water Polo and Wrestling.
* Diverse physical demands in female sports.

## Conclusion

This project provides a comprehensive analysis of the Olympic dataset, revealing valuable insights into athlete demographics, medal distribution, and gender representation. The visualizations and analyses offer actionable information for SportsStats, including optimal athlete profiles and trends in medal counts.
