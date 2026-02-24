use netflix;

-- If You Want Subscription vs Engagement
SELECT 
    u.subscription_plan,
    SUM(w.watch_duration_minutes) AS total_watch_minutes
FROM vw_user_engagement u
JOIN watch_history w 
    ON u.user_id = w.user_id
GROUP BY u.subscription_plan
ORDER BY total_watch_minutes DESC;