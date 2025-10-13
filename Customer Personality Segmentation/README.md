# Customer Personality Segmentation

## Project Overview

This project aims to segment a retail company's customer base using unsupervised machine learning techniques. By understanding distinct customer personalities, lifestyles, and purchasing habits, the company can develop tailored marketing campaigns, improve customer retention, and optimize product offerings. This analysis provides actionable insights for personalizing marketing strategies and creating loyalty programs to sustain a competitive edge.

## Business Context

In the competitive retail landscape, understanding customer behavior is crucial for success. This project addresses the challenge of moving away from generic strategies towards more targeted and personalized approaches by identifying distinct customer segments. The insights gained will help improve the effectiveness of marketing campaigns, identify high-value customer groups, and foster long-term customer relationships.

## Data

The dataset contains historical data on customer demographics, personality traits, and purchasing behaviors. Key features include:

*   **Customer Information:** ID, Year_Birth, Education, Marital_Status, Income, Kidhome, Teenhome, Dt_Customer (Enrollment Date), Recency (Days since last purchase), Complain.
*   **Spending Information (Last 2 Years):** Amount spent on Wines, Fruits, Meat, Fish, Sweets, and Gold products.
*   **Purchase and Campaign Interaction:** Number of purchases through different channels (Deals, Web, Catalog, Store), and responses to various marketing campaigns (AcceptedCmp1-5, Response).
*   **Shopping Behavior:** Number of website visits per month.

## Methodology

The project follows a standard data science pipeline:

1.  **Data Loading and Overview:** Initial inspection of data types, missing values, unique values, and descriptive statistics to understand the dataset's structure and identify potential issues.
2.  **Data Preprocessing:**
    *   Handling missing values in the 'Income' column by imputing with the median income based on 'Education' and 'Age'.
    *   Converting 'Dt_Customer' to datetime format for time-based feature engineering.
    *   Creating new features like 'Age', 'Customer_Tenure_Days', 'TotalSpending', 'TotalAcceptedCmp', and 'ChildrenAtHome'.
    *   Regrouping low-frequency categories in 'Education' and 'Marital_Status'.
    *   Dropping irrelevant columns (ID, Year_Birth, Dt_Customer, Z_CostContact, Z_Revenue).
    *   Handling outliers in numerical features using Winsorization (capping at 1st and 99th percentiles for Income, and 99th percentile for others).
    *   Applying Log1p transformation to skewed numerical features to improve distribution symmetry.
    *   Encoding categorical features ('Education', 'Marital_Status') and low-cardinality numerical features ('Kidhome', 'Teenhome') using one-hot encoding.
    *   Scaling numerical features using StandardScaler to ensure equal contribution to distance calculations.
    *   Selecting a subset of features deemed most relevant for clustering based on EDA and business context.
3.  **Exploratory Data Analysis (EDA):**
    *   Univariate analysis using histograms, box plots, and bar plots to visualize distributions and identify skewness and outliers (both before and after preprocessing steps).
    *   Bivariate analysis using scatter plots and a correlation heatmap to explore relationships between features.
4.  **K-Means Clustering:**
    *   Determining the optimal number of clusters (K) using the Elbow Method and Silhouette Score.
    *   Applying K-Means clustering with the chosen K (K=3 based on analysis).
    *   Comparing clustering results for K=2, K=3, and K=4.
5.  **Cluster Profiling and Interpretation:** Analyzing the characteristics of each cluster by examining the mean/median of numerical features and the distribution of categorical features within each segment.
6.  **Visualization:** Visualizing the clusters in a 2D space using Principal Component Analysis (PCA) to assess their separation.

## Key Findings and Customer Segments (K=3)

Based on the K-Means clustering with K=3, three distinct customer segments were identified:

*   **Segment 0: High-Income, High-Spending, Engaged Customers**
    *   **Characteristics:** Highest average income, high overall spending across all product categories (especially Wines, Meat, Gold), high engagement across channels (catalog, store), highest campaign acceptance rates, fewer children at home.
    *   **Profile:** These are the most valuable customers, likely with disposable income, who are active shoppers and responsive to marketing efforts.
*   **Segment 1: Lower-Income, Low-Spending, Family-Focused Customers**
    *   **Characteristics:** Lowest average income, very low spending across all categories, lower purchase frequencies (higher web visits), low campaign acceptance rates, high presence of young children at home.
    *   **Profile:** This segment is value-sensitive, likely prioritizing essential spending due to lower income and family needs.
*   **Segment 2: Mid-Income, Mid-Spending, Family-Focused Customers (with Teens)**
    *   **Characteristics:** Moderate income and spending, moderate engagement across channels (web, store), moderate campaign acceptance, notable presence of teenagers (often with younger children).
    *   **Profile:** A middle-ground segment with some disposable income but potentially competing spending priorities due to older children.

## Business Recommendations

Tailored strategies for each segment:

*   **Segment 0 (High-Value):** Focus on retention, loyalty programs, upselling/cross-selling premium products, VIP treatment, and engaging through preferred channels (catalog, in-store, targeted digital) with personalized, exclusive messaging.
*   **Segment 1 (Low-Value, Family-Focused):** Emphasize value, discounts, essential product bundles, cost-effective digital channels, family-centric messaging, and consider lifecycle marketing.
*   **Segment 2 (Mid-Value, Family-Focused):** Offer a balanced mix of value and mid-range products relevant to households with teens, engage through multi-channels (web, store, email, social media), and use targeted campaigns with clear value propositions.

**Overall:** Implement personalized marketing, optimize channel allocation, consider the customer lifecycle, use A/B testing to refine strategies, and integrate segmentation into the CRM system for actionable targeting.

## Getting Started

To run this project locally:

1.  Clone the repository: `git clone <repository_url>`
2.  Navigate to the project directory: `cd customer-personality-segmentation`
3.  Install the required libraries: `pip install pandas numpy matplotlib seaborn scikit-learn yellowbrick`
4.  Ensure the dataset `Customer_Personality_Segmentation.csv` is in the project directory.
5.  Run the Jupyter Notebook or Python script.

## Technologies Used

*   Python
*   Pandas
*   NumPy
*   Matplotlib
*   Seaborn
*   Scikit-learn
*   Yellowbrick

## Future Enhancements

*   Explore other clustering algorithms (e.g., DBSCAN, Hierarchical Clustering).
*   Perform more in-depth analysis within each cluster (e.g., product affinity).
*   Develop predictive models to classify new customers into existing segments.
*   Incorporate external data sources for richer segmentation.
*   Implement an automated system for customer segmentation and targeted campaign deployment.

## Contact

Gregory Charles - https://www.linkedin.com/in/gregory-charles-7a460550/ - gregory.charles01@gmail.com
