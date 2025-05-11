-- Migration to update annual plan prices for Basic and Premium plans

UPDATE subscription_plans 
SET amount = 47.90
WHERE id = 'plan_basic_annual';

UPDATE subscription_plans 
SET amount = 95.90
WHERE id = 'plan_premium_annual'; 