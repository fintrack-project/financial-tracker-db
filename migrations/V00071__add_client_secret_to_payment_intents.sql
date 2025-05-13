-- Add client_secret column to payment_intents table
ALTER TABLE payment_intents
ADD COLUMN client_secret VARCHAR(255); 

ALTER TABLE payment_intents
ADD COLUMN payment_method_id VARCHAR(255);

ALTER TABLE payment_intents 
ALTER COLUMN amount TYPE numeric(10,2) USING amount::numeric(10,2);

-- Add unique constraint for account_id in user_subscriptions
ALTER TABLE user_subscriptions
ADD CONSTRAINT uk_user_subscriptions_account_id UNIQUE (account_id);