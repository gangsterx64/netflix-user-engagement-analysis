use netflix;

CREATE TABLE if not exists movie_reviews (
    review_id VARCHAR(20) PRIMARY KEY,
    user_id VARCHAR(20) NOT NULL,
    movie_id VARCHAR(20) NOT NULL,
    rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    review_date DATE NOT NULL,
    device_type VARCHAR(20) NOT NULL,
    is_verified_watch BOOLEAN NOT NULL,
    helpful_votes INT NOT NULL,
    total_votes INT NOT NULL,
    review_text TEXT NOT NULL,
    sentiment VARCHAR(20) NOT NULL,
    sentiment_score DECIMAL(4,3) NOT NULL
);

select * from movie_reviews;
