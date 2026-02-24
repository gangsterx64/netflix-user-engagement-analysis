-- Most Watched Movie 

SELECT
    m.title,
    COUNT(*) AS views
FROM watch_history w
JOIN movies m ON w.movie_id = m.movie_id
GROUP BY m.title
ORDER BY views DESC
LIMIT 5;
