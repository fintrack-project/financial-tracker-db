-- Rename the column `price_change` to `change` in the `forex_data` table
ALTER TABLE forex_data
RENAME COLUMN price_change TO change;