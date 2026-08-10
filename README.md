# Projects — Data Science, Machine Learning & Applied AI

This repository contains **17 projects** spanning **data science, machine learning, recommendation systems, generative AI, retrieval-augmented generation (RAG), computer vision, analytics, data visualization, and software development**.

The portfolio is organized with **data science and machine learning projects first**, followed by complementary AI and software-engineering work.

Projects range from structured course capstones to independently developed applications and demonstrate experience across the data science lifecycle:

```text
Data Collection
      ↓
Data Cleaning & Exploration
      ↓
Feature Engineering
      ↓
Statistical / Machine Learning Modeling
      ↓
Model Evaluation & Optimization
      ↓
Interpretation
      ↓
Business Recommendations
      ↓
Applied AI & Decision-Support Systems
```

> **Repository note:** Each project folder contains its own `README.md` with additional information about the problem, methodology, implementation, results, limitations, and project files.
>
> Some independently developed or commercially sensitive projects are represented by documentation and selected visuals rather than their complete source code.

---

# Data Science Highlights

These projects provide the strongest examples of my work in **predictive modeling, feature engineering, model evaluation, optimization, recommendation systems, and unsupervised learning**.

| Project | Problem | Key Methods | Key Result / Outcome |
| --- | --- | --- | --- |
| **Shinkansen Passenger Experience** | Passenger satisfaction classification | CatBoost, XGBoost, feature engineering, Optuna, Hyperopt | **0.9597 Accuracy · 0.9943 ROC AUC** |
| **ExtraaLearn Lead Conversion** | Lead scoring / conversion prediction | XGBoost, AdaBoost, Random Forest, tuning | **0.931 ROC AUC** with tuned XGBoost |
| **Salifort Motors Employee Turnover** | Employee attrition prediction | XGBoost, Random Forest, Decision Tree, Logistic Regression | Ensemble models provided strongest predictive performance |
| **Amazon Recommendation Engine** | Personalized product recommendations | Collaborative Filtering, SVD, Matrix Factorization | **0.8808 RMSE** with optimized SVD |
| **Customer Personality Segmentation** | Customer segmentation | K-Means, PCA, Silhouette Analysis | **3 actionable customer segments** |
| **NYC Housing Price Prediction** | Property-price regression | Random Forest, Gradient Boosting, geospatial analysis | Best reported RMSE ≈ **$1.21M** |
| **Falcon 9 Landing Prediction** | Launch landing classification | API, scraping, SQL, EDA, classification | Best evaluated classifier ≈ **83.3% test accuracy** |

---

# Quick Project Finder

Use this section to quickly locate projects by technology, model, or technical area.

| Looking for... | Relevant Projects |
| --- | --- |
| **Machine Learning** | Shinkansen, ExtraaLearn, Salifort Motors, NYC Housing, Bicycle Rental, Falcon 9 |
| **Classification** | Shinkansen, ExtraaLearn, Salifort Motors, Falcon 9 |
| **Regression** | NYC Housing, Bicycle Rental Demand |
| **Unsupervised Learning** | Customer Personality Segmentation |
| **Feature Engineering** | Shinkansen, ExtraaLearn, Salifort Motors, NYC Housing, Bicycle Rental, Customer Segmentation |
| **Hyperparameter Optimization** | Shinkansen, ExtraaLearn, Salifort Motors |
| **XGBoost** | Shinkansen, ExtraaLearn, Salifort Motors |
| **CatBoost** | Shinkansen |
| **AdaBoost** | ExtraaLearn |
| **Random Forest** | Salifort Motors, NYC Housing |
| **K-Means** | Customer Personality Segmentation |
| **PCA** | Customer Personality Segmentation |
| **Recommendation Systems** | Amazon Recommendation Engine, Lumina |
| **Collaborative Filtering** | Amazon Recommendation Engine |
| **SVD / Matrix Factorization** | Amazon Recommendation Engine |
| **Bayesian Recommendations** | Lumina |
| **Generative AI / LLMs** | RAG-Powered Q&A Bot, AI Career Coach Pro |
| **RAG** | RAG-Powered Q&A Bot |
| **LangChain** | RAG-Powered Q&A Bot |
| **Embeddings / Vector Databases** | RAG-Powered Q&A Bot |
| **Prompt Engineering** | AI Career Coach Pro, RAG-Powered Q&A Bot |
| **IBM watsonx.ai** | RAG-Powered Q&A Bot, AI Career Coach Pro |
| **Computer Vision** | VisionScribe |
| **Transformers** | VisionScribe |
| **BLIP / BLIP-2** | VisionScribe |
| **NLP** | AI-Based Emotion Detection |
| **Gradio** | RAG-Powered Q&A Bot, AI Career Coach Pro, VisionScribe |
| **Flask** | Quacktastic Conundrum, AI-Based Emotion Detection |
| **Flutter / Dart** | Lumina |
| **Riverpod** | Lumina |
| **SQLite** | Lumina, Quacktastic Conundrum |
| **Tableau** | Heart Disease Risk Visualization |
| **R / Tidyverse / ggplot2** | Bellabeat |
| **SQL** | Falcon 9 |
| **APIs / Web Scraping** | Falcon 9 |
| **Geospatial Analysis** | Falcon 9, NYC Housing |
| **Plotly / Dash** | Falcon 9 |
| **Business Analytics** | ExtraaLearn, Salifort Motors, Bellabeat, Customer Segmentation |
| **Data Visualization** | Heart Disease Risk Visualization, Bellabeat, Falcon 9, Olympic Dataset Analysis |
| **Educational Technology** | Lumina |
| **Full-Stack Development** | Quacktastic Conundrum |

---

# Data Science & Machine Learning Projects

## Shinkansen Passenger Experience Analysis

**MIT IDSS — Data Science and Machine Learning: Making Data-Driven Decisions**  
**Hackathon / Extended Independent Optimization**

**Focus:** Advanced Classification · Feature Engineering · Model Optimization

Developed machine-learning models to predict Shinkansen passenger satisfaction.

The project includes extensive preprocessing, feature engineering, multiple classification approaches, and advanced hyperparameter optimization.

The original hackathon submission was subsequently extended through additional experimentation and model optimization.

**Technologies:** Python · Pandas · Scikit-learn · CatBoost · XGBoost · Optuna · Hyperopt

**Documented optimized result:** **0.9597 Accuracy · 0.9943 ROC AUC** using tuned CatBoost.

[View Project](./Shinkansen%20Bullet%20Train%20Passenger%20Experience%20Analysis)

---

## ExtraaLearn Lead Conversion Prediction

**MIT IDSS — Data Science and Machine Learning: Making Data-Driven Decisions**

**Focus:** Classification · Lead Scoring · Ensemble Learning · Business ML

Developed a machine-learning lead-scoring workflow to predict which prospective students were most likely to convert into paying customers.

The project combines preprocessing, feature engineering, ensemble modeling, hyperparameter optimization, model evaluation, and business interpretation.

**Technologies:** Python · Pandas · NumPy · Scikit-learn · XGBoost

**Models:** XGBoost · AdaBoost · Random Forest · Decision Tree

**Documented results:**

- Tuned XGBoost: **ROC AUC 0.931**
- Tuned AdaBoost: **F1-score 0.784**

[View Project](./Lead%20Conversion%20Prediction%20ML)

---

## Salifort Motors Employee Turnover Prediction

**Google Advanced Data Analytics Capstone**

**Focus:** HR Analytics · Classification · Ensemble Learning · Business Recommendations

Developed predictive models to identify employees at risk of leaving and analyzed the factors associated with employee turnover.

The project follows the **PACE methodology** and compares multiple classification approaches while translating model findings into potential employee-retention strategies.

**Technologies:** Python · Pandas · Scikit-learn · XGBoost · Random Forest

**Models / Methods:**

- Logistic Regression
- Decision Tree
- Random Forest
- XGBoost
- SVM
- Hyperparameter Tuning

Key factors examined include employee satisfaction, workload, tenure, salary, and other workplace characteristics.

[View Project](./Salifort%20Motors%20Employee%20Turnover%20Analysis)

---

## Amazon Product Recommendation Engine

**MIT IDSS — Data Science and Machine Learning: Making Data-Driven Decisions**

**Focus:** Recommendation Systems · Collaborative Filtering · Matrix Factorization

Developed and compared multiple recommendation approaches using a large Amazon product-ratings dataset.

The workflow includes:

- rank-based recommendations;
- user-user collaborative filtering;
- item-item collaborative filtering;
- Singular Value Decomposition (SVD);
- hyperparameter optimization;
- ranking and prediction evaluation.

**Technologies:** Python · Surprise · Pandas · Scikit-learn

**Dataset:** Approximately **7.8 million original ratings**, filtered to create a computationally meaningful interaction dataset.

**Evaluation:** RMSE · Precision@10 · Recall@10 · F1@10

**Documented result:** Optimized SVD achieved **RMSE 0.8808**.

[View Project](./Amazon%20Product%20Recommendation%20Engine)

---

## Customer Personality Segmentation

**MIT IDSS — Data Science and Machine Learning: Making Data-Driven Decisions**

**Focus:** Unsupervised Learning · Customer Segmentation · Marketing Analytics

Applied unsupervised machine learning to segment retail customers according to demographics, spending behavior, household characteristics, and marketing engagement.

The project combines substantial preprocessing and feature engineering with clustering, cluster evaluation, visualization, and business interpretation.

**Technologies:** Python · Pandas · NumPy · Scikit-learn · Yellowbrick

**Key Methods:**

- K-Means
- PCA
- Elbow Method
- Silhouette Analysis
- Feature Engineering
- Standardization
- Outlier Treatment

**Result:** Identified **3 actionable customer segments** with distinct spending and engagement profiles.

[View Project](./Customer%20Personality%20Segmentation)

---

## NYC Housing Price Prediction

**IBM & University of London — Data Science Foundations Specialization Capstone**

**Focus:** Regression · Feature Engineering · Geospatial Analysis

Developed and compared machine-learning models for predicting New York City housing prices.

The project addresses real-world data challenges including outliers, geographical variation, nonlinear relationships, categorical information, and highly variable property values.

**Technologies:** Python · Pandas · GeoPandas · Matplotlib · Scikit-learn

**Models:**

- Linear Regression
- Ridge Regression
- Random Forest Regressor
- Gradient Boosting Regressor

**Documented result:** Random Forest achieved the lowest reported RMSE at approximately **$1.21M** on the analyzed dataset.

[View Project](./Predicting%20New%20York%20City%20Housing%20Prices%3A%20Addressing%20Real-World%20Challenges)

---

## Winning the Space Race with Data Science: Falcon 9 Landing Prediction

**IBM Data Science Professional Certificate Capstone**

**Focus:** End-to-End Data Science · Classification · Data Acquisition · SQL · Geospatial Analysis

Built an end-to-end data science workflow around SpaceX Falcon 9 launch and landing data.

The project covers considerably more than model training:

```text
REST API
   +
Web Scraping
      ↓
Data Wrangling
      ↓
SQL Analysis
      ↓
EDA
      ↓
Geospatial Analysis
      ↓
Interactive Dashboard
      ↓
Machine Learning
```

**Technologies:** Python · Pandas · REST APIs · BeautifulSoup · SQL · Folium · Plotly Dash · Scikit-learn

**Documented result:** Best evaluated classifier achieved approximately **83.3% test accuracy**.

[View Project](./Winning%20Space%20Race%20with%20Data%20Science)

---

## Lumina — Educational Decision Support System

**Independent Project · Active Development**

**Focus:** Adaptive Systems · Educational Technology · Bayesian Recommendations · Decision Support · Application Development

Lumina is an independently designed and developed **Educational Decision Support System (EDSS)** for teachers.

Rather than functioning only as a lesson-plan generator, Lumina connects planning, classroom delivery, teaching resources, historical evidence, and future recommendations.

```text
Plan
 ↓
Teach
 ↓
Observe
 ↓
Learn
 ↓
Recommend
```

Current capabilities include:

- constraint-aware lesson planning;
- coordinated multi-lesson planning;
- Quick Start classroom execution;
- adaptive activity recommendations;
- school-aware teaching history;
- structured activities and media libraries;
- grammar tools;
- an expanding structured vocabulary system;
- vocabulary flashcards and original educational imagery under development.

Activity recommendations use a **Bayesian approach** combining contextual suitability with accumulated classroom engagement evidence.

**Technologies:** Flutter · Dart · Riverpod · Drift · SQLite · SharedPreferences

**Intelligence:** Constraint-Based Planning · Bayesian Adaptive Recommendations

**Architecture:** Local-First / Offline-First

> The complete source code, proprietary educational datasets, recommendation implementation, and original educational asset corpus are intentionally not publicly distributed because Lumina is being evaluated for potential future commercialization.

[View Lumina Project Showcase](./Lumina%20(EDSS))

---

## Bicycle Rental Demand Prediction

**IBM & University of London — Data Science Foundations Specialization Capstone**

**Focus:** Regression · Feature Engineering · Demand Prediction

Developed regression models to predict bicycle rental demand using weather, calendar, and historical-demand information.

The project demonstrates how feature engineering—particularly incorporating historical rental behavior—can improve prediction beyond basic environmental variables.

**Technologies:** Python · Pandas · NumPy · Matplotlib · Scikit-learn

**Key Methods:**

- Simple Linear Regression
- Multiple Linear Regression
- Temporal Feature Engineering
- Train/Validation Evaluation
- RMSE

[View Project](./Bicycle%20Rental%20Demand%20Prediction%20Project)

---

# Data Analytics & Visualization Projects

## Bellabeat Smart Device Usage Analysis

**Google Data Analytics Capstone**

**Focus:** Business Analytics · EDA · Data Visualization · Marketing Strategy

Analyzed publicly available Fitbit activity data to identify behavioral patterns and translate them into marketing recommendations for Bellabeat's Leaf wellness product.

The project demonstrates an analytics workflow from data preparation and exploratory analysis through stakeholder-oriented recommendations.

**Technologies:** R · Tidyverse · lubridate · ggplot2 · R Markdown

[View Project](./Bellabeat%20Smart%20Strategy%3A%20Leveraging%20Smart%20Device%20Data%20for%20Growth)

---

## Olympic Dataset Analysis for SportsStats

**Focus:** Data Analysis · Exploratory Data Analysis · Visualization · Predictive Analysis

Analyzed historical Olympic data to identify patterns in athlete participation and performance and explore changes across Olympic history.

The project demonstrates data preparation, exploratory analysis, visualization, interpretation, and predictive analytical techniques.

**Technologies:** Python · Pandas · NumPy · Matplotlib · Scikit-learn

[View Project](./Olympic%20Dataset%20Analysis%20for%20SportsStats)

---

## Visualizing Heart Disease and Heart Failure Risk Factors

**UC Davis — Data Visualization with Tableau Specialization Capstone**

**Focus:** Data Visualization · Analytical Storytelling · Interactive Dashboards

Created a Tableau data story exploring factors associated with heart disease and heart failure.

The project emphasizes communicating complex health-related information to a general audience through accessible visualizations and an interactive risk-calculator concept.

**Technologies:** Tableau Public · Data Visualization · Interactive Dashboards

[View Project](./The%20Heart's%20Story%3A%20What%20Influences%20Failure%20and%20Disease%3F)

---

# Generative AI, RAG & Deep Learning Projects

## RAG-Powered Q&A Bot

**IBM Generative AI Engineering Professional Certificate**

**Focus:** Generative AI · Retrieval-Augmented Generation · Document Q&A

Built an end-to-end RAG application for question answering over uploaded PDF documents.

The application performs:

```text
PDF
 ↓
Document Loading
 ↓
Text Chunking
 ↓
Embeddings
 ↓
Vector Database
 ↓
Semantic Retrieval
 ↓
LLM
 ↓
Grounded Answer
```

**Technologies:** Python · LangChain · IBM watsonx.ai · ChromaDB · Gradio · PyPDFLoader

This project demonstrates practical integration of **retrieval, embeddings, vector search, LLM generation, and interactive application development**.

[View Project](./RAG-Powered%20Q%26A%20Bot%20with%20LangChain%20and%20watsonx.ai)

---

## AI Career Coach Pro

**IBM Generative AI Engineering Professional Certificate**

**Focus:** Generative AI · LLM Applications · Prompt Engineering

Built a multi-function LLM application supporting four job-application workflows:

- resume analysis;
- personalized cover-letter generation;
- career and skill-gap guidance;
- mock interview preparation.

Each module uses specialized prompting for a different analytical or generative task.

**Technologies:** Python · IBM watsonx.ai · Granite LLM · Gradio · Prompt Engineering · pypdf · python-docx

[View Project](./AI%20Career%20Coach%20App)

---

## VisionScribe

**IBM Generative AI Engineering Professional Certificate**

**Focus:** Computer Vision · Image Captioning · Transformers

Developed several image-captioning workflows using **BLIP and BLIP-2** transformer models.

The project includes:

- interactive single-image captioning;
- directory-based batch processing;
- web-image extraction and captioning;
- a unified interactive interface.

**Technologies:** Python · PyTorch · Hugging Face Transformers · BLIP · BLIP-2 · Gradio · BeautifulSoup

[View Project](./VisionScribe)

---

## AI-Based Emotion Detection Web Application

**IBM Generative AI Engineering Professional Certificate**

**Focus:** NLP · AI Service Integration · Flask · Testing

Built a modular web application that sends text to an emotion-detection service, processes returned emotion scores, identifies the dominant emotion, and presents the result through a Flask interface.

The project also demonstrates:

- Python package organization;
- API/service integration;
- unit testing;
- error handling;
- frontend/backend integration.

**Technologies:** Python · Flask · Watson NLP · JavaScript · HTML · unittest

[View Project](./AI-Based%20Emotion%20Detection%20Web%20Application)

---

# Software Development Project

## Quacktastic Conundrum

**Harvard CS50 Final Project**

**Focus:** Full-Stack Software Development · Game Logic · State Management

Designed and implemented a browser-based mystery game in which players investigate interconnected fictional environments to recover Harvard's missing rubber duck mascot.

The application includes:

- authentication;
- persistent clue progression;
- prerequisite-based unlocking;
- gated environments;
- simulated social platforms;
- contextual hints;
- gameplay timing;
- rankings;
- custom JavaScript interactions.

**Technologies:** Flask · Python · SQLite · JavaScript · Jinja2 · HTML · CSS

[View Project](./Quactastic%20Conundrum)

---

# Technical Toolkit Demonstrated Across the Projects

| Category | Technologies & Methods |
| --- | --- |
| **Programming** | Python, R, Dart, JavaScript, SQL, HTML, CSS |
| **Data Analysis** | Pandas, NumPy, Tidyverse, EDA, Data Cleaning, Statistical Analysis |
| **Feature Engineering** | Transformation, Scaling, Encoding, Temporal Features, Domain-Specific Features |
| **Machine Learning** | Scikit-learn, XGBoost, CatBoost, Random Forest, Gradient Boosting, AdaBoost, KNN, SVM, Logistic Regression |
| **Regression** | Linear Regression, Ridge Regression, Random Forest Regression, Gradient Boosting Regression |
| **Unsupervised Learning** | K-Means, PCA, Silhouette Analysis |
| **Recommendation Systems** | Collaborative Filtering, SVD, Matrix Factorization, Bayesian Adaptive Recommendations |
| **Model Optimization** | Optuna, Hyperopt, GridSearchCV, RandomizedSearchCV |
| **Model Evaluation** | Accuracy, Precision, Recall, F1, ROC AUC, RMSE, Precision@K, Recall@K |
| **Generative AI** | LLM Applications, RAG, LangChain, IBM watsonx.ai, Prompt Engineering |
| **Retrieval** | Embeddings, Semantic Retrieval, ChromaDB, Vector Databases |
| **Deep Learning / Computer Vision** | PyTorch, Hugging Face Transformers, BLIP, BLIP-2 |
| **Visualization** | Tableau, Matplotlib, ggplot2, Plotly, Folium |
| **Geospatial Analysis** | GeoPandas, Folium |
| **Data Acquisition** | REST APIs, Requests, BeautifulSoup, Web Scraping |
| **Web / AI Applications** | Flask, Gradio, Jinja2 |
| **Application Development** | Flutter, Dart |
| **State Management** | Riverpod |
| **Persistence** | SQLite, Drift, SharedPreferences |
| **Testing / Engineering** | unittest, Git, GitHub |
| **Educational Technology** | Decision Support, Constraint-Aware Planning, Adaptive Recommendations, Structured Educational Data |

---

# Projects by Technical Domain

## Predictive Machine Learning

```text
Shinkansen Passenger Experience
ExtraaLearn Lead Conversion
Salifort Motors Employee Turnover
NYC Housing Price Prediction
Bicycle Rental Demand Prediction
Falcon 9 Landing Prediction
```

## Unsupervised Learning

```text
Customer Personality Segmentation
```

## Recommendation & Adaptive Systems

```text
Amazon Product Recommendation Engine
Lumina Educational Decision Support System
```

## Generative AI & RAG

```text
RAG-Powered Q&A Bot
AI Career Coach Pro
```

## Computer Vision / Transformers

```text
VisionScribe
```

## NLP

```text
AI-Based Emotion Detection
```

## Data Analytics & Visualization

```text
Bellabeat Smart Device Usage Analysis
Olympic Dataset Analysis
Heart Disease Risk Visualization
Falcon 9 Landing Prediction
```

## Application / Software Development

```text
Lumina Educational Decision Support System
Quacktastic Conundrum
RAG-Powered Q&A Bot
AI Career Coach Pro
AI-Based Emotion Detection
VisionScribe
```

---

# Project Origins

The repository combines independent development with projects completed through structured technical programs.

| Program / Origin | Projects |
| --- | --- |
| **Independent Development** | Lumina |
| **MIT IDSS — Data Science & Machine Learning** | Shinkansen Passenger Experience, ExtraaLearn Lead Conversion, Amazon Recommendation Engine, Customer Personality Segmentation |
| **Google Advanced Data Analytics** | Salifort Motors Employee Turnover |
| **IBM & University of London — Data Science Foundations** | NYC Housing Price Prediction, Bicycle Rental Demand |
| **IBM Data Science Professional Certificate** | Falcon 9 Landing Prediction |
| **Google Data Analytics** | Bellabeat Smart Device Usage Analysis |
| **UC Davis — Data Visualization with Tableau** | Heart Disease & Heart Failure Risk Visualization |
| **IBM Generative AI Engineering Professional Certificate** | RAG-Powered Q&A Bot, AI Career Coach Pro, VisionScribe, AI-Based Emotion Detection |
| **Harvard CS50** | Quacktastic Conundrum |
| **Additional Data Science Project** | Olympic Dataset Analysis |

---

# Repository Structure

Each project is maintained in its own directory.

```text
Projects/
│
├── AI Career Coach App/
├── AI-Based Emotion Detection Web Application/
├── Amazon Product Recommendation Engine/
├── Bellabeat Smart Strategy.../
├── Bicycle Rental Demand Prediction Project/
├── Customer Personality Segmentation/
├── Lead Conversion Prediction ML/
├── Lumina/
├── Olympic Dataset Analysis for SportsStats/
├── Predicting New York City Housing Prices.../
├── Quacktastic Conundrum/
├── RAG-Powered Q&A Bot with LangChain and watsonx.ai/
├── Salifort Motors Employee Turnover Analysis/
├── Shinkansen Bullet Train Passenger Experience Analysis/
├── The Heart's Story.../
├── VisionScribe/
├── Winning Space Race with Data Science/
│
└── README.md
```

Individual directories may contain:

```text
README.md
notebooks/
scripts/
datasets/
reports/
visualizations/
application files/
supporting documentation/
```

The exact structure depends on the type and scope of the project.

---

# About This Repository

These projects represent different stages of my development in **data science, machine learning, applied AI, and software engineering**.

My primary career focus is **Data Science**.

The portfolio therefore emphasizes projects demonstrating:

- data preparation and exploratory analysis;
- feature engineering;
- supervised and unsupervised machine learning;
- model selection and evaluation;
- hyperparameter optimization;
- recommendation systems;
- business interpretation;
- data-driven decision making.

The additional Generative AI, RAG, computer-vision, and software-development projects demonstrate the ability to extend data-science skills into modern AI applications and working software systems.

Some projects originated as structured course or capstone assignments and were subsequently documented, expanded, or refined. Others—particularly **Lumina**—are independently conceived product-development projects.

Together, the projects show progression across:

```text
Data Analysis
      ↓
Predictive Modeling
      ↓
Feature Engineering
      ↓
Machine Learning
      ↓
Model Optimization
      ↓
Unsupervised Learning
      ↓
Recommendation Systems
      ↓
Generative AI & RAG
      ↓
Data-Driven Applications
```

This repository is intended both as a **technical portfolio** and as a quick reference for identifying which projects demonstrate particular methods, technologies, and problem-solving approaches.

---

# Author

**Gregory Charles**

Data Science · Machine Learning · Applied AI · Software Development
