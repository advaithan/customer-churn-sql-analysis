# Customer Churn Analysis using SQL

## Project Overview
This project analyzes customer churn behavior in a telecom dataset using SQL. The objective is to identify key drivers of churn, segment high-risk customers, and estimate the financial impact of customer attrition.

## Key Insights
- Overall churn rate: **26.58%**
- Month-to-month contracts show highest churn: **42.71%**
- Electronic check users have highest churn: **45.29%**
- Estimated revenue loss due to churn: **$2.86M**
- Identified **994 high-risk customers**

## Business Insights
- Customers on short-term contracts are more likely to churn
- Manual payment methods increase churn risk
- High-risk segment: Month-to-month + Electronic check users

## Recommendations
- Promote long-term contracts through discounts and incentives
- Encourage customers to switch to automated payment methods
- Target high-risk customers with retention campaigns

## Tools Used
- MySQL
- SQL

## Project Files
- `churn_analysis.sql` → SQL queries and analysis
- `dataset.csv` → Raw dataset

## Conclusion
The analysis highlights that contract type and payment method significantly influence customer churn. Implementing targeted retention strategies can help reduce churn and minimize revenue loss.
