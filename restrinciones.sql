/* Restrinciones
NOT NULL
UNIQUE
CONSTRAINT
DEFAULT 
current_timestamp -- nos da la fecha y hora actual
UNSIGNED -- solo positivos
ENUM -- unicos valores que puede tomar no es sensible a mayusculas y minusculas
PRIMARY KEY
AUTO INCREMENT
FOREIGN KEY
ON DELETE CASCADE
*/

-- 1 autor tiene n libros
-- 1 libro pertenece a 1 autor

CREATE TABLE authors(
	id_author INT UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
	name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50),
	pseudonym VARCHAR(50) UNIQUE,
	gender ENUM('M', 'F'),
	birthdate DATE,
	country_origin VARCHAR(50),
	created_date DATETIME DEFAULT current_timestamp,
	CONSTRAINT unique_combination UNIQUE(name, last_name)
);

CREATE TABLE books(
	id_book INT UNSIGNED AUTO_INCREMENT, 
	id_author INT UNSIGNED NOT NULL,
	title VARCHAR(50) NOT NULL,
	description VARCHAR(250),
	pages INTEGER UNSIGNED,
	released_date DATE NOT NULL,
	created_date DATETIME DEFAULT current_timestamp,
	PRIMARY KEY(id_book),
	FOREIGN KEY(id_author) REFERENCES authors(id_author) ON DELETE CASCADE
);


