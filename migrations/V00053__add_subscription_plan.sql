-- Modified subscription_plans table (removed features JSON)
CREATE TABLE subscription_plans (
    id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    stripe_price_id VARCHAR(255) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    currency VARCHAR(3) DEFAULT 'USD',
    interval VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);