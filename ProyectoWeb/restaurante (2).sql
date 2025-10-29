-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2025 a las 06:03:52
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrativo`
--

CREATE TABLE `administrativo` (
  `cedula` varchar(13) NOT NULL,
  `cargo` varchar(50) NOT NULL,
  `antiguedad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `administrativo`
--

INSERT INTO `administrativo` (`cedula`, `cargo`, `antiguedad`) VALUES
('11-2233-44556', 'Gerente', 5),
('22-3344-55667', 'administrador', 3),
('33-4455-66778', 'contador', 4),
('44-5566-77889', 'administrador', 2),
('55-6677-88990', 'contador', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camarero`
--

CREATE TABLE `camarero` (
  `cedula` varchar(13) NOT NULL,
  `años_experiencia` int(11) NOT NULL,
  `habilidades` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `camarero`
--

INSERT INTO `camarero` (`cedula`, `años_experiencia`, `habilidades`) VALUES
('12-3456-78901', 3, 'Atención rápida, conocimiento de vinos'),
('23-4567-89012', 5, 'Trato con clientes exigentes'),
('34-5678-90123', 2, 'Servicio en barra'),
('45-6789-01234', 4, 'Coordinación de mesas'),
('56-7890-12345', 1, 'Servicio básico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cedula` varchar(13) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cedula`, `nombre`, `apellido`, `direccion`, `telefono`, `fecha_nacimiento`) VALUES
('00-1122-22334', 'Elena', 'Vargas', 'Av. DD, Ciudad', '000-1112', '1995-01-03'),
('00-9999-88888', 'Felipe', 'Campos', 'Av. J, Ciudad', '000-1111', '1989-06-22'),
('09-0987-65432', 'Valeria', 'Campos', 'Av. T, Ciudad', '010-1111', '1996-02-28'),
('10-9876-54321', 'Alejandro', 'Fernández', 'Av. K, Ciudad', '101-2020', '1991-01-12'),
('11-0000-99999', 'Adriana', 'Solís', 'Av. I, Ciudad', '888-9999', '1998-03-19'),
('11-2233-33445', 'Fernando', 'Guzmán', 'Av. U, Ciudad', '111-2221', '1984-09-12'),
('21-8765-43210', 'Camila', 'Suárez', 'Av. L, Ciudad', '202-3030', '1993-03-25'),
('22-1111-00000', 'Héctor', 'Navarro', 'Av. H, Ciudad', '666-7777', '1970-09-08'),
('22-3344-44556', 'Mariana', 'Castillo', 'Av. V, Ciudad', '222-3332', '1991-08-20'),
('32-7654-32109', 'Eduardo', 'Moreno', 'Av. M, Ciudad', '303-4040', '1988-07-30'),
('33-2222-11111', 'Isabel', 'Cordero', 'Av. G, Ciudad', '444-5555', '1982-04-17'),
('33-4455-55667', 'Ricardo', 'Duarte', 'Av. W, Ciudad', '333-4443', '1986-03-11'),
('43-6543-21098', 'Isabella', 'Paredes', 'Av. N, Ciudad', '404-5050', '1995-10-14'),
('44-3333-22222', 'Oscar', 'Méndez', 'Av. F, Ciudad', '222-3333', '1992-12-25'),
('44-5566-66778', 'Sofía', 'Mora', 'Av. X, Ciudad', '444-5554', '1994-12-01'),
('54-5432-10987', 'Javier', 'Vega', 'Av. O, Ciudad', '505-6060', '1985-05-08'),
('55-4444-33333', 'Gabriela', 'Ríos', 'Av. E, Ciudad', '999-0000', '2000-07-03'),
('55-6677-77889', 'Andrés', 'Palacios', 'Av. Y, Ciudad', '555-6665', '1988-07-14'),
('65-4321-09876', 'Lucía', 'Herrera', 'Av. P, Ciudad', '606-7070', '1990-11-22'),
('66-5555-44444', 'Ricardo', 'Silva', 'Av. D, Ciudad', '777-8888', '1978-08-12'),
('66-7788-88990', 'Camila', 'Ramos', 'Av. Z, Ciudad', '666-7776', '1993-11-29'),
('76-3210-98765', 'Mario', 'Reyes', 'Av. Q, Ciudad', '707-8080', '1987-12-05'),
('77-6666-55555', 'Laura', 'Morales', 'Av. C, Ciudad', '555-6666', '1995-02-20'),
('77-8899-99001', 'Diego', 'Suárez', 'Av. AA, Ciudad', '777-8887', '1989-05-07'),
('87-2109-87654', 'Natalia', 'Ortiz', 'Av. R, Ciudad', '808-9090', '1992-04-17'),
('88-7777-66666', 'Juan', 'Díaz', 'Av. B, Ciudad', '333-4444', '1985-11-30'),
('88-9900-00112', 'Paola', 'Cárdenas', 'Av. BB, Ciudad', '888-9998', '1992-09-18'),
('98-1098-76543', 'Pedro', 'Salazar', 'Av. S, Ciudad', '909-1010', '1989-06-30'),
('99-0011-11223', 'Luis', 'Beltrán', 'Av. CC, Ciudad', '999-0009', '1990-06-25'),
('99-8888-77777', 'María', 'González', 'Av. A, Ciudad', '111-2222', '1990-05-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cocinero`
--

CREATE TABLE `cocinero` (
  `cedula` varchar(13) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `especialidad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cocinero`
--

INSERT INTO `cocinero` (`cedula`, `tipo`, `especialidad`) VALUES
('01-2345-67890', 'cocinero', 'Ensaladas'),
('67-8901-23456', 'Jefe de cocina', 'Cocina fusión'),
('78-9012-34567', 'Subchef', 'Carnes'),
('89-0123-45678', 'cocinero', 'Pastas'),
('90-1234-56789', 'cocinero', 'Postres');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contiene`
--

CREATE TABLE `contiene` (
  `codigo_plato` int(11) NOT NULL,
  `codigo_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contiene`
--

INSERT INTO `contiene` (`codigo_plato`, `codigo_producto`, `cantidad`) VALUES
(301, 101, 3),
(301, 105, 1),
(302, 102, 2),
(302, 103, 1),
(303, 102, 1),
(303, 104, 1),
(304, 108, 2),
(304, 109, 1),
(305, 101, 2),
(305, 110, 1),
(306, 103, 1),
(306, 105, 2),
(307, 102, 3),
(307, 105, 2),
(307, 106, 1),
(308, 101, 1),
(308, 105, 1),
(308, 107, 1),
(308, 108, 1),
(309, 101, 2),
(309, 106, 1),
(309, 108, 2),
(309, 109, 1),
(310, 102, 1),
(310, 103, 2),
(310, 105, 3),
(310, 108, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `cedula` varchar(13) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`cedula`, `nombre`, `apellido`, `direccion`, `email`, `id_usuario`) VALUES
('01-2345-67890', 'Elena', 'Torres', 'Calle 10, Ciudad', 'elena@email.com', NULL),
('09-0000-11111', 'Fernanda', 'Cordero', 'Calle 29, Ciudad', 'fernanda@email.com', NULL),
('10-1111-22222', 'Sergio', 'Pérez', 'Calle 20, Ciudad', 'sergio@email.com', NULL),
('11-2233-44556', 'Roberto', 'Jiménez', 'Calle 11, Ciudad', 'roberto@email.com', NULL),
('12-3456-78901', 'Carlos', 'Martínez', 'Calle 1, Ciudad', 'carlos@email.com', NULL),
('20-1111-22222', 'Rafael', 'Silva', 'Calle 30, Ciudad', 'rafael@email.com', NULL),
('21-2222-33333', 'Valentina', 'Gómez', 'Calle 21, Ciudad', 'valentina@email.com', NULL),
('22-3344-55667', 'Carmen', 'Vargas', 'Calle 12, Ciudad', 'carmen@email.com', NULL),
('23-4567-89012', 'Ana', 'Rodríguez', 'Calle 2, Ciudad', 'ana@email.com', NULL),
('31-2222-33333', 'Paola', 'Gutiérrez', 'Calle 31, Ciudad', 'paola@email.com', NULL),
('32-3333-44444', 'Miguel', 'Castro', 'Calle 22, Ciudad', 'miguel2@email.com', NULL),
('33-4455-66778', 'Andrés', 'Castro', 'Calle 13, Ciudad', 'andres@email.com', NULL),
('34-5678-90123', 'Luis', 'García', 'Calle 3, Ciudad', 'luis@email.com', NULL),
('42-3333-44444', 'Tomás', 'Díaz', 'Calle 32, Ciudad', 'tomas@email.com', NULL),
('43-4444-55555', 'Lorena', 'Ramírez', 'Calle 23, Ciudad', 'lorena@email.com', NULL),
('44-5566-77889', 'Patricia', 'Rojas', 'Calle 14, Ciudad', 'patricia@email.com', NULL),
('45-6789-01234', 'Marta', 'López', 'Calle 4, Ciudad', 'marta@email.com', NULL),
('53-4444-55555', 'Elisa', 'Solís', 'Calle 33, Ciudad', 'elisa@email.com', NULL),
('54-5555-66666', 'Esteban', 'Vargas', 'Calle 24, Ciudad', 'esteban@email.com', NULL),
('55-6677-88990', 'Fernando', 'Mendoza', 'Calle 15, Ciudad', 'fernando@email.com', NULL),
('56-7890-12345', 'Jorge', 'Hernández', 'Calle 5, Ciudad', 'jorge@email.com', NULL),
('64-5555-66666', 'Javier', 'Campos', 'Calle 34, Ciudad', 'javier@email.com', NULL),
('65-6666-77777', 'Natalia', 'Rojas', 'Calle 25, Ciudad', 'natalia@email.com', NULL),
('66-7777-88888', 'Victoria', 'López', 'Calle 16, Ciudad', 'victoria@email.com', NULL),
('67-8901-23456', 'Sofía', 'Pérez', 'Calle 6, Ciudad', 'sofia@email.com', NULL),
('75-6666-77777', 'Clara', 'Rivas', 'Calle 35, Ciudad', 'clara@email.com', NULL),
('76-7777-88888', 'Andrés', 'Santos', 'Calle 26, Ciudad', 'andres2@email.com', NULL),
('77-8888-99999', 'Manuel', 'Cruz', 'Calle 17, Ciudad', 'manuel@email.com', NULL),
('78-9012-34567', 'Pedro', 'Sánchez', 'Calle 7, Ciudad', 'pedro@email.com', NULL),
('87-8888-99999', 'Camila', 'Morales', 'Calle 27, Ciudad', 'camila@email.com', NULL),
('88-9999-00000', 'Julia', 'Hernández', 'Calle 18, Ciudad', 'julia@email.com', NULL),
('89-0123-45678', 'Lucía', 'Ramírez', 'Calle 8, Ciudad', 'lucia@email.com', NULL),
('90-1234-56789', 'Diego', 'Flores', 'Calle 9, Ciudad', 'diego@email.com', NULL),
('98-9999-00000', 'Bruno', 'Mendoza', 'Calle 28, Ciudad', 'bruno@email.com', NULL),
('99-0000-11111', 'Diego', 'Torres', 'Calle 19, Ciudad', 'diego2@email.com', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incluye`
--

CREATE TABLE `incluye` (
  `num_orden` int(11) NOT NULL,
  `codigo_plato` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `incluye`
--

INSERT INTO `incluye` (`num_orden`, `codigo_plato`, `cantidad`) VALUES
(1001, 301, 2),
(1001, 302, 1),
(1001, 303, 1),
(1002, 301, 2),
(1002, 303, 1),
(1002, 304, 1),
(1003, 302, 1),
(1003, 305, 1),
(1003, 307, 2),
(1004, 305, 2),
(1004, 309, 3),
(1005, 302, 2),
(1005, 304, 1),
(1006, 301, 1),
(1006, 306, 1),
(1006, 310, 1),
(1007, 306, 2),
(1007, 308, 2),
(1008, 302, 1),
(1008, 304, 1),
(1008, 307, 1),
(1009, 307, 1),
(1009, 310, 2),
(1010, 303, 1),
(1010, 308, 2),
(1011, 309, 1),
(1012, 310, 2),
(1013, 303, 1),
(1014, 301, 1),
(1015, 305, 2),
(1016, 306, 1),
(1017, 304, 2),
(1018, 307, 1),
(1019, 308, 2),
(1020, 309, 1),
(1021, 301, 1),
(1021, 302, 2),
(1022, 303, 1),
(1022, 304, 1),
(1023, 305, 2),
(1023, 306, 1),
(1024, 307, 1),
(1024, 308, 2),
(1025, 309, 1),
(1025, 310, 1),
(1026, 301, 2),
(1026, 304, 1),
(1027, 302, 1),
(1027, 305, 2),
(1028, 306, 1),
(1028, 307, 1),
(1029, 308, 2),
(1029, 309, 1),
(1030, 301, 2),
(1030, 310, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maneja`
--

CREATE TABLE `maneja` (
  `cedula_administrativo` varchar(13) NOT NULL,
  `id_sucursal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `maneja`
--

INSERT INTO `maneja` (`cedula_administrativo`, `id_sucursal`) VALUES
('11-2233-44556', 1),
('22-3344-55667', 2),
('33-4455-66778', 3),
('44-5566-77889', 4),
('55-6677-88990', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa`
--

CREATE TABLE `mesa` (
  `id_mesa` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `ubicacion` varchar(100) DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'Disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ofrece`
--

CREATE TABLE `ofrece` (
  `id_sucursal` int(11) NOT NULL,
  `codigo_plato` int(11) NOT NULL,
  `imagen` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ofrece`
--

INSERT INTO `ofrece` (`id_sucursal`, `codigo_plato`, `imagen`) VALUES
(1, 301, NULL),
(1, 302, NULL),
(1, 304, NULL),
(1, 306, NULL),
(1, 312, NULL),
(1, 313, NULL),
(1, 314, NULL),
(1, 315, NULL),
(1, 316, NULL),
(1, 317, NULL),
(1, 318, NULL),
(1, 319, NULL),
(1, 320, NULL),
(1, 321, NULL),
(1, 322, NULL),
(1, 323, NULL),
(1, 324, NULL),
(1, 325, NULL),
(2, 303, NULL),
(2, 305, NULL),
(2, 308, NULL),
(3, 301, NULL),
(3, 307, NULL),
(3, 310, NULL),
(4, 302, NULL),
(4, 304, NULL),
(4, 309, NULL),
(5, 303, NULL),
(5, 306, NULL),
(5, 308, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `num_orden` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto_total` decimal(10,2) NOT NULL,
  `forma_pago` varchar(50) NOT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `cedula_cliente` varchar(13) DEFAULT NULL,
  `cedula_camarero` varchar(13) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `estado` enum('pendiente','cancelada','completada') NOT NULL DEFAULT 'pendiente',
  `nota` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`num_orden`, `fecha`, `monto_total`, `forma_pago`, `id_sucursal`, `cedula_cliente`, `cedula_camarero`, `id_usuario`, `estado`, `nota`) VALUES
(1, '2025-10-28', 8.00, 'Tarjeta', 3, NULL, NULL, NULL, 'pendiente', ''),
(1001, '2024-06-01', 32.50, 'Tarjeta', 1, '99-8888-77777', '12-3456-78901', NULL, 'pendiente', ''),
(1002, '2024-06-02', 25.00, 'Efectivo', 2, '88-7777-66666', '23-4567-89012', NULL, 'pendiente', ''),
(1003, '2024-06-03', 41.00, 'Tarjeta', 3, '77-6666-55555', '34-5678-90123', NULL, 'pendiente', ''),
(1004, '2024-06-04', 18.50, 'Efectivo', 4, '66-5555-44444', '45-6789-01234', NULL, 'pendiente', ''),
(1005, '2024-06-05', 29.75, 'Tarjeta', 5, '55-4444-33333', '56-7890-12345', NULL, 'pendiente', ''),
(1006, '2024-06-06', 36.00, 'Efectivo', 1, '44-3333-22222', '12-3456-78901', NULL, 'pendiente', ''),
(1007, '2024-06-07', 22.50, 'Tarjeta', 2, '33-2222-11111', '23-4567-89012', NULL, 'pendiente', ''),
(1008, '2024-06-08', 47.25, 'Efectivo', 3, '22-1111-00000', '34-5678-90123', NULL, 'pendiente', ''),
(1009, '2024-06-09', 15.00, 'Tarjeta', 4, '11-0000-99999', '45-6789-01234', NULL, 'pendiente', ''),
(1010, '2024-06-10', 28.50, 'Efectivo', 5, '00-9999-88888', '56-7890-12345', NULL, 'pendiente', ''),
(1011, '2024-06-11', 35.00, 'Tarjeta', 1, '99-8888-77777', '12-3456-78901', NULL, 'pendiente', ''),
(1012, '2024-06-12', 22.75, 'Efectivo', 2, '88-7777-66666', '23-4567-89012', NULL, 'pendiente', ''),
(1013, '2024-06-13', 40.50, 'Tarjeta', 3, '77-6666-55555', '34-5678-90123', NULL, 'pendiente', ''),
(1014, '2024-06-14', 19.00, 'Efectivo', 4, '66-5555-44444', '45-6789-01234', NULL, 'pendiente', ''),
(1015, '2024-06-15', 31.20, 'Tarjeta', 5, '55-4444-33333', '56-7890-12345', NULL, 'pendiente', ''),
(1016, '2024-06-16', 38.75, 'Efectivo', 1, '44-3333-22222', '12-3456-78901', NULL, 'pendiente', ''),
(1017, '2024-06-17', 24.50, 'Tarjeta', 2, '33-2222-11111', '23-4567-89012', NULL, 'pendiente', ''),
(1018, '2024-06-18', 49.00, 'Efectivo', 3, '22-1111-00000', '34-5678-90123', NULL, 'pendiente', ''),
(1019, '2024-06-19', 16.80, 'Tarjeta', 4, '11-0000-99999', '45-6789-01234', NULL, 'pendiente', ''),
(1020, '2024-06-20', 27.60, 'Efectivo', 5, '00-9999-88888', '56-7890-12345', NULL, 'pendiente', ''),
(1021, '2024-06-21', 34.50, 'Efectivo', 1, '99-8888-77777', '12-3456-78901', NULL, 'pendiente', ''),
(1022, '2024-06-22', 27.75, 'Tarjeta', 2, '88-7777-66666', '23-4567-89012', NULL, 'pendiente', ''),
(1023, '2024-06-23', 42.00, 'Efectivo', 3, '77-6666-55555', '34-5678-90123', NULL, 'pendiente', ''),
(1024, '2024-06-24', 19.50, 'Tarjeta', 4, '66-5555-44444', '45-6789-01234', NULL, 'pendiente', ''),
(1025, '2024-06-25', 30.25, 'Efectivo', 5, '55-4444-33333', '56-7890-12345', NULL, 'pendiente', ''),
(1026, '2024-06-26', 37.00, 'Tarjeta', 1, '44-3333-22222', '12-3456-78901', NULL, 'pendiente', ''),
(1027, '2024-06-27', 25.50, 'Efectivo', 2, '33-2222-11111', '23-4567-89012', NULL, 'pendiente', ''),
(1028, '2024-06-28', 48.75, 'Tarjeta', 3, '22-1111-00000', '34-5678-90123', NULL, 'pendiente', ''),
(1029, '2024-06-29', 16.20, 'Efectivo', 4, '11-0000-99999', '45-6789-01234', NULL, 'pendiente', ''),
(1030, '2024-06-30', 29.80, 'Tarjeta', 5, '00-9999-88888', '56-7890-12345', NULL, 'pendiente', ''),
(1031, '2024-07-01', 33.50, 'Efectivo', 1, '99-8888-77777', '12-3456-78901', NULL, 'cancelada', ''),
(1032, '2024-07-02', 26.25, 'Tarjeta', 2, '88-7777-66666', '23-4567-89012', NULL, 'pendiente', ''),
(1033, '2024-07-03', 41.75, 'Efectivo', 3, '77-6666-55555', '34-5678-90123', NULL, 'pendiente', ''),
(1034, '2024-07-04', 20.00, 'Tarjeta', 4, '66-5555-44444', '45-6789-01234', NULL, 'pendiente', ''),
(1035, '2024-07-05', 32.50, 'Efectivo', 5, '55-4444-33333', '56-7890-12345', NULL, 'pendiente', ''),
(1036, '2024-07-06', 39.80, 'Tarjeta', 1, '44-3333-22222', '12-3456-78901', NULL, 'completada', ''),
(1037, '2024-07-07', 24.90, 'Efectivo', 2, '33-2222-11111', '23-4567-89012', NULL, 'pendiente', ''),
(1038, '2024-07-08', 46.50, 'Tarjeta', 3, '22-1111-00000', '34-5678-90123', NULL, 'pendiente', ''),
(1039, '2024-07-09', 17.30, 'Efectivo', 4, '11-0000-99999', '45-6789-01234', NULL, 'pendiente', ''),
(1040, '2024-07-10', 28.90, 'Tarjeta', 5, '00-9999-88888', '56-7890-12345', NULL, 'pendiente', ''),
(1050, '0000-00-00', 0.00, '', NULL, NULL, NULL, NULL, 'pendiente', ''),
(1051, '2025-10-28', 78.00, 'Efectivo', 1, NULL, NULL, NULL, 'pendiente', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plato`
--

CREATE TABLE `plato` (
  `codigo_plato` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `cedula_cocinero` varchar(13) DEFAULT NULL,
  `imagen` varchar(150) DEFAULT NULL,
  `nombre` varchar(120) DEFAULT NULL,
  `disponible` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plato`
--

INSERT INTO `plato` (`codigo_plato`, `tipo`, `precio`, `descripcion`, `cedula_cocinero`, `imagen`, `nombre`, `disponible`) VALUES
(301, 'Entrada', 8.00, 'Nuestra auténtica Ensalada César es un clásico irresistible. Preparamos una crujiente base de lechuga romana fresca, la bañamos con una cremosa salsa César casera con el toque justo de ajo y anchoas, y la coronamos con crotones de pan tostado y generosas lascas de queso Parmesano recién rallado. ¡Una combinación de texturas y sabores perfectamente equilibrada!', '67-8901-23456', 'img/platos/ensalada_cesar.jpg', 'Ensalada Cesar', 1),
(302, 'Principal', 15.00, 'Sumérgete en una explosión de sabor con nuestro Pollo al Curry. Tiernos trozos de pechuga de pollo cocinados a fuego lento en una rica y cremosa salsa de curry con un equilibrio perfecto de especias exóticas y un toque de leche de coco. Servido tradicionalmente con arroz jazmín esponjoso. Es un plato reconfortante, lleno de aroma y con el calor justo.', '78-9012-34567', 'img/platos/pollo_curry.jpg', 'Pollo al Curry', 1),
(303, 'Principal', 18.00, 'Una opción deliciosa y saludable directamente desde nuestro horno. Presentamos un generoso filete de Salmón perfectamente horneado hasta quedar tierno y jugoso, infusionado con el aroma de hierbas frescas y un toque de limón. Se acompaña de patatas panaderas (o al romero) doradas y suaves, que absorben los jugos del pescado. ¡Un plato reconfortante y lleno de sabor casero!', '89-0123-45678', 'img/platos/salmon_horno.jpg\r\n', 'Salmón al Horno con Patatas', 1),
(304, 'Postre', 7.00, 'El postre italiano por excelencia, cremoso e irresistible. Nuestro Tiramisú se elabora siguiendo la receta tradicional: delicadas capas de bizcochos de soletilla empapados en un fuerte café espresso, alternadas con una sedosa y aireada crema de queso Mascarpone y un toque de licor (o Amaretto). Finalizado con una generosa espolvoreada de cacao puro en polvo. ¡Un final dulce y sofisticado para tu comida!', '90-1234-56789', 'img/platos/tiramisu.jpg', 'Tiramisú', 1),
(305, 'Entrada', 9.00, 'Una experiencia reconfortante con todo el sabor del océano. Nuestra Sopa de Mariscos es un caldo profundo y sabroso, cocinado lentamente con una base de verduras y especias que realzan su sabor. Cargada generosamente con una selección de mariscos frescos como camarones, almejas, mejillones y trozos de pescado blanco (u otros mariscos que utilicen). Servida bien caliente, es nutritiva y deliciosa hasta la última cucharada.', '67-8901-23456', 'img/platos/sopa_de_mariscos.jpg', 'Sopa de Mariscos', 1),
(306, 'Principal', 16.50, 'Un viaje a la campiña en cada bocado. Preparamos nuestro Risotto de Hongos utilizando arroz Arborio cocido lentamente en un aromático caldo, logrando una textura perfectamente cremosa y al dente. Lo enriquecemos con una mezcla selecta de hongos silvestres salteados, mantequilla, y un toque final de queso Parmesano que aporta una profundidad irresistible. ¡Un plato elegante y sumamente reconfortante!', '78-9012-34567', 'img/platos/risotto_hongos.jpg', 'Risotto de Hongos', 1),
(307, 'Principal', 20.00, 'La máxima expresión de la ternura y el sabor. Servimos un corte de Filete Mignon (lomo) de la más alta calidad, sellado a la perfección para crear una costra deliciosa, mientras se mantiene increíblemente jugoso y tierno por dentro. Lo bañamos con nuestra clásica salsa de reducción de vino tinto (o la salsa que uses, por ejemplo, pimienta o trufa). Un plato verdaderamente memorable para los amantes de la carne.', '89-0123-45678', 'img/platos/filete_mignon.jpg', 'Filete Mignon', 1),
(308, 'Postre', 6.50, 'El postre tradicional que evoca el sabor de casa. Nuestro Flan de Caramelo se elabora diariamente con una base de huevos, leche y vainilla, logrando una textura sedosa, suave y delicada. Se sirve cubierto con un rico y brillante caramelo tostado que le da el equilibrio perfecto de dulzura. ¡Un capricho simple y delicioso que siempre es bienvenido!', '90-1234-56789', 'img/platos/flan.jpg', 'Flan de Caramelo', 1),
(309, 'Entrada', 7.50, 'El aperitivo perfecto para comenzar. Nuestras Bruschettas presentan rebanadas de pan rústico ligeramente tostado y untado con aceite de oliva. Se coronan con una fresca mezcla de tomate maduro en cubos, ajo picado, albahaca fresca y un chorrito de aceite de oliva extra virgen. ¡Una explosión de frescura mediterránea en cada mordisco!', '01-2345-67890', 'img/platos/bruschetta.jpg', 'Bruschettas Clásicas Italianas', 1),
(310, 'Postre', 8.00, 'Nuestro Cheesecake es el clásico que enamora. Presenta una base crujiente de galleta de mantequilla (o Graham) sobre la que reposa una generosa capa de crema de queso suave y aterciopelada, horneada a la perfección. Es ligeramente dulce y viene coronado con nuestra deliciosa salsa de frutos rojos (o el topping que utilices, como fresa o caramelo). ¡Un final de comida ligero, cremoso e inolvidable!', '01-2345-67890', 'img/platos/cheesecake.jpg', 'Cheesecake', 1),
(311, 'Entrada', 8.50, 'La sencillez elevada a la perfección. Esta clásica italiana combina rodajas frescas de mozzarella de búfala (o el queso que uses) y tomates maduros en su punto, alternados con aromáticas hojas de albahaca fresca. Un toque de aceite de oliva extra virgen de alta calidad y una pizca de sal marina completan este plato vibrante. ¡Un equilibrio perfecto de sabores, colores y frescura!', '67-8901-23456', 'img/platos/ensalada_caprese.jpg', 'Ensalada Caprese', 1),
(312, 'Entrada', 7.80, 'Una explosión de sabor fresco y cítrico. Nuestro Ceviche se prepara al momento con cubos de pescado blanco marinado en el potente y vibrante jugo de limas frescas. Lo mezclamos con cebolla morada en juliana, ají para un toque picante sutil, y cilantro fresco. Servido tradicionalmente con maíz tierno y camote. ¡Un manjar ligero, vibrante y lleno de tradición!', '67-8901-23456', 'img/platos/ceviche_pescado.jpg', 'Ceviche de Pescado', 1),
(313, 'Principal', 17.00, 'Un verdadero festín español que captura la esencia del Mediterráneo. Cocinamos nuestro arroz lentamente en un intenso caldo de marisco casero y azafrán, logrando ese sabor característico y el socarrat crujiente en el fondo. La paella viene generosamente cargada con gambas jugosas, almejas frescas y mejillones bañados en el aroma del limón. Ideal para compartir y disfrutar de una experiencia culinaria inolvidable.', '78-9012-34567', 'img/platos/paella_marisco.jpg', 'Paella de Mariscos', 1),
(314, 'Principal', 16.00, 'Una tentadora mezcla de dulce y salado. Nuestro Pollo a la Naranja presenta trozos de pechuga de pollo crujiente bañados en una salsa agridulce y vibrante de naranja natural y jengibre. El resultado es un glaseado delicioso y pegajoso que equilibra la acidez cítrica con un toque de dulzura. Servido con un toque de semillas de sésamo.', '78-9012-34567', 'img/platos/pollo_a_la_naranja.jpg', 'Pollo a la Naranja', 1),
(315, 'Principal', 22.50, 'Un corte sublime para los amantes de la carne. Nuestro Rib Eye se selecciona cuidadosamente por su exquisito marmoleo, que garantiza una jugosidad y sabor incomparables. Se sella a la perfección en nuestra parrilla de brasas, creando una corteza ahumada y un interior tierno. Lo servimos al término de su elección, realzando su sabor únicamente con sal marina.', '89-0123-45678', 'img/platos/rib_eye.jpg', 'Ribeye a la Parrilla', 1),
(316, 'Postre', 6.80, 'El placer de la combinación perfecta. Disfruta de nuestro Brownie casero, horneado hasta obtener un centro denso y fudgy. Se sirve caliente para crear un contraste exquisito al acompañarlo de una generosa bola de cremoso helado de vainilla (o el sabor que uses). Finalizado con un chorrito de salsa de chocolate. ¡Un postre decadente que no puedes perderte!', '90-1234-56789', 'img/platos/brownie_helado.jpg', 'Brownie con Helado', 1),
(317, 'Postre', 7.50, 'Una indulgencia ligera y sofisticada. Nuestro Mousse de Chocolate se elabora con chocolate oscuro de alta calidad, batido hasta alcanzar una textura increíblemente aireada, suave y espumosa. Es intenso en sabor, pero ligero al paladar. Servido frío y decorado con virutas de cacao (o ralladura de naranja). ¡El final perfecto para los verdaderos amantes del cacao!', '90-1234-56789', 'img/platos/mousse_chocolate.jpg', 'Mousse de Chocolate', 1),
(318, 'Entrada', 9.20, 'El aperitivo oriental que conquista paladares. Nuestros Rollitos Primavera son masas delgadas y crujientes rellenas con una mezcla fresca y sabrosa de vegetales cortados finamente (como repollo y zanahoria) y carne de cerdo o pollo (o solo vegetales, si son vegetarianos). Se fríen al momento para lograr la textura perfecta y se sirven con nuestra salsa agridulce casera.', '01-2345-67890', 'img/platos/rollitos_primavera.jpg', 'Rollitos Primavera', 1),
(319, 'Principal', 19.00, 'Disfruta de la sencillez y el sabor puro con nuestro Salmón a la Plancha. Un filete fresco de salmón chileno (o el origen que uses) sellado a la perfección en la plancha, logrando una piel crujiente y un interior jugoso y tierno. Lo sazonamos ligeramente con sal marina y pimienta para resaltar su sabor natural.', '89-0123-45678', 'img/platos/salmon_plancha.jpg', 'Salmón a la Plancha', 1),
(320, 'Principal', 15.50, 'El sabor de Roma en un plato icónico. Preparamos nuestro Espagueti Carbonara siguiendo la receta tradicional italiana: una cremosa y sedosa salsa elaborada únicamente con yema de huevo, queso Pecorino Romano rallado y trozos crujientes de Guanciale (o Pancetta). Servido con espagueti al dente y un toque de pimienta negra recién molida. ¡Pura indulgencia sin nata!', '78-9012-34567', 'img/platos/espagueti_carbonara.jpg', 'Espagueti Carbonara', 1),
(321, 'Postre', 8.20, 'El postre italiano más ligero y delicado. Nuestra Panna Cotta se elabora con crema fresca, azúcar y un toque de vainilla natural, logrando una textura suave, temblorosa y sedosa que se derrite en la boca. Se sirve desmoldada y cubierta con un vibrante y ligeramente ácido coulis de frutos rojos (o el topping de tu elección, como caramelo o café). ¡Un final de comida refrescante y sofisticado!', '90-1234-56789', 'img/platos/panna_cotta.jpg', 'Panna Cotta', 1),
(322, 'Entrada', 8.00, 'El sabor puro del verano, servido bien frío. Nuestro Gazpacho es una sopa fría tradicional andaluza, elaborada diariamente con la mejor selección de tomates maduros, pimientos, pepino, cebolla y un toque de ajo y aceite de oliva virgen extra. Es vibrante, ligero y extremadamente refrescante. ¡Perfecto para un inicio de comida saludable y revitalizante!', '67-8901-23456', 'img/platos/gazpacho.jpg', 'Gazpacho', 1),
(323, 'Principal', 18.50, 'Nuestro plato más reconfortante, con sabor a tradición. Preparamos nuestra Lasaña con múltiples capas de pasta fresca al huevo, intercaladas con una rica y sustanciosa salsa boloñesa casera a base de carne y un toque de vino. Se cubre generosamente con cremosa salsa bechamel y una mezcla de quesos gratinados (Mozzarella y Parmesano), horneada hasta alcanzar un dorado perfecto. ¡Un clásico abundante e irresistible!', '78-9012-34567', 'img/platos/lasana.jpg', 'Lasaña de Carne', 1),
(324, 'Principal', 21.00, 'Un bocado saludable y sofisticado del mar. Disfruta de un grueso filete de atún fresco de aleta amarilla, sellado rápidamente en nuestra parrilla para lograr una corteza crujiente y un interior rosado y jugoso (seared). Ligeramente marinado con un toque de soja, jengibre y semillas de sésamo. ¡Un plato ligero, lleno de sabor umami y cocinado a la perfección!', '89-0123-45678', 'img/platos/atun_parrilla.jpg', 'Atún a la Parrilla', 1),
(325, 'Postre', 7.00, 'El postre más emblemático de Cataluña. Una deliciosa crema a base de yemas de huevo y leche, infusionada con la esencia de cáscara de limón y canela, que le otorga un aroma exquisito. Servida fría, su toque final es una fina capa de azúcar caramelizado al momento con soplete, que se rompe crujientemente en cada cucharada. ¡Suave por dentro, crujiente por fuera!', '90-1234-56789', 'img/platos/crema_catalana.jpg', 'Crema Catalana', 1),
(326, 'Entrada', 8.30, 'Bruschetta de tomate y albahaca', '01-2345-67890', NULL, NULL, 1),
(327, 'Principal', 16.80, 'Cordero al horno', '78-9012-34567', NULL, NULL, 1),
(328, 'Principal', 20.50, 'Pollo tikka masala', '78-9012-34567', NULL, NULL, 1),
(329, 'Postre', 6.50, 'Helado de chocolate', '90-1234-56789', NULL, NULL, 1),
(330, 'Entrada', 7.90, 'Ensalada de quinoa', '67-8901-23456', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigo_producto` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `tipo_producto` varchar(15) DEFAULT NULL,
  `disponible` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigo_producto`, `nombre`, `precio`, `descripcion`, `tipo_producto`, `disponible`) VALUES
(101, 'Tomate', 1.50, 'Tomate fresco de tierras altas', 'Ingrediente', 1),
(102, 'Pollo', 4.00, 'Pollo orgánico', 'Ingrediente', 1),
(103, 'Arroz', 2.00, 'Arroz premium', 'Ingrediente', 1),
(104, 'Vino Tinto', 15.00, 'Reserva especial', 'Producto', 1),
(105, 'Queso', 3.50, 'Queso madurado', 'Ingrediente', 1),
(106, 'Pan', 1.00, 'Pan artesanal', 'Producto', 1),
(107, 'Café', 2.50, 'Café de altura', 'Producto', 1),
(108, 'Chocolate', 4.00, 'Chocolate 70%', 'Ingrediente', 1),
(109, 'Helado', 3.00, 'Helado de vainilla', 'Producto', 1),
(110, 'Refresco', 2.00, 'Refresco cola', 'Producto', 1),
(111, 'Lechuga', 1.20, 'Lechuga fresca', 'Ingrediente', 1),
(112, 'Cebolla', 0.80, 'Cebolla morada', 'Ingrediente', 1),
(113, 'Ajo', 0.50, 'Dientes de ajo', 'Ingrediente', 1),
(114, 'Carne de Res', 5.00, 'Carne premium', 'Ingrediente', 1),
(115, 'Pasta', 2.50, 'Pasta italiana', 'Ingrediente', 1),
(116, 'Salsa de Tomate', 1.75, 'Salsa casera', 'Producto', 1),
(117, 'Agua Mineral', 1.00, 'Agua embotellada', 'Producto', 1),
(118, 'Cerveza', 3.50, 'Cerveza nacional', 'Producto', 1),
(119, 'Leche', 2.00, 'Leche fresca', 'Producto', 1),
(120, 'Mantequilla', 2.50, 'Mantequilla artesanal', 'Producto', 1),
(121, 'Jugo de Naranja', 2.00, 'Jugo natural', 'Producto', 1),
(122, 'Miel', 4.00, 'Miel orgánica', 'Producto', 1),
(123, 'Manzana', 1.50, 'Manzana fresca', 'Ingrediente', 1),
(124, 'Pera', 1.60, 'Pera de calidad', 'Ingrediente', 1),
(125, 'Naranja', 1.20, 'Naranja jugosa', 'Ingrediente', 1),
(126, 'Tomillo', 0.90, 'Hierba aromática', 'Ingrediente', 1),
(127, 'Pimienta', 1.00, 'Pimienta negra', 'Ingrediente', 1),
(128, 'Sal', 0.60, 'Sal de mesa', 'Ingrediente', 1),
(129, 'Vinagre', 1.50, 'Vinagre de manzana', 'Producto', 1),
(130, 'Aceite de Oliva', 5.00, 'Aceite extra virgen', 'Producto', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `codigo_proveedor` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `persona_contacto` varchar(100) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`codigo_proveedor`, `nombre`, `persona_contacto`, `direccion`, `email`) VALUES
(201, 'Distribuidora Alimentos S.A.', 'Roberto Sánchez', 'Av. K, Ciudad', 'contacto@alimentos.com'),
(202, 'Bebidas Premium Ltda.', 'Laura Mejía', 'Av. L, Ciudad', 'ventas@bebidaspremium.com'),
(203, 'Carnes Selectas', 'Carlos Rojas', 'Av. M, Ciudad', 'info@carnesselectas.com'),
(204, 'Delicias del Mar', 'Marta Fuentes', 'Av. N, Ciudad', 'pedidos@deliciasmar.com'),
(205, 'Granos y Más', 'Jorge Linares', 'Av. O, Ciudad', 'contacto@granosymas.com'),
(206, 'Lácteos Frescos', 'Ana Beltrán', 'Av. P, Ciudad', 'lacteos@frescos.com'),
(207, 'Panadería Artesanal', 'Pedro Navarro', 'Av. Q, Ciudad', 'info@panartesanal.com'),
(208, 'Dulces Sueños', 'Lucía Jiménez', 'Av. R, Ciudad', 'ventas@dulcessueños.com'),
(209, 'Importaciones Gourmet', 'Diego Castro', 'Av. S, Ciudad', 'gourmet@importaciones.com'),
(210, 'Frutas Tropicales', 'Elena Mora', 'Av. T, Ciudad', 'frutas@tropicales.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservacion`
--

CREATE TABLE `reservacion` (
  `id_reservacion` int(11) NOT NULL,
  `cedula_cliente` varchar(13) NOT NULL,
  `id_mesa` int(11) NOT NULL,
  `fecha_reservacion` date NOT NULL,
  `hora` time NOT NULL,
  `cantidad_personas` int(11) NOT NULL,
  `estado` varchar(20) DEFAULT 'Activa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE `sucursal` (
  `id_sucursal` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id_sucursal`, `nombre`, `direccion`, `email`) VALUES
(1, 'Sucursal Bella Vista', 'Av. Central 123, Ciudad de Panamá', 'bella@restaurante.com'),
(2, 'Sucursal Albrook', 'Calle Mall, Albrook', 'albrook@restaurante.com'),
(3, 'Sucursal Metromall', 'Via Tocumen 455', 'metromall@restaurante.com'),
(4, 'Sucursal San Miguelito', 'Av. Domingo Díaz', 'sanmi@restaurante.com'),
(5, 'Sucursal Costa del Este', 'Blvd. Costa Este 22', 'costa@restaurante.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suministra_producto`
--

CREATE TABLE `suministra_producto` (
  `codigo_proveedor` int(11) NOT NULL,
  `codigo_producto` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `suministra_producto`
--

INSERT INTO `suministra_producto` (`codigo_proveedor`, `codigo_producto`, `fecha`, `cantidad`) VALUES
(201, 101, '2024-05-01', 50),
(201, 102, '2024-06-01', 55),
(201, 103, '2024-05-02', 30),
(201, 104, '2024-06-02', 40),
(201, 104, '2024-08-01', 25),
(201, 105, '2024-06-03', 30),
(201, 105, '2024-08-02', 30),
(202, 101, '2024-06-04', 50),
(202, 102, '2024-06-05', 45),
(202, 103, '2024-06-05', 28),
(202, 104, '2024-05-03', 20),
(202, 106, '2024-08-03', 20),
(202, 107, '2024-08-04', 35),
(203, 102, '2024-05-04', 40),
(203, 103, '2024-06-06', 35),
(203, 104, '2024-06-10', 22),
(203, 105, '2024-06-07', 25),
(203, 108, '2024-08-05', 15),
(203, 109, '2024-08-06', 40),
(204, 101, '2024-05-05', 35),
(204, 101, '2024-08-08', 50),
(204, 105, '2024-06-15', 33),
(204, 106, '2024-06-08', 60),
(204, 107, '2024-06-09', 20),
(204, 110, '2024-08-07', 22),
(205, 102, '2024-08-09', 28),
(205, 103, '2024-05-06', 25),
(205, 103, '2024-08-10', 33),
(205, 106, '2024-06-20', 45),
(205, 108, '2024-06-10', 15),
(205, 109, '2024-06-11', 30),
(206, 101, '2024-06-13', 35),
(206, 104, '2024-08-11', 30),
(206, 105, '2024-05-07', 30),
(206, 105, '2024-08-12', 20),
(206, 107, '2024-07-01', 50),
(206, 110, '2024-06-12', 40),
(207, 102, '2024-06-14', 50),
(207, 103, '2024-06-15', 45),
(207, 106, '2024-05-08', 60),
(207, 106, '2024-08-13', 45),
(207, 107, '2024-08-14', 50),
(207, 108, '2024-07-05', 20),
(208, 101, '2024-07-10', 40),
(208, 104, '2024-06-16', 25),
(208, 105, '2024-06-17', 30),
(208, 108, '2024-05-09', 15),
(208, 108, '2024-08-15', 18),
(208, 109, '2024-08-16', 25),
(209, 101, '2024-08-18', 35),
(209, 102, '2024-07-15', 38),
(209, 104, '2024-05-10', 18),
(209, 106, '2024-06-18', 40),
(209, 107, '2024-06-19', 50),
(209, 110, '2024-08-17', 30),
(210, 101, '2024-05-11', 45),
(210, 102, '2024-08-19', 40),
(210, 103, '2024-07-20', 26),
(210, 103, '2024-08-20', 22),
(210, 108, '2024-06-20', 35),
(210, 109, '2024-06-21', 45);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_empleado`
--

CREATE TABLE `telefono_empleado` (
  `cedula` varchar(13) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefono_empleado`
--

INSERT INTO `telefono_empleado` (`cedula`, `telefono`) VALUES
('12-3456-78901', '123-4567'),
('23-4567-89012', '234-5678'),
('34-5678-90123', '345-6789'),
('45-6789-01234', '456-7890'),
('45-6789-01234', '456-7891'),
('56-7890-12345', '567-8901'),
('67-8901-23456', '678-9012'),
('78-9012-34567', '789-0123'),
('89-0123-45678', '890-1234'),
('90-1234-56789', '901-2345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_proveedor`
--

CREATE TABLE `telefono_proveedor` (
  `codigo_proveedor` int(11) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefono_proveedor`
--

INSERT INTO `telefono_proveedor` (`codigo_proveedor`, `telefono`) VALUES
(201, '200-1000'),
(201, '200-1001'),
(202, '200-2000'),
(203, '200-3000'),
(203, '200-3001'),
(204, '200-4000'),
(205, '200-5000'),
(206, '200-6000'),
(206, '200-6001'),
(207, '200-7000'),
(208, '200-8000'),
(209, '200-9000'),
(210, '201-0000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefono_sucursal`
--

CREATE TABLE `telefono_sucursal` (
  `id_sucursal` int(11) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefono_sucursal`
--

INSERT INTO `telefono_sucursal` (`id_sucursal`, `telefono`) VALUES
(1, '111-1111'),
(2, '222-3333'),
(3, '333-2222'),
(4, '444-3333'),
(5, '555-5555');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajan_en`
--

CREATE TABLE `trabajan_en` (
  `cedula_empleado` varchar(13) NOT NULL,
  `id_sucursal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `trabajan_en`
--

INSERT INTO `trabajan_en` (`cedula_empleado`, `id_sucursal`) VALUES
('01-2345-67890', 1),
('01-2345-67890', 5),
('11-2233-44556', 3),
('12-3456-78901', 1),
('12-3456-78901', 2),
('12-3456-78901', 3),
('22-3344-55667', 4),
('23-4567-89012', 2),
('23-4567-89012', 3),
('23-4567-89012', 4),
('33-4455-66778', 5),
('34-5678-90123', 3),
('34-5678-90123', 4),
('34-5678-90123', 5),
('44-5566-77889', 1),
('45-6789-01234', 1),
('45-6789-01234', 4),
('45-6789-01234', 5),
('55-6677-88990', 2),
('56-7890-12345', 1),
('56-7890-12345', 2),
('56-7890-12345', 5),
('67-8901-23456', 1),
('67-8901-23456', 2),
('78-9012-34567', 2),
('78-9012-34567', 3),
('89-0123-45678', 3),
('89-0123-45678', 4),
('90-1234-56789', 4),
('90-1234-56789', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL CHECK (`correo` like '%@%' or `correo` like 'EMP%'),
  `clave` varchar(255) NOT NULL,
  `rol` enum('cliente','administrador','camarero') NOT NULL,
  `id_sucursal` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `correo`, `clave`, `rol`, `id_sucursal`) VALUES
(1, 'Juan Pérez', 'admin@hou.com', '1234', 'administrador', NULL),
(2, 'María Gómez', 'EMP001', '1234', 'camarero', NULL),
(4, 'Daniel Perez', 'dani@gmail.com', '123456789', 'cliente', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrativo`
--
ALTER TABLE `administrativo`
  ADD PRIMARY KEY (`cedula`);

--
-- Indices de la tabla `camarero`
--
ALTER TABLE `camarero`
  ADD PRIMARY KEY (`cedula`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cedula`);

--
-- Indices de la tabla `cocinero`
--
ALTER TABLE `cocinero`
  ADD PRIMARY KEY (`cedula`);

--
-- Indices de la tabla `contiene`
--
ALTER TABLE `contiene`
  ADD PRIMARY KEY (`codigo_plato`,`codigo_producto`),
  ADD KEY `codigo_producto` (`codigo_producto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`cedula`),
  ADD KEY `FK_Empleado_Usuario` (`id_usuario`);

--
-- Indices de la tabla `incluye`
--
ALTER TABLE `incluye`
  ADD PRIMARY KEY (`num_orden`,`codigo_plato`),
  ADD KEY `codigo_plato` (`codigo_plato`);

--
-- Indices de la tabla `maneja`
--
ALTER TABLE `maneja`
  ADD PRIMARY KEY (`cedula_administrativo`,`id_sucursal`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- Indices de la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD PRIMARY KEY (`id_mesa`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- Indices de la tabla `ofrece`
--
ALTER TABLE `ofrece`
  ADD PRIMARY KEY (`id_sucursal`,`codigo_plato`),
  ADD KEY `codigo_plato` (`codigo_plato`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`num_orden`),
  ADD KEY `id_sucursal` (`id_sucursal`),
  ADD KEY `cedula_cliente` (`cedula_cliente`),
  ADD KEY `FK_Pedido_Usuario` (`id_usuario`),
  ADD KEY `cedula_camarero` (`cedula_camarero`) USING BTREE;

--
-- Indices de la tabla `plato`
--
ALTER TABLE `plato`
  ADD PRIMARY KEY (`codigo_plato`),
  ADD KEY `cedula_cocinero` (`cedula_cocinero`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo_producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`codigo_proveedor`);

--
-- Indices de la tabla `reservacion`
--
ALTER TABLE `reservacion`
  ADD PRIMARY KEY (`id_reservacion`),
  ADD KEY `cedula_cliente` (`cedula_cliente`),
  ADD KEY `id_mesa` (`id_mesa`);

--
-- Indices de la tabla `sucursal`
--
ALTER TABLE `sucursal`
  ADD PRIMARY KEY (`id_sucursal`);

--
-- Indices de la tabla `suministra_producto`
--
ALTER TABLE `suministra_producto`
  ADD PRIMARY KEY (`codigo_proveedor`,`codigo_producto`,`fecha`),
  ADD KEY `codigo_producto` (`codigo_producto`);

--
-- Indices de la tabla `telefono_empleado`
--
ALTER TABLE `telefono_empleado`
  ADD PRIMARY KEY (`cedula`,`telefono`);

--
-- Indices de la tabla `telefono_proveedor`
--
ALTER TABLE `telefono_proveedor`
  ADD PRIMARY KEY (`codigo_proveedor`,`telefono`);

--
-- Indices de la tabla `telefono_sucursal`
--
ALTER TABLE `telefono_sucursal`
  ADD PRIMARY KEY (`id_sucursal`,`telefono`);

--
-- Indices de la tabla `trabajan_en`
--
ALTER TABLE `trabajan_en`
  ADD PRIMARY KEY (`cedula_empleado`,`id_sucursal`),
  ADD KEY `id_sucursal` (`id_sucursal`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `FK_Usuario_Sucursal` (`id_sucursal`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `num_orden` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1052;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrativo`
--
ALTER TABLE `administrativo`
  ADD CONSTRAINT `administrativo_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `empleado` (`cedula`) ON DELETE CASCADE;

--
-- Filtros para la tabla `camarero`
--
ALTER TABLE `camarero`
  ADD CONSTRAINT `camarero_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `empleado` (`cedula`) ON DELETE CASCADE;

--
-- Filtros para la tabla `cocinero`
--
ALTER TABLE `cocinero`
  ADD CONSTRAINT `cocinero_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `empleado` (`cedula`) ON DELETE CASCADE;

--
-- Filtros para la tabla `contiene`
--
ALTER TABLE `contiene`
  ADD CONSTRAINT `contiene_ibfk_1` FOREIGN KEY (`codigo_plato`) REFERENCES `plato` (`codigo_plato`),
  ADD CONSTRAINT `contiene_ibfk_2` FOREIGN KEY (`codigo_producto`) REFERENCES `producto` (`codigo_producto`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `FK_Empleado_Usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `incluye`
--
ALTER TABLE `incluye`
  ADD CONSTRAINT `incluye_ibfk_1` FOREIGN KEY (`num_orden`) REFERENCES `orden` (`num_orden`),
  ADD CONSTRAINT `incluye_ibfk_2` FOREIGN KEY (`codigo_plato`) REFERENCES `plato` (`codigo_plato`);

--
-- Filtros para la tabla `maneja`
--
ALTER TABLE `maneja`
  ADD CONSTRAINT `maneja_ibfk_1` FOREIGN KEY (`cedula_administrativo`) REFERENCES `administrativo` (`cedula`),
  ADD CONSTRAINT `maneja_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`);

--
-- Filtros para la tabla `mesa`
--
ALTER TABLE `mesa`
  ADD CONSTRAINT `mesa_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`);

--
-- Filtros para la tabla `ofrece`
--
ALTER TABLE `ofrece`
  ADD CONSTRAINT `ofrece_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`),
  ADD CONSTRAINT `ofrece_ibfk_2` FOREIGN KEY (`codigo_plato`) REFERENCES `plato` (`codigo_plato`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `FK_Pedido_Usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`),
  ADD CONSTRAINT `orden_ibfk_2` FOREIGN KEY (`cedula_cliente`) REFERENCES `cliente` (`cedula`),
  ADD CONSTRAINT `orden_ibfk_3` FOREIGN KEY (`cedula_camarero`) REFERENCES `camarero` (`cedula`);

--
-- Filtros para la tabla `plato`
--
ALTER TABLE `plato`
  ADD CONSTRAINT `plato_ibfk_1` FOREIGN KEY (`cedula_cocinero`) REFERENCES `cocinero` (`cedula`);

--
-- Filtros para la tabla `reservacion`
--
ALTER TABLE `reservacion`
  ADD CONSTRAINT `reservacion_ibfk_1` FOREIGN KEY (`cedula_cliente`) REFERENCES `cliente` (`cedula`),
  ADD CONSTRAINT `reservacion_ibfk_2` FOREIGN KEY (`id_mesa`) REFERENCES `mesa` (`id_mesa`);

--
-- Filtros para la tabla `suministra_producto`
--
ALTER TABLE `suministra_producto`
  ADD CONSTRAINT `suministra_producto_ibfk_1` FOREIGN KEY (`codigo_proveedor`) REFERENCES `proveedor` (`codigo_proveedor`),
  ADD CONSTRAINT `suministra_producto_ibfk_2` FOREIGN KEY (`codigo_producto`) REFERENCES `producto` (`codigo_producto`);

--
-- Filtros para la tabla `telefono_empleado`
--
ALTER TABLE `telefono_empleado`
  ADD CONSTRAINT `telefono_empleado_ibfk_1` FOREIGN KEY (`cedula`) REFERENCES `empleado` (`cedula`);

--
-- Filtros para la tabla `telefono_proveedor`
--
ALTER TABLE `telefono_proveedor`
  ADD CONSTRAINT `telefono_proveedor_ibfk_1` FOREIGN KEY (`codigo_proveedor`) REFERENCES `proveedor` (`codigo_proveedor`);

--
-- Filtros para la tabla `telefono_sucursal`
--
ALTER TABLE `telefono_sucursal`
  ADD CONSTRAINT `telefono_sucursal_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`);

--
-- Filtros para la tabla `trabajan_en`
--
ALTER TABLE `trabajan_en`
  ADD CONSTRAINT `trabajan_en_ibfk_1` FOREIGN KEY (`cedula_empleado`) REFERENCES `empleado` (`cedula`),
  ADD CONSTRAINT `trabajan_en_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_Usuario_Sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
