-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mar. 15 fév. 2022 à 04:08
-- Version du serveur : 8.0.27
-- Version de PHP : 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `forfaits_voyages`
--

-- --------------------------------------------------------

--
-- Structure de la table `bilan_analytique`
--

CREATE TABLE `bilan_analytique` (
  `id` int NOT NULL,
  `nbr_occupants` int NOT NULL,
  `activite_spa` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `service_transport` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `film_sur_demande` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `minibar_collation` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `qte_cartes_cadeaux` int NOT NULL,
  `nbr-reclamations` int NOT NULL,
  `nbr_annulations` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `bilan_analytique`
--

INSERT INTO `bilan_analytique` (`id`, `nbr_occupants`, `activite_spa`, `service_transport`, `film_sur_demande`, `minibar_collation`, `qte_cartes_cadeaux`, `nbr-reclamations`, `nbr_annulations`) VALUES
(1, 59, 'spa familial', 'Autocar', 'Comedie', 'Repas du midi', 50, 2, 6),
(2, 100, 'spa familial', 'taxi', 'Drama', 'Collation végane', 21, 2, 0),
(3, 250, 'Spa individuel', 'Autocar', 'Comedie', 'Collation santé', 15, 0, 8),
(4, 140, 'Spa familial', 'Moto', 'Histoire', 'Collation spéciale', 31, 6, 0),
(5, 210, 'Spa en groupe', 'Limousine', 'Comedie', 'Collation aux fruits', 10, 4, 4),
(6, 79, 'Spa solo', 'Limousine', 'Théâtre', 'Collation sucrée', 24, 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `forfaits`
--

CREATE TABLE `forfaits` (
  `id` int NOT NULL,
  `destination` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ville_de_depart` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nom_hotel` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `coordonnees` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre_etoiles` int NOT NULL,
  `nombre_chambres` int NOT NULL,
  `caracteristiques` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_de_depart` date NOT NULL,
  `date_de_retour` date NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `rabais` decimal(10,0) NOT NULL,
  `vedette` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `forfaits`
--

INSERT INTO `forfaits` (`id`, `destination`, `ville_de_depart`, `nom_hotel`, `coordonnees`, `nombre_etoiles`, `nombre_chambres`, `caracteristiques`, `date_de_depart`, `date_de_retour`, `prix`, `rabais`, `vedette`) VALUES
(1, 'Mexique', 'Québec', 'Hilton', '2546 Boulevard des Pierres Mexico City', 6, 100, 'Face à la plage; Ascenseur; Miniclub', '2022-03-01', '2022-03-15', '500', '100', 1),
(3, 'Sydney', 'Québec', 'Mogador Palace', '457 Wickham Terrace Australie', 4, 130, 'Face aux montagne; Ascenseur; piscine', '2022-05-13', '2022-05-28', '530', '100', 0),
(4, 'Maroc', 'Québec', 'Sofitel', '548 rue Zerqtouni Rabat', 6, 230, 'Face à la rivière; Ascenseur; Golf; piscine', '2022-07-13', '2022-07-22', '720', '100', 0),
(5, 'Paris', 'Québec', 'Ibis', '256 rue Charles CP 78954 Paris', 5, 150, 'Face à la Tour Effel; Ascenseur; piscine; Golf', '2022-06-17', '2022-06-26', '815', '100', 0),
(6, 'Jamaïque', 'Québec', 'Coco La Palm', '635 Montego Bay', 4, 80, 'Face océan; Ascenseur; piscine', '2022-08-01', '2022-08-13', '550', '100', 1),
(7, 'Carthagène', 'Québec', 'Cartagena Hills', '254 av Blas De Lezo Villas Colombie', 5, 110, 'Face océan; piscine; à proximité gare de train', '2022-08-07', '2022-08-28', '1290', '100', 1),
(8, 'Istanbul', 'Québec', 'Le Royal', '896 boul Guniss Turquie', 4, 85, 'Face au Bosphore; Spa; Piscine; Site historique', '2022-08-01', '2022-08-15', '389', '100', 1),
(14, 'Cuba', 'Quebec', 'Hilton', '24 rue Pierre dubois', 3, 56, 'Test1;Test2', '2022-02-15', '2022-02-28', '789', '100', 1),
(15, 'Cuba', 'Quebec', 'Hilton', '24 rue Pierre dubois', 3, 56, 'Test1;Test2', '2022-02-15', '2022-02-28', '896', '100', 1),
(16, 'Cuba', 'Quebec', 'Hilton', '24 rue Pierre dubois', 3, 58, '', '2022-02-15', '2022-02-28', '785', '100', 1);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `forfaits`
--
ALTER TABLE `forfaits`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
