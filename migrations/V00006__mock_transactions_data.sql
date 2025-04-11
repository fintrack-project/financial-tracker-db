-- Retrieve account_id for the given user_id values
WITH user_accounts AS (
    SELECT u.account_id, u.user_id
    FROM users u
    WHERE u.user_id IN ('user1', 'user2', 'user3')
)

-- Insert mock transactions for each account_id
INSERT INTO transactions (account_id, date, asset_name, credit, debit, total_balance_before, total_balance_after, unit)
VALUES
    -- Mock transactions for rndusr1
    ((SELECT account_id FROM user_accounts WHERE user_id = 'user1'), '2025-04-01', 'USD', 100.00, 0.00, 0.00, 100.00, 'USD'),
    ((SELECT account_id FROM user_accounts WHERE user_id = 'user1'), '2025-04-02', 'USD', 0.00, 50.00, 100.00, 50.00, 'USD'),
    ((SELECT account_id FROM user_accounts WHERE user_id = 'user1'), '2025-04-03', 'USD', 200.00, 0.00, 50.00, 250.00, 'USD'),

    -- Mock transactions for rndusr2
    ((SELECT account_id FROM user_accounts WHERE user_id = 'user2'), '2025-04-01', 'BTC', 0.01, 0.00, 0.00, 0.01, 'BTC'),
    ((SELECT account_id FROM user_accounts WHERE user_id = 'user2'), '2025-04-02', 'BTC', 0.00, 0.005, 0.01, 0.005, 'BTC'),
    ((SELECT account_id FROM user_accounts WHERE user_id = 'user2'), '2025-04-03', 'BTC', 0.02, 0.00, 0.005, 0.025, 'BTC'),

    -- Mock transactions for rndusr3
    ((SELECT account_id FROM user_accounts WHERE user_id = 'user3'), '2025-04-01', 'EUR', 500.00, 0.00, 0.00, 500.00, 'EUR'),
    ((SELECT account_id FROM user_accounts WHERE user_id = 'user3'), '2025-04-02', 'EUR', 0.00, 200.00, 500.00, 300.00, 'EUR'),
    ((SELECT account_id FROM user_accounts WHERE user_id = 'user3'), '2025-04-03', 'EUR', 100.00, 0.00, 300.00, 400.00, 'EUR');