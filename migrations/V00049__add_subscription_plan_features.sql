-- Define which features are included in each subscription plan
CREATE TABLE subscription_plan_features (
    id SERIAL PRIMARY KEY,
    plan_id VARCHAR(255) NOT NULL,
    feature_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (plan_id) REFERENCES subscription_plans(id),
    FOREIGN KEY (feature_id) REFERENCES features(id),
    UNIQUE(plan_id, feature_id)
);