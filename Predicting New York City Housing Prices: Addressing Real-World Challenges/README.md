# NYC Housing Price Prediction Project

## Overview

This project aims to predict housing prices in New York City using machine learning techniques.  The analysis encompasses data exploration, preprocessing, model building, and evaluation.  The project addresses the complexities of real estate valuation in a diverse urban environment.

## Key Findings

* **Data Exploration:** The analysis reveals a non-normal distribution of housing prices with significant outliers.  Strong correlations exist between price and features like property square footage, bedrooms, and bathrooms.  Geographical analysis indicates price variations across different boroughs.
* **Model Performance:** Non-linear ensemble models (Random Forest, Gradient Boosting) outperform linear models (Linear Regression, Ridge Regression), demonstrating the importance of capturing complex, non-linear relationships in housing prices.  The Random Forest Regressor, after hyperparameter tuning, achieved the best performance with an RMSE of approximately $1,214,838.
* **Feature Importance:** Key price drivers include the number of bathrooms, property square footage, and location (latitude and longitude), with `LOCALITY_New York County` (Manhattan) being a significant categorical predictor.

## Methodology

The project follows a standard data science workflow:

1.  **Data Loading and Exploration:** Loading the dataset and exploring its characteristics using descriptive statistics and visualizations.
2.  **Data Preparation:** Cleaning the data (handling missing values and outliers), and engineering new features.
3.  **Model Building:** Training and tuning several regression models, including Linear Regression, Ridge Regression, Random Forest Regressor, and Gradient Boosting Regressor.
4.  **Model Evaluation:** Evaluating model performance using Root Mean Squared Error (RMSE) and visualizing actual vs. predicted prices.

## Code and File Descriptions

* `NY-House-Dataset.csv`:  The primary dataset containing NYC housing data.
* `Borough_Boundaries_20250509.csv`: Contains geographical boundaries for NYC boroughs.
* Python notebooks: The core analysis is conducted in a Python environment (e.g., Jupyter Notebook) with libraries like Pandas, Geopandas, Matplotlib, Seaborn, and Scikit-learn.  Key steps are:
    * Data loading and exploration.
    * Geographical data processing and visualization.
    * Missing value handling, outlier removal, and feature engineering.
    * Model training and evaluation.
* Image files:
    * `distribution_price.png`: Histogram of the price distribution.
    * `boxplot_outlier_price.png`: Boxplot of price, showing outliers.
    * `boxplot_price_vs_type.png`: Boxplot of price vs. property type.
    * `scatterplot_propertysqft.png`: Scatterplot of price vs. property square footage.
    * `geograph_scatterplot.png`: Scatterplot of property locations.
    * `property_borough_map.png`: Map of NYC property locations with borough boundaries.
    * `correlation_matrix.png`: Heatmap of feature correlations.
    * `actual_vs_predicted_*.png`: Scatterplots of actual vs. predicted prices for each model.

## Model Evaluation

The following table summarizes the performance of the models:

| Model                   | RMSE (Original Scale) |
| ----------------------- | ----------------------- |
| Linear Regression       | 18,583,888            |
| Ridge Regression        | 18,482,892            |
| Random Forest Regressor | 1,214,838             |
| Gradient Boosting Regressor| 1,228,725             |

## Further Improvements

The following improvements could be implemented:

* Enhanced feature engineering, particularly for location data (e.g., neighborhood, proximity to amenities)
* Incorporation of external datasets (e.g., school ratings, crime rates)
* Advanced outlier management techniques
* Experimentation with more advanced models (e.g., XGBoost, LightGBM)
* Improved handling of categorical features
* Separate modeling of different price segments

## Conclusion

The Random Forest Regressor provides the most accurate predictions among the models tested. However, predicting NYC housing prices accurately is challenging. Further research is needed.
