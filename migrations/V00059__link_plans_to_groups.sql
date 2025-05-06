-- Migration to link subscription plans to plan groups
-- This is part 3 of the plan-groups approach implementation

-- First, insert subscription plans if they don't exist already
INSERT INTO subscription_plans (id, name, stripe_price_id, amount, currency, interval)
SELECT * FROM (
    SELECT 'plan_free'::VARCHAR(255), 'Free'::VARCHAR(100), 'price_free'::VARCHAR(255), 0.00::DECIMAL(10,2), 'USD'::VARCHAR(3), 'month'::VARCHAR(20) UNION ALL
    SELECT 'plan_basic', 'Basic', 'price_basic_monthly', 4.99, 'USD', 'month' UNION ALL
    SELECT 'plan_basic_annual', 'Basic Annual', 'price_basic_annual', 47.88, 'USD', 'year' UNION ALL
    SELECT 'plan_premium', 'Premium', 'price_premium_monthly', 9.99, 'USD', 'month' UNION ALL
    SELECT 'plan_premium_annual', 'Premium Annual', 'price_premium_annual', 95.88, 'USD', 'year'
) AS new_plans(id, name, stripe_price_id, amount, currency, interval)
WHERE NOT EXISTS (
    SELECT 1 FROM subscription_plans WHERE id = new_plans.id
);

-- Add plan_group_id column to subscription_plans table
ALTER TABLE subscription_plans 
  ADD COLUMN plan_group_id TEXT REFERENCES plan_groups(id);

-- Assign plan groups to subscription plans
UPDATE subscription_plans SET plan_group_id = 'free' 
  WHERE id = 'plan_free';
  
UPDATE subscription_plans SET plan_group_id = 'basic' 
  WHERE id IN ('plan_basic', 'plan_basic_annual');
  
UPDATE subscription_plans SET plan_group_id = 'premium' 
  WHERE id IN ('plan_premium', 'plan_premium_annual'); 