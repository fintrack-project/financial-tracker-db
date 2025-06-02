-- Trigger function to insert default currency (USD) for new accounts
CREATE OR REPLACE FUNCTION add_default_currency()
RETURNS TRIGGER AS $$
BEGIN
    -- Insert USD as the default currency for the new account
    INSERT INTO account_currencies (account_id, currency, is_default)
    VALUES (NEW.id, 'USD', TRUE);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger to call the function after inserting a new account
CREATE TRIGGER add_default_currency_trigger
AFTER INSERT ON accounts
FOR EACH ROW
EXECUTE FUNCTION add_default_currency();