-- Add asset_name and price_unit columns to the market_data table
ALTER TABLE market_data
ADD COLUMN asset_name VARCHAR(255), -- Name of the asset (e.g., Bitcoin, Ethereum)
ADD COLUMN price_unit VARCHAR(50); -- Unit of the price (e.g., USD, EUR, BTC)