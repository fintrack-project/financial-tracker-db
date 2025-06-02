CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY, -- Unique transaction identifier
    account_id UUID NOT NULL, -- FOREIGN KEY TO ACCOUNTS TABLE
    DATE DATE NOT NULL, -- Transaction date
    asset_name VARCHAR(100) NOT NULL, -- Name of the asset
    credit NUMERIC(10, 2) DEFAULT 0, -- Credit amount
    debit NUMERIC(10, 2) DEFAULT 0, -- Debit amount
    total_balance_before NUMERIC(10, 2) NOT NULL, -- Balance before the transaction
    total_balance_after NUMERIC(10, 2) NOT NULL, -- Balance after the transaction
    unit VARCHAR(10) NOT NULL, -- Currency unit (e.g., USD)
    FOREIGN KEY (account_id) REFERENCES accounts(account_id) ON DELETE CASCADE
);