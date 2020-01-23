-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-10-2019 a las 11:22:27
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `covamsa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `acceso`
--

CREATE TABLE `acceso` (
  `idacceso` int(11) NOT NULL,
  `correo` varchar(35) NOT NULL,
  `password` varchar(300) NOT NULL,
  `tipo_usuario` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `acceso`
--

INSERT INTO `acceso` (`idacceso`, `correo`, `password`, `tipo_usuario`) VALUES
(1, 'rosita', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'administrador'),
(4, 'gua@gmaill.com', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'vendedor'),
(6, 'pao@gmail.com', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'vendedor'),
(7, 'rosita@hotmail.com', 'f6b07b6c1340e947b861def5f8b092d8ee710826dc56bd175bdc8f3a16b0b8acf853c64786a710dedf9d1524d61e32504e27d60de159af110bc3941490731578', NULL),
(8, 'juancaph2010@hotmail.com', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'vendedor'),
(9, 'maria@gmail.com', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', NULL),
(10, 'cristian@gamil.com', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', NULL),
(11, 'rosio@gmailcom', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', NULL),
(12, 'zaira@hotmail.con', '31139043bed8305ce9dc00b1261f7514f12b5de8e88c0d32f28867758912008c8cd2ac04b77eb57497528ed8b4a5bed324289b26900df1729542506937d14816', NULL),
(13, 'yomero@gmail.com', '7552b8ffa5fcee81252146e3a8feaa4526136e9e2d8169b5b49bbd3a06a5d708681111749775fe374e563e731d57774ffe3df92070f26750fe82d26cea5f70f2', NULL),
(14, 'pepa@', '94d294932d9ae8c6f8b26675258bdf835c6530ef47ad0b8b3f4b72fef93900b3b23916d464a296746890949955cbe54c4b32e05816f0efa04e01238252006bde', NULL),
(15, 'maria@gmail.com', 'c8728f1dc2317f78e6fff16d765ec8e0468f1daaaba85827aecd8a5c02666988b82e46447c0778e92d9168eaccaea0910aed624359df379d591b119f8636e000', NULL),
(16, 'gerardo@gmail.com', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', NULL),
(17, 'jose@gmail.com', 'f6b07b6c1340e947b861def5f8b092d8ee710826dc56bd175bdc8f3a16b0b8acf853c64786a710dedf9d1524d61e32504e27d60de159af110bc3941490731578', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacenistas`
--

CREATE TABLE `almacenistas` (
  `idalmacenista` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `numeroInterno` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `almacenistas`
--

INSERT INTO `almacenistas` (`idalmacenista`, `nombre`, `numeroInterno`) VALUES
(1, 'marina', '1237');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `numero_interno` int(11) NOT NULL,
  `idvendedor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idcliente`, `nombre`, `numero_interno`, `idvendedor`) VALUES
(2, 'tornillos', 799, 3),
(3, 'las marias', 789, 7),
(4, 'tornillos upa', 654, 1),
(6, 'tornillos perrones', 896, 2),
(7, 'tuercas y tornillos', 7863, 2),
(8, 'mex tornillo ', 999, 3),
(10, 'rosa la tornillera', 654, 2),
(12, 'pepe chuy', 456, 2),
(13, 'doÃ±a lola', 45, 2),
(15, 'jose rafael ', 78946, 3),
(17, 'el tornillo  ric', 9654, 3),
(19, 'tornillos doÃ±a rosa ', 654, 2),
(20, 'tornillos la guera', 987, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `idfactura` int(11) NOT NULL,
  `idpedido` int(11) DEFAULT NULL,
  `codigoFactura` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `facturas`
--

INSERT INTO `facturas` (`idfactura`, `idpedido`, `codigoFactura`) VALUES
(1, 7, 'vdejwñdl'),
(2, 7, 'vdejwñdl'),
(4, 15, 'abcd'),
(5, 39, 'rrrrrr'),
(6, 40, 'abc7788'),
(7, 21, 'am8888'),
(8, 21, 'agshl'),
(9, 42, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `faltantes`
--

CREATE TABLE `faltantes` (
  `idfaltante` int(11) NOT NULL,
  `codigo_producto` varchar(20) NOT NULL,
  `fechaRealizoPedido` datetime NOT NULL,
  `fechaLlegada` datetime NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `idpedido` int(11) NOT NULL,
  `estatus` int(11) DEFAULT NULL,
  `factura` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `faltantes`
--

INSERT INTO `faltantes` (`idfaltante`, `codigo_producto`, `fechaRealizoPedido`, `fechaLlegada`, `descripcion`, `idpedido`, `estatus`, `factura`) VALUES
(1, '555', '0209-08-08 00:00:00', '0209-08-08 00:00:00', 'no', 15, 4, NULL),
(2, 'ab445', '2019-08-16 00:00:00', '2018-08-16 00:00:00', '09:51', 15, 1, NULL),
(3, 'am200', '2019-09-27 00:00:00', '2019-09-30 00:00:00', 'ninguna ', 7, 1, NULL),
(5, 'alhd', '2019-09-27 00:00:00', '2019-09-30 00:00:00', 'ninguna', 21, 1, NULL),
(6, 'apri', '2019-09-27 00:00:00', '2019-09-30 00:00:00', 'ninguna', 21, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `idpedido` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `importe` double NOT NULL,
  `observaciones` varchar(50) NOT NULL,
  `fecha_inicial` datetime DEFAULT NULL,
  `fecha_final` datetime NOT NULL,
  `numero_cotizacion` varchar(15) DEFAULT NULL,
  `ordenCompra` varchar(20) DEFAULT NULL,
  `ruta` tinyint(1) DEFAULT NULL,
  `estatus` int(11) DEFAULT NULL,
  `total` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`idpedido`, `idventa`, `idcliente`, `importe`, `observaciones`, `fecha_inicial`, `fecha_final`, `numero_cotizacion`, `ordenCompra`, `ruta`, `estatus`, `total`) VALUES
(7, 1, 3, 1, 'simon', '2019-07-08 11:26:48', '2019-01-01 01:00:00', '6', '45', 1, 4, 120000),
(8, 1, 3, 1, '456', '2019-07-08 11:27:43', '2019-01-01 01:00:00', '465', '456', 1, 2, 6689),
(15, 1, 6, 456, 'esta bueno el pedidp', '2019-07-16 16:35:56', '2019-01-01 01:00:00', '54648', '54', 2, 1, 444556),
(21, 3, 2, 54, 'SI SI ', '2019-07-16 18:28:16', '2019-01-01 01:00:00', '6545', '6564', 1, 3, NULL),
(23, 3, 2, 456, 'Ã±OÃ±O', '2019-07-16 18:33:12', '2019-01-01 01:00:00', '65465', '6', 1, 1, NULL),
(26, 1, 6, 456, '', '2019-07-17 19:16:41', '2019-01-01 01:00:00', '565', '645', 1, 4, NULL),
(34, 1, 6, 777, 'ni', '2019-08-19 00:00:00', '2019-08-19 00:00:00', '777', '777', 1, 1, 7777),
(35, 1, 6, 777, 'ni', '2019-08-19 00:00:00', '2019-08-19 00:00:00', '777', '777', 1, 1, 7777),
(36, 1, 6, 44, '444', '2019-08-19 21:00:37', '2019-01-01 00:00:00', '44', '44', 1, 1, 444),
(37, 1, 6, 55, 'si selol', '2019-08-19 21:01:12', '2019-01-02 00:00:00', '29', '45', 1, 1, 22),
(38, 1, 6, 44, 'si', '2019-08-19 21:08:22', '2019-01-01 00:00:00', '55', '44', 1, 1, 10),
(39, 1, 7, 77, 'yes', '2019-08-19 21:11:57', '2019-01-01 00:00:00', '5', '11111111', 1, 1, 5000),
(40, 1, 6, 45, 'puede ser ', '2019-08-19 21:15:27', '2019-01-01 00:00:00', '15', '444444444', 1, 1, 5000000000),
(41, 3, 8, 45, 'ninguna ', '2019-10-09 16:35:27', '2019-10-25 00:00:00', '1564', '79641', 1, 1, 15065),
(42, 3, 8, 45, 'no', '2019-10-11 22:56:38', '2019-10-24 00:00:00', '8564', '55532', 1, 1, 150),
(43, 3, 8, 45, 'no', '2019-10-11 22:57:39', '2019-10-24 00:00:00', '8564', '55532', 1, 1, 150),
(44, 3, 8, 45, 'no', '2019-10-11 22:58:05', '2019-10-24 00:00:00', '8564', '55532', 1, 1, 150),
(45, 3, 8, 46, 'NO', '2019-10-11 22:58:05', '2019-10-24 00:00:00', '896', '55532', 1, 1, 6478);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_almacenistas`
--

CREATE TABLE `pedidos_almacenistas` (
  `idpedido` int(11) NOT NULL,
  `idalmacenista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idproveedor` int(11) NOT NULL,
  `nombre_proveedor` varchar(45) NOT NULL,
  `numeroProveedor` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idproveedor`, `nombre_proveedor`, `numeroProveedor`) VALUES
(1, 'el rey del tornillo', '456'),
(2, 'pedro de alba ', '659'),
(3, 'pedro de alvarado ', '6589'),
(4, 'emiliano', '896'),
(5, 'la rosa tornillera', '6984');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores_faltantes`
--

CREATE TABLE `proveedores_faltantes` (
  `idproveedor` int(11) DEFAULT NULL,
  `idfaltante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedores`
--

CREATE TABLE `vendedores` (
  `idvendedor` int(11) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `numero_interno` int(11) NOT NULL,
  `idacceso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `vendedores`
--

INSERT INTO `vendedores` (`idvendedor`, `nombre`, `numero_interno`, `idacceso`) VALUES
(1, 'paola', 4889, 6),
(2, 'rosita', 788, 7),
(3, 'juan Carlos', 785, 8),
(4, 'maria', 456, 9),
(5, 'jonathan', 456, 10),
(7, 'zaira', 456, 12),
(8, 'pepa', 8899, 14),
(9, 'maria socorro', 456, 15),
(10, 'gerdardi', 456, 16),
(11, 'josÃ© carlos', 6975, 17);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `acceso`
--
ALTER TABLE `acceso`
  ADD PRIMARY KEY (`idacceso`),
  ADD UNIQUE KEY `idusuarios_UNIQUE` (`idacceso`);

--
-- Indices de la tabla `almacenistas`
--
ALTER TABLE `almacenistas`
  ADD PRIMARY KEY (`idalmacenista`),
  ADD UNIQUE KEY `idalmacen_UNIQUE` (`idalmacenista`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idcliente`),
  ADD UNIQUE KEY `idclientes_UNIQUE` (`idcliente`),
  ADD KEY `fk_clientes_ventas1_idx` (`idvendedor`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`idfactura`),
  ADD KEY `FK_facturas_idpedido` (`idpedido`);

--
-- Indices de la tabla `faltantes`
--
ALTER TABLE `faltantes`
  ADD PRIMARY KEY (`idfaltante`),
  ADD UNIQUE KEY `idproductos_UNIQUE` (`idfaltante`),
  ADD KEY `fk_faltantes_pedidos1_idx` (`idpedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idpedido`),
  ADD UNIQUE KEY `idpedidos_UNIQUE` (`idpedido`),
  ADD KEY `fk_pedidos_vendedores1_idx` (`idventa`),
  ADD KEY `fk_pedidos_clientes1_idx` (`idcliente`);

--
-- Indices de la tabla `pedidos_almacenistas`
--
ALTER TABLE `pedidos_almacenistas`
  ADD KEY `fk_pedidos_has_almacenistas_almacenistas1_idx` (`idalmacenista`),
  ADD KEY `fk_pedidos_has_almacenistas_pedidos1_idx` (`idpedido`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idproveedor`),
  ADD UNIQUE KEY `idproveedores_UNIQUE` (`idproveedor`);

--
-- Indices de la tabla `proveedores_faltantes`
--
ALTER TABLE `proveedores_faltantes`
  ADD KEY `idproveedor` (`idproveedor`),
  ADD KEY `FK_proveedores_faltantes_idfaltante` (`idfaltante`);

--
-- Indices de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`idvendedor`),
  ADD UNIQUE KEY `idvendedores_UNIQUE` (`idvendedor`),
  ADD KEY `fk_vendedores_acceso1_idx` (`idacceso`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `acceso`
--
ALTER TABLE `acceso`
  MODIFY `idacceso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `almacenistas`
--
ALTER TABLE `almacenistas`
  MODIFY `idalmacenista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `facturas`
--
ALTER TABLE `facturas`
  MODIFY `idfactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `faltantes`
--
ALTER TABLE `faltantes`
  MODIFY `idfaltante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idpedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idproveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `idvendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `fk_clientes_ventas1` FOREIGN KEY (`idvendedor`) REFERENCES `vendedores` (`idvendedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `FK_facturas_idpedido` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE,
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`),
  ADD CONSTRAINT `facturas_ibfk_3` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE;

--
-- Filtros para la tabla `faltantes`
--
ALTER TABLE `faltantes`
  ADD CONSTRAINT `FK_faltantes_idpedido` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE,
  ADD CONSTRAINT `faltantes_ibfk_1` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_faltantes_pedidos1` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedidos_clientes1` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_vendedores1` FOREIGN KEY (`idventa`) REFERENCES `vendedores` (`idvendedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedidos_almacenistas`
--
ALTER TABLE `pedidos_almacenistas`
  ADD CONSTRAINT `FK_idpedido` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pedidos_has_almacenistas_almacenistas1` FOREIGN KEY (`idalmacenista`) REFERENCES `almacenistas` (`idalmacenista`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_pedidos_has_almacenistas_pedidos1` FOREIGN KEY (`idpedido`) REFERENCES `pedido` (`idpedido`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedores_faltantes`
--
ALTER TABLE `proveedores_faltantes`
  ADD CONSTRAINT `FK_proveedores_faltantes_idfaltante` FOREIGN KEY (`idfaltante`) REFERENCES `faltantes` (`idfaltante`) ON DELETE CASCADE,
  ADD CONSTRAINT `proveedores_faltantes_ibfk_1` FOREIGN KEY (`idfaltante`) REFERENCES `faltantes` (`idfaltante`),
  ADD CONSTRAINT `proveedores_faltantes_ibfk_2` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`idproveedor`);

--
-- Filtros para la tabla `vendedores`
--
ALTER TABLE `vendedores`
  ADD CONSTRAINT `fk_vendedores_acceso1` FOREIGN KEY (`idacceso`) REFERENCES `acceso` (`idacceso`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
