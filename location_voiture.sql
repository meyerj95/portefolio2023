-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 08 Décembre 2022 à 15:13
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `location_voiture`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `code_client` varchar(10) NOT NULL,
  `nom_prenom` varchar(20) NOT NULL,
  `date_naissance` date NOT NULL,
  `adresse` text NOT NULL,
  `ville` varchar(10) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `date_permis` date NOT NULL,
  `code_postal` varchar(5) NOT NULL,
  `email` varchar(20) NOT NULL,
  PRIMARY KEY (`code_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `clients`
--

INSERT INTO `clients` (`code_client`, `nom_prenom`, `date_naissance`, `adresse`, `ville`, `telephone`, `date_permis`, `code_postal`, `email`) VALUES
('12A', 'Mouloud B', '1998-12-23', '35 allée des peupliers', 'Paris', '0656589862', '2017-12-27', '75003', 'reubeunrv@gmail.com'),
('15B', 'Anissa H', '1999-08-25', '35 rue de la puterie', 'Garges', '0758596851', '2011-12-29', '95500', 'meufdelar@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `id_location` int(11) NOT NULL AUTO_INCREMENT,
  `date_location` date NOT NULL,
  `duree` int(11) NOT NULL,
  `code_client` varchar(10) NOT NULL,
  `prix_jour` int(11) NOT NULL,
  `immatriculation` varchar(10) NOT NULL,
  PRIMARY KEY (`id_location`),
  KEY `code_client` (`code_client`),
  KEY `immatriculation` (`immatriculation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Contenu de la table `location`
--

INSERT INTO `location` (`id_location`, `date_location`, `duree`, `code_client`, `prix_jour`, `immatriculation`) VALUES
(12, '2022-12-13', 5, '12A', 90, '15 ER 200'),
(15, '2022-12-17', 10, '15B', 250, '23 GD 3900');

-- --------------------------------------------------------

--
-- Structure de la table `reparations`
--

CREATE TABLE IF NOT EXISTS `reparations` (
  `num_reparation` int(11) NOT NULL,
  `date_reparation` date NOT NULL,
  `duree_reparation` varchar(100) NOT NULL,
  `cout_reparation` int(255) NOT NULL,
  `responsable_rep` varchar(255) NOT NULL,
  `immatriculation` varchar(255) NOT NULL,
  PRIMARY KEY (`num_reparation`),
  KEY `immatriculation` (`immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `reparations`
--


-- --------------------------------------------------------

--
-- Structure de la table `voitures`
--

CREATE TABLE IF NOT EXISTS `voitures` (
  `immatriculation` varchar(20) NOT NULL,
  `marque` varchar(10) NOT NULL,
  `couleur` varchar(10) NOT NULL,
  `kilometrage` int(11) NOT NULL,
  `année_circulation` date NOT NULL,
  `modele` varchar(10) NOT NULL,
  PRIMARY KEY (`immatriculation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `voitures`
--

INSERT INTO `voitures` (`immatriculation`, `marque`, `couleur`, `kilometrage`, `année_circulation`, `modele`) VALUES
('15 ER 200', 'Audi', 'bleu', 200000, '2014-12-16', 'R8 V10'),
('23 GD 3900', 'Renault', 'noir', 200000, '2008-12-18', 'clio');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_2` FOREIGN KEY (`immatriculation`) REFERENCES `voitures` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`code_client`) REFERENCES `clients` (`code_client`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reparations`
--
ALTER TABLE `reparations`
  ADD CONSTRAINT `reparations_ibfk_1` FOREIGN KEY (`immatriculation`) REFERENCES `voitures` (`immatriculation`) ON DELETE CASCADE ON UPDATE CASCADE;
