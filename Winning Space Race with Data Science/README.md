# 🚀 Falcon 9 First-Stage Landing Success Prediction

**Author:** Gregory Charles  
**Date:** December 19, 2024  
**Course:** IBM Data Science Professional Certificate  

---

## ✨ Executive Summary

SpaceX has revolutionized space exploration with its Falcon 9 reusable rockets, which significantly reduce launch costs. The ability to predict the success of Falcon 9 first-stage landings is crucial for enhancing the efficiency of these rockets. This project explores **machine learning** techniques to forecast landing outcomes, helping SpaceX optimize its launches.

### Key Highlights:
- **Data Collection**: Merged API data from SpaceX and web scraping for comprehensive launch details.
- **Data Analysis**: Applied advanced EDA to uncover patterns in success/failure outcomes.
- **Machine Learning**: Implemented multiple models (KNN, Logistic Regression, SVM, Decision Tree) to predict landing success.
- **Visualization**: Developed interactive maps and dashboards for deeper insight into landing trends.

**Top Finding:** The **K-Nearest Neighbors (KNN)** model achieved an impressive **83.3% accuracy**, making it the best performer in predicting landing success.

---

## 📖 Table of Contents

1. [Executive Summary](#✨-executive-summary)
2. [Introduction](#-introduction)
3. [Methodology](#-methodology)
   - [Data Collection](#data-collection)
   - [Data Wrangling](#data-wrangling)
   - [Exploratory Data Analysis](#exploratory-data-analysis)
   - [Interactive Visualization](#interactive-visualization)
   - [Machine Learning](#machine-learning)
4. [Results](#results)
5. [Conclusion](#conclusion)
6. [Appendix](#appendix)

---

## 🧑‍🚀 Introduction

### The SpaceX Advantage:
SpaceX has disrupted the space industry with its **reusable Falcon 9 rockets**, significantly reducing the cost of sending payloads to space. A key part of this strategy is the **successful landing of Falcon 9's first stage**, which allows SpaceX to reuse boosters, cutting down on operational expenses. In this project, we predict whether Falcon 9 first-stage landings will succeed based on various launch factors.

### Problem Statement:
How can we predict Falcon 9's first-stage landing success to improve cost-efficiency and help SpaceX stay ahead of its competitors?

---

## 🔧 Methodology

### Data Collection
To build a reliable prediction model, we collected and combined data from:
- **SpaceX API**: Provides launch details, including payload weight, landing status, and more.
- **Wikipedia Scraping**: Used **BeautifulSoup** to gather supplementary launch data from Wikipedia.
- **Data Processing**: Cleaned and structured the data for further analysis.

### Data Wrangling
- **One-Hot Encoding**: Converted categorical data (e.g., launch site, orbit type) into numerical values.
- **Handling Missing Values**: Cleaned incomplete or irrelevant rows for consistency and accuracy.

### Exploratory Data Analysis (EDA)
- **Visual Exploration**: Created plots to reveal key relationships between features like payload weight, launch site, and orbit type with landing success.
- **SQL Insights**: Executed SQL queries to gather key metrics, like average payload mass and landing success rates by site.

### Interactive Visualization
- **Folium Maps**: Developed interactive maps that visualize launch sites and their associated landing successes.
- **Plotly Dashboards**: Designed an interactive dashboard to explore landing success by payload, launch site, and orbit type.

### Machine Learning
- **Model Selection**: Tried four classification models: **Logistic Regression**, **SVM**, **Decision Tree**, and **KNN**.
- **Hyperparameter Tuning**: Used **Grid Search** to find optimal parameters for each model.
- **Evaluation**: Compared models based on their **accuracy**, **confusion matrices**, and overall performance.

---

## 📊 Results

### Key Findings:
- **Launch Site Success Rates**: **KSC LC-39A** emerged as the top performer in terms of landing success, while **VAFB-SLC** struggled with heavier payloads.
- **Payload Weight**: Heavier payloads generally had a higher probability of landing success, indicating a complex relationship between payload and landing outcomes.
- **Orbit Type**: Launches to **LEO** and **GEO** orbits had the highest success rates, while **GTO** orbits exhibited mixed results.

### Best-Performing Model
The **K-Nearest Neighbors (KNN)** model outperformed others with an **accuracy of 83.3%**, making it the best choice for predicting landing success. 

---

## 🏁 Conclusion

### Key Insights:
- **Flight Volume Correlation**: Launch sites with more flight history (e.g., KSC LC-39A) showed higher landing success rates.
- **Time-Based Improvement**: Falcon 9’s landing success rates have improved consistently over the years, reflecting advancements in technology and learning.
- **Payload Impact**: Lighter payloads tend to correlate with success, but the payload itself is not the sole determinant of landing outcomes.
- **Launch Site Performance**: KSC LC-39A stands out as the most successful site, which can be attributed to its operational maturity and location factors.

### Actionable Takeaways:
- SpaceX can focus on optimizing its landing strategies for specific payload categories and launch sites.
- Understanding the relationship between orbit types and landing success can guide future mission planning.

---

## 📂 Appendix

- **GitHub Repository**: [View the code and notebooks on GitHub](https://github.com/your-repository).
- **Data Sources**: SpaceX API, Wikipedia.
- **Libraries Used**: Pandas, Matplotlib, Seaborn, Scikit-learn, Plotly, Folium, BeautifulSoup.

---

## 💡 Future Work
- **Real-time Prediction**: Integrating live data to make real-time landing success predictions.
- **Advanced Models**: Exploring deep learning techniques like neural networks for even more accurate predictions.
- **Broader Dataset**: Expanding the dataset to include other private space companies and comparing their landing success.

---

### Special Thanks:
- **IBM Coursera** for providing the tools and learning environment for this analysis.
- **SpaceX** for their trailblazing work in space exploration.

---
