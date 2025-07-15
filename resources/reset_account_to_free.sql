-- Reset Account to Free Plan Subscription
-- Usage: Replace 'YOUR_ACCOUNT_ID_HERE' with the actual account ID you want to reset
-- Run this script in your PostgreSQL database

-- Set the account ID to reset (replace with actual UUID)
DO $$
DECLARE
    target_account_id UUID := 'bcbf7c33-e1a5-4feb-942a-6eda9f746990'::UUID;
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
        status = 'active',
        is_active = true,
        cancel_at_period_end = false,
        pending_plan_change = false,
        subscription_start_date = NOW(),
        subscription_end_date = NULL,
        next_billing_date = NULL,
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
            cancel_at_period_end,
            pending_plan_change,
            subscription_start_date,
            subscription_end_date,
            next_billing_date,
            last_payment_date,
            created_at
        ) VALUES (
            target_account_id,
            free_plan_id,
            'free_' || target_account_id::TEXT,
            NULL, -- No Stripe customer for free plan
            'active',
            true,
            false,
            false,
            NOW(),
            NULL,
            NULL,
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
    us.pending_plan_change,
    us.subscription_start_date,
    us.next_billing_date,
    COUNT(pi.id) as payment_intent_count,
    COUNT(pm.id) as payment_method_count
FROM financial_tracker.user_subscriptions us
LEFT JOIN financial_tracker.payment_intents pi ON us.account_id = pi.account_id
LEFT JOIN financial_tracker.payment_methods pm ON us.account_id = pm.account_id
WHERE us.account_id = 'bcbf7c33-e1a5-4feb-942a-6eda9f746990'::UUID
GROUP BY us.account_id, us.plan_id, us.stripe_subscription_id, us.status, us.is_active, us.pending_plan_change, us.subscription_start_date, us.next_billing_date; 