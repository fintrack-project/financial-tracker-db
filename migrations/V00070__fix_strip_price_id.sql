UPDATE subscription_plans 
SET stripe_price_id = 'price_1RO8MtB2rinDvlePyKWhcHRg'
WHERE name = 'Basic' AND id = 'plan_basic';

UPDATE subscription_plans 
SET stripe_price_id = 'price_1RO8GYB2rinDvlePJTSVrxcw'
WHERE name = 'Basic Annual' AND id = 'plan_basic_annual';

UPDATE subscription_plans 
SET stripe_price_id = 'price_1RO8N7B2rinDvlePdF1JOZaO'
WHERE name = 'Premium' AND id = 'plan_premium';

UPDATE subscription_plans 
SET stripe_price_id = 'price_1RO8H0B2rinDvlePBhdLnB9C'
WHERE name = 'Premium Annual' AND id = 'plan_premium_annual';