DELETE FROM transactions
WHERE asset_name IN ('USD', 'BTC', 'EUR');

DELETE FROM holdings
WHERE asset_name IN ('USD', 'BTC', 'EUR');

DELETE FROM holdings_monthly
WHERE asset_name IN ('USD', 'BTC', 'EUR');