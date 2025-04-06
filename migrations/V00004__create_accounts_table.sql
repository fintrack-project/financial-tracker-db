-- Create the accounts table
CREATE TABLE accounts (
    account_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Populate the accounts table with existing account_id values from users
INSERT INTO accounts (account_id)
SELECT DISTINCT account_id
FROM users;

-- Alter the users table to make account_id a foreign key
ALTER TABLE users
ADD CONSTRAINT fk_users_account_id FOREIGN KEY (account_id) REFERENCES accounts(account_id) ON DELETE CASCADE;