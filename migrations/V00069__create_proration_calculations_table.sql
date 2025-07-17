-- Migration to create proration calculations table
-- This caches proration calculations for performance optimization

-- Calculation cache for performance optimization
CREATE TABLE proration_calculations (
    id SERIAL PRIMARY KEY,
    calculation_hash VARCHAR(64) UNIQUE NOT NULL,
    from_plan_id VARCHAR(255),
    to_plan_id VARCHAR(255),
    days_remaining INTEGER,
    proration_amount DECIMAL(10,2),
    next_billing_amount DECIMAL(10,2),
    calculation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP NOT NULL
);

-- Create indexes for proration_calculations table
CREATE INDEX idx_proration_calculations_hash ON proration_calculations(calculation_hash);
CREATE INDEX idx_proration_calculations_expires ON proration_calculations(expires_at); 