-- Migration to create policy acceptances table
-- This tracks user acceptance of subscription policies

-- Policy acceptance tracking table
CREATE TABLE policy_acceptances (
    id SERIAL PRIMARY KEY,
    account_id UUID NOT NULL REFERENCES accounts(account_id) ON DELETE CASCADE,
    policy_version VARCHAR(20) NOT NULL,
    policy_type VARCHAR(50) NOT NULL,
    accepted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip_address VARCHAR(45),
    user_agent TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for policy_acceptances table
CREATE INDEX idx_policy_acceptances_account ON policy_acceptances(account_id);
CREATE INDEX idx_policy_acceptances_type_version ON policy_acceptances(policy_type, policy_version); 