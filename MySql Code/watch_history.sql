use netflix;

CREATE TABLE if not exists watch_history (
    session_id VARCHAR(20) PRIMARY KEY,
    user_id VARCHAR(20) NOT NULL,
    movie_id VARCHAR(20) NOT NULL,
    watch_date DATE NOT NULL,
    device_type VARCHAR(20),
    watch_duration_minutes DECIMAL(10, 2),
    progress_percentage DECIMAL(5, 2),
    action VARCHAR(20),
    quality VARCHAR(20),
    location_country VARCHAR(50),
    is_download TINYINT(1) DEFAULT 0,
    user_rating TINYINT CHECK (user_rating BETWEEN 1 AND 5),
    
    -- Indexes for common queries
    INDEX idx_user (user_id),
    INDEX idx_movie (movie_id),
    INDEX idx_date (watch_date)
);
select * from watch_history;