-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 20-01-2022 a las 16:44:37
-- Versión del servidor: 8.0.21
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `sgea`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

DROP TABLE IF EXISTS `eventos`;
CREATE TABLE IF NOT EXISTS `eventos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `tipo_coordinador` tinyint(1) NOT NULL,
  `nombre_coordinador` varchar(50) NOT NULL,
  `id_coordinador` int NOT NULL,
  `tipo_evento` varchar(4) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `duracion` tinyint NOT NULL,
  `tipo_inscripcion` tinyint(1) NOT NULL,
  `precio_inscripcion` smallint DEFAULT NULL,
  `descripcion` text NOT NULL,
  `tipo_certificado` tinyint(1) NOT NULL,
  `precio_certificado` smallint DEFAULT NULL,
  `tipo_ambiente` varchar(4) NOT NULL,
  `participantes` smallint NOT NULL,
  `logo` varchar(256) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_coordinador_id` (`id_coordinador`),
  KEY `fk_tipo_coordinador_id` (`tipo_coordinador`),
  KEY `fk_tipo_evento_id` (`tipo_evento`),
  KEY `fk_tipo_inscripcion_id` (`tipo_inscripcion`),
  KEY `fk_tipo_certificado_id` (`tipo_certificado`),
  KEY `fk_tipo_ambiente_id` (`tipo_ambiente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones`
--

DROP TABLE IF EXISTS `inscripciones`;
CREATE TABLE IF NOT EXISTS `inscripciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_evento` int NOT NULL,
  `id_usuario` int NOT NULL,
  `certificado` tinyint(1) NOT NULL,
  `voucher` varchar(255) DEFAULT NULL,
  `fecha_inscripcion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_evento_id` (`id_evento`),
  KEY `fk_usuario_id` (`id_usuario`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
CREATE TABLE IF NOT EXISTS `solicitudes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `estado` int NOT NULL,
  `id_evento` int NOT NULL,
  `fecha_envio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `observaciones` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `fk_estado_id` (`estado`),
  KEY `fk_evento_id` (`id_evento`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_ambiente`
--

DROP TABLE IF EXISTS `tipos_ambiente`;
CREATE TABLE IF NOT EXISTS `tipos_ambiente` (
  `id` varchar(4) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tipos_ambiente`
--

INSERT INTO `tipos_ambiente` (`id`, `descripcion`) VALUES
('A001', 'AUDITORIO'),
('A002', 'AULA MAGNA'),
('A003', 'AULA'),
('A004', 'LABORATORIO'),
('A005', 'EXTERIORES');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_certificado`
--

DROP TABLE IF EXISTS `tipos_certificado`;
CREATE TABLE IF NOT EXISTS `tipos_certificado` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tipos_certificado`
--

INSERT INTO `tipos_certificado` (`id`, `descripcion`) VALUES
(1, 'GRATUITO'),
(2, 'PAGO'),
(3, 'NO APLICA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_coordinador`
--

DROP TABLE IF EXISTS `tipos_coordinador`;
CREATE TABLE IF NOT EXISTS `tipos_coordinador` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tipos_coordinador`
--

INSERT INTO `tipos_coordinador` (`id`, `descripcion`) VALUES
(1, 'INDIVIDUAL'),
(2, 'GRUPAL');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_estado`
--

DROP TABLE IF EXISTS `tipos_estado`;
CREATE TABLE IF NOT EXISTS `tipos_estado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(9) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tipos_estado`
--

INSERT INTO `tipos_estado` (`id`, `descripcion`) VALUES
(1, 'CANCELADO'),
(2, 'APROBADO'),
(3, 'PENDIENTE'),
(4, 'COMPLETO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_evento`
--

DROP TABLE IF EXISTS `tipos_evento`;
CREATE TABLE IF NOT EXISTS `tipos_evento` (
  `id` varchar(4) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tipos_evento`
--

INSERT INTO `tipos_evento` (`id`, `descripcion`) VALUES
('E001', 'TALLER'),
('E002', 'CURSO'),
('E003', 'CONFERENCIA'),
('E004', 'CONGRESO'),
('E005', 'SEMINARIO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_inscripcion`
--

DROP TABLE IF EXISTS `tipos_inscripcion`;
CREATE TABLE IF NOT EXISTS `tipos_inscripcion` (
  `id` tinyint(1) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `tipos_inscripcion`
--

INSERT INTO `tipos_inscripcion` (`id`, `descripcion`) VALUES
(1, 'GRATUITO'),
(2, 'PAGO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombres` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `edad` tinyint DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `sexo` varchar(9) DEFAULT NULL,
  `ocupacion` varchar(30) DEFAULT NULL,
  `tipo_usuario` varchar(1) NOT NULL DEFAULT 'N',
  `foto` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
