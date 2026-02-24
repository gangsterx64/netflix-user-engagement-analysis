use netflix;

CREATE TABLE if not exists users (
    user_id VARCHAR(20) PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    age INT CHECK (age BETWEEN 13 AND 120),
    gender VARCHAR(20),
    country VARCHAR(100),
    state_province VARCHAR(100),
    city VARCHAR(100),
    subscription_plan VARCHAR(50),
    subscription_start_date DATE,
    is_active BOOLEAN,
    monthly_spend DECIMAL(8,2),
    primary_device VARCHAR(50),
    household_size INT,
    created_at DATETIME NULL
);


select * from users;
