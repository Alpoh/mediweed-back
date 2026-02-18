-- Insert roles if they don't exist
INSERT INTO roles (name)
SELECT 'ROLE_ADMIN'
WHERE NOT EXISTS (SELECT 1 FROM roles WHERE name = 'ROLE_ADMIN');
INSERT INTO roles (name)
SELECT 'ROLE_CLIENT'
WHERE NOT EXISTS (SELECT 1 FROM roles WHERE name = 'ROLE_CLIENT');

-- Insert default admin account if it doesn't exist
-- Password is 'password' encoded with BCrypt
INSERT INTO accounts (username, password, email)
SELECT 'admin', '$2a$10$G.w.1.h.X2.jV.8.g.9U3.W.Z.Y.X.Z.Y.X.Z.Y.X.Z.Y', 'admin@example.com'
WHERE NOT EXISTS (SELECT 1 FROM accounts WHERE username = 'admin');

-- Assign ROLE_ADMIN to the admin account
INSERT INTO account_roles (account_id, role_id)
SELECT a.id, r.id
FROM accounts a, roles r
WHERE a.username = 'admin' AND r.name = 'ROLE_ADMIN'
  AND NOT EXISTS (SELECT 1 FROM account_roles ar WHERE ar.account_id = a.id AND ar.role_id = r.id);
