-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 26, 2018 at 09:48 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grc`
--

-- --------------------------------------------------------

--
-- Table structure for table `GRC_ASIGNACION_BOX`
--

CREATE TABLE `GRC_ASIGNACION_BOX` (
  `abx_id` int(11) NOT NULL,
  `abx_fecha_uso` datetime DEFAULT NULL,
  `abx_hora_inicio_uso` datetime DEFAULT NULL,
  `abx_hora_fin_uso` datetime DEFAULT NULL,
  `tra_id` int(11) NOT NULL,
  `box_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GRC_ASIGNACION_EQUIPO`
--

CREATE TABLE `GRC_ASIGNACION_EQUIPO` (
  `aeq_id` int(11) NOT NULL,
  `aeq_fecha_uso` datetime DEFAULT NULL,
  `aeq_hora_inicio_uso` datetime DEFAULT NULL,
  `aeq_hora_fin_uso` datetime DEFAULT NULL,
  `aeq_unidades` int(11) DEFAULT NULL,
  `tra_id` int(11) NOT NULL,
  `eqp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GRC_ASIGNACION_SALA`
--

CREATE TABLE `GRC_ASIGNACION_SALA` (
  `asl_id` int(11) NOT NULL,
  `asl_fecha_uso` datetime DEFAULT NULL,
  `asl_hora_inicio_uso` datetime DEFAULT NULL,
  `asl_hora_fin_uso` datetime DEFAULT NULL,
  `asl_unidades` int(11) DEFAULT NULL,
  `tra_id` int(11) NOT NULL,
  `GRC_SALAS_sal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `GRC_ASIGNACION_SALA`
--

INSERT INTO `GRC_ASIGNACION_SALA` (`asl_id`, `asl_fecha_uso`, `asl_hora_inicio_uso`, `asl_hora_fin_uso`, `asl_unidades`, `tra_id`, `GRC_SALAS_sal_id`) VALUES
(1, '2018-10-24 00:00:00', '2018-10-24 09:00:00', '2018-10-26 16:00:00', 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `GRC_BOXES`
--

CREATE TABLE `GRC_BOXES` (
  `box_id` int(11) NOT NULL,
  `box_numero` varchar(45) DEFAULT NULL,
  `box_descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GRC_EQUIPOS`
--

CREATE TABLE `GRC_EQUIPOS` (
  `eqp_id` int(11) NOT NULL,
  `eqp_descripcion` varchar(45) DEFAULT NULL,
  `eqp_unidades_totales` int(11) DEFAULT NULL,
  `eqp_unidades_disponibles` int(11) DEFAULT NULL,
  `teq_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GRC_PERFILES`
--

CREATE TABLE `GRC_PERFILES` (
  `per_id` int(11) NOT NULL,
  `per_descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GRC_PERFIL_TRABAJADOR`
--

CREATE TABLE `GRC_PERFIL_TRABAJADOR` (
  `pet_id` int(11) NOT NULL,
  `per_id` int(11) NOT NULL,
  `tra_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GRC_SALAS`
--

CREATE TABLE `GRC_SALAS` (
  `sal_id` int(11) NOT NULL,
  `sal_numero` int(11) DEFAULT NULL,
  `sal_descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `GRC_SALAS`
--

INSERT INTO `GRC_SALAS` (`sal_id`, `sal_numero`, `sal_descripcion`) VALUES
(1, 303, 'sala');

-- --------------------------------------------------------

--
-- Table structure for table `GRC_SOLICITUD_EQUIPO`
--

CREATE TABLE `GRC_SOLICITUD_EQUIPO` (
  `seq_id` int(11) NOT NULL,
  `seq_fecha_solicitud` datetime DEFAULT NULL,
  `seq_fecha_inicio_uso` datetime DEFAULT NULL,
  `seq_fecha_fin_uso` datetime DEFAULT NULL,
  `seq_hora_inicio_uso` datetime DEFAULT NULL,
  `seq_hora_fin_uso` datetime DEFAULT NULL,
  `seq_tipo_recurrencia` varchar(45) DEFAULT NULL,
  `seq_estado` varchar(45) DEFAULT NULL,
  `seq_unidades` int(11) DEFAULT NULL,
  `tra_id` int(11) NOT NULL,
  `eqp_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GRC_SOLICITUD_SALA`
--

CREATE TABLE `GRC_SOLICITUD_SALA` (
  `ssa_id` int(11) NOT NULL,
  `ssa_fecha_solicitud` datetime DEFAULT NULL,
  `ssa_fecha_inicio_uso` datetime DEFAULT NULL,
  `ssa_fecha_fin_uso` datetime DEFAULT NULL,
  `ssa_hora_inicio_uso` datetime DEFAULT NULL,
  `ssa_hora_fin_uso` datetime DEFAULT NULL,
  `ssa_tipo_recurrencia` varchar(45) DEFAULT NULL,
  `ssa_estado` varchar(45) DEFAULT NULL,
  `tra_id` int(11) NOT NULL,
  `sal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GRC_TRABAJADORES`
--

CREATE TABLE `GRC_TRABAJADORES` (
  `tra_id` int(11) NOT NULL,
  `tra_nombre_apellido` varchar(45) DEFAULT NULL,
  `tra_nombre_usuario` varchar(45) DEFAULT NULL,
  `tra_contrasena` varchar(45) DEFAULT NULL,
  `tra_tipo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `GRC_TRABAJADORES`
--

INSERT INTO `GRC_TRABAJADORES` (`tra_id`, `tra_nombre_apellido`, `tra_nombre_usuario`, `tra_contrasena`, `tra_tipo`) VALUES
(1, 'nom bre', 'nom1', '123asd', 'hola');

-- --------------------------------------------------------

--
-- Table structure for table `GRS_TIPOS_EQUIPOS`
--

CREATE TABLE `GRS_TIPOS_EQUIPOS` (
  `teq_id` int(11) NOT NULL,
  `teq_descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `GRC_ASIGNACION_BOX`
--
ALTER TABLE `GRC_ASIGNACION_BOX`
  ADD PRIMARY KEY (`abx_id`),
  ADD KEY `fk_GRC_SOLICITUD_SALA_GRC_TRABAJADORES000` (`tra_id`),
  ADD KEY `fk_GRC_ASIGNACION_BOX_GRC_BOXES1` (`box_id`);

--
-- Indexes for table `GRC_ASIGNACION_EQUIPO`
--
ALTER TABLE `GRC_ASIGNACION_EQUIPO`
  ADD PRIMARY KEY (`aeq_id`),
  ADD KEY `fk_GRC_SOLICITUD_SALA_GRC_TRABAJADORES00` (`tra_id`),
  ADD KEY `fk_GRC_SOLICITUD_EQUIPO_GRC_EQUIPOS10` (`eqp_id`);

--
-- Indexes for table `GRC_ASIGNACION_SALA`
--
ALTER TABLE `GRC_ASIGNACION_SALA`
  ADD PRIMARY KEY (`asl_id`),
  ADD KEY `fk_GRC_SOLICITUD_SALA_GRC_TRABAJADORES0000` (`tra_id`),
  ADD KEY `fk_GRC_ASIGNACION_SALA_GRC_SALAS1` (`GRC_SALAS_sal_id`);

--
-- Indexes for table `GRC_BOXES`
--
ALTER TABLE `GRC_BOXES`
  ADD PRIMARY KEY (`box_id`);

--
-- Indexes for table `GRC_EQUIPOS`
--
ALTER TABLE `GRC_EQUIPOS`
  ADD PRIMARY KEY (`eqp_id`),
  ADD KEY `fk_GRC_EQUIPOS_GRS_TIPOS_EQUIPOS1` (`teq_id`);

--
-- Indexes for table `GRC_PERFILES`
--
ALTER TABLE `GRC_PERFILES`
  ADD PRIMARY KEY (`per_id`);

--
-- Indexes for table `GRC_PERFIL_TRABAJADOR`
--
ALTER TABLE `GRC_PERFIL_TRABAJADOR`
  ADD PRIMARY KEY (`pet_id`),
  ADD KEY `fk_GRC_PERFIL_TRABAJADOR_GRC_PERFILES1` (`per_id`),
  ADD KEY `fk_GRC_PERFIL_TRABAJADOR_GRC_TRABAJADORES1` (`tra_id`);

--
-- Indexes for table `GRC_SALAS`
--
ALTER TABLE `GRC_SALAS`
  ADD PRIMARY KEY (`sal_id`);

--
-- Indexes for table `GRC_SOLICITUD_EQUIPO`
--
ALTER TABLE `GRC_SOLICITUD_EQUIPO`
  ADD PRIMARY KEY (`seq_id`),
  ADD KEY `fk_GRC_SOLICITUD_SALA_GRC_TRABAJADORES0` (`tra_id`),
  ADD KEY `fk_GRC_SOLICITUD_EQUIPO_GRC_EQUIPOS1` (`eqp_id`);

--
-- Indexes for table `GRC_SOLICITUD_SALA`
--
ALTER TABLE `GRC_SOLICITUD_SALA`
  ADD PRIMARY KEY (`ssa_id`),
  ADD KEY `fk_GRC_SOLICITUD_SALA_GRC_TRABAJADORES` (`tra_id`),
  ADD KEY `fk_GRC_SOLICITUD_SALA_GRC_SALAS1` (`sal_id`);

--
-- Indexes for table `GRC_TRABAJADORES`
--
ALTER TABLE `GRC_TRABAJADORES`
  ADD PRIMARY KEY (`tra_id`);

--
-- Indexes for table `GRS_TIPOS_EQUIPOS`
--
ALTER TABLE `GRS_TIPOS_EQUIPOS`
  ADD PRIMARY KEY (`teq_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `GRC_ASIGNACION_BOX`
--
ALTER TABLE `GRC_ASIGNACION_BOX`
  ADD CONSTRAINT `fk_GRC_ASIGNACION_BOX_GRC_BOXES1` FOREIGN KEY (`box_id`) REFERENCES `GRC_BOXES` (`box_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_GRC_SOLICITUD_SALA_GRC_TRABAJADORES000` FOREIGN KEY (`tra_id`) REFERENCES `GRC_TRABAJADORES` (`tra_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `GRC_ASIGNACION_EQUIPO`
--
ALTER TABLE `GRC_ASIGNACION_EQUIPO`
  ADD CONSTRAINT `fk_GRC_SOLICITUD_EQUIPO_GRC_EQUIPOS10` FOREIGN KEY (`eqp_id`) REFERENCES `GRC_EQUIPOS` (`eqp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_GRC_SOLICITUD_SALA_GRC_TRABAJADORES00` FOREIGN KEY (`tra_id`) REFERENCES `GRC_TRABAJADORES` (`tra_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `GRC_ASIGNACION_SALA`
--
ALTER TABLE `GRC_ASIGNACION_SALA`
  ADD CONSTRAINT `fk_GRC_ASIGNACION_SALA_GRC_SALAS1` FOREIGN KEY (`GRC_SALAS_sal_id`) REFERENCES `GRC_SALAS` (`sal_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_GRC_SOLICITUD_SALA_GRC_TRABAJADORES0000` FOREIGN KEY (`tra_id`) REFERENCES `GRC_TRABAJADORES` (`tra_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `GRC_EQUIPOS`
--
ALTER TABLE `GRC_EQUIPOS`
  ADD CONSTRAINT `fk_GRC_EQUIPOS_GRS_TIPOS_EQUIPOS1` FOREIGN KEY (`teq_id`) REFERENCES `GRS_TIPOS_EQUIPOS` (`teq_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `GRC_PERFIL_TRABAJADOR`
--
ALTER TABLE `GRC_PERFIL_TRABAJADOR`
  ADD CONSTRAINT `fk_GRC_PERFIL_TRABAJADOR_GRC_PERFILES1` FOREIGN KEY (`per_id`) REFERENCES `GRC_PERFILES` (`per_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_GRC_PERFIL_TRABAJADOR_GRC_TRABAJADORES1` FOREIGN KEY (`tra_id`) REFERENCES `GRC_TRABAJADORES` (`tra_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `GRC_SOLICITUD_EQUIPO`
--
ALTER TABLE `GRC_SOLICITUD_EQUIPO`
  ADD CONSTRAINT `fk_GRC_SOLICITUD_EQUIPO_GRC_EQUIPOS1` FOREIGN KEY (`eqp_id`) REFERENCES `GRC_EQUIPOS` (`eqp_id`),
  ADD CONSTRAINT `fk_GRC_SOLICITUD_SALA_GRC_TRABAJADORES0` FOREIGN KEY (`tra_id`) REFERENCES `GRC_TRABAJADORES` (`tra_id`);

--
-- Constraints for table `GRC_SOLICITUD_SALA`
--
ALTER TABLE `GRC_SOLICITUD_SALA`
  ADD CONSTRAINT `fk_GRC_SOLICITUD_SALA_GRC_SALAS1` FOREIGN KEY (`sal_id`) REFERENCES `GRC_SALAS` (`sal_id`),
  ADD CONSTRAINT `fk_GRC_SOLICITUD_SALA_GRC_TRABAJADORES` FOREIGN KEY (`tra_id`) REFERENCES `GRC_TRABAJADORES` (`tra_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
