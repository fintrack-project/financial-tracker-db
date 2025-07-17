-- Migration to create subscription policies table
-- This is part of the subscription policy implementation

-- Policy management table
CREATE TABLE subscription_policies (
    id SERIAL PRIMARY KEY,
    version VARCHAR(20) NOT NULL,
    policy_type VARCHAR(50) NOT NULL, -- 'upgrade', 'downgrade', 'cancellation', 'general'
    content JSONB NOT NULL,
    effective_date TIMESTAMP NOT NULL,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for subscription_policies table
CREATE INDEX idx_subscription_policies_type_active ON subscription_policies(policy_type, is_active);
CREATE INDEX idx_subscription_policies_version ON subscription_policies(version); 