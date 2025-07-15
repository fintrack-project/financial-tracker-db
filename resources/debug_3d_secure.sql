-- Debug 3D Secure Payment Issue
-- This script helps identify the current state of subscriptions and payment intents

-- 1. Check all recent subscriptions
SELECT 
    us.id,
    us.account_id,
    us.stripe_subscription_id,
    us.status as subscription_status,
    us.is_active as subscription_active,
    us.created_at,
    us.last_payment_date,
    us.next_billing_date
FROM user_subscriptions us
ORDER BY us.created_at DESC
LIMIT 10;

-- 2. Check all recent payment intents
SELECT 
    pi.id,
    pi.account_id,
    pi.stripe_payment_intent_id,
    pi.amount,
    pi.currency,
    pi.status as payment_status,
    pi.payment_method_id,
    pi.requires_action,
    pi.metadata,
    pi.created_at
FROM payment_intents pi
ORDER BY pi.created_at DESC
LIMIT 10;

-- 3. Find subscriptions with incomplete status but active flag
SELECT 
    us.id,
    us.account_id,
    us.stripe_subscription_id,
    us.status as subscription_status,
    us.is_active as subscription_active,
    us.created_at,
    us.last_payment_date
FROM user_subscriptions us
WHERE us.status = 'incomplete' AND us.is_active = true
ORDER BY us.created_at DESC;

-- 4. Find payment intents that are incomplete but have active subscriptions
SELECT 
    pi.stripe_payment_intent_id,
    pi.status as payment_status,
    pi.amount,
    pi.currency,
    pi.metadata,
    us.stripe_subscription_id,
    us.status as subscription_status,
    us.is_active as subscription_active
FROM payment_intents pi
JOIN user_subscriptions us ON pi.account_id = us.account_id
WHERE pi.status IN ('requires_action', 'processing', 'incomplete')
    AND us.is_active = true
ORDER BY pi.created_at DESC;

-- 5. Check for any payment intents with 3D Secure metadata
SELECT 
    pi.stripe_payment_intent_id,
    pi.status as payment_status,
    pi.metadata,
    pi.created_at
FROM payment_intents pi
WHERE pi.metadata LIKE '%3d_secure%' 
   OR pi.metadata LIKE '%requires_action%'
   OR pi.status = 'requires_action'
ORDER BY pi.created_at DESC;

-- 6. Get the most recent subscription for debugging
SELECT 
    'Most Recent Subscription' as info,
    us.id,
    us.account_id,
    us.stripe_subscription_id,
    us.status as subscription_status,
    us.is_active as subscription_active,
    us.created_at,
    us.last_payment_date
FROM user_subscriptions us
ORDER BY us.created_at DESC
LIMIT 1;

-- 7. Get the most recent payment intent for debugging
SELECT 
    'Most Recent Payment Intent' as info,
    pi.id,
    pi.account_id,
    pi.stripe_payment_intent_id,
    pi.amount,
    pi.currency,
    pi.status as payment_status,
    pi.payment_method_id,
    pi.requires_action,
    pi.metadata,
    pi.created_at
FROM payment_intents pi
ORDER BY pi.created_at DESC
LIMIT 1; 