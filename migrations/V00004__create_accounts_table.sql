-- Create the accounts table
CREATE TABLE accounts (
    account_id UUID PRIMARY KEY, -- Primary key
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Timestamp for account creation
    CONSTRAINT fk_accounts_account_id FOREIGN KEY (account_id) REFERENCES users(account_id) ON DELETE CASCADE -- Foreign key from users table
);

-- Populate the accounts table with existing account_id values from users
INSERT INTO accounts (account_id)
SELECT DISTINCT account_id
FROM users;
