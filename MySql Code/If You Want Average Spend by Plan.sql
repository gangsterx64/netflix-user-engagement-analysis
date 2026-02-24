use netflix;

-- If You Want Average Spend by Plan
SELECT 
    subscription_plan,
    ROUND(AVG(monthly_spend), 2) AS avg_monthly_spend
FROM vw_user_engagement
WHERE is_active = 1
GROUP BY subscription_plan
ORDER BY avg_monthly_spend DESC;
