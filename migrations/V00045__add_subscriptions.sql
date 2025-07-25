CREATE TABLE user_subscriptions (
    id SERIAL PRIMARY KEY,
    account_id UUID NOT NULL REFERENCES accounts(account_id) ON DELETE CASCADE, -- Foreign key to accounts table
    stripe_subscription_id VARCHAR(255) NOT NULL, -- Stripe's subscription ID
    subscription_start_date TIMESTAMP NOT NULL,
    subscription_end_date TIMESTAMP,
    is_active BOOLEAN DEFAULT false,
    last_payment_date TIMESTAMP,
    next_billing_date TIMESTAMP,
    status VARCHAR(50), -- Stripe standard statuses: "active", "canceled", "incomplete", "incomplete_expired", "past_due", "trialing", "unpaid", "paused"
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);