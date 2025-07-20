-- Migration to insert initial subscription policy records
-- This provides default policy content for the subscription system

-- Insert initial policy records
INSERT INTO subscription_policies (version, policy_type, content, effective_date) VALUES
('1.0.0', 'general', '{"title": "FinTrack Subscription Policy", "sections": ["overview", "upgrades", "downgrades", "cancellations", "billing", "data", "support"]}', CURRENT_TIMESTAMP),
('1.0.0', 'upgrade', '{"title": "Subscription Upgrades", "content": "Upgrades take effect immediately with prorated billing."}', CURRENT_TIMESTAMP),
('1.0.0', 'downgrade', '{"title": "Subscription Downgrades", "content": "Downgrades take effect at the end of the current billing period."}', CURRENT_TIMESTAMP),
('1.0.0', 'cancellation', '{"title": "Subscription Cancellations", "content": "Cancellations continue service until the end of the current billing period."}', CURRENT_TIMESTAMP); 