UPDATE subscription_plans 
SET stripe_price_id = 'price_1RLfOxB2rinDvlePn2XYRYmD'
WHERE name = 'Free' AND id = 'plan_free';

UPDATE subscription_plans 
SET stripe_price_id = 'price_1RLfRlB2rinDvlePmwJJQieX'
WHERE name = 'Basic' AND id = 'plan_basic';

UPDATE subscription_plans 
SET stripe_price_id = 'price_1RLfRtB2rinDvlePFlKbkJBS'
WHERE name = 'Basic Annual' AND id = 'plan_basic_annual';

UPDATE subscription_plans 
SET stripe_price_id = 'price_1RLfSAB2rinDvleP7EfUAev5'
WHERE name = 'Premium' AND id = 'plan_premium';

UPDATE subscription_plans 
SET stripe_price_id = 'price_1RLfSVB2rinDvlePBNb6frKp'
WHERE name = 'Premium Annual' AND id = 'plan_premium_annual';