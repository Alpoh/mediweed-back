-- Insert roles if they don't exist
INSERT INTO roles (name) VALUES ('ROLE_ADMIN') ON CONFLICT (name) DO NOTHING;
INSERT INTO roles (name) VALUES ('ROLE_CLIENT') ON CONFLICT (name) DO NOTHING;

-- Insert default admin user if it doesn't exist
-- Password is 'password' encoded with BCrypt
INSERT INTO users (username, password, email)
SELECT 'admin', '$2a$10$G.w.1.h.X2.jV.8.g.9U3.W.Z.Y.X.Z.Y.X.Z.Y.X.Z.Y', 'admin@example.com'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE username = 'admin');

-- Assign ROLE_ADMIN to the admin user
INSERT INTO user_roles (user_id, role_id)
SELECT u.id, r.id
FROM users u, roles r
WHERE u.username = 'admin' AND r.name = 'ROLE_ADMIN'
  AND NOT EXISTS (SELECT 1 FROM user_roles ur WHERE ur.user_id = u.id AND ur.role_id = r.id);
