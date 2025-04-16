ALTER TABLE holdings_categories
ADD CONSTRAINT unique_account_asset_category
UNIQUE (account_id, asset_name, category);