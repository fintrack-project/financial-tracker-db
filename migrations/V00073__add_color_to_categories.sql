-- Add color column to categories table
ALTER TABLE categories
ADD COLUMN color VARCHAR(7) DEFAULT '#0000FF'; -- Default color is blue, using hex format

-- Update existing categories with default blue color
UPDATE categories
SET color = '#0000FF'
WHERE color IS NULL OR color = '#000000';