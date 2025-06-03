ALTER TABLE holdings
ADD CONSTRAINT unique_account_date_asset
UNIQUE (account_id, date, asset_name);