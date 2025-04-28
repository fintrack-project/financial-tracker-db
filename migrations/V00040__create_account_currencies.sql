CREATE TABLE account_currencies (
    id SERIAL PRIMARY KEY,               -- Unique identifier for each row
    account_id UUID NOT NULL,            -- Account ID (foreign key to accounts table)
    currency VARCHAR(10) NOT NULL,       -- Currency code (e.g., USD, EUR)
    is_default BOOLEAN NOT NULL DEFAULT FALSE, -- Indicates if this is the default currency
    CONSTRAINT unique_account_currency UNIQUE (account_id, currency) -- Ensure no duplicate currencies per account
);