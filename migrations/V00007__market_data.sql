CREATE TABLE market_data (
    id SERIAL PRIMARY KEY,
    symbol VARCHAR(10),
    price NUMERIC,
    percent_change NUMERIC,
    timestamp TIMESTAMP
);