-- Migration to create the plan_groups structure
-- This is part 2 of the plan-groups approach implementation

-- Create the plan_groups lookup table
CREATE TABLE plan_groups (
  id   TEXT        PRIMARY KEY,       -- e.g. 'free','basic','premium'
  lvl  SMALLINT    NOT NULL UNIQUE,   -- numeric order: 0,1,2...
  name TEXT        NOT NULL           -- human-readable name
);

-- Insert the plan groups
INSERT INTO plan_groups (id, lvl, name) VALUES
  ('free',     0, 'Free'),
  ('basic',    1, 'Basic'),
  ('premium',  2, 'Premium'); 