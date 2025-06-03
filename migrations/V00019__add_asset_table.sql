CREATE TABLE asset (
    id SERIAL PRIMARY KEY, -- Unique identifier for the asset
    account_id UUID NOT NULL, -- Links to the account owning the asset
    asset_name VARCHAR(255) NOT NULL, -- Name of the asset
    symbol VARCHAR(255) NOT NULL, -- Symbol used to fetch data
    unit VARCHAR(50) NOT NULL, -- Unit of the asset (e.g., USD, BTC)
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Tracks the last update time
    CONSTRAINT unique_account_asset_name UNIQUE (account_id, asset_name) -- Ensures (account_id, asset_name) is unique
);