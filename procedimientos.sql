-- Los procedimientos son funciones que no retornan un valor y se usan para realizar acciones sobre las tablas
-- recorda que se pueden usar ELSEIF, ciclos while y swich case ya que pueden ser necesarios en algunos casos

/* la principal ventaja es la rapidez al momento de manejar los datos. Con el procedimiento almacenado todo se trabaja desde el mismo gestor, por otro lado, con el lenguaje primero se hace la consulta y luego se utilizan los datos.

Cuando usar uno u otro depende mucho de tu equipo de trabajo. Yo de forma personal recomendaría tratar los datos con el lenguaje de programación, puesto que allí debería esta nuestra lógica de negocios. Los procedimientos los dejaría para temas como: Mover datos, actualizar datos, replicación, quizás procedimientos muy pesados que involucren hacer pivotes con tablas etc.. */

DROP PROCEDURE IF EXISTS prestamo;

DELIMITER /

CREATE PROCEDURE prestamo(id_user INT, id_book INT)
BEGIN
	IF (SELECT stock FROM books WHERE books.id_book = id_book) > 0 THEN
		
		INSERT INTO books_users(id_user, id_book) VALUES (id_user, id_book);
		UPDATE books SET stock = stock -1 WHERE books.id_book = id_book;

	ELSE
		SELECT 'stock is zero' AS msg_error;

	END IF;
END/

DELIMITER ;

system clear;

SHOW PROCEDURE STATUS WHERE db = database() AND type = "PROCEDURE";

CALL prestamo(2, 40);

SELECT * FROM count_books_users_vw;

SELECT stock FROM books WHERE books.id_book = 40;