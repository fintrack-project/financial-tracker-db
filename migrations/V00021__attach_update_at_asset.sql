-- Attach the reusable trigger to the asset table
CREATE TRIGGER trigger_update_asset_updated_at
BEFORE UPDATE ON asset
FOR EACH ROW
EXECUTE FUNCTION update_updated_at();

-- Update existing `asset` data to set `updated_at` to the current timestamp if it is NULL
UPDATE asset
SET updated_at = CURRENT_TIMESTAMP
WHERE updated_at IS NULL;