use netflix;
CREATE TABLE IF NOT EXISTS recommendation_logs (
    recommendation_id   VARCHAR(20)  NOT NULL,
    user_id              VARCHAR(20)  NOT NULL,
    movie_id             VARCHAR(20)  NOT NULL,
    recommendation_date  DATE         NOT NULL,
    recommendation_type  VARCHAR(30)  NOT NULL,
    recommendation_score DECIMAL(5,3) NOT NULL,
    was_clicked          TINYINT(1)    NOT NULL,
    position_in_list     INT          NOT NULL,
    device_type          VARCHAR(20)  NOT NULL,
    time_of_day          VARCHAR(20)  NOT NULL,
    algorithm_version    VARCHAR(10)  NOT NULL,
    PRIMARY KEY (recommendation_id)
);


select * from recommendation_logs;