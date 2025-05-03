ALTER TABLE users ADD COLUMN phone_verified boolean DEFAULT false; -- Phone verified status

ALTER TABLE users ADD COLUMN country_code varchar(2); -- Phone verified status

-- Add a CHECK constraint to enforce that `country_code` contains only two uppercase letters
ALTER TABLE users ADD CONSTRAINT chk_country_code_format CHECK (country_code ~ '^[A-Z]{2}$');