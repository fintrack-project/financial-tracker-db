-- Create the holdings table
CREATE TABLE holdings (
    id SERIAL PRIMARY KEY, -- Unique identifier for the holdings record
    account_id UUID NOT NULL REFERENCES accounts(account_id) ON DELETE CASCADE, -- Foreign key to accounts table
    date DATE NOT NULL, -- Date of the most recent holding
    asset_name VARCHAR(255) NOT NULL, -- Name of the asset (e.g., USD, BTC, etc.)
    total_balance NUMERIC(15, 2) NOT NULL, -- Total balance of the asset
    unit VARCHAR(50) NOT NULL, -- Unit of the asset (e.g., USD, BTC, etc.)
    -- Comment: This table tracks the most recent holdings of the user. 
    -- Updates are triggered synchronously when transactions are confirmed in the backend.
    UNIQUE (account_id, asset_name) -- Ensure one record per account and asset
);

-- Create the holdings_history table
CREATE TABLE holdings_history (
    id SERIAL PRIMARY KEY, -- Unique identifier for the historical holdings record
    account_id UUID NOT NULL REFERENCES accounts(account_id) ON DELETE CASCADE, -- Foreign key to accounts table
    date DATE NOT NULL, -- Date of the historical holding
    asset_name VARCHAR(255) NOT NULL, -- Name of the asset (e.g., USD, BTC, etc.)
    total_balance NUMERIC(15, 2) NOT NULL, -- Total balance of the asset
    unit VARCHAR(50) NOT NULL, -- Unit of the asset (e.g., USD, BTC, etc.)
    -- Comment: This table tracks historical holdings of the user.
    -- Holdings are calculated synchronously by the backend when transactions are confirmed.
    -- If a confirmed transaction includes a past date, this table should be updated by recalculating the values.
    UNIQUE (account_id, asset_name, date) -- Ensure one record per account, asset, and date
);