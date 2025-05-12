-- Table to store notification preferences for each user
CREATE TABLE user_notification_preferences (
    id SERIAL PRIMARY KEY,
    account_id UUID NOT NULL REFERENCES users(account_id) ON DELETE CASCADE,
    notification_type VARCHAR(255) NOT NULL, -- Type of notification (e.g., email, SMS)
    is_enabled BOOLEAN NOT NULL DEFAULT FALSE -- Whether the notification is enabled
);