-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 05 Janvier 2023 à 15:58
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `RH_BD`
--

-- --------------------------------------------------------

--
-- Structure de la table `rh.employe`
--

CREATE TABLE IF NOT EXISTS `rh.employe` (
  `NoEmp` int(11) NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Prenom` varchar(20) NOT NULL,
  `Sexe` varchar(1) NOT NULL,
  `Salaire` int(11) NOT NULL,
  `TypeContract` varchar(20) NOT NULL,
  `Fonction` varchar(20) NOT NULL,
  `Site` varchar(20) NOT NULL,
  `DateEmbauche` date NOT NULL,
  `DateNaissance` date NOT NULL,
  `NoSrv` int(11) NOT NULL,
  PRIMARY KEY (`NoEmp`),
  KEY `NoSrv` (`NoSrv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `rh.employe`
--

INSERT INTO `rh.employe` (`NoEmp`, `Nom`, `Prenom`, `Sexe`, `Salaire`, `TypeContract`, `Fonction`, `Site`, `DateEmbauche`, `DateNaissance`, `NoSrv`) VALUES
(7, 'Kadid', 'Mehdi', 'H', 100, 'CDI', 'Chef ', 'Orly', '2022-03-01', '1999-01-05', 734),
(8, 'Sounni', 'Moha', 'H', 99, 'CDD', 'Sous-Chef', 'CDG', '2009-01-03', '1998-01-05', 735),
(9, 'Hassani', 'Ange', 'H', 99, 'Alternance', 'Sous-Chef', 'Bourget', '2022-01-03', '2023-01-05', 736);

-- --------------------------------------------------------

--
-- Structure de la table `rh.intervenir`
--

CREATE TABLE IF NOT EXISTS `rh.intervenir` (
  `Num_Interv` varchar(20) NOT NULL,
  `NoProj` int(11) NOT NULL,
  `NoEmp` int(11) NOT NULL,
  `NbHeures` int(11) NOT NULL,
  PRIMARY KEY (`Num_Interv`),
  KEY `NoEmp` (`NoEmp`),
  KEY `NoProj` (`NoProj`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `rh.intervenir`
--

INSERT INTO `rh.intervenir` (`Num_Interv`, `NoProj`, `NoEmp`, `NbHeures`) VALUES
('B32', 7345, 7, 5),
('B33', 7355, 8, 25),
('B34', 7365, 9, 15);

-- --------------------------------------------------------

--
-- Structure de la table `rh.project`
--

CREATE TABLE IF NOT EXISTS `rh.project` (
  `NoProj` int(11) NOT NULL,
  `LibelleProjet` varchar(20) NOT NULL,
  `Noserv` int(11) NOT NULL,
  PRIMARY KEY (`NoProj`),
  KEY `Noserv` (`Noserv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `rh.project`
--

INSERT INTO `rh.project` (`NoProj`, `LibelleProjet`, `Noserv`) VALUES
(7345, 'Pose de switch', 734),
(7355, 'Pose de caméra', 735),
(7365, 'Pose de Atiéké', 736);

-- --------------------------------------------------------

--
-- Structure de la table `rh.service`
--

CREATE TABLE IF NOT EXISTS `rh.service` (
  `NoSrv` int(11) NOT NULL,
  `NomSrv` varchar(20) NOT NULL,
  PRIMARY KEY (`NoSrv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `rh.service`
--

INSERT INTO `rh.service` (`NoSrv`, `NomSrv`) VALUES
(734, 'DSI'),
(735, 'DSO'),
(736, 'DSA');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `rh.employe`
--
ALTER TABLE `rh.employe`
  ADD CONSTRAINT `rh@002eemploye_ibfk_1` FOREIGN KEY (`NoSrv`) REFERENCES `rh.service` (`NoSrv`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `rh.intervenir`
--
ALTER TABLE `rh.intervenir`
  ADD CONSTRAINT `rh@002eintervenir_ibfk_2` FOREIGN KEY (`NoProj`) REFERENCES `rh.project` (`NoProj`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rh@002eintervenir_ibfk_1` FOREIGN KEY (`NoEmp`) REFERENCES `rh.employe` (`NoEmp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `rh.project`
--
ALTER TABLE `rh.project`
  ADD CONSTRAINT `rh@002eproject_ibfk_1` FOREIGN KEY (`Noserv`) REFERENCES `rh.service` (`NoSrv`) ON DELETE CASCADE ON UPDATE CASCADE;
