CREATE TABLE user_subscriptions (
    id SERIAL PRIMARY KEY,
    account_id UUID NOT NULL REFERENCES users(account_id) ON DELETE CASCADE, -- Foreign key to users table
    stripe_subscription_id VARCHAR(255) NOT NULL, -- Stripe's subscription ID
    subscription_start_date TIMESTAMP NOT NULL,
    subscription_end_date TIMESTAMP,
    is_active BOOLEAN DEFAULT false,
    last_payment_date TIMESTAMP,
    next_billing_date TIMESTAMP,
    status VARCHAR(50), -- Subscription status (e.g., "active", "canceled")
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);