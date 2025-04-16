ALTER TABLE holdings_categories
ADD COLUMN category VARCHAR(255), -- Column to store the category name
ADD COLUMN subcategory VARCHAR(255); -- Column to store the subcategory name

UPDATE holdings_categories h
SET 
    category = COALESCE(c1.category_name, c2.category_name), -- Use parent category if available, otherwise use the current category
    subcategory = CASE 
        WHEN c1.category_name IS NOT NULL THEN c2.category_name -- Subcategory if parent exists
        ELSE NULL -- No subcategory if it's a parent category
    END
FROM 
    categories c2
LEFT JOIN 
    categories c1 ON c1.category_id = c2.parent_id
WHERE 
    h.category_id = c2.category_id;