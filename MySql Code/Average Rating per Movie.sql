
SELECT
    m.title,
    AVG(r.rating) AS avg_rating
FROM movie_reviews r
JOIN movies m ON r.movie_id = m.movie_id
GROUP BY m.title
limit 5;

