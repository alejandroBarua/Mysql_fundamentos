-- Los eventos nos permitirán a nosotros cómo administradores de base de datos programar ciertas tareas las cuales queremos que se ejecuten de forma periódica o en un momento en concreto, de tal manera que podamos automatizar ciertos procesos.

-- Lo primero que debemos de hacer es habilitar nuestro servidor para que pueda ejecutar eventos
SET GLOBAL event_scheduler = ON;

-- Para detener todos los eventos
SET GLOBAL event_scheduler = OFF;

-- Listar eventos
SHOW events\G;

-- Eliminar evento
DROP EVENT insertion_event;

-- Detener evento
ALTER EVENT nombre_evento DISABLE;

-- habilitar evento
ALTER EVENT nombre_evento ENABLE;

CREATE TABLE IF NOT EXISTS test(
 evento VARCHAR(50),
 fecha DATETIME 
); 

-- Este evento se ejecutará dentro de 1 min
CREATE EVENT insertion_event
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO INSERT INTO test VALUES ('Event 1', NOW());

-- Para ejercutarlo en una fecha concreta
CREATE EVENT insertion_event
ON SCHEDULE AT '2021-10-08 10:20:00'
DO INSERT INTO test VALUES ('Event 1', NOW());

/* Es importante mencionar que una vez el evento haya expirado, este, será eliminado de forma automática. Si nosotros no queremos que esto ocurra debemos de apoyarnos de ON COMPLETION
 */

-- Si nuestro evento ejecutara mas de una sentencia SQL debemos de apoyarnos de BEGIN y END
DELIMITER //

CREATE EVENT insertion_event
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
DO
BEGIN
 INSERT INTO test VALUES ('Event 1', NOW());
 INSERT INTO test VALUES ('Event 2', NOW());
 INSERT INTO test VALUES ('Event 3', NOW());
END //

DELIMITER ;

-- Algo común con los eventos es trabajar con store procedures
CREATE EVENT name_event
ON SCHEDULE AT 'execution date' 
DO CALL store_procedure();

-- Eventos periodicos
CREATE EVENT insertion_event
ON SCHEDULE EVERY 1 MINUTE STARTS '2018-07-07 18:30:00'
ENDS '2018-07-07 19:00:00'
DO INSERT INTO test VALUES ('Event 1', NOW());