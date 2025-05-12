-- Add the `change` column to the `market_data` table
ALTER TABLE market_data
ADD COLUMN change NUMERIC(15, 6);

-- Add the `high` column to the `market_data` table
ALTER TABLE market_data
ADD COLUMN high NUMERIC(15, 6);

-- Add the `low` column to the `market_data` table
ALTER TABLE market_data
ADD COLUMN low NUMERIC(15, 6);