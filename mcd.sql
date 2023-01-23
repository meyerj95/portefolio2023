-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 19 Janvier 2023 à 15:27
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `appartement`
--

-- --------------------------------------------------------

--
-- Structure de la table `appartement`
--

CREATE TABLE IF NOT EXISTS `appartement` (
  `NumAppart` varchar(50) NOT NULL,
  `TypeAppart` varchar(50) NOT NULL,
  `Etage` int(11) NOT NULL,
  `Porte` int(11) NOT NULL,
  `Superficie` varchar(50) NOT NULL,
  `NumIm` varchar(50) NOT NULL,
  PRIMARY KEY (`NumAppart`),
  KEY `Appartement_Immeuble_FK` (`NumIm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `appartement`
--


-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `NumClient` varchar(50) NOT NULL,
  `NomClient` varchar(50) NOT NULL,
  `Titre` varchar(50) NOT NULL,
  `AdresseClient` varchar(50) NOT NULL,
  `CodeVille` varchar(50) NOT NULL,
  PRIMARY KEY (`NumClient`),
  KEY `Client_Ville_FK` (`CodeVille`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--


-- --------------------------------------------------------

--
-- Structure de la table `immeuble`
--

CREATE TABLE IF NOT EXISTS `immeuble` (
  `NumIm` varchar(50) NOT NULL,
  `TypeIm` varchar(50) NOT NULL,
  `Taxe` varchar(50) NOT NULL,
  `CodeVille` varchar(50) NOT NULL,
  PRIMARY KEY (`NumIm`),
  KEY `Immeuble_Ville_FK` (`CodeVille`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `immeuble`
--


-- --------------------------------------------------------

--
-- Structure de la table `louer`
--

CREATE TABLE IF NOT EXISTS `louer` (
  `NumAppart` varchar(50) NOT NULL,
  `NumClient` varchar(50) NOT NULL,
  `DateSignature` date NOT NULL,
  `DateResiliation` date NOT NULL,
  PRIMARY KEY (`NumAppart`,`NumClient`),
  KEY `Louer_Client0_FK` (`NumClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `louer`
--


-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

CREATE TABLE IF NOT EXISTS `ville` (
  `CodeVille` varchar(50) NOT NULL,
  `CodePostal` varchar(50) NOT NULL,
  `NomVille` varchar(50) NOT NULL,
  PRIMARY KEY (`CodeVille`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `ville`
--


--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `appartement`
--
ALTER TABLE `appartement`
  ADD CONSTRAINT `Appartement_Immeuble_FK` FOREIGN KEY (`NumIm`) REFERENCES `immeuble` (`NumIm`);

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `Client_Ville_FK` FOREIGN KEY (`CodeVille`) REFERENCES `ville` (`CodeVille`);

--
-- Contraintes pour la table `immeuble`
--
ALTER TABLE `immeuble`
  ADD CONSTRAINT `Immeuble_Ville_FK` FOREIGN KEY (`CodeVille`) REFERENCES `ville` (`CodeVille`);

--
-- Contraintes pour la table `louer`
--
ALTER TABLE `louer`
  ADD CONSTRAINT `Louer_Appartement_FK` FOREIGN KEY (`NumAppart`) REFERENCES `appartement` (`NumAppart`),
  ADD CONSTRAINT `Louer_Client0_FK` FOREIGN KEY (`NumClient`) REFERENCES `client` (`NumClient`);
