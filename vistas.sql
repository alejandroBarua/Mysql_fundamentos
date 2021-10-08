-- las vistas nos sirven para guardar una consulta y usarla como tabla y esta actualizara sus valores dependiendo de su definicion
-- tambien se puede user para crear una tabla que oculte algunos campos con informacion sensible

-- DROP VIEW count_books_users_vw;

CREATE OR REPLACE VIEW count_books_users_vw AS
SELECT 
	users.id_user,
	CONCAT(users.name, ' ', users.last_name) AS name_user,
	COUNT(users.id_user) AS total_books
FROM users
INNER JOIN books_users
ON users.id_user = books_users.id_user
GROUP BY users.id_user;

SHOW TABLES;

SELECT * FROM count_books_users_vw;

