-- Table to store feature flags for each user
CREATE TABLE user_feature_flags (
    id SERIAL PRIMARY KEY,
    account_id UUID NOT NULL REFERENCES accounts(account_id) ON DELETE CASCADE,
    feature_flag VARCHAR(255) NOT NULL, -- Name of the feature flag
    is_enabled BOOLEAN NOT NULL DEFAULT FALSE -- Whether the feature is enabled
);