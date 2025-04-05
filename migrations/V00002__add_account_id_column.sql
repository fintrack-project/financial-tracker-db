CREATE EXTENSION IF NOT EXISTS pgcrypto;
ALTER TABLE users ADD COLUMN account_id UUID DEFAULT gen_random_uuid();
UPDATE users SET account_id = gen_random_uuid();
ALTER TABLE users ALTER COLUMN account_id SET NOT NULL;