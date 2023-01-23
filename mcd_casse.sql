-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 19 Janvier 2023 à 15:23
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `casse`
--

-- --------------------------------------------------------

--
-- Structure de la table `correspondance`
--

CREATE TABLE IF NOT EXISTS `correspondance` (
  `Marque` varchar(50) NOT NULL,
  `Reference` varchar(50) NOT NULL,
  PRIMARY KEY (`Marque`,`Reference`),
  KEY `Correspondance_Piece0_FK` (`Reference`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `correspondance`
--


-- --------------------------------------------------------

--
-- Structure de la table `entite9`
--

CREATE TABLE IF NOT EXISTS `entite9` (
  `Marque` varchar(50) NOT NULL,
  `Modele` varchar(50) NOT NULL,
  `Annee` year(4) NOT NULL,
  PRIMARY KEY (`Marque`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `entite9`
--


-- --------------------------------------------------------

--
-- Structure de la table `piece`
--

CREATE TABLE IF NOT EXISTS `piece` (
  `Reference` varchar(50) NOT NULL,
  `Categorie` varchar(50) NOT NULL,
  `DateRecup` date NOT NULL,
  `PrixVente` decimal(15,3) NOT NULL,
  PRIMARY KEY (`Reference`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `piece`
--


--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `correspondance`
--
ALTER TABLE `correspondance`
  ADD CONSTRAINT `Correspondance_entite9_FK` FOREIGN KEY (`Marque`) REFERENCES `entite9` (`Marque`),
  ADD CONSTRAINT `Correspondance_Piece0_FK` FOREIGN KEY (`Reference`) REFERENCES `piece` (`Reference`);
