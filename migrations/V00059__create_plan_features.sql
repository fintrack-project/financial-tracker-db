-- Migration to create and populate plan_group_features table
-- This is part 4 of the plan-groups approach implementation

-- Create the plan_group_features join table 
-- This will only store the "new" features introduced at each tier
CREATE TABLE plan_group_features (
  plan_group_id TEXT REFERENCES plan_groups(id),
  feature_id    INTEGER REFERENCES features(id),
  PRIMARY KEY (plan_group_id, feature_id)
);

-- Add all features that belong to free tier
INSERT INTO plan_group_features (plan_group_id, feature_id)
SELECT 'free', id FROM features WHERE name IN (
    'single_user',
    'one_year_history',
    'bulk_import',
    'daily_market_data',
    'two_categories',
    'basic_dashboard',
    'basic_reports',
    'manual_entry',
    'basic_export',
    'storage_1gb',
    'api_access_100'
);

-- Add ONLY new features introduced in basic tier (not inherited from free)
INSERT INTO plan_group_features (plan_group_id, feature_id)
SELECT 'basic', id FROM features WHERE name IN (
    'multiple_users',
    'five_year_history',
    'unlimited_categories',
    'market_data_4x',
    'advanced_dashboard',
    'advanced_reports',
    'multiple_export',
    'data_visualization',
    'email_support',
    'storage_10gb',
    'api_access_1000',
    'budget_planning',
    'recurring_transactions'
);

-- Add ONLY new features introduced in premium tier (not inherited from lower tiers)
INSERT INTO plan_group_features (plan_group_id, feature_id)
SELECT 'premium', id FROM features WHERE name IN (
    'unlimited_users',
    'unlimited_history',
    'live_market_data',
    'custom_dashboard',
    'storage_50gb',
    'unlimited_api',
    'priority_support',
    'advanced_analytics',
    'custom_reports',
    'automated_import',
    'investment_tracking',
    'tax_reporting',
    'multi_currency',
    'advanced_security',
    'team_collaboration',
    'custom_integrations',
    'automated_categorization',
    'advanced_search'
); 