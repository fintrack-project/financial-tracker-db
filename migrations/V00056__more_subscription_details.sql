ALTER TABLE user_subscriptions
ADD COLUMN stripe_customer_id varchar(255),
ADD COLUMN plan_id varchar(255),
ADD COLUMN cancel_at_period_end boolean DEFAULT false,
ADD CONSTRAINT fk_plan FOREIGN KEY (plan_id) REFERENCES subscription_plans(id);