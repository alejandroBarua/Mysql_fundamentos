INSERT INTO authors (name, last_name, pseudonym, birthdate, gender, country_origin) 
	VALUES ('Stephen Edwin', 'King', 'Richard Bachman', '1947-09-27', 'M', 'USA'),
         ('Joanne', 'Rowling', 'J.K Rowling', '1947-09-27', 'F', 'United Kingdom'),
         ('Daniel', 'Brown',  NULL, '1964-06-22', 'M', 'USA'),
         ('John', 'Katzenbach ', NULL,'1950-06-23', 'M', 'USA'),
         ('John Ronald', 'Reuel Tolkien', NULL, '1892-01-03', 'M', 'United Kingdom'),
         ('Miguel', 'de Unamuno', NULL, '1892-01-03', 'M', 'USA'),
         ('Arturo', 'Pérez Reverte', NULL, '1951-11-25', 'M', 'Spain'),
         ('George Raymond', 'Richard Martin', NULL, '1948-09-20', 'M', 'USA');

INSERT INTO books (id_author, title, pages, released_date) 
	VALUES (1, 'Carrie', 129,'1974-01-01'),
     	  (1, 'Salmes Lot', 350,'1975-01-01'),
     	  (1, 'The Shining', 220,'1977-01-01'),
     	  (1, 'Rage', 129, '1977-01-01'),
     	  (1, 'The Long Walk', 50, '1979-01-01'),
     	  (1, 'The Dead Zone', 220, '1979-01-01'),
     	  (1, 'The Eyes of the Dragon', 266, '1980-01-01'),
     	  (1, 'Cujo', 220, '1981-01-01'),
     	  (1, 'Dark Tower 1 The Gunslinger', 160, '1982-01-01'),
     	  (1, 'Dark Tower 2 The Drawing of the Three', 120, '1987-01-01'),
     	  (1, 'The Stand', 888, '1990-01-01'),
     	  (1, 'Dark Tower 3 The Waste Lands', 55, '1991-01-01'),
     	  (1, 'Dark Tower 4 Wizard and Glass', 62, '1997-01-01'),
     	  (1, 'Dark Tower 5 Wolves of the Calla', 660, '2003-01-01'),
     	  (1, 'Dark Tower 6 Song of Susannah', 120, '2004-01-01'),
     	  (1, 'Dark Tower 7 The Dark Tower', 332, '2004-01-01'),
     	  (1, 'The Mist', 191, '1981-01-01'),
	
     	  (2, 'Harry Potter and the Philosopher’s Stone', 33,'1997-06-30'),
     	  (2, 'Harry Potter and the Chamber of Secrets', 22, '1998-07-2'),
     	  (2, 'Harry Potter and the Prisoner of Azkaban', 444, '1999-07-8'),
     	  (2, 'Harry Potter and the Goblet of Fire', 222, '2000-03-20'),
     	  (2, 'Harry Potter and the Order of the Phoenix', 120, '2003-06-21'),
     	  (2, 'Harry Potter and the Half-Blood Prince', 849, '2005-06-16'),
     	  (2, 'Harry Potter and the Deathly Hallows', 392, '2007-07-21'),
	
     	  (4, 'In the Heat of the Summer', 273, '1982-01-01'),
     	  (4, 'Day of Reckoning', 198, '1987-01-01'),
     	  (4, 'Just Cause', 152, '1992-01-01'),
     	  (4, 'The Shadow Man', 182, '1995-01-01'),
     	  (4, 'The Analyst', 675, '2002-01-01'),
     	  (4, 'The Mandmans Tale', 923, '2004-01-01'),
     	  (4, 'The Wrong Man', 262, '2006-01-01'),
     	  (4, 'The Dead Student', 182, '2014-01-01'),
	
     	  (5, 'The hobbit', 282, '1937-01-01'),
     	  (5, 'Lord of The Rings and The Two Towers', 271, '1954-01-01'),
     	  (5, 'Lord of The Rings', 872, '1954-01-01'),
     	  (5, 'Lord of The Rings and Fellowship of Ring', 273, '1954-01-01'),
     	  (5, 'Lord of The Rings and Return of The King', 272, '1955-01-01'),
	
     	  (6, 'The Mist', 261, '1914-01-01'),
	
     	  (8, 'A Game of Thrones', 272, '1996-08-01'),
     	  (8, 'A Clash of Kings', 638, '1998-11-16'),
     	  (8, 'A Storm of Swords', 272, '2005-10-17'),
     	  (8, 'A Feast for Crows', 272, '2011-07-12'),
     	  (8, 'Dance of Dragons', 111, '2011-07-12');

INSERT INTO users (name, last_name, username, email)
VALUES  ('Alejandro', 'Barua', 'alebarua', 'alebarua@gmail.com'),
        ('Tony', 'Stark', 'tonystark', 'tonystark@gmail.com'),
        ('Codi', 'Facilito', 'codifacilito', 'codi456@gmail.com');

INSERT INTO books_users(id_book, id_user)
VALUES (1, 1), (2, 1), (36, 1), 
			 (2, 2), (31, 2), (4, 2);
