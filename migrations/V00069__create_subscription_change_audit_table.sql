-- Migration to create subscription change audit table
-- This logs all subscription changes for audit purposes

-- Subscription change audit log
CREATE TABLE subscription_change_audit (
    id SERIAL PRIMARY KEY,
    account_id UUID NOT NULL REFERENCES accounts(account_id) ON DELETE CASCADE,
    change_type VARCHAR(50) NOT NULL, -- 'upgrade', 'downgrade', 'cancellation', 'reactivation'
    from_plan_id VARCHAR(255),
    to_plan_id VARCHAR(255),
    policy_version VARCHAR(20),
    proration_amount DECIMAL(10,2) DEFAULT 0.00, -- Proration amount for subscription changes
    change_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip_address VARCHAR(45),
    user_agent TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for subscription_change_audit table
CREATE INDEX idx_subscription_change_audit_account ON subscription_change_audit(account_id);
CREATE INDEX idx_subscription_change_audit_date ON subscription_change_audit(change_date); 