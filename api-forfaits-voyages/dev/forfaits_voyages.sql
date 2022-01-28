-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  mer. 26 jan. 2022 à 00:53
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `forfaits_voyages`
--

-- --------------------------------------------------------

--
-- Structure de la table `bilan_analytique`
--

CREATE TABLE `bilan_analytique` (
  `id` int(11) NOT NULL,
  `nbr_occupants` int(11) NOT NULL,
  `activite_spa` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `service_transport` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `film_sur_demande` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `minibar_collation` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `qte_cartes_cadeaux` int(11) NOT NULL,
  `nbr-reclamations` int(11) NOT NULL,
  `nbr_annulations` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `bilan_analytique`
--

INSERT INTO `bilan_analytique` (`id`, `nbr_occupants`, `activite_spa`, `service_transport`, `film_sur_demande`, `minibar_collation`, `qte_cartes_cadeaux`, `nbr-reclamations`, `nbr_annulations`) VALUES
(1, 59, 'spa familial', 'Autocar', 'Comédie', 'Repas du midi', 50, 2, 6),
(2, 100, 'spa familial', 'taxi', 'Drama', 'Collation végane', 21, 2, 0),
(3, 250, 'Spa individuel', 'Autocar', 'Comédie', 'Collation santé', 15, 0, 8),
(4, 140, 'Spa familial', 'Moto', 'Histoire', 'Collation Spéciale', 31, 6, 0),
(5, 210, 'Spa en groupe', 'Limousine', 'Comédie', 'Collation aux fruits', 10, 4, 4),
(6, 79, 'Spa solo', 'Limousine', 'Théâtre', 'Collation sucrée', 24, 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `forfaits`
--

CREATE TABLE `forfaits` (
  `id` int(11) NOT NULL,
  `destination` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `ville_de_depart` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `nom_hotel` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `coordonnees` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_etoiles` int(11) NOT NULL,
  `nombre_chambres` int(11) NOT NULL,
  `caracteristiques` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `date_de_depart` datetime NOT NULL,
  `date_de_retour` datetime NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `rabais` decimal(10,0) NOT NULL,
  `vedette` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `forfaits`
--

INSERT INTO `forfaits` (`id`, `destination`, `ville_de_depart`, `nom_hotel`, `coordonnees`, `nombre_etoiles`, `nombre_chambres`, `caracteristiques`, `date_de_depart`, `date_de_retour`, `prix`, `rabais`, `vedette`) VALUES
(1, 'Mexique', 'Québec', 'Hilton', '2546 Boulevard des Pierres Mexico City', 6, 100, 'Face à la plage; Ascenseur; Miniclub', '2022-03-01 09:00:00', '2022-03-15 22:00:00', '500', '100', b'1'),
(2, 'New York', 'Québec', 'Palace', '2548 Street City USA', 5, 130, 'Face à la Forêt; Ascenseur; Golf', '2022-04-05 09:00:00', '2022-04-15 22:00:00', '600', '100', b'0'),
(3, 'Sydney', 'Québec', 'Mogador', '457 Wickham Terrace', 4, 100, 'Face aux montagne; Ascenseur; piscine', '2022-05-13 09:00:00', '2022-05-28 22:00:00', '480', '100', b'0'),
(4, 'Maroc', 'Québec', 'Sofitel', '548 rue Zerqtouni Rabat', 6, 230, 'Face à la rivière; Ascenseur; Golf; piscine', '2022-07-13 09:00:00', '2022-07-22 22:00:00', '720', '100', b'0'),
(5, 'Paris', 'Québec', 'Ibis', '256 rue Charles CP 78954 Paris', 5, 150, 'Face à la Tour Effel; Ascenseur; piscine; Golf', '2022-06-17 09:00:00', '2022-06-26 22:00:00', '815', '100', b'0'),
(6, 'Jamaïque', 'Québec', 'Coco La Palm', '635 Montego Bay', 3, 80, 'Face océan; Ascenseur; piscine', '2022-08-05 09:00:00', '2022-08-13 22:00:00', '580', '100', b'1'),
(7, 'Carthagène', 'Québec', 'Cartagena Hills', '254 av Blas De Lezo Villas Colombie', 5, 110, 'Face océan; piscine; à proximité gare de train', '2022-08-07 09:00:00', '2022-08-28 22:00:00', '1290', '100', b'1');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bilan_analytique`
--
ALTER TABLE `bilan_analytique`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `forfaits`
--
ALTER TABLE `forfaits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bilan_analytique`
--
ALTER TABLE `bilan_analytique`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `forfaits`
--
ALTER TABLE `forfaits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;