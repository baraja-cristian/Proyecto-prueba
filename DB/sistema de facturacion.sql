CREATE DATABASE sistema_facturacion;
USE sistema_facturacion;

-- TABLA ROLES
CREATE TABLE rol(
    id_rol INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    tipo_rol VARCHAR(15) NOT NULL
);

-- TABLA EMPLEADOS
CREATE TABLE empleados(
    id_nombre INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(15),
    apellido VARCHAR(15),
    cedula VARCHAR(10),
    contraseña VARCHAR(15),
    rol INT
);

-- TABLA PRODUCTOS
CREATE TABLE producto(
    id_producto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    producto LONGTEXT,
    cantidad INT(10),
    costo_unidad FLOAT(10)
);

-- TABLA CLIENTES
CREATE TABLE cliente(
    id_cliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre varchar(15) not null,
    apellido varchar(15) not null,
    cedula varchar(10) not null
);

-- TABLA VENTAS
CREATE TABLE venta(
    id_venta INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_producto INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha_venta DATE,
    cantidad_producto INT
);
-- TABLA FACTURAS
CREATE TABLE factura(
    id_factura INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_cliente INT,
    id_ventas INT,
    costo_total FLOAT
);

-- CREAR RELACIONES EN LAS TABLAS
ALTER TABLE empleados ADD CONSTRAINT fk_empleado_rol FOREIGN KEY (rol) references rol(id_rol);
ALTER TABLE venta ADD CONSTRAINT fk_venta_empleado FOREIGN KEY (id_empleado) references empleados(id_nombre);
ALTER TABLE venta ADD CONSTRAINT fk_venta_producto FOREIGN KEY (id_producto) references producto(id_producto);
ALTER TABLE factura ADD CONSTRAINT fk_factura_venta FOREIGN KEY (id_ventas) references venta(id_venta);
ALTER TABLE factura ADD CONSTRAINT fk_factura_cliente FOREIGN KEY (id_cliente) references cliente(id_cliente);


-- DATA EJEMPLO
-- ROLES
INSERT INTO rol VALUES (1, 'Admin');
INSERT INTO rol VALUES (2, 'vendedor');

-- CLIENTES
INSERT INTO cliente VALUES (1, 'Sofia', 'Martínez', '2135345123');
INSERT INTO cliente VALUES (2, 'Alejandro', 'Rodriguez', '12312390');
INSERT INTO cliente VALUES (3, 'Grabiel', 'López', '1000126576');
INSERT INTO cliente VALUES (4, 'Isabel', 'Garcia', '12350003');
INSERT INTO cliente VALUES (5, 'Valentina', 'Pérez', '3477120');

-- EMPLEADOS
INSERT INTO empleados VALUES (1, 'Sofía','Martínez', '100456234', 'admin', 1);
INSERT INTO empleados VALUES (2, 'Alejandro','Rodríguez', '04523434', 'admin', 2);

-- PRODUCTO
INSERT INTO producto VALUES (1, 'Smartphone', 5, 500);
INSERT INTO producto VALUES (2, 'Portátil', 20, 1000);
INSERT INTO producto VALUES (3, 'Auriculares inalámbricos', 100, 150);
INSERT INTO producto VALUES (4, 'Smartwatch', 15, 200);
INSERT INTO producto VALUES (5, 'Tablet', 30, 300);

-- VENTA
INSERT INTO venta VALUES (1, 2, 2,'2024-03-13', 2);
INSERT INTO venta VALUES (2, 2, 2,'2023-01-13', 3);
INSERT INTO venta VALUES (3, 3, 2,'2024-02-20', 2);
INSERT INTO venta VALUES (4, 4, 2,'2022-04-12', 1);
INSERT INTO venta VALUES (5, 1, 2,'2024-05-20', 2);

-- FACTURA
INSERT INTO factura VALUES (1, 1, 1, 1000);
INSERT INTO factura VALUES (2, 2, 2, 3000);
INSERT INTO factura VALUES (3, 3, 3, 300);
INSERT INTO factura VALUES (4, 1, 4, 200);
INSERT INTO factura VALUES (5, 5, 5, 600);
