-- Migration to create helper views and functions for plan-feature access
-- This is part 5 of the plan-groups approach implementation

-- Create a view for easy lookup of all features for a plan
CREATE OR REPLACE VIEW plan_features AS
WITH plan_levels AS (
  SELECT 
    sp.id AS plan_id,
    sp.name AS plan_name,
    pg.id AS group_id,
    pg.lvl AS group_level
  FROM subscription_plans sp
  JOIN plan_groups pg ON sp.plan_group_id = pg.id
),
allowed_groups AS (
  SELECT 
    pl.plan_id,
    g.id AS group_id
  FROM plan_levels pl
  JOIN plan_groups g ON g.lvl <= pl.group_level
)
SELECT 
  ag.plan_id,
  f.id AS feature_id,
  f.name AS feature_name,
  f.description AS feature_description
FROM allowed_groups ag
JOIN plan_group_features pgf ON pgf.plan_group_id = ag.group_id
JOIN features f ON f.id = pgf.feature_id;

-- Create a function to check if a user has access to a specific feature
CREATE OR REPLACE FUNCTION has_feature(user_id UUID, feature_name TEXT)
RETURNS BOOLEAN AS $$
DECLARE
    has_access BOOLEAN;
BEGIN
    SELECT EXISTS (
        SELECT 1
        FROM users u
        JOIN subscriptions s ON u.id = s.user_id
        JOIN subscription_plans sp ON s.plan_id = sp.id
        JOIN plan_features pf ON sp.id = pf.plan_id
        JOIN features f ON pf.feature_id = f.id
        WHERE u.id = user_id
        AND f.name = feature_name
        AND s.status = 'active'
    ) INTO has_access;
    
    RETURN has_access;
END;
$$ LANGUAGE plpgsql; 