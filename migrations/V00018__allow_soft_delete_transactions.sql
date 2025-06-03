-- Add `deleted_at` column to `transactions` table
ALTER TABLE transactions ADD COLUMN deleted_at TIMESTAMP;

-- Create an index on `deleted_at` to optimize queries filtering by this column
CREATE INDEX idx_transactions_deleted_at ON transactions (deleted_at);