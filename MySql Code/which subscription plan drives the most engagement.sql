use netflix;

-- which subscription plan drives the most engagement:
SELECT 
    u.subscription_plan,
    ROUND(SUM(w.watch_duration_minutes), 2) AS total_watch_minutes
FROM vw_user_engagement u
JOIN watch_history w 
    ON u.user_id = w.user_id
WHERE u.is_active = 1
GROUP BY u.subscription_plan
ORDER BY total_watch_minutes DESC;
