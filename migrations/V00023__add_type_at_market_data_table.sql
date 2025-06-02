-- Add a new column `type` to the `market_data` table
ALTER TABLE market_data
ADD COLUMN type VARCHAR(255) NOT NULL DEFAULT 'unknown';