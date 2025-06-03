-- Create schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS financial_tracker;

-- Set search path to the schema
SET search_path TO financial_tracker;

-- Create accounts table first
CREATE TABLE accounts (
    account_id UUID PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create users table with reference to accounts
CREATE TABLE users (
    account_id UUID PRIMARY KEY REFERENCES accounts(account_id) ON DELETE CASCADE,
    user_id VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20),
    address TEXT
);