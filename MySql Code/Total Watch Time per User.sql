use netflix;

-- Total Watch Time per User 
SELECT
    user_id,
    SUM(watch_duration_minutes) AS total_watch_minutes
FROM watch_history
GROUP BY user_id
limit 10;


