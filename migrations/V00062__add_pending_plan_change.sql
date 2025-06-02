-- Migration to add pending_plan_change column to user_subscriptions table

ALTER TABLE user_subscriptions
    ADD COLUMN pending_plan_change BOOLEAN NOT NULL DEFAULT false;

-- Update existing records to ensure pending_plan_change is false
UPDATE user_subscriptions
SET pending_plan_change = false
WHERE pending_plan_change IS NULL; 