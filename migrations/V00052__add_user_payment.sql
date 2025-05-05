CREATE TABLE payment_methods (
    id SERIAL PRIMARY KEY,
    account_id UUID NOT NULL REFERENCES users(account_id) ON DELETE CASCADE, -- Foreign key to users table
    stripe_payment_method_id VARCHAR(255) NOT NULL, -- Stripe's payment method ID
    last4 VARCHAR(4), -- Last 4 digits of the card
    expiration_date VARCHAR(5), -- MM/YY
    billing_address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE payment_intents (
    id SERIAL PRIMARY KEY,
    account_id UUID NOT NULL REFERENCES users(account_id) ON DELETE CASCADE, -- Foreign key to users table
    stripe_payment_intent_id VARCHAR(255) NOT NULL, -- Stripe's payment intent ID
    amount BIGINT NOT NULL, -- Amount in cents
    currency VARCHAR(10) NOT NULL, -- e.g., "usd"
    status VARCHAR(50), -- Payment status (e.g., "succeeded", "failed")
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);