use netflix;

-- If You Want Average Watch Time Per User
SELECT 
    u.subscription_plan,
    ROUND(AVG(w.watch_duration_minutes), 2) AS avg_watch_minutes
FROM vw_user_engagement u
JOIN watch_history w 
    ON u.user_id = w.user_id
WHERE u.is_active = 1
GROUP BY u.subscription_plan
ORDER BY avg_watch_minutes DESC;





