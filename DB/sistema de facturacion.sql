CREATE DATABASE sistema_facturacion;

USE sistema_facturacion;

CREATE TABLE rol(
    id_rol INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    tipo_rol VARCHAR(15) NOT NULL
);

CREATE TABLE empleados(
    id_nombre INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre VARCHAR(15),
    apellido VARCHAR(15),
    cedula VARCHAR(10),
    contraseña VARCHAR(15),
    rol INT
);

CREATE TABLE producto(
    id_producto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    producto LONGTEXT,
    cantidad INT(10),
    costo_unidad FLOAT(10)
);

CREATE TABLE cliente(
    id_cliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nombre varchar(15) not null,
    apellido varchar(15) not null,
    cedula varchar(10) not null
);

CREATE TABLE venta(
    id_venta INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_producto INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha_venta DATE,
    cantidad_producto INT
);

CREATE TABLE factura(
    id_factura INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_cliente INT,
    id_ventas INT,
    costo_total FLOAT
);


ALTER TABLE empleados ADD CONSTRAINT fk_empleado_rol FOREIGN KEY (rol) references rol(id_rol);
ALTER TABLE venta ADD CONSTRAINT fk_venta_empleado FOREIGN KEY (id_empleado) references empleados(id_nombre);
ALTER TABLE venta ADD CONSTRAINT fk_venta_producto FOREIGN KEY (id_producto) references producto(id_producto);
ALTER TABLE factura ADD CONSTRAINT fk_factura_venta FOREIGN KEY (id_ventas) references venta(id_venta);
ALTER TABLE factura ADD CONSTRAINT fk_factura_cliente FOREIGN KEY (id_cliente) references cliente(id_cliente);
