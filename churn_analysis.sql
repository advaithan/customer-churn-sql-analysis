-- =====================================================
-- CUSTOMER CHURN ANALYSIS PROJECT (TELECOM DOMAIN)
-- =====================================================

-- Author: Advaitha Neerati
-- Objective: Analyze customer churn behavior and identify key drivers impacting retention and revenue

-- =====================================================
-- 1. DATABASE SETUP
-- =====================================================

CREATE DATABASE IF NOT EXISTS churn_analysis;
USE churn_analysis;

-- =====================================================
-- 2. DATA CLEANING
-- =====================================================

-- Convert TotalCharges to numeric format for analysis
ALTER TABLE customer_churn
MODIFY TotalCharges DECIMAL(10,2);

-- =====================================================
-- 3. KEY PERFORMANCE INDICATORS (KPI)
-- =====================================================

-- Overall Churn Rate
-- Insight: ~26.58% of customers have churned
SELECT 
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS churn_rate_percentage
FROM customer_churn;

-- =====================================================
-- 4. CHURN ANALYSIS BY CONTRACT TYPE
-- =====================================================

-- Insight:
-- Month-to-month customers have the highest churn (~42.71%)
-- Long-term contracts significantly improve retention

SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY Contract
ORDER BY churn_rate_percentage DESC;

-- =====================================================
-- 5. CHURN ANALYSIS BY PAYMENT METHOD
-- =====================================================

-- Insight:
-- Electronic check users show highest churn (~45.29%)
-- Auto-payment methods reduce churn significantly

SELECT 
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS churn_rate_percentage
FROM customer_churn
GROUP BY PaymentMethod
ORDER BY churn_rate_percentage DESC;

-- =====================================================
-- 6. REVENUE IMPACT ANALYSIS
-- =====================================================

-- Insight:
-- Total revenue loss due to churn is approximately $2.86M

SELECT 
    ROUND(SUM(TotalCharges), 2) AS revenue_lost
FROM customer_churn
WHERE Churn = 'Yes';

-- =====================================================
-- 7. HIGH-RISK CUSTOMER SEGMENT IDENTIFICATION
-- =====================================================

-- Insight:
-- 994 customers belong to high-risk segment:
-- Month-to-month + Electronic check + Churn = Yes

SELECT 
    COUNT(*) AS high_risk_customers
FROM customer_churn
WHERE 
    Contract = 'Month-to-month'
    AND PaymentMethod = 'Electronic check'
    AND Churn = 'Yes';

-- =====================================================
-- 8. SAMPLE HIGH-RISK CUSTOMER DATA
-- =====================================================

-- This helps in targeted marketing strategies

SELECT 
    customerID,
    tenure,
    MonthlyCharges,
    Contract,
    PaymentMethod
FROM customer_churn
WHERE 
    Contract = 'Month-to-month'
    AND PaymentMethod = 'Electronic check'
    AND Churn = 'Yes'
LIMIT 10;

-- =====================================================
-- END OF PROJECT
-- =====================================================