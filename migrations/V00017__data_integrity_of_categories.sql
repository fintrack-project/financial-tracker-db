ALTER TABLE categories ADD CONSTRAINT unique_account_category_name UNIQUE (account_id, category_name);