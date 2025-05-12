-- Migration to drop the now-redundant subscription_plan_features table
-- Now that we have plan_features VIEW, the original subscription_plan_features table is redundant
 
-- Check if the table exists and drop it
DROP TABLE IF EXISTS subscription_plan_features; 