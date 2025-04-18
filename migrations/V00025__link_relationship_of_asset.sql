INSERT INTO asset (account_id, asset_name, symbol, unit, updated_at)
SELECT DISTINCT t.account_id, t.asset_name, t.symbol, t.unit, CURRENT_TIMESTAMP
FROM transactions t
WHERE NOT EXISTS (
    SELECT 1
    FROM asset a
    WHERE a.account_id = t.account_id AND a.asset_name = t.asset_name
);
-- Add a foreign key to enforce the relationship with the `asset` table
ALTER TABLE transactions
ADD CONSTRAINT transactions_account_asset_fkey
FOREIGN KEY (account_id, asset_name)
REFERENCES asset (account_id, asset_name)
ON DELETE CASCADE;

-- Add a foreign key to enforce the relationship with the `asset` table
ALTER TABLE holdings_monthly
ADD CONSTRAINT holdings_monthly_account_asset_fkey
FOREIGN KEY (account_id, asset_name)
REFERENCES asset (account_id, asset_name)
ON DELETE CASCADE;

-- Add a foreign key to enforce the relationship with the `asset` table
ALTER TABLE holdings_categories
ADD CONSTRAINT holdings_categories_account_asset_fkey
FOREIGN KEY (account_id, asset_name)
REFERENCES asset (account_id, asset_name)
ON DELETE CASCADE;

-- Add a foreign key to enforce the relationship with the `asset` table
ALTER TABLE holdings
ADD CONSTRAINT holdings_account_asset_fkey
FOREIGN KEY (account_id, asset_name)
REFERENCES asset (account_id, asset_name)
ON DELETE CASCADE;