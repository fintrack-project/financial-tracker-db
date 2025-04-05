-- Drop the existing primary key constraint
ALTER TABLE users DROP CONSTRAINT users_pkey;

-- Drop the id column
ALTER TABLE users DROP COLUMN id;

-- Set account_id as the new primary key
ALTER TABLE users ADD CONSTRAINT users_pkey PRIMARY KEY (account_id);