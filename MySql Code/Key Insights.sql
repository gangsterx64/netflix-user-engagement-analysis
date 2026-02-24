use netflix;

-- Measure Engagement by Device (Correct Way)
SELECT 
    device_type,
    COUNT(session_id) AS total_sessions,
    SUM(watch_duration_minutes) AS total_watch_minutes,
    AVG(watch_duration_minutes) AS avg_watch_per_session
FROM watch_history
GROUP BY device_type
ORDER BY total_watch_minutes DESC;

-- Measure Engagement by RegionMeasure Engagement by Region 
SELECT 
    location_country,
    COUNT(session_id) AS total_sessions,
    SUM(watch_duration_minutes) AS total_watch_minutes,
    AVG(watch_duration_minutes) AS avg_watch_per_session
FROM watch_history
GROUP BY location_country
ORDER BY total_watch_minutes DESC;

-- Identify High-Rated but Under-Viewed Movies
SELECT 
    m.movie_id,
    m.title,
    AVG(w.user_rating) AS avg_rating,
    COUNT(w.session_id) AS total_views
FROM movies m
JOIN watch_history w
    ON m.movie_id = w.movie_id
WHERE w.user_rating IS NOT NULL
GROUP BY m.movie_id, m.title
HAVING AVG(w.user_rating) > (
        SELECT AVG(user_rating)
        FROM watch_history
        WHERE user_rating IS NOT NULL
    )
AND COUNT(w.session_id) < (
        SELECT AVG(view_count)
        FROM (
            SELECT COUNT(*) AS view_count
            FROM watch_history
            GROUP BY movie_id
        ) AS sub
    )
ORDER BY avg_rating DESC
limit 10;

-- Check Engagement by Subscription Plan 
SELECT 
    u.subscription_plan,
    COUNT(DISTINCT u.user_id) AS total_users,
    SUM(w.watch_duration_minutes) AS total_watch_minutes,
    AVG(w.watch_duration_minutes) AS avg_watch_per_session
FROM vw_user_engagement u
JOIN watch_history w
    ON u.user_id = w.user_id
GROUP BY u.subscription_plan
ORDER BY total_watch_minutes DESC;

-- Revenue + Engagement Check
SELECT 
    subscription_plan,
    COUNT(*) AS total_users,
    AVG(monthly_spend) AS avg_monthly_spend
FROM vw_user_engagement
GROUP BY subscription_plan;

-- Measure Engagement by Region
SELECT 
    location_country,
    COUNT(DISTINCT user_id) AS total_users,
    COUNT(session_id) AS total_sessions,
    SUM(watch_duration_minutes) AS total_watch_minutes,
    AVG(watch_duration_minutes) AS avg_watch_per_session
FROM watch_history
GROUP BY location_country
ORDER BY total_watch_minutes DESC;

-- Check User-Level Engagement Spread
SELECT 
    user_id,
    SUM(watch_duration_minutes) AS total_watch
FROM watch_history
GROUP BY user_id
ORDER BY total_watch DESC;

-- Check Low Completion Rates 
SELECT 
    AVG(progress_percentage) AS avg_completion_rate
FROM watch_history;

SELECT 
    u.subscription_plan,
    COUNT(DISTINCT u.user_id) AS total_users,
    SUM(w.watch_duration_minutes) AS total_watch_minutes,
    AVG(w.watch_duration_minutes) AS avg_watch_minutes
FROM vw_user_engagement u
JOIN watch_history w 
    ON u.user_id = w.user_id
GROUP BY u.subscription_plan
ORDER BY avg_watch_minutes DESC;


SELECT 
    m.movie_id,
    m.title,
    AVG(w.user_rating) AS avg_rating,
    COUNT(w.movie_id) AS total_views
FROM movies m
JOIN watch_history w
    ON m.movie_id = w.movie_id
WHERE w.user_rating IS NOT NULL
GROUP BY m.movie_id, m.title
HAVING AVG(w.user_rating) >= 3.20
   AND COUNT(w.movie_id) < 90
ORDER BY avg_rating DESC;

