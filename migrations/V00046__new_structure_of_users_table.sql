-- Add new columns to the `users` table
ALTER TABLE users ADD COLUMN account_tier varchar(50) DEFAULT 'free'; -- Account tier (e.g., free, premium)
ALTER TABLE users ADD COLUMN subscription_start_date timestamp; -- Subscription start date
ALTER TABLE users ADD COLUMN subscription_end_date timestamp; -- Subscription end date
ALTER TABLE users ADD COLUMN is_active_subscription boolean DEFAULT false; -- Active subscription status
ALTER TABLE users ADD COLUMN payment_method varchar(50); -- Preferred payment method
ALTER TABLE users ADD COLUMN billing_address varchar(255); -- Billing address
ALTER TABLE users ADD COLUMN last_payment_date timestamp; -- Last payment date
ALTER TABLE users ADD COLUMN next_billing_date timestamp; -- Next billing date
ALTER TABLE users ADD COLUMN payment_status varchar(50); -- Payment status (e.g., paid, pending)
ALTER TABLE users ADD COLUMN timezone varchar(50); -- Timezone
ALTER TABLE users ADD COLUMN two_factor_enabled boolean DEFAULT false; -- Two-factor authentication enabled
ALTER TABLE users ADD COLUMN two_factor_secret varchar(50); -- Two-factor authentication secret
ALTER TABLE users ADD COLUMN last_login timestamp; -- Last login time
ALTER TABLE users ADD COLUMN failed_login_attempts integer DEFAULT 0; -- Failed login attempts
ALTER TABLE users ADD COLUMN account_locked boolean DEFAULT false; -- Account locked status
ALTER TABLE users ADD COLUMN signup_date timestamp DEFAULT CURRENT_TIMESTAMP; -- Signup date
ALTER TABLE users ADD COLUMN last_activity_date timestamp; -- Last activity date
ALTER TABLE users ADD COLUMN storage_limit integer DEFAULT 0; -- Storage limit (e.g., in MB)
ALTER TABLE users ADD COLUMN api_usage_limit integer DEFAULT 0; -- API usage limit
ALTER TABLE users ADD COLUMN email_verified boolean DEFAULT false; -- Email verified status
