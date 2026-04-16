CREATE DATABASE empresa_buses;
USE empresa_buses;


CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100),
    password VARCHAR(255),
    rol_id INT,
    estado INT DEFAULT 1,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO usuarios (nombre, email, password, rol_id) VALUES
('Andrea', 'test123@gmail.com', '123456', 1),
('admin', 'admin@admin.com', '123456', 1),
('cliente1', 'cliente@gmail.com', '123456', 2);


CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

INSERT INTO roles (nombre) VALUES
('Administrador'),
('Cliente');


CREATE TABLE tipos_bus (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

INSERT INTO tipos_bus (nombre) VALUES
('Económico'),
('Ejecutivo'),
('VIP');


CREATE TABLE buses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(20),
    tipo_id INT,
    estado VARCHAR(50),
    FOREIGN KEY (tipo_id) REFERENCES tipos_bus(id)
);

INSERT INTO buses (placa, tipo_id, estado) VALUES
('ABC123', 1, 'Disponible'),
('XYZ789', 2, 'Disponible'),
('BUS456', 1, 'Mantenimiento');


CREATE TABLE rutas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    origen VARCHAR(100),
    destino VARCHAR(100)
);

INSERT INTO rutas (origen, destino) VALUES
('Tegucigalpa', 'San Pedro Sula'),
('Tegucigalpa', 'La Ceiba'),
('San Pedro Sula', 'Copán');


CREATE TABLE viajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ruta_id INT,
    bus_id INT,
    fecha_salida DATETIME,
    precio DECIMAL(10,2),
    estado VARCHAR(50),
    FOREIGN KEY (ruta_id) REFERENCES rutas(id),
    FOREIGN KEY (bus_id) REFERENCES buses(id)
);

INSERT INTO viajes (ruta_id, bus_id, fecha_salida, precio, estado) VALUES
(1, 1, '2026-05-01 08:00:00', 150.00, 'Activo'),
(2, 2, '2026-05-02 09:00:00', 180.00, 'Activo'),
(3, 1, '2026-05-03 07:30:00', 120.00, 'Activo');


CREATE TABLE carrito (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);


CREATE TABLE carrito_detalle (
    id INT AUTO_INCREMENT PRIMARY KEY,
    carrito_id INT,
    viaje_id INT,
    cantidad INT,
    precio DECIMAL(10,2),
    FOREIGN KEY (carrito_id) REFERENCES carrito(id),
    FOREIGN KEY (viaje_id) REFERENCES viajes(id)
);


CREATE TABLE ordenes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    total DECIMAL(10,2),
    estado VARCHAR(50),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

INSERT INTO ordenes (usuario_id, total, estado) VALUES
(1, 150.00, 'Pagado'),
(1, 180.00, 'Pendiente');


CREATE TABLE orden_detalle (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT,
    viaje_id INT,
    cantidad INT,
    precio DECIMAL(10,2),
    FOREIGN KEY (orden_id) REFERENCES ordenes(id),
    FOREIGN KEY (viaje_id) REFERENCES viajes(id)
);


CREATE TABLE pagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT,
    metodo VARCHAR(50),
    monto DECIMAL(10,2),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (orden_id) REFERENCES ordenes(id)
);


CREATE TABLE historial (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    accion VARCHAR(255),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);