-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-11-2019 a las 05:21:38
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `noticias`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escritores`
--

CREATE TABLE `escritores` (
  `id` int(10) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `edad` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `escritores`
--

INSERT INTO `escritores` (`id`, `nombre`, `edad`) VALUES
(250, 'Pilar Sordo', '52'),
(300, 'Robert kiyosaky', '56'),
(350, 'Juan Diego Gomez', '49'),
(400, 'Omar Villalobos', '45'),
(450, 'Carlos kosuka', '68');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `id` int(10) NOT NULL,
  `titulo` varchar(40) DEFAULT NULL,
  `fecha` date NOT NULL,
  `descripcion` text DEFAULT NULL,
  `id_escritor` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`id`, `titulo`, `fecha`, `descripcion`, `id_escritor`) VALUES
(1, 'Padre Rico Padre Pobre', '2019-09-24', 'Habla de un padre emprendedor que generaba varios negocios y tenia ganancias de diferentes emprendimiento que genero mucho dinero y un padre academico, que hacia todo una rutina hasta que fue hechado de su trabajo y fue reemplazado y olvidado.', 300),
(2, 'Vivir Purpura', '2018-07-10', 'Habla de ser de una actitud positiva de no permitir de personas negativas mal humoradas te quitan tu sueños.', 350),
(3, 'Vivir y Soñar', '2016-08-16', 'Habla de vivir intensamente como fuera el ultimo dia de tu vida.', 400),
(4, 'El buen Lider', '2021-11-18', 'El líder te enseña y te muestra para que seas un gran Triunfador, para tener un mundo mejor de oportunidades...', 450),
(5, 'La juventud actual', '2015-07-09', 'Habla de los jÃ³venes adolescentes de como adolecen hoy en dia', 350),
(6, 'La juventud actual', '2015-07-09', 'Habla de como los jÃ³venes adolecen en la actualidad', 300),
(7, 'La juventud actual', '2015-07-09', 'Habla de como los jÃ³venes adolecen en la actualidad', 300),
(8, 'Elecciones Presidenciales Argentina', '2016-09-10', 'fue un fraude las elecciones en Bolivia', 450),
(9, 'actitud y responsabilidad', '2018-10-12', 'debemos siempre tener actitud a pesar de todo', 450),
(10, 'SoÃ±ar hacia tu Libertad', '2016-10-31', 'Cuando logra su sueÃ±o goza hacia la libertad deseada', 400),
(11, 'SoÃ±ar hacia tu Libertad', '2016-10-31', 'Cuando logra su sueÃ±o goza hacia la libertad deseada', 400),
(12, 'Como ser Millonario', '2019-09-30', 'Segun el empresario Robert kiyosaky', 300),
(13, 'SoÃ±ar hacia tu Libertad', '2016-10-31', 'Cuando logra su sueÃ±o goza hacia la libertad deseada', 400),
(14, 'Mujer Valientes', '2019-12-31', 'El valora a la mujer por luchona que es dice que las mujeres son fantÃ¡sticas ', 400),
(15, 'Mujer Valientes', '2019-12-31', 'El valora a la mujer por luchona que es dice que las mujeres son fantÃ¡sticas ', 400),
(16, 'Mujer Valientes', '2019-12-31', 'El valora a la mujer por luchona que es dice que las mujeres son fantÃ¡sticas ', 400),
(17, 'Como educar a la juventud', '2019-12-22', 'Es una excelente mujer que tiene valores y principio y se lo ve los resultado en ella en su actitud', 250),
(18, 'asd', '2019-11-28', 'asd', 250);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `escritores`
--
ALTER TABLE `escritores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_escritor` (`id_escritor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `noticias_ibfk_1` FOREIGN KEY (`id_escritor`) REFERENCES `escritores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
