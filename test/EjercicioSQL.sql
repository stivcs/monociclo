-- 3 sentencias - crear tablas con sus respectivos campos, relaciones y restricciones de integridad referencial
CREATE DATABASE hotel; 
USE hotel;
CREATE TABLE ciudades(
    id_ciudad INT(11) PRIMARY KEY,
    nombre_ciudad VARCHAR(50)
);
CREATE TABLE clientes_hotel(
    id_cliente_hotel INT(11) PRIMARY KEY,
    nombre_cliente_hotel VARCHAR(50),
    apellido_cliente_hotel VARCHAR(50),
    genero VARCHAR(50),
    id_ciudad INT(11),
    FOREIGN KEY(id_ciudad) REFERENCES ciudades(id_ciudad) ON DELETE CASCADE ON UPDATE CASCADE
); 
CREATE TABLE telefonos_cliente_hotel(
    id_telefono_cliente_hotel INT(11) PRIMARY KEY,
    Numero_telefonoCliente INT(11),
    id_cliente_hotel INT(11),
    FOREIGN KEY(id_cliente_hotel) REFERENCES Clientes_hotel(id_cliente_hotel) ON DELETE CASCADE ON UPDATE CASCADE
); 
-- 1 sentencia - ALTER TABLE agregar campo numerohab_ciudad de tipo entero no nulo, a la tabla ciudades
ALTER TABLE ciudades ADD COLUMN numerohab_ciudad INT(11) NOT NULL;
-- 1 sentencia - ALTER TABLE modificar campo numero_telefonoCliente de tipo texto(12) no nulo
ALTER TABLE telefonos_cliente_hotel MODIFY COLUMN Numero_telefonoCliente VARCHAR(11) NOT NULL;
-- 1 sentencia - ALTER TABLE eliminar campo (Error)
-- el error es la columna genero ya que resulta en redundancia de datos
ALTER TABLE clientes_hotel
DROP COLUMN genero;
-- 1 sentencia - crear nueva tabla (Error) con sus respectivos campos, relaciones y restricciones de integridad referencial
CREATE TABLE Genero_Cliente(
    Id_Genero INT(50) PRIMARY KEY,
    Descripcion VARCHAR(50) NOT NULL
); 
--1 sentencia - ALTER TABLE agregar campo (Error)
ALTER TABLE clientes_hotel ADD COLUMN Id_Genero INT(50);
--1 sentencia - ALTER TABLE agregar índice (Error)
ALTER TABLE clientes_hotel ADD KEY Id_Genero(Id_Genero);
--1 sentencia - ALTER TABLE agregar clave foránea (Error)
ALTER TABLE clientes_hotel ADD FOREIGN KEY(Id_Genero) REFERENCES Genero_Cliente(Id_Genero) ON DELETE CASCADE ON UPDATE CASCADE;

--5 sentencias insert
INSERT INTO ciudades(id_ciudad, nombre_ciudad, numerohab_ciudad) VALUES(1, 'Bogota', 100);
INSERT INTO ciudades(id_ciudad, nombre_ciudad, numerohab_ciudad) VALUES(2, 'Medellin', 50);
INSERT INTO ciudades(id_ciudad, nombre_ciudad, numerohab_ciudad) VALUES(3, 'Cali', 70);
INSERT INTO clientes_hotel(id_cliente_hotel, nombre_cliente_hotel, apellido_cliente_hotel, id_ciudad) VALUES(1, 'Juan', 'Perez', 1);
INSERT INTO clientes_hotel(id_cliente_hotel, nombre_cliente_hotel, apellido_cliente_hotel, id_ciudad) VALUES(2, 'Maria', 'Gomez', 2);
INSERT INTO Genero_Cliente(Id_Genero, Descripcion) VALUES(1, 'Masculino');
INSERT INTO Genero_Cliente(Id_Genero, Descripcion) VALUES(2, 'Femenino');
INSERT INTO telefonos_cliente_hotel(id_telefono_cliente_hotel, Numero_telefonoCliente, id_cliente_hotel) VALUES(1, 1234567890, 1);
--5 sentencias Select
SELECT id_ciudad FROM ciudades;
SELECT nombre_ciudad FROM ciudades;
SELECT numerohab_ciudad FROM ciudades;
SELECT numero_telefonoCliente FROM telefonos_cliente_hotel;
SELECT nombre_cliente_hotel FROM clientes_hotel;
--3 sentencias Update
UPDATE ciudades SET nombre_ciudad = 'Bogota DC' WHERE id_ciudad = 1;
UPDATE clientes_hotel SET nombre_cliente_hotel = 'Juan Carlos' WHERE id_cliente_hotel = 1;
UPDATE telefonos_cliente_hotel SET Numero_telefonoCliente = 1234567891 WHERE id_telefono_cliente_hotel = 1;
--3 sentencias Delete
DELETE FROM ciudades WHERE id_ciudad = 1;
DELETE FROM clientes_hotel WHERE id_cliente_hotel = 1;
DELETE FROM telefonos_cliente_hotel WHERE id_telefono_cliente_hotel = 1;
-- 3 sentencias - SELECT (ALL / DISTINCT)
SELECT * FROM ciudades;
SELECT DISTINCT nombre_ciudad FROM ciudades;
SELECT * FROM clientes_hotel;
-- 3 sentencias - SELECT (WHERE)
SELECT * FROM ciudades WHERE id_ciudad = 2;
SELECT * FROM clientes_hotel WHERE id_cliente_hotel = 2;
SELECT * FROM telefonos_cliente_hotel WHERE id_telefono_cliente_hotel = 2;
--1 sentencia - SELECT Join
SELECT clientes_hotel.nombre_cliente_hotel, ciudades.nombre_ciudad FROM clientes_hotel JOIN ciudades ON clientes_hotel.id_ciudad = ciudades.id_ciudad;
--1 sentencia - SELECT (Alias)
SELECT clientes_hotel.nombre_cliente_hotel AS Nombre, ciudades.nombre_ciudad AS Ciudad FROM clientes_hotel JOIN ciudades ON clientes_hotel.id_ciudad = ciudades.id_ciudad;
--1 sentencia - Función Agregada (COUNT, SUM, MAX, MIN, AVG)
SELECT COUNT(id_ciudad) FROM ciudades;
--3 sentencias - SELECT - WHERE - ORDER BY Ascendente o Descendente
SELECT * FROM ciudades WHERE numerohab_ciudad > 50 ORDER BY numerohab_ciudad ASC;
SELECT * FROM ciudades WHERE numerohab_ciudad > 50 ORDER BY numerohab_ciudad DESC;
SELECT * FROM ciudades WHERE numerohab_ciudad > 50 ORDER BY nombre_ciudad ASC;

