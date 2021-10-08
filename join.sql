/* 
El join es para unir los datos de tablas, hay que pensar con diagramas de VEN (teoria de conjuntos)
INNER JOIN -> intercepcion entre A y B
LEFT JOIN -> A-B (halla o no coincidencia) 
RIGHT JOIN -> B-A
*/

-- Obtener el nombre del autor de cada libro
SELECT 
	books.title, 
	CONCAT(authors.name, ' ', authors.last_name) AS name_author,
	books.created_date
FROM books 
INNER JOIN authors 
ON books.id_author = authors.id_author 
	AND authors.pseudonym IS NOT NULL;

-- Obtener el nombre del usuario y el id del libro prestado
SELECT
	CONCAT(name, ' ', last_name),
	books_users.id_book
FROM users
LEFT JOIN books_users
ON users.id_user = books_users.id_user
WHERE books_users.id_book IS NOT NULL;

-- Obtener el nombre completo del autor de cada libro
SELECT
	CONCAT(authors.name, ' ', authors.last_name) AS name_author,
	books.title
FROM authors
INNER JOIN books
ON authors.id_author = books.id_author;

system clear;

-- Obtener los autores que no tienen libros asociados
SELECT 
	CONCAT(authors.name, ' ', authors.last_name) AS name_author,
	books.title
FROM authors
LEFT JOIN books
ON authors.id_author = books.id_author
WHERE books.id_book IS NULL;

-- Obtener los autores que solo tienen libros asociados
SELECT 
	CONCAT(authors.name, ' ', authors.last_name) AS name_author,
	books.title
FROM authors
RIGHT JOIN books
ON authors.id_author = books.id_author;
-- OBS: me podria mostrar (si existe) los libros que no tienen autor