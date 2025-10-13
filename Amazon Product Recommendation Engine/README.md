# Amazon Product Recommendation Engine: SVD & Collaborative Filtering Implementation

## 🚀 Project Overview

This project focuses on developing a robust and scalable **Product Recommendation System** using a large dataset of Amazon product reviews. In the competitive e-commerce landscape, effective personalization is critical for improving user experience and driving revenue.

The primary objective was to build, compare, and optimize various recommendation models to determine the most accurate approach for predicting user ratings and suggesting personalized product recommendations.

### 🎯 Key Goals

* **Handle Large-Scale Data:** Process and filter a dataset of over **7.8 million user ratings** to create a computationally feasible and meaningful interaction matrix.
* **Model Comparison:** Implement and rigorously evaluate three distinct types of recommendation systems (Rank-Based, Collaborative Filtering, and SVD).
* **Optimization:** Apply **hyperparameter tuning** to maximize model performance and accuracy.
* **Business Recommendation:** Select and justify the best-performing model for real-world deployment.

## 🛠️ Methodology and Models

### 1. Data Preparation

The initial dataset of over **7.8 million ratings** was filtered for meaningful interactions to improve model efficacy. The final working dataset included:

* Users with **$\ge 50$ ratings**.
* Products with **$\ge 5$ ratings**.
* Resulting in **65,290 ratings** from 1,540 unique users for 5,689 unique products.

### 2. Implemented Models

Three core types of recommendation systems were built and evaluated:

| Model Type | Approach | Purpose |
| :--- | :--- | :--- |
| **Rank-Based** | Recommends based on average rating and popularity. | Serves as a baseline and a solution for the **Cold-Start Problem**. |
| **Collaborative Filtering** | User-User and Item-Item similarity based on rating patterns. | Provides personalized recommendations by finding similar user/item groups. |
| **Model-Based (SVD)** | Matrix Factorization using **Singular Value Decomposition (SVD)**. | Discovers latent factors influencing user ratings for high-accuracy predictions. |

## ✅ Key Results and Performance

All models were evaluated using **Root Mean Square Error (RMSE)** for prediction accuracy and **Precision@10**, **Recall@10**, and **F1-score@10** for ranking accuracy (using a threshold of 3.5).

The **Optimized SVD model** demonstrated the superior performance, achieving the lowest RMSE.

| Model | RMSE | Precision@10 | Recall@10 | F1-score@10 |
| :--- | :--- | :--- | :--- | :--- |
| User-User Baseline | 1.0012 | 0.855 | 0.858 | 0.856 |
| User-User Optimized | 0.9527 | 0.847 | 0.894 | **0.870** |
| Item-Item Baseline | 0.9950 | 0.838 | 0.845 | 0.841 |
| Item-Item Optimized | 0.9576 | 0.839 | 0.880 | 0.859 |
| SVD Baseline | 0.8882 | 0.853 | 0.880 | 0.866 |
| **SVD Optimized** | **0.8808** | **0.854** | 0.878 | 0.866 |

### **Conclusion:**

The **Optimized SVD model is recommended** for deployment due to its superior accuracy (**lowest RMSE of 0.8808**) in predicting user ratings for personalized recommendations. The **Rank-Based system** is the recommended fallback for new users or products (the cold-start problem).

## 💼 Data Science Career Alignment

This project is an ideal asset for a data science portfolio, demonstrating proficiency across the entire machine learning lifecycle:

| Skill Demonstrated | Value to an Employer |
| :--- | :--- |
| **Problem Formulation** | Translating a business objective ("increase e-commerce sales") into a technical problem (building a recommender). |
| **Data Engineering** | Handling and filtering a massive dataset ($\sim7.8$ million records) for computational efficiency. |
| **Model Diversity** | Proficiency in multiple ML paradigms (**Collaborative Filtering**, **SVD**). |
| **Model Optimization** | Experience with **Hyperparameter Tuning** and advanced Python libraries (e.g., `surprise`). |
| **Evaluation & Reporting** | The ability to select appropriate metrics (RMSE, Precision/Recall@k) and communicate a data-driven final recommendation. |

## ⏭️ Future Enhancements

These are the planned next steps to further enhance the system, perfect for showcasing ongoing learning and technical curiosity:

* **Hybrid Models:** Implementing a hybrid recommendation system to combine SVD's accuracy with the interpretability of collaborative filtering.
* **Temporal Analysis:** Incorporating the 'timestamp' data to model and predict shifts in user preferences over time.
* **Cold-Start Mitigation:** Exploring content-based filtering strategies to better recommend products to new users by leveraging product metadata.
