-- Migration to add additional Stripe-related columns to payment_intents table

ALTER TABLE payment_intents
    ADD COLUMN stripe_customer_id VARCHAR(255),
    ADD COLUMN setup_future_usage VARCHAR(20),
    ADD COLUMN payment_method_types VARCHAR(255),
    ADD COLUMN next_action TEXT,
    ADD COLUMN last_payment_error TEXT,
    ADD COLUMN cancellation_reason VARCHAR(50),
    ADD COLUMN capture_method VARCHAR(20),
    ADD COLUMN confirmation_method VARCHAR(20),
    ADD COLUMN requires_action BOOLEAN,
    ADD COLUMN metadata TEXT; 