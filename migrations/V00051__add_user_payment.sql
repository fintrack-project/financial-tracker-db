CREATE TABLE payment_methods (
    id SERIAL PRIMARY KEY,
    account_id UUID NOT NULL REFERENCES users(account_id) ON DELETE CASCADE, -- Foreign key to users table
    stripe_payment_method_id VARCHAR(255) NOT NULL, -- Stripe's payment method ID
    type VARCHAR(255) NOT NULL, -- Type of payment method (e.g., "card", "bank_transfer")
    card_last4 VARCHAR(4), -- Last 4 digits of the card
    card_brand VARCHAR(255), -- Brand of the card (e.g., "visa", "mastercard")
    card_exp_month VARCHAR(2), -- Expiration month of the card
    card_exp_year VARCHAR(4), -- Expiration year of the card
    is_default BOOLEAN NOT NULL DEFAULT FALSE, -- Whether this is the default payment method
    billing_address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
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