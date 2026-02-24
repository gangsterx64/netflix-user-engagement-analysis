use netflix;

CREATE TABLE if not exists search_logs (
    search_id VARCHAR(20) PRIMARY KEY,
    user_id VARCHAR(20) NOT NULL,
    search_query VARCHAR(100) NOT NULL,
    search_date VARCHAR(10) NOT NULL, -- stored as DD-MM-YYYY
    results_returned INT NOT NULL,
    clicked_result_position INT NOT NULL,
    device_type VARCHAR(20) NOT NULL,
    search_duration_seconds DECIMAL(6,2) NOT NULL,
    had_typo BOOLEAN NOT NULL,
    used_filters BOOLEAN NOT NULL,
    location_country VARCHAR(50) NOT NULL
);

select * from search_logs;

