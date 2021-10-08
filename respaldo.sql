-- En MySQL nosotros podemos realizar respaldos de nuestra información, para ello, utilizaremos la aplicación mysqldump.

-- Para una DB
mysqldump base_de_datos > ruta/archivo_respaldo.sql

-- Para varias DB
mysqldump --databases db1 db2 db3 > ruta/archivo_respaldo.sql

-- Para una o varias tablas de una DB
mysqldump base_de_datos tabla1 tabla3 > ruta/archivo_respaldo.sql