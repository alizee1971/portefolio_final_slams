-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 12 déc. 2025 à 10:37
-- Version du serveur : 8.0.39
-- Version de PHP : 8.2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bibliotheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `abonee`
--

CREATE TABLE `abonee` (
  `fidele` int NOT NULL,
  `probleme` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `id_recuperation` int NOT NULL,
  `id_raretee` int NOT NULL,
  `id_abonee` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `abonee`
--

INSERT INTO `abonee` (`fidele`, `probleme`, `id_recuperation`, `id_raretee`, `id_abonee`) VALUES
(1, '2', 1, 2, 1),
(2, '1', 2, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `adherents`
--

CREATE TABLE `adherents` (
  `id_adherent` int NOT NULL,
  `nom` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_naissance` date NOT NULL,
  `date_adhesion` date NOT NULL,
  `adresse` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `num_tel` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mail` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `adherents`
--

INSERT INTO `adherents` (`id_adherent`, `nom`, `prenom`, `date_naissance`, `date_adhesion`, `adresse`, `num_tel`, `mail`) VALUES
(43, 'marchand', 'lionel', '2015-08-06', '2026-01-15', '3 rue du camboge', '04854585', 'pointbarre@gmail.com'),
(44, 'mbappe', 'kyks', '2025-12-01', '2025-12-20', '7 rue 3-0', '0639456199', 'ballondor@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `auteurs`
--

CREATE TABLE `auteurs` (
  `id_auteur` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nom` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `prenom` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_naissance` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `auteurs`
--

INSERT INTO `auteurs` (`id_auteur`, `nom`, `prenom`, `date_naissance`) VALUES
('1', 'oda', 'echiro', '2015-12-01'),
('2', 'harry', 'maguire', '2016-12-14');

-- --------------------------------------------------------

--
-- Structure de la table `emprunts`
--

CREATE TABLE `emprunts` (
  `id_emprunt` int NOT NULL,
  `date_emprunt` date NOT NULL,
  `duree` int NOT NULL,
  `id_adherent` int NOT NULL,
  `reference_livre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `emprunts`
--

INSERT INTO `emprunts` (`id_emprunt`, `date_emprunt`, `duree`, `id_adherent`, `reference_livre`) VALUES
(23, '2017-12-06', 25, 43, 'harry poter'),
(24, '2026-01-06', 10, 44, 'one piece');

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE `livres` (
  `reference_livre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nbre_pages` int NOT NULL,
  `id_auteur` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `annee` date NOT NULL,
  `genre` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `disponibilite` tinyint(1) NOT NULL,
  `nbre_emprunts` int NOT NULL,
  `etat` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nbre_exemplaire` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `livres`
--

INSERT INTO `livres` (`reference_livre`, `nbre_pages`, `id_auteur`, `annee`, `genre`, `disponibilite`, `nbre_emprunts`, `etat`, `nbre_exemplaire`) VALUES
('harry poter', 52, '2', '2015-12-09', 'histoire', 1, 740, 'neuf', 30),
('one piece', 91, '1', '2015-12-03', 'manga', 1, 875, 'neuf', 30);

-- --------------------------------------------------------

--
-- Structure de la table `location`
--

CREATE TABLE `location` (
  `id_location` int NOT NULL,
  `duree` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `location`
--

INSERT INTO `location` (`id_location`, `duree`) VALUES
(1, '6'),
(2, '72');

-- --------------------------------------------------------

--
-- Structure de la table `prix`
--

CREATE TABLE `prix` (
  `id_prix` int NOT NULL,
  `motif` int NOT NULL,
  `montant_base_deja_payee_a_la_location_preus` int NOT NULL,
  `montant_total_a_deoir_payee_le_surplus_a_payee_redeable` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `prix`
--

INSERT INTO `prix` (`id_prix`, `motif`, `montant_base_deja_payee_a_la_location_preus`, `montant_total_a_deoir_payee_le_surplus_a_payee_redeable`) VALUES
(1, 1, 10, 100),
(2, 0, 100, 200);

-- --------------------------------------------------------

--
-- Structure de la table `raretee`
--

CREATE TABLE `raretee` (
  `id_raretee` int NOT NULL,
  `raretee` int NOT NULL,
  `id_location` int NOT NULL,
  `id_prix` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `raretee`
--

INSERT INTO `raretee` (`id_raretee`, `raretee`, `id_location`, `id_prix`) VALUES
(1, 1, 1, 2),
(2, 0, 2, 2);

-- --------------------------------------------------------

--
-- Structure de la table `recuperation`
--

CREATE TABLE `recuperation` (
  `date_recuperation` date NOT NULL,
  `etat` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `difference` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `prix` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `id_recuperation` int NOT NULL,
  `id_emprunts` int NOT NULL,
  `id_raretee` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `recuperation`
--

INSERT INTO `recuperation` (`date_recuperation`, `etat`, `difference`, `prix`, `id_recuperation`, `id_emprunts`, `id_raretee`) VALUES
('2025-12-12', '1', '1', '121', 1, 23, 2),
('2025-12-12', '1', '2', '100', 2, 24, 2);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `abonee`
--
ALTER TABLE `abonee`
  ADD PRIMARY KEY (`id_abonee`),
  ADD KEY `id_raretee` (`id_raretee`),
  ADD KEY `id_recuperation` (`id_recuperation`);

--
-- Index pour la table `adherents`
--
ALTER TABLE `adherents`
  ADD PRIMARY KEY (`id_adherent`);

--
-- Index pour la table `auteurs`
--
ALTER TABLE `auteurs`
  ADD PRIMARY KEY (`id_auteur`);

--
-- Index pour la table `emprunts`
--
ALTER TABLE `emprunts`
  ADD PRIMARY KEY (`id_emprunt`),
  ADD KEY `id_adherent` (`id_adherent`),
  ADD KEY `reference_livre` (`reference_livre`);

--
-- Index pour la table `livres`
--
ALTER TABLE `livres`
  ADD PRIMARY KEY (`reference_livre`),
  ADD KEY `id_auteur` (`id_auteur`);

--
-- Index pour la table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id_location`);

--
-- Index pour la table `prix`
--
ALTER TABLE `prix`
  ADD PRIMARY KEY (`id_prix`);

--
-- Index pour la table `raretee`
--
ALTER TABLE `raretee`
  ADD PRIMARY KEY (`id_raretee`),
  ADD KEY `id_location` (`id_location`),
  ADD KEY `id_prix` (`id_prix`);

--
-- Index pour la table `recuperation`
--
ALTER TABLE `recuperation`
  ADD PRIMARY KEY (`id_recuperation`),
  ADD KEY `id_emprunts` (`id_emprunts`),
  ADD KEY `id_raretee` (`id_raretee`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `abonee`
--
ALTER TABLE `abonee`
  MODIFY `id_abonee` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `location`
--
ALTER TABLE `location`
  MODIFY `id_location` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `prix`
--
ALTER TABLE `prix`
  MODIFY `id_prix` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `raretee`
--
ALTER TABLE `raretee`
  MODIFY `id_raretee` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `recuperation`
--
ALTER TABLE `recuperation`
  MODIFY `id_recuperation` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `abonee`
--
ALTER TABLE `abonee`
  ADD CONSTRAINT `abonee_ibfk_1` FOREIGN KEY (`id_raretee`) REFERENCES `raretee` (`id_raretee`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `abonee_ibfk_2` FOREIGN KEY (`id_recuperation`) REFERENCES `recuperation` (`id_recuperation`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `emprunts`
--
ALTER TABLE `emprunts`
  ADD CONSTRAINT `emprunts_ibfk_2` FOREIGN KEY (`id_adherent`) REFERENCES `adherents` (`id_adherent`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `emprunts_ibfk_3` FOREIGN KEY (`reference_livre`) REFERENCES `livres` (`reference_livre`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `livres`
--
ALTER TABLE `livres`
  ADD CONSTRAINT `livres_ibfk_1` FOREIGN KEY (`id_auteur`) REFERENCES `auteurs` (`id_auteur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `raretee`
--
ALTER TABLE `raretee`
  ADD CONSTRAINT `raretee_ibfk_1` FOREIGN KEY (`id_prix`) REFERENCES `prix` (`id_prix`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `raretee_ibfk_2` FOREIGN KEY (`id_location`) REFERENCES `location` (`id_location`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `recuperation`
--
ALTER TABLE `recuperation`
  ADD CONSTRAINT `recuperation_ibfk_1` FOREIGN KEY (`id_emprunts`) REFERENCES `emprunts` (`id_emprunt`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recuperation_ibfk_2` FOREIGN KEY (`id_raretee`) REFERENCES `raretee` (`id_raretee`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
