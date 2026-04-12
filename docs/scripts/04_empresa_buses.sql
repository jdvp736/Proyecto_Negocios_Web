
CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE tipos_bus (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    capacidad INT
) ENGINE=InnoDB;

CREATE TABLE rutas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    origen VARCHAR(100),
    destino VARCHAR(100),
    distancia_km DECIMAL(6,2)
) ENGINE=InnoDB;

CREATE TABLE funciones (
    fncod VARCHAR(50) PRIMARY KEY,
    fndsc VARCHAR(100),
    fnest CHAR(3),
    fntyp CHAR(3)
) ENGINE=InnoDB;


CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(255),
    rol_id INT,
    estado TINYINT(1) DEFAULT 1,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (rol_id) REFERENCES roles(id)
) ENGINE=InnoDB;

CREATE TABLE buses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(20) UNIQUE,
    tipo_id INT,
    estado VARCHAR(50),
    FOREIGN KEY (tipo_id) REFERENCES tipos_bus(id)
) ENGINE=InnoDB;

CREATE TABLE viajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ruta_id INT,
    bus_id INT,
    fecha_salida DATETIME,
    precio DECIMAL(10,2),
    estado VARCHAR(50),
    FOREIGN KEY (ruta_id) REFERENCES rutas(id),
    FOREIGN KEY (bus_id) REFERENCES buses(id)
) ENGINE=InnoDB;


CREATE TABLE asientos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    viaje_id INT,
    numero INT,
    estado VARCHAR(50) DEFAULT 'disponible',
    FOREIGN KEY (viaje_id) REFERENCES viajes(id)
) ENGINE=InnoDB;

CREATE TABLE carrito (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
) ENGINE=InnoDB;

CREATE TABLE carrito_detalle (
    id INT AUTO_INCREMENT PRIMARY KEY,
    carrito_id INT,
    viaje_id INT,
    asiento_id INT,
    precio DECIMAL(10,2),
    FOREIGN KEY (carrito_id) REFERENCES carrito(id),
    FOREIGN KEY (viaje_id) REFERENCES viajes(id),
    FOREIGN KEY (asiento_id) REFERENCES asientos(id)
) ENGINE=InnoDB;

CREATE TABLE ordenes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    total DECIMAL(10,2),
    estado VARCHAR(50),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
) ENGINE=InnoDB;

CREATE TABLE orden_detalle (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT,
    viaje_id INT,
    asiento_id INT,
    precio DECIMAL(10,2),
    FOREIGN KEY (orden_id) REFERENCES ordenes(id),
    FOREIGN KEY (viaje_id) REFERENCES viajes(id),
    FOREIGN KEY (asiento_id) REFERENCES asientos(id)
) ENGINE=InnoDB;

CREATE TABLE pagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT,
    metodo VARCHAR(50),
    estado VARCHAR(50),
    transaction_id VARCHAR(100),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (orden_id) REFERENCES ordenes(id)
) ENGINE=InnoDB;

CREATE TABLE historial (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    accion TEXT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
) ENGINE=InnoDB;


CREATE TABLE roles_usuarios (
    usercod INT,
    rolescod VARCHAR(50),
    roleuserest CHAR(3)
) ENGINE=InnoDB;

CREATE TABLE funciones_roles (
    fncod VARCHAR(50),
    rolescod VARCHAR(50),
    fnrolest CHAR(3)
) ENGINE=InnoDB;