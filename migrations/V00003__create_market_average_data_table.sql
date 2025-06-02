CREATE TABLE market_average_data (
    id SERIAL PRIMARY KEY,
    symbol VARCHAR(10) NOT NULL,
    price NUMERIC NOT NULL,
    price_change NUMERIC,
    percent_change NUMERIC,
    price_high NUMERIC,
    price_low NUMERIC,
    timestamp TIMESTAMP NOT NULL
);