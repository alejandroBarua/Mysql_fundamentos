system clear;

SELECT * FROM books;

SELECT id_book, title FROM books;

-- operadores relacionales: > >= < <= = !=
SELECT * FROM books WHERE id_author = 1;

-- operadores logicos: AND OR NOT
SELECT * FROM books WHERE (title = 'Misery' AND id_author = 1) OR (title = 'Fire & Blood' AND id_author = 2);

SELECT * FROM authors WHERE pseudonym IS NOT NULL;

SELECT title FROM books WHERE released_date BETWEEN '1995-01-01' AND '2015-01-31';

SELECT * FROM books WHERE title IN('It', 'Misery');

-- Mostrar titulos pero sin que se repitan
SELECT DISTINCT title FROM books;