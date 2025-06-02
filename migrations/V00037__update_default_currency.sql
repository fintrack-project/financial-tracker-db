-- Insert 'USD' as the default currency for all existing accounts
INSERT INTO account_currencies (account_id, currency, is_default)
SELECT account_id AS account_id, 'USD' AS currency, TRUE AS is_default
FROM accounts
WHERE account_id NOT IN (
    SELECT account_id
    FROM account_currencies
);