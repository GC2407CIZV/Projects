# 💼 Gregory Charles - Data Science, Machine Learning, & Software Portfolio

Welcome to my project portfolio repository!

This collection showcases my proficiency in full-stack AI development, deep learning, statistical analysis, and predictive modeling, utilizing Python, R, and foundational web frameworks like Flask. The projects emphasize turning complex data challenges into actionable business insights and deployable applications.

## 🔎 Quick Project Index

Use this table to quickly navigate to the project most relevant to your interests:

| Category | Project Name | Core Technology | Key Achievement | 
 | ----- | ----- | ----- | ----- | 
| **Predictive Modeling** | [**Falcon 9 Landing Success Prediction**](https://github.com/GC2407CIZV/Projects/tree/main/Winning%20Space%20Race%20with%20Data%20Science) | **Predictive ML, Web Scraping, MLOps Principles** | Achieved **83.3% accuracy** with KNN model for predicting rocket landing outcomes. | 
| **Predictive Modeling** | [**ExtraaLearn Lead Conversion Prediction**](https://github.com/GC2407CIZV/Projects/tree/main/Lead%20Conversion%20Prediction%20ML) | **XGBoost, Lead Scoring, Feature Engineering** | Built a Lead Scoring System, achieving **ROC AUC 0.931** to optimize sales. | 
| **Predictive Modeling** | [**NYC Housing Price Prediction**](https://github.com/GC2407CIZV/Projects/tree/main/Predicting%20New%20York%20City%20Housing%20Prices%3A%20Addressing%20Real-World%20Challenges) | **Ensemble ML (RF/GB), Geo-Spatial Analysis** | Non-linear models outperformed linear ones, capturing complex **NYC price drivers**. | 
| **Predictive Modeling** | [**Salifort Motors Turnover Prediction**](https://github.com/GC2407CIZV/Projects/tree/main/Salifort%20Motors%20Employee%20Turnover%20Analysis) | **HR/Business ML, A/B Testing, XGBoost** | Identified key turnover factors (satisfaction, workload) and proposed HR interventions. | 
| **Predictive Modeling** | [**Bicycle Rental Demand Prediction**](https://github.com/GC2407CIZV/Projects/tree/main/Bicycle%20Rental%20Demand%20Prediction%20Project) | **Time Series ML, Forecasting, Feature Engineering** | Improved prediction accuracy by incorporating temporal features (e.g., last week's average). | 
| **Specialized AI/RecSys** | [**Amazon Product Recommendation Engine**](https://github.com/GC2407CIZV/Projects/tree/main/Amazon%20Product%20Recommendation%20Engine) | **Recommendation Systems (SVD), Collaborative Filtering** | Achieved **RMSE of 0.8808** via optimized SVD on 7.8M ratings data. | 
| **Specialized AI/RecSys** | [**VisionScribe**](https://github.com/GC2407CIZV/Projects/tree/main/VisionScribe) | **Deep Learning / Computer Vision (BLIP), Gradio** | Integrated web application for image captioning, batch processing, and web scraping. | 
| **Specialized AI/RecSys** | [**AI-Based Emotion Detection App**](https://github.com/GC2407CIZV/Projects/tree/main/AI-Based%20Emotion%20Detection%20Web%20Application) | **NLP (Watson), Full-Stack AI, Flask** | Full-stack AI application deployment with modular packaging and unit testing. | 
| **Business Analytics** | [**Customer Personality Segmentation**](https://github.com/GC2407CIZV/Projects/tree/main/Customer%20Personality%20Segmentation) | **Unsupervised ML (K-Means), PCA, Segmentation** | Identified 3 distinct customer segments for personalized marketing strategies. | 
| **Business Analytics** | [**Bellabeat Smart Device Usage Analysis**](https://github.com/GC2407CIZV/Projects/tree/main/Bellabeat%20Smart%20Strategy%3A%20Leveraging%20Smart%20Device%20Data%20for%20Growth) | **R, Business Analytics, Data Storytelling** | Delivered data-driven marketing recommendations based on fitness data trends. | 
| **EDA & Visualization** | [**Olympic Dataset Analysis**](https://github.com/GC2407CIZV/Projects/tree/main/Olympic%20Dataset%20Analysis%20for%20SportsStats) | **Advanced EDA, Sports Analytics, Visualization** | Uncovered historical trends and identified **Optimal Athlete Profiles** for success. | 
| **EDA & Visualization** | [**Heart Disease Risk Visualization**](https://github.com/GC2407CIZV/Projects/tree/main/The%20Heart's%20Story%3A%20What%20Influences%20Failure%20and%20Disease%3F)| **Tableau, Data Storytelling, Public Health** | Data story with Interactive Risk Calculator for public health communication. | 
| **Full-Stack Development** | [**Quacktastic Conundrum (Flask Game)**](https://github.com/GC2407CIZV/Projects/tree/main/Quactastic%20Conundrum) | **Full-Stack Development, Flask/SQLite, Security** | Full-stack web game development with robust security and database integration. | 

## 💻 Technical Skills Overview

| Area | Technologies & Tools | 
 | ----- | ----- | 
| **Programming Languages** | Python (Pandas, NumPy, Scikit-learn, Transformers), R (Tidyverse, ggplot2) | 
| **Machine Learning** | **XGBoost, Deep Learning (BLIP), NLP (Watson)**, SVD, KNN, Ensemble Methods, K-Means | 
| **Web & Deployment** | Flask, Gradio, Requests, BeautifulSoup, Unit Testing, Geopandas, Folium, Plotly | 
| **Version Control** | Git | 

---

## 💡 Project Details

### Predictive Modeling & Time Series

### 1. Falcon 9 First-Stage Landing Success Prediction (Predictive ML)

A project exploring **machine learning** techniques to forecast the successful landing of the reusable Falcon 9 rocket's first stage, a process critical to SpaceX's cost-efficiency.

* **Problem:** Accurately predicting the outcome of Falcon 9 landings is essential for optimizing launches and improving the rocket's reusability.

* **Solution:** Combined launch data from the **SpaceX API** and **Wikipedia (using BeautifulSoup)**. After performing **EDA** and **One-Hot Encoding**, trained and tuned four classification models (**KNN, SVM, Decision Tree, Logistic Regression**) using **Grid Search**, demonstrating **MLOps principles** in data acquisition.

* **Key Technologies:** `Python`, **KNN**, **Grid Search**, **Web Scraping**, **Folium** (Interactive Maps), **Plotly** (Dashboards).
* **Repository:** [View Project Code](https://github.com/gcharles/falcon-9-prediction)

* **Achievement:** The **K-Nearest Neighbors (KNN)** model proved most effective, achieving an **83.3% accuracy** in predicting landing success.

### 2. ExtraaLearn Lead Conversion Prediction ML (Predictive Modeling)

An end-to-end **Machine Learning** solution designed to build a robust **Lead Scoring System** for the EdTech institution, ExtraaLearn.

* **Problem:** ExtraaLearn needed to prioritize leads effectively due to limited resources in a growing EdTech market, shifting from a high-volume to a **targeted, data-driven approach**.

* **Solution:** Built and tuned advanced Ensemble ML models (**XGBoost**, **AdaBoost**) to predict the probability of lead conversion. This involved extensive **feature engineering**, handling skewness (`np.log1p`), and specialized evaluation metrics (**ROC AUC**, F1-Score) to ensure high business value.

* **Key Technologies:** `Python`, **XGBoost**, **AdaBoost**, `Scikit-learn`, `Pandas` (Feature Engineering, Log Transformation).
* **Repository:** [View Project Code](https://github.com/gcharles/extraalearn-lead-conversion)

* **Achievement:** Achieved a peak **ROC AUC of 0.931** (Tuned XGBoost), providing the business with **actionable insights** that led to a projected **5-10% increase** in the overall conversion rate.

### 3. NYC Housing Price Prediction Project (Real Estate ML)

A project to predict housing prices in New York City, demonstrating expertise in regression modeling and handling complex urban data.

* **Problem:** Accurately predict NYC housing prices, which involves complex, non-linear relationships and significant geographical variability across boroughs.

* **Solution:** Employed rigorous data preparation and trained multiple regression models. Non-linear **Ensemble ML** methods (**Random Forest** and **Gradient Boosting**) were essential for capturing price drivers, complemented by **Geo-Spatial Analysis**.

* **Key Technologies:** `Python`, **Random Forest Regressor**, **Geopandas**, `Scikit-learn`.
* **Repository:** [View Project Code](https://github.com/gcharles/nyc-housing-prediction)

* **Achievement:** The Random Forest Regressor achieved the best performance with an RMSE of approximately **\$1.2 million**, confirming location (**Manhattan**) and property square footage are the most critical price drivers.

### 4. Salifort Motors Employee Turnover Prediction Project (HR Analytics)

Analysis and **predictive modeling** for employee turnover at Salifort Motors to improve retention strategies.

* **Problem:** The HR department was concerned about high employee turnover and needed to understand the key factors contributing to employees leaving the company.

* **Solution:** Used the **PACE methodology** to perform EDA, build high-performing **Ensemble ML models** (**XGBoost**, **Random Forest**), and conduct **simulated A/B testing** on HR interventions.

* **Key Technologies:** `Python`, **XGBoost**, **Random Forest**, **PACE Methodology**, **A/B Testing**.
* **Repository:** [View Project Code](https://github.com/gcharles/salifort-turnover-prediction)

* **Achievement:** Developed a highly performant **XGBoost model** for proactive risk identification and delivered actionable recommendations focusing on improving employee satisfaction and managing workload/compensation disparity.

### 5. Bicycle Rental Demand Prediction Project (Time Series/ML)

A project focused on building a **predictive model** to forecast daily demand for bicycle rentals based on time and weather factors.

* **Problem:** Forecasting rental demand accurately to optimize inventory and staffing, leveraging historical data and environmental features.

* **Solution:** Developed and evaluated multiple **Linear Regression models**, focusing heavily on **feature engineering** to capture temporal patterns. This demonstrates core **Time Series ML** principles.

* **Key Technologies:** `Python`, **Scikit-learn** (Linear Regression), **Pandas**, \*\*Matplotlib\`.
* **Repository:** [View Project Code](https://github.com/gcharles/bicycle-demand-prediction)

* **Achievement:** Demonstrated the critical importance of feature engineering by incorporating the **'last week's average rental count'** feature, which significantly reduced the model's Root Mean Squared Error (RMSE).

---

### Specialized AI & Recommendation Systems

### 6. Amazon Product Recommendation Engine: SVD & Collaborative Filtering (Recommendation Systems)

Development and optimization of a scalable **Recommendation System** using a massive dataset of Amazon product reviews.

* **Problem:** Building an accurate and scalable system to predict user ratings and provide personalized product recommendations.

* **Solution:** Processed **7.8 million ratings** and implemented three models (Rank-Based, **Collaborative Filtering**, and **SVD** - Matrix Factorization), using **hyperparameter tuning** to maximize performance.

* **Key Technologies:** `Python`, **SVD** (Matrix Factorization), **Collaborative Filtering**, `Surprise`.
* **Repository:** [View Project Code](https://github.com/gcharles/amazon-recommendation-engine)

* **Achievement:** The **Optimized SVD model** achieved superior accuracy with the lowest **RMSE of 0.8808**, making it the recommended choice for production deployment.

### 7. VisionScribe (Computer Vision & Automation)

A Python toolkit designed for generating descriptive captions for images using state-of-the-art Hugging Face **Deep Learning models** (BLIP and BLIP-2).

* **Problem:** The need for automated, high-quality image descriptions from various sources (local files, large directories, and web pages).

* **Solution:** Built a suite of scripts, including a **Gradio web application**, that utilizes the **BLIP/BLIP-2 Computer Vision models** to upload single images, batch process directories, or scrape images for instant captioning.

* **Key Technologies:** `Python`, `Hugging Face Transformers` (**Deep Learning / Computer Vision**), **Gradio**, `BeautifulSoup` (for web scraping).
* **Repository:** [View Project Code](https://github.com/gcharles/visionscribe-captioning-toolkit)

* **Achievement:** Created a **unified, deployable interface** demonstrating competence in bridging **ML models** with user-friendly web interfaces.

### 8. Capstone Project: AI-Based Emotion Detection Web Application (Applied AI/Web)

A full-stack web application demonstrating the entire development pipeline for a deployed **AI service**.

* **Problem:** Creating a deployable, end-to-end AI application that demonstrates proficiency in Flask, unit testing, and external API integration.

* **Solution:** Developed a web server using **Flask** to handle user text input and integrate with the **Watson NLP** (Natural Language Processing) service to detect emotions (joy, sadness, anger, fear, disgust).

* **Key Technologies:** `Python`, **Flask**, **Watson NLP**, `unittest` (for testing core logic), Modular Architecture.
* **Repository:** [View Project Code](https://github.com/gcharles/emotion-detection-app)

* **Achievement:** Successfully completed the entire **development and deployment pipeline**, including modular code packaging and comprehensive unit testing, proving capability in **Full-Stack AI** development.

---

### Business & Customer Analytics

### 9. Customer Personality Segmentation (Customer Analytics)

An **unsupervised machine learning** project to segment a retail company's customer base for targeted marketing.

* **Problem:** Moving beyond generic marketing by identifying distinct customer personality segments based on demographics and spending habits.

* **Solution:** Utilized a data science pipeline involving extensive data cleaning, **feature engineering**, and **K-Means clustering** (K=3) to define distinct customer profiles, supported by **PCA** (Principal Component Analysis).

* **Key Technologies:** `Python`, **Scikit-learn** (**K-Means**, **PCA**, StandardScaler), **Pandas**, \*\*Seaborn\`.
* **Repository:** [View Project Code](https://github.com/gcharles/customer-personality-segmentation)

* **Achievement:** Identified **three actionable segments** and provided tailored business recommendations for retention and sales optimization.

### 10. Bellabeat Smart Device Usage Analysis (Business Analytics)

A data-driven case study using public fitness tracker data to inform the marketing strategy for the Bellabeat "Leaf" product.

* **Problem:** Providing actionable, data-backed marketing and product positioning recommendations for the Bellabeat Leaf in the competitive wellness tech market.

* **Solution:** Performed comprehensive **Exploratory Data Analysis (EDA)** on Fitbit data (activity, sleep, calories) using the **R Tidyverse** ecosystem, focusing on fitness and sleep trends.

* **Key Technologies:** **R**, **Tidyverse** (`dplyr`, `ggplot2`), `R Markdown`.
* **Repository:** [View Project Code](https://github.com/gcharles/bellabeat-analysis)

* **Achievement:** Delivered strategic marketing recommendations (e.g., targeting sedentary behavior, weekend promotions) based on quantifiable user trends, showcasing strong **business acumen and data communication** skills.

---

### Exploratory Data Analysis & Visualization

### 11. Olympic Dataset Analysis for SportsStats (Data Analysis & Predictive Modeling)

A comprehensive analysis of 120 years of Olympic Games data to extract meaningful trends and identify factors influencing athletic success.

* **Problem:** SportsStats needed historical trends and predictive factors from the Olympic Games dataset to inform athlete training, recruitment, and performance optimization strategies.

* **Solution:** Conducted extensive **Exploratory Data Analysis (EDA)** on athlete demographics and medal distribution. Used **Predictive Modeling** (Linear Regression, Random Forest) to test hypotheses on medal success factors.

* **Key Technologies:** `Python`, `Pandas` (Cleaning/Imputation), `Matplotlib/Seaborn` (**Visualization**), `Scikit-learn` (Predictive Modeling).
* **Repository:** [View Project Code](https://github.com/gcharles/olympic-dataset-analysis)

* **Achievement:** Uncovered specific **"Optimal Athlete Profiles"** across various sports, providing data-driven insights to guide strategic sports decision-making.

### 12. Visualizing Heart Disease and Heart Failure Risk Factors (Tableau Data Story) (Data Analysis)

An accessible and informative **Tableau data story** designed for a general audience to promote understanding of heart health.

* **Problem:** Communicating complex health risk data (heart disease/failure) to a non-technical audience in an engaging and accessible format.

* **Solution:** Created a multi-frame narrative data story in **Tableau**, exploring key risk factors (age, BMI, cholesterol, etc.). Designed an **Interactive Risk Calculator** within the dashboard for personalized risk assessment.

* **Key Technologies:** **Tableau Public**, **Data Storytelling**.
* **Repository:** [View Project Code](https://github.com/gcharles/heart-disease-visualization)

* **Achievement:** Developed an effective **data communication** artifact, demonstrating expertise in visualization for public health and business insight delivery.

---

### Full-Stack Application Development

### 13. Quacktastic Conundrum (Flask Web Game) (Applied AI/Web)

A hilarious and thrilling mystery game, a blend of adventure and digital sleuthing, built on **Flask** with robust **security** features.

* **Problem:** To design and implement a secure, multi-featured web game that showcases full-stack development skills, including user authentication and database management.

* **Solution:** Developed a web game focused on mystery and adventure. Integrated user registration, secure sessions, and an **SQLite Database**. Used security libraries like **Bleach** for input sanitization, demonstrating competence in **web security**.

* **Key Technologies:** **Full-Stack Development**, **Flask**, **SQLite**, **Werkzeug**, **Bleach**.
* **Repository:** [View Project Code](https://github.com/gcharles/quacktastic-conundrum)

* **Achievement:** Successfully deployed a **full-stack web application** demonstrating competence in web security, database integration, and complex application flow.

## 📧 Contact

**Name:** Gregory Charles
**Email:** gregory.charles01@gmail.com
**LinkedIn:** <https://www.linkedin.com/in/gregory-charles-7a460550/>
