use netflix;

CREATE TABLE if not exists movies (
    movie_id VARCHAR(20) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content_type VARCHAR(50),
    genre_primary VARCHAR(50),
    genre_secondary VARCHAR(50),
    release_year INT,
    duration_minutes INT,
    rating VARCHAR(10), -- Currently empty in dataset, but reserved for age ratings
    language VARCHAR(50),
    country_of_origin VARCHAR(50),
    imdb_rating DECIMAL(3, 1),
    production_budget BIGINT,
    box_office_revenue DECIMAL(15, 2),
    number_of_seasons INT DEFAULT 0,
    number_of_episodes INT DEFAULT 0,
    is_netflix_original TINYINT(1) DEFAULT 0,
    added_to_platform DATE,
    content_warning TINYINT(1) DEFAULT 0,
    
    -- Indexes for performance
    INDEX idx_content_type (content_type),
    INDEX idx_genre (genre_primary),
    INDEX idx_release_year (release_year)
);

select * from movies;


