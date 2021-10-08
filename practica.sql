-- Obtener todos los libros escritos por autores que cuenten con un seudónimo
SELECT * FROM books WHERE id_author IN(SELECT id_author FROM authors WHERE pseudonym IS NOT NULL) ORDER BY id_author ASC;

-- Obtener el título de todos los libros publicados en el año actual cuyos autores poseen un pseudónimo
SELECT * FROM books WHERE YEAR(released_date) = YEAR(NOW());
SELECT * FROM books WHERE YEAR(released_date) = '2011';

-- Obtener todos los libros escritos por autores que cuenten con un seudónimo y que hayan nacido antes de 1960

SELECT * FROM books WHERE id_author IN(SELECT id_author FROM authors WHERE pseudonym IS NOT NULL AND birthdate < '1960-01-01') ORDER BY id_author ASC;

-- Colocar el mensaje no disponible a la columna descripción, en todos los libros publicados antes del año 2000
UPDATE books SET description = 'No Disponible' WHERE released_date < '2000-01-01';

-- Obtener la llave primaria de todos los libros cuya descripción sea diferente de no disponible
SELECT id_book FROM books WHERE description IS NULL;

-- Obtener el título de los últimos 3 libros escritos por el autor con id 2
SELECT title FROM books WHERE id_author = 2 ORDER BY released_date DESC LIMIT 3;

-- Obtener la cantidad de libros escritos por autores con seudónimo y sin seudónimo
SELECT (SELECT COUNT(*) FROM books WHERE id_book IN(SELECT id_book FROM books WHERE id_author IN(SELECT id_author FROM authors WHERE pseudonym IS NOT NULL))) AS with_pseudonym, (SELECT COUNT(*) FROM books WHERE id_book IN(SELECT id_book FROM books WHERE id_author IN(SELECT id_author FROM authors WHERE pseudonym IS NULL))) AS without_pseudonym;

-- Obtener la cantidad de libros publicados entre enero del año 2000 y enero del año 2005
SELECT COUNT(*) FROM books WHERE released_date BETWEEN '2000-01-01' AND '2005-01-01';

-- Obtener el título y el número de paginas de los cinco libros con más paginas
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 5;

-- Obtener la cantidad maxima de paginas que tiene cada autor
SELECT id_author, MAX(pages) FROM books GROUP BY id_author;

-- Obtener el título del libro con más páginas
SELECT title FROM books ORDER BY pages DESC LIMIT 1;

-- Obtener todos los libros cuyo título comience con la palabra “The”
SELECT * FROM books WHERE title LIKE 'The%';

-- Obtener todos los libros cuyo título comience con la palabra “The” y termine con la letra “e”
SELECT * FROM books WHERE title LIKE 'The%e';

-- Obtener la el nombre completo y la edad de todos los autores
SELECT YEAR(NOW())-YEAR(birthdate) AS age, CONCAT(name, ' ', last_name) AS name_cp FROM authors ORDER BY age;

-- Obtener el nombre completo de todos los autores cuyo último libro publicado sea posterior al 2005
SELECT CONCAT(name, ' ', last_name) AS name_cp FROM authors WHERE id_author IN(SELECT DISTINCT id_author FROM books WHERE released_date > '2005-01-01');
