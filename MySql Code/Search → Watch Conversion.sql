-- Search → Watch Conversion

SELECT
    s.search_query,
    COUNT(DISTINCT w.user_id) AS converted_users
FROM search_logs s
JOIN watch_history w
    ON s.user_id = w.user_id
GROUP BY s.search_query;