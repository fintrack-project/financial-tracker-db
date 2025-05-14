-- Drop the forex table if it exists
DROP TABLE IF EXISTS forex;

-- Create watchlist data table
CREATE TABLE watchlist_data (
    id SERIAL PRIMARY KEY,
    account_id UUID NOT NULL,
    symbol VARCHAR(10) NOT NULL,
    asset_type VARCHAR(255) NOT NULL,
    CONSTRAINT unique_account_symbol_asset_type UNIQUE (account_id, symbol, asset_type)
);