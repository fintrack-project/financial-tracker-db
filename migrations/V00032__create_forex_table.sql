CREATE TABLE forex_data (
    id SERIAL PRIMARY KEY,               -- Unique identifier for each row
    symbol VARCHAR(10) NOT NULL,         -- Currency symbol (e.g., USD, EUR)
    price NUMERIC(15, 6) NOT NULL,       -- Current price of the currency
    price_change NUMERIC(15, 6),         -- Absolute price change
    percent_change NUMERIC(10, 4),       -- Percentage price change
    high NUMERIC(15, 6),                 -- Highest price in the period
    low NUMERIC(15, 6),                  -- Lowest price in the period
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Last updated timestamp
    CONSTRAINT unique_symbol UNIQUE (symbol) -- Ensure each symbol is unique
);