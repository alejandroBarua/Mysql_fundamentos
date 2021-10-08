-- Buscar un substring
SELECT * FROM books WHERE title LIKE "Th%"; -- busca el substring al comienzo

SELECT * FROM books WHERE title LIKE "%od";

SELECT * FROM books WHERE title LIKE "%World%";

SELECT * FROM books WHERE title LIKE "____S____";

SELECT * FROM books WHERE title LIKE "_h__W%";

SELECT * FROM books WHERE title LIKE 'F%' OR title LIKE 'T%';

-- Expresiones regulares
SELECT * FROM books WHERE title REGEXP '^[FT]'; -- comienzen con F o T

-- Ordenar registros
SELECT title FROM books ORDER BY title ASC; -- ordena de la AZ

SELECT title FROM books ORDER BY title DESC; -- ordena de la ZA

-- Limitar registros
SELECT title FROM books LIMIT 2; -- devuelve los primeros dos registros

-- Paginar registros
SELECT id_book, title FROM books LIMIT 1, 2	; -- LIMIT desde, cantidad

-- Funciones de agrupamiento

-- Contar registros
SELECT COUNT(*) FROM books; -- cantidad de libros

SELECT COUNT(*) FROM authors WHERE pseudonym IS NOT NULL;

SELECT SUM(pages) FROM books; -- devuelve suma total

SELECT MAX(pages) FROM books;

SELECT MIN(pages) FROM books;

SELECT AVG(pages) FROM books; -- devuelve el promedio

-- ¿Cual es la cantidad de paginas que escribio cada autor?
SELECT id_author, SUM(pages) FROM books GROUP BY id_author;

-- ¿Cual es la cantidad de paginas que escribio cada autor y que supera 1000?
SELECT id_author, SUM(pages) FROM books GROUP BY id_author HAVING SUM(pages) > 1000; -- no puedo usar el where para condicionar un agrupamiento

-- ¿Que autor tiene el libro con mas paginas?
SELECT id_author, MAX(pages) AS total FROM books GROUP BY id_author ORDER BY total DESC LIMIT 1;

-- Consultas anidadas
-- ¿Cual es el nombre de los autores que superan el promedio de paginas?
SELECT CONCAT(name, " ", last_name) FROM authors 
	WHERE id_author IN (SELECT id_author FROM books GROUP BY id_author HAVING SUM(pages) >(SELECT AVG(pages) FROM books)); -- hay dos subconsultas

-- Validaciones
SELECT IF(
	EXISTS(SELECT id_book FROM books WHERE title = 'It'), 
	'Dispobible', 
	'No Disponible'
) AS resultado;