CREATE TABLE market_data_monthly (
    id SERIAL PRIMARY KEY,          -- Unique identifier for each row
    symbol VARCHAR(255) NOT NULL,   -- Symbol of the asset (e.g., "AAPL", "BTC")
    type VARCHAR(255) NOT NULL,     -- Type of the asset (e.g., "stock", "crypto")
    price NUMERIC(15, 2) NOT NULL,  -- Price of the asset
    date DATE NOT NULL,             -- Date of the market data
    CONSTRAINT unique_symbol_type_date UNIQUE (symbol, type, date) -- Ensure unique data for each symbol, type, and date
);