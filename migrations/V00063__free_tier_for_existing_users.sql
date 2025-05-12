-- Migration to add free tier subscriptions for all existing users
-- and drop the account_tier column from the users table

-- First, add free tier subscriptions for all users who don't already have a subscription
INSERT INTO user_subscriptions (
    account_id, 
    stripe_subscription_id, 
    stripe_customer_id,
    plan_id,
    subscription_start_date,
    next_billing_date,
    status,
    is_active,
    created_at
)
SELECT 
    u.account_id,
    'free_' || u.account_id, -- Placeholder for Stripe subscription ID
    u.account_id::text, -- Placeholder for Stripe customer ID
    'plan_free', -- Free plan ID
    NOW(), -- subscription_start_date
    NOW() + INTERVAL '100 years', -- next_billing_date (free plans don't expire)
    'active', -- status
    TRUE, -- is_active
    NOW() -- created_at
FROM 
    users u
LEFT JOIN
    user_subscriptions us ON u.account_id = us.account_id
WHERE 
    us.id IS NULL;

-- Now, drop the account_tier column from the users table if it exists
DO $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM information_schema.columns
        WHERE table_name = 'users'
        AND column_name = 'account_tier'
    ) THEN
        ALTER TABLE users DROP COLUMN account_tier;
    END IF;
END $$; 