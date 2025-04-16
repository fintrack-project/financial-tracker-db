CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY, -- Unique identifier for the category
    account_id UUID NOT NULL REFERENCES users(account_id) ON DELETE CASCADE, -- Links category to a user
    parent_id INT REFERENCES categories(category_id) ON DELETE CASCADE, -- Parent category (NULL for top-level categories)
    category_name VARCHAR(255) NOT NULL, -- Name of the category
    level INT NOT NULL, -- Level in the hierarchy (e.g., 1 for top-level, 2 for subcategories)
    priority INT DEFAULT 0 NOT NULL, -- Priority for ordering categories and subcategories
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Tracks the last update time
    UNIQUE (account_id, category_name, parent_id) -- Ensure unique category names under the same parent for a user
);

-- Attach the reusable trigger to the categories table
CREATE TRIGGER trigger_update_categories_updated_at
BEFORE UPDATE ON categories
FOR EACH ROW
EXECUTE FUNCTION update_updated_at();