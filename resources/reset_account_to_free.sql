-- Reset Account to Free Plan Subscription
-- Usage: Replace 'YOUR_ACCOUNT_ID_HERE' with the actual account ID you want to reset
-- Run this script in your PostgreSQL database

-- Set the account ID to reset (replace with actual UUID)
DO $$
DECLARE
    target_account_id UUID := 'YOUR_ACCOUNT_ID_HERE'::UUID;
    free_plan_id VARCHAR(50) := 'plan_free';
BEGIN
    RAISE NOTICE 'Resetting account % to free plan...', target_account_id;
    
    -- Step 1: Delete all payment intents for this account
    DELETE FROM financial_tracker.payment_intents 
    WHERE account_id = target_account_id;
    RAISE NOTICE 'Deleted payment intents for account %', target_account_id;
    
    -- Step 2: Delete all payment methods for this account
    DELETE FROM financial_tracker.payment_methods 
    WHERE account_id = target_account_id;
    RAISE NOTICE 'Deleted payment methods for account %', target_account_id;
    
    -- Step 3: Update user subscription to free plan
    UPDATE financial_tracker.user_subscriptions 
    SET 
        plan_id = free_plan_id,
        stripe_subscription_id = 'free_' || target_account_id::TEXT,
        stripe_customer_id = target_account_id::TEXT, -- Set customer ID to account ID
        status = 'active',
        is_active = true,
        subscription_start_date = NOW(),
        subscription_end_date = NULL,
        next_billing_date = NOW() + INTERVAL '100 years', -- Free plans don't expire
        last_payment_date = NOW()
    WHERE account_id = target_account_id;
    
    -- Step 4: If no subscription exists, create one
    IF NOT FOUND THEN
        INSERT INTO financial_tracker.user_subscriptions (
            account_id,
            plan_id,
            stripe_subscription_id,
            stripe_customer_id,
            status,
            is_active,
            subscription_start_date,
            subscription_end_date,
            next_billing_date,
            last_payment_date,
            created_at
        ) VALUES (
            target_account_id,
            free_plan_id,
            'free_' || target_account_id::TEXT,
            target_account_id::TEXT, -- Set customer ID to account ID
            'active',
            true,
            NOW(),
            NULL,
            NOW() + INTERVAL '100 years', -- Free plans don't expire
            NOW(),
            NOW()
        );
        RAISE NOTICE 'Created new free subscription for account %', target_account_id;
    ELSE
        RAISE NOTICE 'Updated existing subscription to free plan for account %', target_account_id;
    END IF;
    
    RAISE NOTICE 'Account % has been successfully reset to free plan!', target_account_id;
END $$;

-- Verify the reset
SELECT 
    us.account_id,
    us.plan_id,
    us.stripe_subscription_id,
    us.status,
    us.is_active,
    us.subscription_start_date,
    us.next_billing_date,
    COUNT(pi.id) as payment_intent_count,
    COUNT(pm.id) as payment_method_count
FROM financial_tracker.user_subscriptions us
LEFT JOIN financial_tracker.payment_intents pi ON us.account_id = pi.account_id
LEFT JOIN financial_tracker.payment_methods pm ON us.account_id = pm.account_id
WHERE us.account_id = 'YOUR_ACCOUNT_ID_HERE'::UUID
GROUP BY us.account_id, us.plan_id, us.stripe_subscription_id, us.status, us.is_active, us.subscription_start_date, us.next_billing_date; 