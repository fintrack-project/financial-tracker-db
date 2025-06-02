-- Drop the dependent trigger before dropping the function
DROP TRIGGER IF EXISTS add_default_currency_trigger ON accounts;

-- Drop the existing function
DROP FUNCTION IF EXISTS add_default_currency();

-- Recreate the function
CREATE OR REPLACE FUNCTION add_default_currency()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO account_currencies (account_id, currency, is_default)
    VALUES (NEW.account_id, 'USD', TRUE);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Recreate the trigger to call the function after an account is created
CREATE TRIGGER add_default_currency_trigger
AFTER INSERT ON accounts
FOR EACH ROW
EXECUTE FUNCTION add_default_currency();