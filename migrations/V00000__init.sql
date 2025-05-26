-- Create schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS financial_tracker;

-- Set search path to the schema
SET search_path TO financial_tracker;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20),
    address TEXT
);