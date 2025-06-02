-- Create a partial unique index to enforce uniqueness only when is_default = TRUE
CREATE UNIQUE INDEX unique_default_currency_per_account
ON account_currencies (account_id)
WHERE is_default = TRUE;