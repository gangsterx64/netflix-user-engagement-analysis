use netflix;
WITH user_watch AS (
    SELECT 
        u.is_active,
        SUM(w.watch_duration_minutes) AS total_watch
    FROM vw_user_engagement u
    JOIN watch_history w
        ON u.user_id = w.user_id
    GROUP BY u.is_active
)
SELECT 
    CASE 
        WHEN is_active = 1 THEN 'Active'
        ELSE 'Inactive'
    END AS user_status,
    total_watch,
    ROUND(100 * total_watch / SUM(total_watch) OVER (), 2) 
        AS percentage_contribution
FROM user_watch;

