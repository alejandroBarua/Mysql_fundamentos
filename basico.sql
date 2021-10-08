/* 
MySQL es un sistema de gestión de bases de datos relacional desarrollado por Oracle Corporation y está considerada como la base datos open source más popular del mundo. Su puerto por defecto es el 3306. */

/* Iniciar servidor xampp
$ /opt/lampp/lampp start 

Acceder a phpMyAdmin desde el navegador
127.0.0.1/phpmyadmin/

Manejar la DB desde de la terminal (abrir sesion msql)
$ sudo mysql -u root
*/

-- Cerrar sesion mysql
exit;

-- Crear DB
CREATE DATABASE bookshop;

-- Borrar DB
DROP DATABASE bookshop;

-- Mostrar todas las DB
SHOW DATABASES;

-- Seleccionar DB
USE bookshop;

-- Mostrar DB seleccionada
SELECT DATABASE();

-- Crear tabla
CREATE TABLE authors(
	id_author INT, 
	name VARCHAR(50),
	last_name VARCHAR(50),
	gender CHAR(1), -- M o F
	birthdate DATE, -- YYYY-MM-DD

);

/* otros tipos de datos
TINYINT	-128 a 127
FLOAT (3, 2) -- 999,99
DATETIME -- YY-MM-DD HH:MM:SS
TIME -- HH:MM:SS
*/

-- Mostrar todas las tablas
SHOW TABLES;

-- Borrar tabla
DROP TABLE authors;

-- Mostrar tabla
DESC authors;

-- Crear registro
INSERT INTO authors (id_author, name, last_name, gender, birthdate) 
	VALUES (1, "Stephen", "King", "M", "1947-09-21");

-- Crear multiples registros
INSERT INTO authors (id_author, name, last_name, gender, birthdate) 
	VALUES (2, "John", "Crisham", "M", "1955-02-08"), 
				 (3, "George", "Martin", "M", "1948-09-20");

-- Mostrar registros
SELECT * FROM authors;


-- Modificar tabla

-- Cambiar nombre de la tabla
ALTER TABLE authors RENAME authors_bs;

-- Borrar columna
ALTER TABLE authors DROP COLUMN country_origin;

-- Agregar columna
ALTER TABLE authors ADD country_origin VARCHAR(50);

-- Agregar llave primaria
ALTER TABLE authors ADD id_author INT UNSIGNED NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (id_author);

-- Agregar llave foranea (1 libro le pertenece a 1 autor)
ALTER TABLE books ADD FOREIGN KEY (id_author) REFERENCES authors(id_author);

-- borrar llave foranea
ALTER TABLE books DROP FOREIGN KEY id_author;


-- Modificar o actualizar registros
UPDATE books SET pages = 400, stock = 10 WHERE id_book = 2;

-- Borrar registros
DELETE FROM books WHERE pages = 280;

-- Borrar todos los registros
DELETE FROM books;
TRUNCATE TABLE books; -- mejor opcion pues resetea la tabla no se podran recuperar los datos

-- Eliminacion en cascada
-- si queremos eliminar un autor vamos a tener un problema, porque este campo es llave foranea en la tabla de libros.
-- Primero vamos a tener que eliminar los libros de este autor y luego al autor.
-- Otra solucion es definir la llave foranea del autor con eliminacion en cascada (esta es la mejor solucion).
ALTER TABLE books ADD FOREIGN KEY (id_author) REFERENCES authors(id_author) ON DELETE CASCADE;