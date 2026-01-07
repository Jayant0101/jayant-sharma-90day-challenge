SELECT * FROM users;

SELECT name, email FROM users;

SELECT * FROM users WHERE name = 'Alice';

SELECT * FROM users WHERE name LIKE 'A%';

SELECT * FROM users ORDER BY created_at DESC;

SELECT * FROM users LIMIT 5;

SELECT COUNT(*) FROM users;

SELECT COUNT(*) FROM users WHERE email LIKE '%gmail.com';

SELECT DATE(created_at), COUNT(*)
FROM users
GROUP BY DATE(created_at);

SELECT DATE(created_at), COUNT(*)
FROM users
GROUP BY DATE(created_at)
HAVING COUNT(*) >= 1;

SELECT * FROM users WHERE email IS NOT NULL;

SELECT * FROM users WHERE created_at >= CURRENT_DATE;
