CREATE TABLE holdings_categories (
    id SERIAL PRIMARY KEY, -- Unique identifier for the relationship
    account_id UUID NOT NULL REFERENCES users(account_id) ON DELETE CASCADE, -- Links to the user
    asset_name VARCHAR(255) NOT NULL, -- Name of the asset (e.g., Bitcoin, USD)
    category_id INT NOT NULL REFERENCES categories(category_id) ON DELETE CASCADE, -- Links to the category
    category VARCHAR(255), -- Column to store the category name
    subcategory VARCHAR(255), -- Column to store the subcategory name
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Tracks the last update time
    UNIQUE (account_id, asset_name, category) -- Ensure each asset_name is linked to only one category per user
);

-- Attach the reusable trigger to the holdings_categories table
CREATE TRIGGER trigger_update_holdings_categories_updated_at
BEFORE UPDATE ON holdings_categories
FOR EACH ROW
EXECUTE FUNCTION update_updated_at();