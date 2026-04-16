CREATE DATABASE empresa_buses;
USE empresa_buses;


CREATE TABLE `asientos` (
  `id` int(11) NOT NULL,
  `viaje_id` int(11) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `estado` varchar(50) DEFAULT 'disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `buses` (
  `id` int(11) NOT NULL,
  `placa` varchar(20) DEFAULT NULL,
  `tipo_id` int(11) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `buses` (`id`, `placa`, `tipo_id`, `estado`) VALUES
(1, 'Prueba2', 2, 'Pendiente'),
(2, 'ABC123', 1, 'Disponible'),
(3, 'XYZ789', 2, 'Disponible'),
(4, 'BUS456', 1, 'Mantenimiento');

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `carrito_detalle` (
  `id` int(11) NOT NULL,
  `carrito_id` int(11) DEFAULT NULL,
  `viaje_id` int(11) DEFAULT NULL,
  `asiento_id` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `funciones` (
  `fncod` varchar(50) NOT NULL,
  `fndsc` varchar(100) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `funciones` (`fncod`, `fndsc`, `fnest`, `fntyp`) VALUES
('buses_DEL', 'Eliminar buses', 'ACT', 'CTR'),
('buses_INS', 'Insertar buses', 'ACT', 'CTR'),
('buses_UPD', 'Actualizar buses', 'ACT', 'CTR'),
('Controllers\\Home\\Acerca', 'Controllers\\Home\\Acerca', 'ACT', 'ACT'),
('Controllers\\Home\\Contacto', 'Controllers\\Home\\Contacto', 'ACT', 'ACT'),
('Controllers\\Home\\Dashboard', 'Controllers\\Home\\Dashboard', 'ACT', 'ACT'),
('Controllers\\Mantenimientos\\Buses\\Formulario', 'Controllers\\Mantenimientos\\Buses\\Formulario', 'ACT', 'ACT'),
('Controllers\\Mantenimientos\\Buses\\Listado', 'Controllers\\Mantenimientos\\Buses\\Listado', 'ACT', 'CTR'),
('Controllers\\Mantenimientos\\Dashboard\\Dashboard', 'Panel mantenimientos', 'ACT', 'CTR'),
('Controllers\\Mantenimientos\\Libros\\Listado', 'Controllers\\Mantenimientos\\Libros\\Listado', 'ACT', 'CTR'),
('Controllers\\Mantenimientos\\Ordenes\\Formulario', 'Controllers\\Mantenimientos\\Ordenes\\Formulario', 'ACT', 'ACT'),
('Controllers\\Mantenimientos\\Ordenes\\Listado', 'Listado ordenes', 'ACT', 'CTR'),
('Controllers\\Mantenimientos\\Pagos\\Listado', 'Listado pagos', 'ACT', 'CTR'),
('Controllers\\Mantenimientos\\Rutas\\Listado', 'Listado rutas', 'ACT', 'CTR'),
('Controllers\\Mantenimientos\\Usuarios\\Listado', 'Listado usuarios', 'ACT', 'CTR'),
('Controllers\\Mantenimientos\\Viajes\\Listado', 'Controllers\\Mantenimientos\\Viajes\\Listado', 'ACT', 'ACT'),
('Controllers\\Pf_Seguridad\\control', 'Controllers\\Pf_Seguridad\\control', 'ACT', 'CTR'),
('Menu_Mantenimientos', 'Menu_Mantenimientos', 'ACT', 'ACT'),
('Menu_PaymentCheckout', 'Menu_PaymentCheckout', 'ACT', 'MNU'),
('ordenes_UPD', 'ordenes_UPD', 'ACT', 'ACT'),
('PF_SEGURIDAD_CONTROL', 'Acceso Seguridad', 'ACT', 'MNU');

CREATE TABLE `funciones_roles` (
  `fncod` varchar(50) DEFAULT NULL,
  `rolescod` varchar(50) DEFAULT NULL,
  `fnrolest` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `funciones_roles` (`fncod`, `rolescod`, `fnrolest`) VALUES
('PF_SEGURIDAD_CONTROL', 'admin', 'ACT'),
('Menu_PaymentCheckout', '1', 'ACT'),
('Menu_PaymentCheckout', 'admin', 'ACT'),
('Controllers\\Pf_Seguridad\\Control', 'admin', 'ACT'),
('buses_INS', 'admin', 'ACT'),
('buses_UPD', 'admin', 'ACT'),
('buses_DEL', 'admin', 'ACT'),
('Controllers\\Mantenimientos\\Buses\\Listado', 'admin', 'ACT'),
('buses_INS', 'admin', 'ACT'),
('buses_UPD', 'admin', 'ACT'),
('buses_DEL', 'admin', 'ACT'),
('Controllers\\Mantenimientos\\Buses\\Formulario', 'admin', 'ACT'),
('Controllers\\Mantenimientos\\Viajes\\Listado', 'admin', 'ACT'),
('Controllers\\Mantenimientos\\Pagos\\Listado', 'admin', 'ACT'),
('Controllers\\Mantenimientos\\Ordenes\\Listado', 'admin', 'ACT'),
('Controllers\\Mantenimientos\\Rutas\\Listado', 'admin', 'ACT'),
('Controllers\\Mantenimientos\\Usuarios\\Listado', 'admin', 'ACT'),
('Controllers\\Mantenimientos\\Dashboard\\Dashboard', 'admin', 'ACT'),
('ordenes_INS', 'admin', 'ACT'),
('ordenes_UPD', 'admin', 'ACT'),
('ordenes_DEL', 'admin', 'ACT');

CREATE TABLE `historial` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `accion` text DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `ordenes` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `ordenes` (`id`, `usuario_id`, `total`, `estado`, `fecha`) VALUES
(1, 1, 150.00, 'Pagado', '2026-04-15 06:55:14'),
(2, 1, 180.00, 'Pendiente', '2026-04-15 06:55:14');

CREATE TABLE `orden_detalle` (
  `id` int(11) NOT NULL,
  `orden_id` int(11) DEFAULT NULL,
  `viaje_id` int(11) DEFAULT NULL,
  `asiento_id` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL,
  `orden_id` int(11) DEFAULT NULL,
  `metodo` varchar(50) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `pagos` (`id`, `orden_id`, `metodo`, `estado`, `transaction_id`, `fecha`) VALUES
(1, 1, 'PayPal', 'Completado', 'TXN123456', '2026-04-15 06:55:26'),
(2, 2, 'Tarjeta', 'Pendiente', 'TXN789012', '2026-04-15 06:55:26');

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'admin'),
(2, 'cliente');

CREATE TABLE `roles_usuarios` (
  `usercod` int(11) DEFAULT NULL,
  `rolescod` varchar(50) DEFAULT NULL,
  `roleuserest` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `roles_usuarios` (`usercod`, `rolescod`, `roleuserest`) VALUES
(1, 'admin', 'ACT'),
(3, 'admin', 'INA'),
(6, 'admin', 'ACT'),
(3, 'usuario', 'ACT'),
(2, '1', 'ACT'),
(2, 'admin', 'ACT'),
(22, 'usuario', 'INA'),
(22, 'admin', 'INA'),
(22, 'admin', 'INA'),
(22, 'admin', 'INA'),
(22, 'admin', 'INA'),
(22, 'admin', 'ACT');

CREATE TABLE `rutas` (
  `id` int(11) NOT NULL,
  `origen` varchar(100) DEFAULT NULL,
  `destino` varchar(100) DEFAULT NULL,
  `distancia_km` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `rutas` (`id`, `origen`, `destino`, `distancia_km`) VALUES
(1, 'Tegucigalpa', 'San Pedro Sula', 240.00),
(2, 'Tegucigalpa', 'La Ceiba', 300.00),
(3, 'San Pedro Sula', 'Copán', 180.00),
(4, 'La Ceiba', 'Tela', 100.00);

CREATE TABLE `tipos_bus` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `tipos_bus` (`id`, `nombre`, `descripcion`, `capacidad`) VALUES
(1, 'Económico', 'Bus básico', 40),
(2, 'Ejecutivo', 'Bus cómodo', 30),
(3, 'VIP', 'Bus de lujo', 20);

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `rol_id`, `estado`, `creado_en`) VALUES
(1, 'Andrea', 'test123@gmaicom', '123456', 1, 1, '2026-04-11 03:18:07'),
(3, 'jdvp733', 'jdvp733@gmail.com', '$2y$10$0ulVmlThnNlxtJUJPuWsveXXJtw7VnP4VCNBYJL7erlVugjnYggZy', 2, 1, '2026-04-12 04:01:37'),
(6, 'admin', 'admin@admin.com', '$2y$10$tTtQOAGiKFIDCIxdb.6WUuV1h5fXuLuqisSPL5qmEGtu5ZDOzGpum', 1, 1, '2026-04-12 04:29:50'),
(22, 'j4', 'j4@gmail.com', '$2y$10$USjS0n.6SLCoGUkbAzDXIe.sus/8lxnDEyersK5do0QV7H1YWCJiS', 1, 1, '2026-04-12 07:11:26');

CREATE TABLE `viajes` (
  `id` int(11) NOT NULL,
  `ruta_id` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `fecha_salida` datetime DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `viajes` (`id`, `ruta_id`, `bus_id`, `fecha_salida`, `precio`, `estado`) VALUES
(1, 1, 1, '2026-05-01 08:00:00', 150.00, 'Activo'),
(2, 2, 2, '2026-05-02 09:00:00', 180.00, 'Activo'),
(3, 3, 1, '2026-05-03 07:30:00', 120.00, 'Activo');

ALTER TABLE `asientos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `viaje_id` (`viaje_id`);

ALTER TABLE `buses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `placa` (`placa`),
  ADD KEY `tipo_id` (`tipo_id`);

ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

ALTER TABLE `carrito_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carrito_id` (`carrito_id`),
  ADD KEY `viaje_id` (`viaje_id`),
  ADD KEY `asiento_id` (`asiento_id`);

ALTER TABLE `funciones`
  ADD PRIMARY KEY (`fncod`);

ALTER TABLE `historial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

ALTER TABLE `orden_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orden_id` (`orden_id`),
  ADD KEY `viaje_id` (`viaje_id`),
  ADD KEY `asiento_id` (`asiento_id`);

ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orden_id` (`orden_id`);

ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `rutas`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `tipos_bus`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `rol_id` (`rol_id`);

ALTER TABLE `viajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ruta_id` (`ruta_id`),
  ADD KEY `bus_id` (`bus_id`);

ALTER TABLE `asientos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `buses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `carrito_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `ordenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `orden_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `rutas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `tipos_bus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

ALTER TABLE `viajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `asientos`
  ADD CONSTRAINT `asientos_ibfk_1` FOREIGN KEY (`viaje_id`) REFERENCES `viajes` (`id`);

ALTER TABLE `buses`
  ADD CONSTRAINT `buses_ibfk_1` FOREIGN KEY (`tipo_id`) REFERENCES `tipos_bus` (`id`);

ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

ALTER TABLE `carrito_detalle`
  ADD CONSTRAINT `carrito_detalle_ibfk_1` FOREIGN KEY (`carrito_id`) REFERENCES `carrito` (`id`),
  ADD CONSTRAINT `carrito_detalle_ibfk_2` FOREIGN KEY (`viaje_id`) REFERENCES `viajes` (`id`),
  ADD CONSTRAINT `carrito_detalle_ibfk_3` FOREIGN KEY (`asiento_id`) REFERENCES `asientos` (`id`);

ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

ALTER TABLE `ordenes`
  ADD CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

ALTER TABLE `orden_detalle`
  ADD CONSTRAINT `orden_detalle_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes` (`id`),
  ADD CONSTRAINT `orden_detalle_ibfk_2` FOREIGN KEY (`viaje_id`) REFERENCES `viajes` (`id`),
  ADD CONSTRAINT `orden_detalle_ibfk_3` FOREIGN KEY (`asiento_id`) REFERENCES `asientos` (`id`);

ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes` (`id`);

ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);

ALTER TABLE `viajes`
  ADD CONSTRAINT `viajes_ibfk_1` FOREIGN KEY (`ruta_id`) REFERENCES `rutas` (`id`),
  ADD CONSTRAINT `viajes_ibfk_2` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`id`);
COMMIT;
