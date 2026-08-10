# 🛒 Amazon Product Recommendation Engine

**Recommendation Systems · Collaborative Filtering · Matrix Factorization · SVD**

> **Project Context:** MIT IDSS — *Data Science and Machine Learning: Making Data-Driven Decisions*

Built and evaluated a personalized product recommendation system using an Amazon product-review dataset containing approximately **7.8 million user-product ratings**.

The project progressed from a non-personalized **rank-based recommender** to **user-user and item-item collaborative filtering**, and finally to **Singular Value Decomposition (SVD)** for latent-factor modeling. After model comparison and hyperparameter tuning, the **Optimized SVD model achieved the lowest RMSE of 0.8808**, while **Optimized User-User Collaborative Filtering achieved the highest F1@10 of 0.870**.

The project demonstrates that recommendation-system model selection depends on the objective: SVD provided the strongest rating-prediction accuracy, while User-User Collaborative Filtering performed best on the balanced Top-N ranking metric.

---

## ⭐ Key Highlights

- Processed an original dataset containing approximately **7.8 million ratings**.
- Reduced sparsity and computational requirements using explicit user and product activity thresholds.
- Created a working dataset of **65,290 ratings from 1,540 users across 5,689 products**.
- Built **rank-based, user-user, item-item, and SVD recommendation approaches**.
- Compared both **memory-based and model-based collaborative filtering**.
- Applied **hyperparameter tuning** to improve model performance.
- Evaluated models using **RMSE, Precision@10, Recall@10, and F1@10**.
- Achieved the lowest **RMSE of 0.8808** with Optimized SVD.
- Achieved the highest **F1@10 of 0.870** with Optimized User-User Collaborative Filtering.
- Developed a practical strategy combining personalized recommendations with a **rank-based cold-start fallback**.
- Translated technical model results into an e-commerce recommendation strategy.

---

## 🎯 Business Problem & Objectives

Large e-commerce platforms offer enormous product catalogs. While this provides customers with extensive choice, it also creates a product-discovery problem.

The central question was:

> **How can historical user-product interactions be used to recommend products that are relevant to individual customers?**

Showing the same popular products to every customer ignores differences in preferences. A recommendation system can instead learn from historical rating patterns and estimate which unseen products a particular user is likely to value.

The project addressed five main objectives:

1. **Prepare a large recommendation dataset** for computationally feasible modeling.
2. **Build a non-personalized baseline** using product popularity and ratings.
3. **Develop collaborative-filtering models** using similarities between users and products.
4. **Develop an SVD matrix-factorization model** to learn latent preference patterns.
5. **Compare and optimize the models** using both prediction-error and Top-N recommendation metrics.

The final goal was not simply to identify the model with the best single metric, but to understand which recommendation approach was most appropriate for different objectives.

---

## 🔄 Recommendation System Workflow

```text
Amazon Ratings Dataset
        ↓
Data Inspection & Preparation
        ↓
Interaction Filtering
Users ≥ 50 ratings
Products ≥ 5 ratings
        ↓
Reduced User-Item Interaction Data
        ↓
┌─────────────────────────────────┐
│ Recommendation Approaches       │
│                                 │
│ • Rank-Based                    │
│ • User-User Collaborative       │
│ • Item-Item Collaborative       │
│ • SVD Matrix Factorization      │
└─────────────────────────────────┘
        ↓
Hyperparameter Tuning
        ↓
Model Evaluation
        ↓
RMSE + Precision@10
Recall@10 + F1@10
        ↓
Model Comparison
        ↓
Personalized Recommendation Strategy
```

This workflow allowed each modeling approach to be evaluated within the same recommendation problem.

---

## 📊 Data

The original Amazon product-review dataset contained approximately:

**7.8 million user-product ratings**

Recommendation datasets are typically highly sparse because individual customers interact with only a small fraction of the available product catalog.

Working directly with the full interaction space would therefore create a very large and sparse user-item matrix.

### Interaction Filtering

To create a more meaningful and computationally manageable modeling dataset, the project retained:

- users with **at least 50 ratings**;
- products with **at least 5 ratings**.

After filtering:

| Dataset Characteristic | Value |
| --- | ---: |
| Original ratings | ~7.8 million |
| Filtered ratings | **65,290** |
| Unique users | **1,540** |
| Unique products | **5,689** |
| Minimum ratings per retained user | **50** |
| Minimum ratings per retained product | **5** |

This filtering step reduced extreme sparsity while retaining users and products with sufficient interaction history for collaborative recommendation.

### Why Sparsity Matters

A typical recommendation matrix contains many unknown interactions:

```text
             Product A   Product B   Product C   Product D
User 1           5           ?           4           ?
User 2           ?           3           ?           5
User 3           4           ?           ?           2
User 4           ?           5           4           ?
```

The `?` values do not represent negative preferences. They represent products for which no rating has been observed.

The recommender must estimate which unseen products are likely to be relevant to each user.

Filtering extremely inactive users and products therefore affected both **computational tractability and the quality of the interaction information available to the models**.

---

## 🧠 Recommendation Approaches

The project compared three major recommendation paradigms.

| Approach | Models | Core Idea |
| --- | --- | --- |
| **Rank-Based** | Popularity / rating ranking | Recommend highly rated or popular products |
| **Memory-Based Collaborative Filtering** | User-User, Item-Item | Use similarity in historical rating patterns |
| **Model-Based Collaborative Filtering** | SVD | Learn latent representations of users and products |

### Rank-Based Recommendations

The rank-based approach recommends products according to aggregate product performance rather than individual user preferences.

Conceptually:

```text
Product Ratings
      ↓
Aggregate Rating Information
      ↓
Rank Products
      ↓
Recommend Top Products
```

This provides an important baseline and is useful when personalized interaction history is unavailable.

**Strengths**

- simple;
- interpretable;
- computationally inexpensive;
- useful for new or anonymous users.

**Limitation**

The recommendations are not personalized. Users with very different preferences can receive the same recommendations.

For this reason, rank-based recommendation is particularly useful as a **cold-start fallback**.

### User-User Collaborative Filtering

User-user collaborative filtering assumes that users with similar historical rating patterns may have similar preferences.

Conceptually:

```text
Target User
     ↓
Find Similar Users
     ↓
Identify Products They Rated Highly
     ↓
Estimate Target User Preferences
     ↓
Recommend Unseen Products
```

For example:

```text
User A likes → Product 1, Product 2, Product 3
User B likes → Product 1, Product 2

Potential recommendation for User B → Product 3
```

This approach provides personalized recommendations without requiring detailed product metadata.

Its effectiveness, however, depends on having sufficient overlap between user histories.

### Item-Item Collaborative Filtering

Item-item collaborative filtering reverses the perspective.

Instead of finding similar users, it identifies products that receive similar rating patterns.

```text
Products Rated by User
        ↓
Find Similar Products
        ↓
Estimate Ratings for Unseen Products
        ↓
Recommend Highest-Scoring Products
```

This can support recommendations similar to:

> Customers who showed preference for this product also tended to prefer these products.

Item relationships can sometimes be more stable than user relationships, although the method still depends on sufficient historical interaction data.

### Matrix Factorization with SVD

The model-based approach uses **Singular Value Decomposition (SVD)** to learn lower-dimensional latent representations of users and products.

Conceptually:

```text
Large Sparse User-Item Matrix
             ↓
      Matrix Factorization
             ↓
       ┌─────┴─────┐
       ↓           ↓
 User Factors   Product Factors
       └─────┬─────┘
             ↓
      Predicted Ratings
```

Rather than relying directly on user or item similarity, SVD attempts to capture hidden structures in the rating matrix.

These latent factors can represent combinations of preferences that are not explicitly defined in the original data.

The model can then estimate ratings for user-product combinations that have not previously been observed.

---

## ⚙️ Hyperparameter Tuning

Baseline models were compared with optimized versions to determine whether parameter tuning could improve generalization.

The process can be summarized as:

```text
Baseline Model
      ↓
Hyperparameter Search
      ↓
Optimized Configuration
      ↓
Evaluation on Test Data
      ↓
Baseline vs. Optimized Performance
```

An important result was that tuning improved SVD only modestly:

```text
Baseline SVD RMSE  → 0.8882
Optimized SVD RMSE → 0.8808
```

This is itself informative: the baseline SVD model was already performing strongly, so optimization produced an incremental rather than dramatic gain.

The collaborative-filtering models showed larger improvements after optimization.

---

## 📏 Evaluation Metrics

Recommendation systems should not be evaluated using a single metric.

This project therefore considered both:

1. **rating-prediction accuracy**; and
2. **Top-N recommendation quality**.

### RMSE

**Root Mean Square Error (RMSE)** measures the difference between actual and predicted ratings.

Lower RMSE indicates better rating-prediction accuracy.

### Precision@10

Precision@10 measures the proportion of recommended items in the Top 10 that are relevant to the user.

Higher precision means fewer irrelevant products are being recommended.

### Recall@10

Recall@10 measures the proportion of relevant items successfully retrieved in the Top 10 recommendations.

Higher recall means the recommender identifies more of the products considered relevant to the user.

### F1@10

F1@10 balances Precision@10 and Recall@10.

It is useful when both recommendation relevance and coverage matter.

A relevance threshold of **3.5** was used for the Top-N evaluation.

---

## 📈 Model Performance

| Model | RMSE | Precision@10 | Recall@10 | F1@10 |
| --- | ---: | ---: | ---: | ---: |
| User-User Baseline | 1.0012 | **0.855** | 0.858 | 0.856 |
| **User-User Optimized** | 0.9527 | 0.847 | **0.894** | **0.870** |
| Item-Item Baseline | 0.9950 | 0.838 | 0.845 | 0.841 |
| Item-Item Optimized | 0.9576 | 0.839 | 0.880 | 0.859 |
| SVD Baseline | 0.8882 | 0.853 | 0.880 | 0.866 |
| **SVD Optimized** | **0.8808** | 0.854 | 0.878 | 0.866 |

The results reveal an important trade-off:

- **Optimized SVD achieved the lowest RMSE: 0.8808**
- **Optimized User-User achieved the highest Recall@10: 0.894**
- **Optimized User-User achieved the highest F1@10: 0.870**
- **User-User Baseline achieved the highest Precision@10: 0.855**

This means no model dominated every metric.

---

## 🏆 Model Selection

### Optimized SVD — Best Rating Prediction

The **Optimized SVD model** achieved:

**RMSE = 0.8808**

This was the lowest prediction error among the evaluated models.

SVD therefore provided the strongest overall accuracy for predicting individual user ratings while maintaining competitive Top-N recommendation performance.

Its latent-factor structure also provides a more compact representation of user-product relationships than direct similarity calculations.

### Optimized User-User — Best F1@10

The **Optimized User-User Collaborative Filtering model** achieved:

- **RMSE:** 0.9527
- **Precision@10:** 0.847
- **Recall@10:** 0.894
- **F1@10:** 0.870

This was the strongest F1@10 result and the highest Recall@10 among the evaluated models.

### Why SVD Was Selected

The Optimized SVD model was selected as the preferred personalized recommendation model because **rating-prediction accuracy was the primary criterion for the final model recommendation**.

Its RMSE of **0.8808** was substantially lower than the optimized memory-based collaborative-filtering alternatives.

The conclusion is therefore not that SVD was universally superior.

Rather:

> **SVD was the strongest model for rating prediction, while Optimized User-User Collaborative Filtering was strongest on the balanced Top-N F1 metric.**

This distinction demonstrates why model selection should be tied to the intended recommendation objective.

---

## 🆕 Cold-Start Strategy

Collaborative-filtering systems have an important limitation: they depend on historical interaction data.

For a new user with no meaningful rating history, the system has insufficient information to identify similar users or learn reliable latent preferences.

This is the **cold-start problem**.

A practical strategy is therefore:

```text
                    User
                      ↓
             Interaction History?
                /            \
              Yes             No
               ↓               ↓
       Personalized SVD     Rank-Based
       Recommendations     Recommendations
                \           /
                 └────┬────┘
                      ↓
            Product Suggestions
```

### Existing Users

Use the personalized **SVD recommendation model** when sufficient interaction history exists.

### New Users

Use **rank-based recommendations** until enough behavioral information has been collected to support personalization.

This creates a more realistic recommendation architecture than assuming one model can serve every user state.

---

## 💼 From Predictions to Recommendations

SVD produces estimated ratings for user-product combinations.

These predictions can be converted into Top-N recommendations by:

1. identifying products the user has not rated;
2. estimating the user's rating for each candidate;
3. sorting the candidates by predicted rating;
4. returning the highest-ranked products.

Conceptually:

```text
Identify Unseen Products
        ↓
Predict User Ratings
        ↓
Rank Predicted Ratings
        ↓
Select Top-N Products
        ↓
Personalized Recommendations
```

This converts model predictions into a practical recommendation output.

---

## 💡 Business Applications

A recommendation system based on this work could support several e-commerce use cases.

### Personalized Product Discovery

Customers can receive recommendations based on their historical preferences rather than only global popularity.

### Personalized Home Pages

Predicted preferences could power sections such as:

```text
Recommended for You
```

### Cross-Selling

Products with high predicted relevance can be surfaced alongside or after customer interactions with other products.

### Customer Engagement

Relevant recommendations can reduce the effort required to navigate a large product catalog.

### Cold-Start Recommendations

Popular and highly rated products can provide useful initial recommendations before sufficient personalized interaction history exists.

A production system would need to validate whether these recommendations improve actual business outcomes rather than assuming that stronger offline model metrics automatically create commercial value.

---

## 🧩 Challenges & How I Addressed Them

| Challenge | How I Addressed It | What It Demonstrated |
| --- | --- | --- |
| **Very large source dataset** | Filtered ~7.8M ratings using minimum user and product interaction thresholds | Large-data preparation |
| **Sparse user-item interactions** | Retained sufficiently active users/products and compared memory- and model-based approaches | Recommendation-system reasoning |
| **Different recommendation paradigms** | Built rank-based, User-User, Item-Item, and SVD approaches | Model diversity |
| **Model optimization** | Compared baseline and hyperparameter-tuned models | Model tuning |
| **Different models winning different metrics** | Evaluated RMSE alongside Precision@10, Recall@10, and F1@10 | Multi-metric model selection |
| **Cold-start problem** | Retained rank-based recommendations as a fallback strategy | System-level design thinking |
| **Turning rating predictions into recommendations** | Ranked unseen products by predicted preference to create Top-N outputs | Model-to-product translation |
| **Choosing a final model** | Selected SVD based on the primary rating-prediction objective while acknowledging User-User's stronger F1@10 | Objective-driven decision-making |

---

## 🛠️ Technical Stack

| Area | Technologies & Methods |
| --- | --- |
| **Programming** | Python |
| **Data Processing** | Pandas, NumPy |
| **Recommendation Modeling** | Surprise |
| **Recommendation Methods** | Rank-Based, User-User CF, Item-Item CF, SVD |
| **Model Type** | Memory-Based and Model-Based Collaborative Filtering |
| **Optimization** | Hyperparameter Tuning |
| **Evaluation** | RMSE, Precision@10, Recall@10, F1@10 |
| **Visualization** | Matplotlib |
| **Environment** | Jupyter Notebook |

---

## ⚠️ Limitations & Critical Evaluation

### Interaction Filtering

Users with fewer than 50 ratings and products with fewer than 5 ratings were removed.

This improved tractability and interaction density, but it also means the evaluation focuses on relatively active users and sufficiently rated products.

Performance for sparse or new users may differ substantially.

### Explicit Ratings Only

The models primarily rely on explicit ratings.

A real e-commerce system could also use implicit behavioral signals such as:

- product views;
- clicks;
- searches;
- cart additions;
- purchases;
- dwell time.

These signals could significantly enrich user preference representations.

### Limited Product Metadata

Collaborative filtering learns primarily from interactions rather than detailed product characteristics.

Product metadata such as category, brand, price, description, or semantic embeddings could improve recommendations and help with new-product cold start.

### Temporal Preference Changes

Customer preferences can evolve over time.

A model based on historical ratings may treat older and newer interactions similarly even when recent behavior better reflects current interests.

### Offline Evaluation

RMSE and Top-N metrics evaluate the model offline.

They do not establish that recommendations would increase:

- click-through rate;
- conversion rate;
- revenue;
- average order value;
- retention.

Those outcomes would need to be validated through deployment and controlled experimentation.

---

## 🔄 Future Improvements

If I extended this project today, I would:

- compare **Non-Negative Matrix Factorization (NMF)** with SVD;
- build a **hybrid recommender** combining collaborative signals with product metadata;
- incorporate timestamps to model changing preferences;
- include implicit feedback such as views, clicks, cart additions, and purchases;
- develop stronger cold-start strategies for both new users and new products;
- evaluate recommendation coverage, diversity, novelty, and popularity bias;
- experiment with more advanced ranking metrics;
- investigate user and product embeddings;
- create an API or recommendation service for real-time inference;
- monitor recommendation quality and behavioral drift in production;
- run A/B tests comparing recommendation strategies;
- measure business KPIs such as click-through rate, conversion rate, and revenue per session.

---

## 🧠 What I Learned

This project strengthened my understanding of recommendation systems as a distinct machine-learning problem.

One of the most important lessons was that **recommendation data requires different thinking from conventional tabular supervised learning**. The user-item matrix is inherently sparse, and decisions about interaction thresholds directly affect both computational requirements and the population represented by the model.

The model comparison also demonstrated why a single metric cannot define the best recommender.

The Optimized SVD model achieved the lowest RMSE, while Optimized User-User Collaborative Filtering achieved the highest F1@10 and Recall@10. The correct model choice therefore depends on whether the primary objective is accurate rating estimation, Top-N retrieval, or another business outcome.

The project also reinforced that:

- latent-factor models can capture hidden preference structure;
- data filtering is a modeling decision, not merely preprocessing;
- hyperparameter tuning does not always produce dramatic gains;
- cold start requires system-level thinking beyond the primary ML model;
- personalized recommendations must eventually be evaluated against real user behavior;
- offline model performance does not automatically imply business impact.

The key progression was from:

**"Which algorithm has the best metric?"**

to:

**"Which recommendation strategy best supports the objective and user state?"**

---

## 💬 Interview Quick Reference

| Question | Quick Answer |
| --- | --- |
| **What was the project?** | A product recommendation system built from Amazon user-product ratings |
| **Project context?** | MIT IDSS — Data Science and Machine Learning: Making Data-Driven Decisions |
| **Original dataset size?** | Approximately **7.8 million ratings** |
| **Why filter the dataset?** | To reduce extreme sparsity and create a computationally manageable interaction dataset with meaningful user/product histories |
| **Filtering criteria?** | Users with ≥50 ratings and products with ≥5 ratings |
| **Working dataset?** | **65,290 ratings, 1,540 users, 5,689 products** |
| **Approaches compared?** | Rank-Based, User-User CF, Item-Item CF, and SVD |
| **Best RMSE?** | **0.8808 — Optimized SVD** |
| **Best F1@10?** | **0.870 — Optimized User-User CF** |
| **Best Recall@10?** | **0.894 — Optimized User-User CF** |
| **Why select SVD?** | Rating-prediction accuracy was the primary selection criterion, and SVD achieved the lowest RMSE |
| **What does SVD do?** | Learns lower-dimensional latent user and product factors that can be used to estimate unseen ratings |
| **Main technical challenge?** | Working with a large, sparse user-item interaction space |
| **How did you address cold start?** | Use rank-based recommendations until sufficient interaction history exists for personalization |
| **Why use multiple metrics?** | RMSE evaluates rating prediction, while Precision@10, Recall@10, and F1@10 evaluate Top-N recommendation behavior |
| **Important limitation?** | Offline recommendation metrics do not establish real-world engagement or revenue impact |
| **What would you improve today?** | Hybrid recommendations, temporal modeling, implicit feedback, richer ranking evaluation, and online A/B testing |
| **Main lesson?** | The best recommendation model depends on the objective and the amount of information available about the user |

---

## 📁 Repository Contents

A typical repository for this project contains the analysis notebook, README, and project data where licensing and file-size constraints permit.

```text
.
├── README.md
├── recommendation_system.ipynb
└── data/
```

> Update the notebook and directory names above if the repository uses different filenames.

The primary notebook contains the end-to-end workflow, including:

- data inspection;
- interaction filtering;
- rank-based recommendation;
- User-User Collaborative Filtering;
- Item-Item Collaborative Filtering;
- SVD;
- hyperparameter tuning;
- model evaluation;
- Top-N recommendation generation;
- final model comparison and recommendation.

---

## 🎓 Project Context

This project was completed as part of:

**MIT IDSS — *Data Science and Machine Learning: Making Data-Driven Decisions***

The project demonstrates the integration of:

**Python · Recommendation Systems · Collaborative Filtering · User-User Similarity · Item-Item Similarity · Matrix Factorization · SVD · Hyperparameter Tuning · RMSE · Precision@K · Recall@K · F1@K · Business Analytics**

It is included in my portfolio because it demonstrates a different machine-learning paradigm from conventional classification and regression: learning from **user-item interactions to support personalized decision systems**.

The project also demonstrates the ability to move from a large raw interaction dataset through data reduction, multiple recommendation strategies, optimization, multi-metric evaluation, and finally to a defensible model-selection and cold-start strategy.

---

## 📄 License & Educational Use

This repository is intended for **educational and portfolio purposes**.

The project demonstrates recommendation-system and machine-learning work completed as part of the MIT IDSS learning program. Any original course materials, datasets, or instructional content remain subject to their respective ownership and usage terms.

---

## 👤 Author

**Gregory Charles**

Data Science · Machine Learning · Generative AI · Data Visualization · Applied Software Development

[← Back to Main Projects Portfolio](../README.md)
