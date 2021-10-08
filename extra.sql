-- Ejecutar una consulta sin iniciar sesion
$ sudo mysql -u root bookshop -e "SELECT * FROM authors"

-- Limpiar la consola
> system clear

-- Ejecutar archivo .sql
> SOURCE apunte_db/demo.slq;

-- Crear tabla apartir de otra
> CREATE TABLE authors_copy LIKE authors;

-- Condicionar sentencia
> DROP DATABASE IF EXISTS bookshop; -- borra la DB solo si existe
> CREATE DATABASE IF NOT EXISTS bookshop; -- creara la DB solo si no existe

