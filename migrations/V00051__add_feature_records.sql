-- Migration to insert all features for subscription plans (if they don't exist)
-- This is part 1 of the plan-groups approach implementation

-- Insert all features if they don't exist yet
INSERT INTO features (name, description)
SELECT temp.feature_name, temp.feature_description
FROM (
    -- Free Tier Features
    SELECT 'single_user' as feature_name, 'Single user account' as feature_description UNION ALL
    SELECT 'one_year_history', 'Access to one year of transaction history' UNION ALL
    SELECT 'bulk_import', 'Import CSV and Excel files for bulk transaction history' UNION ALL
    SELECT 'daily_market_data', 'Daily market data updates' UNION ALL
    SELECT 'two_categories', 'Two predefined categories' UNION ALL
    SELECT 'basic_dashboard', 'Basic dashboard with essential metrics' UNION ALL
    SELECT 'basic_reports', 'Basic financial reports' UNION ALL
    SELECT 'manual_entry', 'Manual data entry' UNION ALL
    SELECT 'basic_export', 'Basic export functionality (CSV)' UNION ALL
    SELECT 'storage_1gb', '1GB storage space' UNION ALL
    SELECT 'api_access_100', 'Limited API access (100 calls/month)' UNION ALL

    -- Basic Tier Additional Features
    SELECT 'multiple_users', 'Multiple user accounts (up to 3)' UNION ALL
    SELECT 'five_year_history', 'Access to five years of transaction history' UNION ALL
    SELECT 'unlimited_categories', 'Unlimited custom categories' UNION ALL
    SELECT 'market_data_4x', '4x daily market data updates' UNION ALL
    SELECT 'advanced_dashboard', 'Enhanced dashboard with more metrics' UNION ALL
    SELECT 'advanced_reports', 'Advanced financial reports' UNION ALL
    SELECT 'multiple_export', 'Multiple export formats' UNION ALL
    SELECT 'data_visualization', 'Basic data visualization' UNION ALL
    SELECT 'email_support', 'Email support' UNION ALL
    SELECT 'storage_10gb', '10GB storage space' UNION ALL
    SELECT 'api_access_1000', 'Increased API access (1000 calls/month)' UNION ALL
    SELECT 'budget_planning', 'Basic budget planning tools' UNION ALL
    SELECT 'recurring_transactions', 'Recurring transaction setup' UNION ALL

    -- Premium Tier Additional Features
    SELECT 'unlimited_users', 'Unlimited user accounts' UNION ALL
    SELECT 'unlimited_history', 'Unlimited transaction history' UNION ALL
    SELECT 'live_market_data', 'Live market data updates' UNION ALL
    SELECT 'custom_dashboard', 'Customizable dashboard builder' UNION ALL
    SELECT 'storage_50gb', '50GB storage space' UNION ALL
    SELECT 'unlimited_api', 'Unlimited API access' UNION ALL
    SELECT 'priority_support', 'Priority support' UNION ALL
    SELECT 'advanced_analytics', 'Advanced analytics and insights' UNION ALL
    SELECT 'custom_reports', 'Custom report builder' UNION ALL
    SELECT 'automated_import', 'Automated data import' UNION ALL
    SELECT 'investment_tracking', 'Investment tracking' UNION ALL
    SELECT 'tax_reporting', 'Tax reporting tools' UNION ALL
    SELECT 'multi_currency', 'Multi-currency support' UNION ALL
    SELECT 'advanced_security', 'Advanced security features' UNION ALL
    SELECT 'team_collaboration', 'Team collaboration tools' UNION ALL
    SELECT 'custom_integrations', 'Custom integrations' UNION ALL
    SELECT 'automated_categorization', 'Automated transaction categorization' UNION ALL
    SELECT 'advanced_search', 'Advanced search and filtering'
) AS temp
WHERE NOT EXISTS (
    SELECT 1 FROM features WHERE name = temp.feature_name
); 