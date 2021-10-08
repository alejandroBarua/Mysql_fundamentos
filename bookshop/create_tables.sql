DROP DATABASE IF EXISTS bookshop;

CREATE DATABASE bookshop;

USE bookshop;

CREATE TABLE authors(
	id_author INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50),
	pseudonym VARCHAR(50) UNIQUE,
	gender ENUM('M', 'F'),
	birthdate DATE,
	country_origin VARCHAR(50),
	created_date DATETIME DEFAULT current_timestamp
);

-- 1 autor tiene n libros
-- 1 libro pertenece a 1 autor
-- relacion uno a muchos

CREATE TABLE books(
	id_book INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
	id_author INT UNSIGNED NOT NULL,
	title VARCHAR(50) NOT NULL,
	description VARCHAR(250),
	pages INTEGER UNSIGNED,
	released_date DATE NOT NULL,
	created_date DATETIME DEFAULT current_timestamp,
	FOREIGN KEY (id_author) REFERENCES authors(id_author) ON DELETE CASCADE
);

ALTER TABLE books ADD stock INT UNSIGNED DEFAULT 10;


CREATE TABLE users(
  id_user INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  name varchar(25) NOT NULL,
  last_name varchar(25),
  username varchar(25) NOT NULL,
  email varchar(50) NOT NULL,
  created_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 1 usuario tiene n libros
-- 1 mismo titulo puede tener n usuarios
-- relacion muchos a muchos

CREATE TABLE books_users(
  id_book INT UNSIGNED NOT NULL,
  id_user INT UNSIGNED NOT NULL,
  created_date DATETIME DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (id_book) REFERENCES books(id_book),
  FOREIGN KEY (id_user) REFERENCES users(id_user)
);


