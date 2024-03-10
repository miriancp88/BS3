-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-03-2024 a las 19:55:37
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
-- Base de datos: `bs3.1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `codigoArticulo` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `codigoCategoria` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `descuento` float DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `articulos`
--

INSERT INTO `articulos` (`codigoArticulo`, `nombre`, `descripcion`, `codigoCategoria`, `precio`, `imagen`, `descuento`, `estado`) VALUES
(3, 'AURORA', 'Gafas de sol que fusionan elegancia y modernidad con su armazón de metal resistente y detalles de pasta, ofreciendo un estilo único y sofisticado que se adapta a cualquier ocasión.', 2, 30, '11.jpg', 0, 1),
(5, 'ECLIPSE', 'Gafas de sol con un diseño contemporáneo, caracterizadas por su montura cuadrada en tono gris transparente, que añade un toque de sutileza y estilo urbano a cualquier conjunto.', 3, 25, '22.jpg', 0, 0),
(6, 'HORIZONTE', 'Gafas de sol con un toque de vanguardia, presentando un diseño redondo y plano en la parte superior, con cristales azules que contrastan elegantemente con la montura negra, ofreciendo un estilo audaz ', 3, 45, '33.jpg', 0, 1),
(7, 'ORBITA', 'Gafas de sol de estilo contemporáneo, con montura de pasta negra transparente, cuadrada y alargada, que ofrece un look sofisticado y discreto, perfecto para quienes buscan un toque de elegancia sin re', 3, 98, '44.jpg', 45, 1),
(8, 'LUCERO', 'Gafas de sol de diseño clásico con un toque contemporáneo, caracterizadas por su montura de pasta que combina mitad negro y mitad blanco. Esta fusión de colores ofrece un estilo atemporal y versátil q', 3, 47, '55.jpg', 36, 1),
(9, 'SOMBRA', 'Gafas de sol redondas de inspiración retro de los años 80, con montura de metal que evoca el estilo vintage. Estas gafas ofrecen un aspecto atrevido y lleno de personalidad, perfectas para quienes bus', 2, 38, '8-f.jpg', 0, 1),
(10, 'RAYO', 'Gafas de sol con montura de pasta transparente que añade un toque contemporáneo y ligero. Los cristales morados aportan un contraste vibrante y elegante, creando un estilo único y llamativo que destac', 3, 28, '66.jpg', 0, 1),
(11, 'DESTELLO', 'Gafas de sol con montura de metal dorado, que añade un toque de lujo y sofisticación. Los cristales rosas proporcionan un contraste suave y elegante, creando un estilo moderno y llamativo, perfecto pa', 2, 35, '100.jpg', 0, 1),
(12, 'ZAFIRO', 'Gafas de sol clásicas con montura de metal dorado y cristales negros, evocando un estilo atemporal y sofisticado que complementa cualquier look con elegancia y distinción.', 2, 23, '77.jpg', 0, 0),
(13, 'AZURA', 'Gafas de sol estilo aviador en negro con borde grueso, ofreciendo un aspecto audaz y moderno que combina el clásico diseño aviador con un toque contemporáneo y llamativo.', 2, 49, '99.jpg', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `codigoCategoria` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `codigoCategoriaPadre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`codigoCategoria`, `nombre`, `estado`, `codigoCategoriaPadre`) VALUES
(1, 'gafas', 1, 0),
(2, 'metalicas', 1, 1),
(3, 'pasta', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineapedido`
--

CREATE TABLE `lineapedido` (
  `numLinea` int(11) NOT NULL,
  `numPedido` int(11) DEFAULT NULL,
  `codArticulo` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `descuento` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `idPedido` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `total` float DEFAULT NULL,
  `estadoPedido` varchar(20) DEFAULT NULL,
  `codUsuario` varchar(9) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`idPedido`, `fecha`, `total`, `estadoPedido`, `codUsuario`, `estado`) VALUES
(15, '2024-03-09', 23, 'cancelado', '25654846L', 0),
(16, '2024-03-09', 35, 'cancelado', '25654846L', 0),
(17, '2024-03-09', 25, 'enviado', '25654846L', 1),
(27, '2024-03-10', 83, 'cancelado', '25654846L', 0),
(31, '2024-03-10', 49, 'pagado', '23288991T', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `dni` varchar(9) NOT NULL,
  `password` varchar(60) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `rol` varchar(20) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`dni`, `password`, `nombre`, `direccion`, `email`, `rol`, `estado`) VALUES
('23288991L', '$2y$10$RrakAFswo1l.53.aO2rt3eRaz/oSADAepzY7aevH4U9LaUcNvXbk6', 'ADMINISTRADOR ', 'Calle Picomar', 'administrador@hotmail.com', 'administrador', 1),
('23288991ñ', '$2y$10$wO/7iX/3lialI.QGYs3s9OLZ1Mlrb0VpXa3AxAsbxmdhQkt7bvoaW', 'Mirian Raquel', 'Calle Picomar', 'miriancp1988@gmail.com', 'cliente', 0),
('23288991T', '$2y$10$yvXMVTt8.fB6yzo8dm1Xu.IcaiIOJ83qZIWU1cYBl9p68yc0Mch2u', 'Mirian', '31 Islington Rd', 'mirian-cp@hotmail.com', 'empleado', 1),
('23288995T', '$2y$10$3P.OpzL73oj0L9/Opu3EGeYuOVrDdsR83AADv15zdEIBF.iOSM4pK', 'EMPLEADO', 'Calle Picomar', 'empleado@hotmail.com', 'empleado', 1),
('25654846L', '$2y$10$/HiWNqjV0MD1.kvSaYOL8Oh2gAU2L.4UpN2VJeaT65wJPsVyJx8D.', 'CLIENTE ', 'Carrer Sant Ramon 44-46  ', 'cliente@hotmail.com', 'cliente', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`codigoArticulo`),
  ADD KEY `codigoCategoria` (`codigoCategoria`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`codigoCategoria`);

--
-- Indices de la tabla `lineapedido`
--
ALTER TABLE `lineapedido`
  ADD PRIMARY KEY (`numLinea`),
  ADD KEY `numPedido` (`numPedido`),
  ADD KEY `codArticulo` (`codArticulo`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `codUsuario` (`codUsuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`dni`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `codigoArticulo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `codigoCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `lineapedido`
--
ALTER TABLE `lineapedido`
  MODIFY `numLinea` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`codigoCategoria`) REFERENCES `categorias` (`codigoCategoria`);

--
-- Filtros para la tabla `lineapedido`
--
ALTER TABLE `lineapedido`
  ADD CONSTRAINT `lineapedido_ibfk_1` FOREIGN KEY (`numPedido`) REFERENCES `pedidos` (`idPedido`),
  ADD CONSTRAINT `lineapedido_ibfk_2` FOREIGN KEY (`codArticulo`) REFERENCES `articulos` (`codigoArticulo`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`codUsuario`) REFERENCES `usuarios` (`dni`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
