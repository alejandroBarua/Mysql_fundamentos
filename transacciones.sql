/* 
Las transacciones es una forma de realizar un conjunto de acciones sobre la tabla, si surge un error todo vuelve al estado que se tenia antes de ejecutar la transaccion, si todo sale bien se pueden guardar el nuevo estado o descartarlo
*/

DROP PROCEDURE IF EXISTS prestamo_transaccion;

DELIMITER /

CREATE PROCEDURE prestamo_transaccion(id_user INT, id_book INT)
BEGIN

	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
		ROLLBACK;
	END;

	START TRANSACTION;

	IF (SELECT stock FROM books WHERE books.id_book = id_book) > 0 THEN
		
		INSERT INTO books_users(id_user, id_book) VALUES (id_user, id_book);
		UPDATE books SET stock = stock -1 WHERE books.id_book = id_book;

	ELSE
		SELECT 'stock is zero' AS msg_error;

	END IF;

	COMMIT;

END/

DELIMITER ;

system clear;

SHOW PROCEDURE STATUS WHERE db = database() AND type = "PROCEDURE";

CALL prestamo_transaccion(3, 43);

SELECT * FROM books_users;