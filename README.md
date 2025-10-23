# 💼 Gregory Charles - Data Science, Machine Learning, & Software Portfolio

| Location | Status | Resume | 
 | :---: | :---: | :---: | 
| 📍 Japan / Greater Toronto Area | 🟢 Available for Full-Time Roles | [Download CV (PDF)](./Gregory_Charles_CV.pdf) | 

Welcome to my project portfolio repository!

This collection showcases my proficiency in full-stack AI development, deep learning, statistical analysis, and predictive modeling, utilizing Python, R, and foundational web frameworks like Flask. The projects emphasize turning complex data challenges into actionable business insights and deployable applications.

## 🔎 Quick Project Index

This index is designed to help you quickly identify projects relevant to specific industries.
**DS Tier 1** projects are my most complex, high-value, and production-ready examples of Machine Learning and AI.

| DS Tier | Sector | Project Name | Core Technology | **App/Demo Link** | Key Achievement | 
 | :---: | :---: | ----- | ----- | :---: | ----- | 
| **Tier 1** | **Retail/eCommerce** | [**Amazon Product Recommendation Engine**](https://github.com/GC2407CIZV/Projects/tree/main/Amazon%20Product%20Recommendation%20Engine) | **Recommendation Systems (SVD), Collaborative Filtering** | [Jupyter Notebook](#) | Achieved **RMSE of 0.8808** via optimized SVD on 7.8M ratings data. | 
| **Tier 1** | **NLP/Web Dev** | [**AI-Based Emotion Detection App**](https://github.com/GC2407CIZV/Projects/tree/main/AI-Based%20Emotion%20Detection%20Web%20Application) | **NLP (Watson), Full-Stack AI, Flask** | [Flask Web App](#) | Full-stack AI application deployment with modular packaging and unit testing. | 
| **Tier 1** | **Sales/Marketing** | [**ExtraaLearn Lead Conversion Prediction**](https://github.com/GC2407CIZV/Projects/tree/main/Lead%20Conversion%20Prediction%20ML) | **XGBoost, Lead Scoring, Feature Engineering** | [Flask Web App](#) | Built a Lead Scoring System, achieving **ROC AUC 0.931** to optimize sales. | 
| **Tier 1** | **Space/MLOps** | [**Falcon 9 Landing Success Prediction**](https://github.com/GC2407CIZV/Projects/tree/main/Winning%20Space%20Race%20with%20Data%20Science) | **Predictive ML, Web Scraping, MLOps Principles** | [Plotly Dashboard](#) | Achieved **83.3% accuracy** with KNN model for predicting rocket landing outcomes. | 
| **Tier 2** | **HR/Workforce** | [**Salifort Motors Turnover Prediction**](https://github.com/GC2407CIZV/Projects/tree/main/Salifort%20Motors%20Employee%20Turnover%20Analysis) | **HR/Business ML, A/B Testing, XGBoost** | [Jupyter Notebook](#) | Identified key turnover factors (satisfaction, workload) and proposed HR interventions. | 
| **Tier 2** | **Marketing** | [**Customer Personality Segmentation**](https://github.com/GC2407CIZV/Projects/tree/main/Customer%20Personality%20Segmentation) | **Unsupervised ML (K-Means), PCA, Segmentation** | [Tableau Dashboard](#) | Identified 3 distinct customer segments for personalized marketing strategies. | 
| **Tier 2** | **Real Estate/Geo** | [**NYC Housing Price Prediction**](https://github.com/GC2407CIZV/Projects/tree/main/Predicting%20New%20York%20City%20Housing%20Prices%3A%20Addressing%20Real-World%20Challenges) | **Ensemble ML (RF/GB), Geo-Spatial Analysis** | [Interactive Map](#) | Non-linear models outperformed linear ones, capturing complex **NYC price drivers**. | 
| **Tier 2** | **Computer Vision** | [**VisionScribe**](https://github.com/GC2407CIZV/Projects/tree/main/VisionScribe) | **Deep Learning / Computer Vision (BLIP), Gradio** | [Gradio App](#) | Integrated web application for image captioning, batch processing, and web scraping. | 
| **Tier 3** | **Public Health** | [**Heart Disease Risk Visualization**](https://github.com/GC2407CIZV/Projects/tree/main/The%20Heart's%20Story%3A%20What%20Influences%20Failure%20and%20Disease%3F) | **Tableau, Data Storytelling, Public Health** | [Tableau Public Link](#) | Data story with Interactive Risk Calculator for public health communication. | 
| **Tier 3** | **Transportation** | [**Bicycle Rental Demand Prediction**](https://github.com/GC2407CIZV/Projects/tree/main/Bicycle%20Rental%20Demand%20Prediction%20Project) | **Time Series ML, Forecasting, Feature Engineering** | [Jupyter Notebook](#) | Improved prediction accuracy by incorporating temporal features (e.g., last week's average). | 
| **Tier 3** | **Fitness/Wellness** | [**Bellabeat Smart Device Usage Analysis**](https://github.com/GC2407CIZV/Projects/tree/main/Bellabeat%20Smart%20Strategy%3A%20Leveraging%20Smart%20Device%20Data%20for%20Growth) | **R, Business Analytics, Data Storytelling** | [R Markdown Report](#) | Delivered data-driven marketing recommendations based on fitness data trends. | 
| **Tier 3** | **Sports Analytics** | [**Olympic Dataset Analysis**](https://github.com/GC2407CIZV/Projects/tree/main/Olympic%20Dataset%20Analysis%20for%20SportsStats) | **Advanced EDA, Sports Analytics, Visualization** | [Jupyter Notebook](#) | Uncovered historical trends and identified **Optimal Athlete Profiles** for success. | 
| **N/A** | **Full-Stack** | [**Quacktastic Conundrum (Flask Game)**](https://github.com/GC2407CIZV/Projects/tree/main/Quactastic%20Conundrum) | **Full-Stack Development, Flask/SQLite, Security** | [YouTube Demo](https://www.youtube.com/watch?v=dQw4w9WgXcQ) | Full-stack web game development with robust security and database integration. | 

## 💻 Technical Skills Overview

| Area | Technologies & Tools | 
 | ----- | ----- | 
| **Programming Languages** | Python (Pandas, NumPy, Scikit-learn, Transformers), R (Tidyverse, ggplot2) | 
| **Machine Learning** | **XGBoost, Deep Learning (BLIP), NLP (Watson)**, SVD, KNN, Ensemble Methods, K-Means | 
| **Web & Deployment** | Flask, Gradio, Requests, BeautifulSoup, Unit Testing, Geopandas, Folium, Plotly | 
| **Version Control** | Git | 

## 💡 Project Details

### Predictive Modeling & Time Series

### 1. Falcon 9 First-Stage Landing Success Prediction (Predictive ML)

*(DS Tier: Tier 1 | Sector: Space/MLOps)*

* **Core Metrics:** Accuracy, F1-Score, ROC AUC

A project exploring **machine learning** techniques to forecast the successful landing of the reusable Falcon 9 rocket's first stage, a process critical to SpaceX's cost-efficiency.

* **Problem:** Accurately predicting the outcome of Falcon 9 landings is essential for optimizing launches and improving the rocket's reusability.

* **Solution:** Combined launch data from the **SpaceX API** and **Wikipedia (using BeautifulSoup)**. After performing **EDA** and **One-Hot Encoding**, trained and tuned four classification models (**KNN, SVM, Decision Tree, Logistic Regression**) using **Grid Search**, demonstrating **MLOps principles** in data acquisition.

* **Key Technologies:** `Python`, **KNN**, **Grid Search**, **Web Scraping**, **Folium** (Interactive Maps), **Plotly** (Dashboards).

* **App/Demo Link:** [Plotly Dashboard](#)

* **Repository:** [View Repository](https://github.com/GC2407CIZV/Projects/tree/main/Winning%20Space%20Race%20with%20Data%20Science)

* **Achievement:** The **K-Nearest Neighbors (KNN)** model proved most effective, achieving an **83.3% accuracy** in predicting landing success.

### 2. ExtraaLearn Lead Conversion Prediction ML (Predictive Modeling)

*(DS Tier: Tier 1 | Sector: Sales/Marketing)*

* **Core Metrics:** ROC AUC, F1-Score, Conversion Rate

An end-to-end **Machine Learning** solution designed to build a robust **Lead Scoring System** for the EdTech institution, ExtraaLearn.

* **Problem:** ExtraaLearn needed to prioritize leads effectively due to limited resources in a growing EdTech market, shifting from a high-volume to a **targeted, data-driven approach**.

* **Solution:** Built and tuned advanced Ensemble ML models (**XGBoost**, **AdaBoost**) to predict the probability of lead conversion. This involved extensive **feature engineering**, handling skewness (`np.log1p`), and specialized evaluation metrics (**ROC AUC**, F1-Score) to ensure high business value.

* **Key Technologies:** `Python`, **XGBoost**, **AdaBoost**, `Scikit-learn`, `Pandas` (Feature Engineering, Log Transformation).

* **App/Demo Link:** [Flask Web App](#)

* **Repository:** [View Repository](https://github.com/GC2407CIZV/Projects/tree/main/Lead%20Conversion%20Prediction%20ML)

* **Achievement:** Achieved a peak **ROC AUC of 0.931** (Tuned XGBoost), providing the business with **actionable insights** that led to a projected **5-10% increase** in the overall conversion rate.

### 3. NYC Housing Price Prediction Project (Real Estate ML)

*(DS Tier: Tier 2 | Sector: Real Estate/Geo)*

* **Core Metrics:** RMSE, R-squared

A project to predict housing prices in New York City, demonstrating expertise in regression modeling and handling complex urban data.

* **Problem:** Accurately predict NYC housing prices, which involves complex, non-linear relationships and significant geographical variability across boroughs.

* **Solution:** Employed rigorous data preparation and trained multiple regression models. Non-linear **Ensemble ML** methods (**Random Forest** and **Gradient Boosting**) were essential for capturing price drivers, complemented by **Geo-Spatial Analysis**.

* **Key Technologies:** `Python`, **Random Forest Regressor**, **Geopandas**, `Scikit-learn`.

* **App/Demo Link:** [Interactive Map](#)

* **Repository:** [View Repository](https://github.com/GC2407CIZV/Projects/tree/main/Predicting%20New%20York%20City%20Housing%20Prices%3A%20Addressing%20Real-World%20Challenges)

* **Achievement:** The Random Forest Regressor achieved the best performance with an RMSE of approximately **\$1.2 million**, confirming location (**Manhattan**) and property square footage are the most critical price drivers.

### 4. Salifort Motors Employee Turnover Prediction Project (HR Analytics)

*(DS Tier: Tier 2 | Sector: HR/Workforce)*

* **Core Metrics:** F1-Score, Precision/Recall

Analysis and **predictive modeling** for employee turnover at Salifort Motors to improve retention strategies.

* **Problem:** The HR department was concerned about high employee turnover and needed to understand the key factors contributing to employees leaving the company.

* **Solution:** Used the **PACE methodology** to perform EDA, build high-performing **Ensemble ML models** (**XGBoost**, **Random Forest**), and conduct **simulated A/B testing** on HR interventions.

* **Key Technologies:** `Python`, **XGBoost**, **Random Forest**, **PACE Methodology**, **A/B Testing**.

* **App/Demo Link:** [Jupyter Notebook](#)

* **Repository:** [View Repository](https://github.com/GC2407CIZV/Projects/tree/main/Salifort%20Motors%20Employee%20Turnover%20Analysis)

* **Achievement:** Developed a highly performant **XGBoost model** for proactive risk identification and delivered actionable recommendations focusing on improving employee satisfaction and managing workload/compensation disparity.

### 5. Bicycle Rental Demand Prediction Project (Time Series/ML)

*(DS Tier: Tier 3 | Sector: Transportation)*

* **Core Metrics:** RMSE, MAE

A project focused on building a **predictive model** to forecast daily demand for bicycle rentals based on time and weather factors.

* **Problem:** Forecasting rental demand accurately to optimize inventory and staffing, leveraging historical data and environmental features.

* **Solution:** Developed and evaluated multiple **Linear Regression models**, focusing heavily on **feature engineering** to capture temporal patterns. This demonstrates core **Time Series ML** principles.

* **Key Technologies:** `Python`, **Scikit-learn** (Linear Regression), **Pandas**, \*\*Matplotlib\`.

* **App/Demo Link:** [Jupyter Notebook](#)

* **Repository:** [View Repository](https://github.com/GC2407CIZV/Projects/tree/main/Bicycle%20Rental%20Demand%20Prediction%20Project)

* **Achievement:** Demonstrated the critical importance of feature engineering by incorporating the **'last week's average rental count'** feature, which significantly reduced the model's Root Mean Squared Error (RMSE).

### Specialized AI & Recommendation Systems

### 6. Amazon Product Recommendation Engine: SVD & Collaborative Filtering (Recommendation Systems)

*(DS Tier: Tier 1 | Sector: Retail/eCommerce)*

* **Core Metrics:** RMSE, Precision/Recall@K

Development and optimization of a scalable **Recommendation System** using a massive dataset of Amazon product reviews.

* **Problem:** Building an accurate and scalable system to predict user ratings and provide personalized product recommendations.

* **Solution:** Processed **7.8 million ratings** and implemented three models (Rank-Based, **Collaborative Filtering**, and **SVD** - Matrix Factorization), using **hyperparameter tuning** to maximize performance.

* **Key Technologies:** `Python`, **SVD** (Matrix Factorization), **Collaborative Filtering**, `Surprise`.

* **App/Demo Link:** [Jupyter Notebook](#)

* **Repository:** [View Repository](https://github.com/GC2407CIZV/Projects/tree/main/Amazon%20Product%20Recommendation%20Engine)

* **Achievement:** The **Optimized SVD model** achieved superior accuracy with the lowest **RMSE of 0.8808**, making it the recommended choice for production deployment.

### 7. VisionScribe (Computer Vision & Automation)

*(DS Tier: Tier 2 | Sector: Computer Vision)*

* **Core Metrics:** (N/A - Application)

A Python toolkit designed for generating descriptive captions for images using state-of-the-art Hugging Face **Deep Learning models** (BLIP and BLIP-2).

* **Problem:** The need for automated, high-quality image descriptions from various sources (local files, large directories, and web pages).

* **Solution:** Built a suite of scripts, including a **Gradio web application**, that utilizes the **BLIP/BLIP-2 Computer Vision models** to upload single images, batch process directories, or scrape images for instant captioning.

* **Key Technologies:** `Python`, `Hugging Face Transformers` (**Deep Learning / Computer Vision**), **Gradio**, `BeautifulSoup` (for web scraping).

* **App/Demo Link:** [Gradio App](#)

* **Repository:** [View Repository](https://github.com/GC2407CIZV/Projects/tree/main/VisionScribe)

* **Achievement:** Created a **unified, deployable interface** demonstrating competence in bridging **ML models** with user-friendly web interfaces.

### 8. Capstone Project: AI-Based Emotion Detection Web Application (Applied AI/Web)

*(DS Tier: Tier 1 | Sector: NLP/Web Dev)*

* **Core Metrics:** (N/A - Application)

A full-stack web application demonstrating the entire development pipeline for a deployed **AI service**.

* **Problem:** Creating a deployable, end-to-end AI application that demonstrates proficiency in Flask, unit testing, and external API integration.

* **Solution:** Developed a web server using **Flask** to handle user text input and integrate with the **Watson NLP** (Natural Language Processing) service to detect emotions (joy, sadness, anger, fear, disgust).

* **Key Technologies:** `Python`, **Flask**, **Watson NLP**, `unittest` (for testing core logic), Modular Architecture.

* **App/Demo Link:** [Flask Web App](#)

* **Repository:** [View Repository](https://github.com/GC2407CIZV/Projects/tree/main/AI-Based%20Emotion%20Detection%20Web%20Application)

* **Achievement:** Successfully completed the entire **development and deployment pipeline**, including modular code packaging and comprehensive unit testing, proving capability in **Full-Stack AI** development.

### Business & Customer Analytics

### 9. Customer Personality Segmentation (Customer Analytics)

*(DS Tier: Tier 2 | Sector: Marketing)*

* **Core Metrics:** Silhouette Score, Elbow Method

An **unsupervised machine learning** project to segment a retail company's customer base for targeted marketing.

* **Problem:** Moving beyond generic marketing by identifying distinct customer personality segments based on demographics and spending habits.

* **Solution:** Utilized a data science pipeline involving extensive data cleaning, **feature engineering**, and **K-Means clustering** (K=3) to define distinct customer profiles, supported by **PCA** (Principal Component Analysis).

* **Key Technologies:** `Python`, **Scikit-learn** (**K-Means**, **PCA**, StandardScaler), **Pandas**, \*\*Seaborn\`.

* **App/Demo Link:** [Tableau Dashboard](#)

* **Repository:** [View Repository](https://github.com/GC2407CIZV/Projects/tree/main/Customer%20Personality%20Segmentation)

* **Achievement:** Identified **three actionable segments** and provided tailored business recommendations for retention and sales optimization.

### 10. Bellabeat Smart Device Usage Analysis (Business Analytics)

*(DS Tier: Tier 3 | Sector: Fitness/Wellness)*

* **Core Metrics:** (N/A - Report)

A data-driven case study using public fitness tracker data to inform the marketing strategy for the Bellabeat "Leaf" product.

* **Problem:** Providing actionable, data-backed marketing and product positioning recommendations for the Bellabeat Leaf in the competitive wellness tech market.

* **Solution:** Performed comprehensive **Exploratory Data Analysis (EDA)** on Fitbit data (activity, sleep, calories) using the **R Tidyverse** ecosystem, focusing on fitness and sleep trends.

* **Key Technologies:** **R**, **Tidyverse** (`dplyr`, `ggplot2`), `R Markdown`.

* **App/Demo Link:** [R Markdown Report](#)

* **Repository:** [View Repository](https://github.com/GC2407CIZV/Projects/tree/main/Bellabeat%20Smart%20Strategy%3A%20Leveraging%20Smart%20Device%20Data%20for%20Growth)

* **Achievement:** Delivered strategic marketing recommendations (e.g., targeting sedentary behavior, weekend promotions) based on quantifiable user trends, showcasing strong **business acumen and data communication** skills.

### Exploratory Data Analysis & Visualization

### 11. Olympic Dataset Analysis for SportsStats (Data Analysis & Predictive Modeling)

*(DS Tier: Tier 3 | Sector: Sports Analytics)*

* **Core Metrics:** (N/A - Analysis)

A comprehensive analysis of 120 years of Olympic Games data to extract meaningful trends and identify factors influencing athletic success.

* **Problem:** SportsStats needed historical trends and predictive factors from the Olympic Games dataset to inform athlete training, recruitment, and performance optimization strategies.

* **Solution:** Conducted extensive **Exploratory Data Analysis (EDA)** on athlete demographics and medal distribution. Used **Predictive Modeling** (Linear Regression, Random Forest) to test hypotheses on medal success factors.

* **Key Technologies:** `Python`, `Pandas` (Cleaning/Imputation), `Matplotlib/Seaborn` (**Visualization**), `Scikit-learn` (Predictive Modeling).

* **App/Demo Link:** [Jupyter Notebook](#)

* **Repository:** [View Repository](https://github.com/GC2407CIZV/Projects/tree/main/Olympic%20Dataset%20Analysis%20for%20SportsStats)

* **Achievement:** Uncovered specific **"Optimal Athlete Profiles"** across various sports, providing data-driven insights to guide strategic sports decision-making.

### 12. Visualizing Heart Disease and Heart Failure Risk Factors (Tableau Data Story) (Data Analysis)

*(DS Tier: Tier 3 | Sector: Public Health)*

* **Core Metrics:** (N/A - Visualization)

An accessible and informative **Tableau data story** designed for a general audience to promote understanding of heart health.

* **Problem:** Communicating complex health risk data (heart disease/failure) to a non-technical audience in an engaging and accessible format.

* **Solution:** Created a multi-frame narrative data story in **Tableau**, exploring key risk factors (age, BMI, cholesterol, etc.). Designed an **Interactive Risk Calculator** within the dashboard for personalized risk assessment.

* **Key Technologies:** **Tableau Public**, **Data Storytelling**.

* **App/Demo Link:** [Tableau Public Link](#)

* **Repository:** [View Repository](https://github.com/GC2407CIZV/Projects/tree/main/The%20Heart's%20Story%3A%20What%20Influences%20Failure%20and%20Disease%3F)

* **Achievement:** Developed an effective **data communication** artifact, demonstrating expertise in visualization for public health and business insight delivery.

### Full-Stack Application Development

### 13. Quacktastic Conundrum (Flask Web Game) (Applied AI/Web)

*(DS Tier: N/A | Sector: Full-Stack)*

* **Core Metrics:** (N/A - Game)

A hilarious and thrilling mystery game, a blend of adventure and digital sleuthing, built on **Flask** with robust **security** features.

* **Problem:** To design and implement a secure, multi-featured web game that showcases full-stack development skills, including user authentication and database management.

* **Solution:** Developed a web game focused on mystery and adventure. Integrated user registration, secure sessions, and an **SQLite Database**. Used security libraries like **Bleach** for input sanitization, demonstrating competence in **web security**.

* **Key Technologies:** **Full-Stack Development**, **Flask**, **SQLite**, **Werkzeug**, **Bleach**.

* **App/Demo Link:** [YouTube Demo](https://www.youtube.com/watch?v=dQw4w9WgXcQ)

* **Repository:** [View Repository](https://github.com/GC2407CIZV/Projects/tree/main/Quactastic%20Conundrum)

* **Achievement:** Successfully deployed a **full-stack web application** demonstrating competence in web security, database integration, and complex application flow.

## 📧 Contact

**Name:** Gregory Charles
**Email:** gregory.charles01@gmail.com
**LinkedIn:** <https://www.linkedin.com/in/gregory-charles-7a460550/>
