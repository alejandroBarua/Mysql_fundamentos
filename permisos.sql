/* Cómo mencionamos anteriormente: el servidor de base de datos permite que más de un usuario pueda trabajar con los recursos del servidor (registros, tablas, bases de datos, funciones, etc..). */

-- Solo el usuario root puede crear usuarios y dar permisos

-- Iniciar con el usuario root
mysql -u root -p -h localhost<ip>

-- Crear usuario y password
CREATE USER 'usuario'@'localhost' IDENTIFIED BY 'password';

-- Asignar todos los permisos sobre todas las tablas de todas las bases de datos (primer asterisco bases de datos, segundo asterisco tablas)
GRANT ALL PRIVILEGES ON *.* TO 'nombre_usuario'@'localhost';

-- Asignar permisos solo de ciertas acciones solo sobre todas las tablas de la base de datos "bookshop"
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP
ON bookshop.* TO 'nombre_usuario'@'localhost';

-- Una vez hayamos finalizado con los permisos, el último paso será refrescarlos
FLUSH PRIVILEGES;

/* 
Otros permisos disponibles:
GRANT OPTION permite remover permisos de usuarios.
SHOW DATABASE Permite listar las bases de datos existentes.
*/

-- Listar usuarios
SELECT User FROM mysql.user;

-- Borrar usuario
DROP USER 'usuario'@'localhost';

-- Remover permisos
REVOKE UPDATE, DELETE ON *.* FROM 'usuario'@'localhost';

-- Remover todos los permisos
REVOKE ALL PRIVILEGES ON *.* FROM 'usuario'@'localhost';