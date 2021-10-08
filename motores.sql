/* 
Un motor de almacenamiento es el encargado de almacenar, gestionar y recuperar toda la información de una tabla. Es por ello que es de suma importancia que nosotros conozcamos la existencia de estos motores, cuales son sus principales diferencias y en qué casos es bueno utilizar uno u otro, de esta forma que podamos garantizar un mejor performance en nuestras aplicaciones. 
*/

SHOW ENGINES;

/* 
MyISAM es el motor por default de MySQL.
Una de las principales ventajas es la velocidad al momento de recuperar información. MyISAM es una excelente opción cuando las sentencias predominantes en nuestra aplicación sean de consultas.
La principal desventaja es que recae en la ausencia de atomocidad, ya que no se comprueba la integridad referencial de los datos. Se gana tiempo en la inserción, sí, pero perdemos confiabilidad en los datos.
*/


/* 
Por otro lado, tenemos a InnoDB. 
Su ventaja es que recae en la seguridad de las operaciones. InnoDB permite la ejecución de transacciones, esto nos garantiza que los datos se persisten de forma correcta y si existe algún error podamos revertir todos los cambios realizados.

Algo interesante a mencionar sobre InnoDB es que este motor realiza un bloqueo total sobre un tabla (asegura la atomicidad) cuando es ejecutada una se las siguientes sentencias: Select, Insert, Update, Delete.
Si deseamos trabajar con transacción y la integridad de los datos sea crucial nuestra mejor opción será InnoDB.
*/

SET storage_engine=INNODB;

SHOW TABLE STATUS WHERE `Name` = 'tabla' \G;