-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 28 avr. 2022 à 10:18
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `reservations_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `artists`
--

DROP TABLE IF EXISTS `artists`;
CREATE TABLE IF NOT EXISTS `artists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=872 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `artists`
--

INSERT INTO `artists` (`id`, `firstname`, `lastname`) VALUES
(859, 'Daniel', 'Marcelin'),
(860, 'Philippe', 'Laurent'),
(861, 'Marius', 'Von Mayenburg'),
(862, 'Olivier', 'Boudon'),
(863, 'Anne Marie', 'Loop'),
(864, 'Pietro', 'Varasso'),
(865, 'Laurent', 'Caron'),
(866, 'Élena', 'Perez'),
(867, 'Guillaume', 'Alexandre'),
(868, 'Claude', 'Semal'),
(869, 'Laurence', 'Warin'),
(870, 'Pierre', 'Wayburn'),
(871, 'Gwendoline', 'Gauthier');

-- --------------------------------------------------------

--
-- Structure de la table `artists_types`
--

DROP TABLE IF EXISTS `artists_types`;
CREATE TABLE IF NOT EXISTS `artists_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `artist_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `artist_type_idx` (`artist_id`,`type_id`),
  KEY `IDX_29173A3AB7970CF8` (`artist_id`),
  KEY `IDX_29173A3AC54C8C93` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `artists_types`
--

INSERT INTO `artists_types` (`id`, `artist_id`, `type_id`) VALUES
(99, 859, 156),
(100, 860, 156),
(101, 861, 156),
(102, 862, 155),
(103, 863, 154),
(104, 864, 154),
(105, 865, 154),
(106, 866, 154),
(107, 867, 154),
(110, 868, 154),
(108, 868, 156),
(109, 869, 155),
(113, 870, 154),
(111, 870, 156),
(114, 871, 154),
(112, 871, 156);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220324024105', '2022-03-24 02:46:00', 1910),
('DoctrineMigrations\\Version20220325043945', '2022-03-25 04:42:59', 1387),
('DoctrineMigrations\\Version20220410155323', '2022-04-10 15:55:25', 89),
('DoctrineMigrations\\Version20220410203123', '2022-04-10 20:33:30', 244),
('DoctrineMigrations\\Version20220418190232', '2022-04-18 19:06:58', 4136),
('DoctrineMigrations\\Version20220418223714', '2022-04-18 22:45:32', 2963),
('DoctrineMigrations\\Version20220419012721', '2022-04-19 01:31:09', 2464),
('DoctrineMigrations\\Version20220424054626', '2022-04-24 05:48:57', 2620),
('DoctrineMigrations\\Version20220424070803', '2022-04-24 07:10:20', 2159),
('DoctrineMigrations\\Version20220425040210', '2022-04-25 04:05:14', 5075),
('DoctrineMigrations\\Version20220427132533', '2022-04-27 13:27:59', 7221);

-- --------------------------------------------------------

--
-- Structure de la table `localities`
--

DROP TABLE IF EXISTS `localities`;
CREATE TABLE IF NOT EXISTS `localities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `postal_code` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locality` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=410 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `localities`
--

INSERT INTO `localities` (`id`, `postal_code`, `locality`) VALUES
(403, '1170', 'Watermael-Boitsfort'),
(404, '1000', 'Bruxelles'),
(405, '1020', 'Laeken'),
(406, '1030', 'Schaerbeek'),
(407, '1050', 'Ixelles'),
(408, '1070', 'Anderlecht'),
(409, '1180', 'Uccle');

-- --------------------------------------------------------

--
-- Structure de la table `locations`
--

DROP TABLE IF EXISTS `locations`;
CREATE TABLE IF NOT EXISTS `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locality_id` int(11) DEFAULT NULL,
  `slug` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `designation` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_17E64ABA88823A92` (`locality_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `locations`
--

INSERT INTO `locations` (`id`, `locality_id`, `slug`, `designation`, `address`, `website`, `phone`) VALUES
(125, 403, 'espace-delvaux-la-venerie', 'Espace Delvaux / La Vénerie', '3 rue Gratès', 'https://www.lavenerie.be', '+32 (0)2/663.85.50'),
(126, 404, 'dexia-art-center', 'Dexia Art Center', '50 rue de l\'Ecuyer', NULL, NULL),
(127, 404, 'la-samaritaine', 'La Samaritaine', '16 rue de la samaritaine', 'http://www.lasamaritaine.be/', NULL),
(128, 404, 'espace-magh', 'Espace Magh', '17 rue du Poinçon', 'http://www.espacemagh.be', '+32 (0)2/274.05.10');

-- --------------------------------------------------------

--
-- Structure de la table `representations`
--

DROP TABLE IF EXISTS `representations`;
CREATE TABLE IF NOT EXISTS `representations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `show_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `schedule` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C90A401D0C1FC64` (`show_id`),
  KEY `IDX_C90A40164D218E` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `representations`
--

INSERT INTO `representations` (`id`, `show_id`, `location_id`, `schedule`) VALUES
(93, 121, 125, '2012-10-12 13:30:00'),
(94, 121, 126, '2012-10-12 20:30:00'),
(95, 122, NULL, '2012-10-02 20:30:00'),
(96, 123, NULL, '2012-10-16 20:30:00');

-- --------------------------------------------------------

--
-- Structure de la table `representationsusers`
--

DROP TABLE IF EXISTS `representationsusers`;
CREATE TABLE IF NOT EXISTS `representationsusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `representations_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `places` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BA4CF5F75DE745A2` (`representations_id`),
  KEY `IDX_BA4CF5F767B3B43D` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `representationsusers`
--

INSERT INTO `representationsusers` (`id`, `representations_id`, `users_id`, `places`) VALUES
(25, 93, 64, '2'),
(26, 94, 65, '4'),
(27, 95, 66, '6'),
(28, 96, 66, '8');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(133, 'admin'),
(134, 'member'),
(135, 'affiliate');

-- --------------------------------------------------------

--
-- Structure de la table `shows`
--

DROP TABLE IF EXISTS `shows`;
CREATE TABLE IF NOT EXISTS `shows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location_id` int(11) DEFAULT NULL,
  `slug` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `poster_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bookable` tinyint(1) NOT NULL,
  `price` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6C3BF14464D218E` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `shows`
--

INSERT INTO `shows` (`id`, `location_id`, `slug`, `title`, `description`, `poster_url`, `bookable`, `price`) VALUES
(121, 125, 'ayiti', 'Ayiti', 'Un homme est bloqué à l’aéroport.\n Questionné par les douaniers, il doit alors justifier son identité, et surtout prouver qu\'il est haïtien – qu\'est-ce qu\'être haïtien ?', 'ayiti.jpg', 1, '8.50'),
(122, 126, 'cible-mouvante', 'Cible mouvante', 'Dans ce « thriller d’anticipation », des adultes semblent alimenter et véhiculer une crainte féroce envers les enfants âgés entre 10 et 12 ans.', 'cible.jpg', 1, '9.00'),
(123, NULL, 'ceci-n-est-pas-un-chanteur-belge', 'Ceci n\'est pas un chanteur belge', 'Non peut-être ?!\nEntre Magritte (pour le surréalisme comique) et Maigret (pour le réalisme mélancolique), ce dixième opus semalien propose quatorze nouvelles chansons mêlées à de petits textes humoristiques et à quelques fortes images poétiques.', 'claudebelgesaison220.jpg', 0, '5.50'),
(124, 127, 'manneke', 'Manneke… !', 'A tour de rôle, Pierre se joue de ses oncles, tantes, grands-parents et surtout de sa mère.', 'wayburn.jpg', 1, '10.50');

-- --------------------------------------------------------

--
-- Structure de la table `shows_artists_types`
--

DROP TABLE IF EXISTS `shows_artists_types`;
CREATE TABLE IF NOT EXISTS `shows_artists_types` (
  `shows_id` int(11) NOT NULL,
  `artists_types_id` int(11) NOT NULL,
  PRIMARY KEY (`shows_id`,`artists_types_id`),
  KEY `IDX_262F141DAD7ED998` (`shows_id`),
  KEY `IDX_262F141DE9C7FEE1` (`artists_types_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `shows_artists_types`
--

INSERT INTO `shows_artists_types` (`shows_id`, `artists_types_id`) VALUES
(121, 99),
(121, 100),
(122, 101),
(122, 102),
(122, 103),
(122, 104),
(122, 105),
(122, 106),
(122, 107),
(123, 108),
(123, 109),
(123, 110),
(124, 111),
(124, 112),
(124, 113),
(124, 114);

-- --------------------------------------------------------

--
-- Structure de la table `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `types`
--

INSERT INTO `types` (`id`, `type`) VALUES
(154, 'comédien'),
(155, 'scénographe'),
(156, 'auteur');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `langue` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9AA08CB10` (`login`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `login`, `password`, `firstname`, `lastname`, `email`, `langue`) VALUES
(64, 'bob', '$2y$10$7qZYKbVnYmD3dCn1ynqeYuEqnkpfrpj8BMtaTfX2bw8O4SM3d3d/K', 'bob', 'Dylan', 'bob@sull.com', 'fr'),
(65, 'fred', '$2y$10$3DUAVUdsBFI/jbkzJBBRzOYMBEIV0ndHkDYqFnk0IuBzrTmyhiYn2', 'fred', 'Mercuri', 'fred@sull.com', 'en'),
(66, 'stef', '$2y$10$lWwPeA9djSwKAnHVgGPAPOffR36kvl/gdTm.7qybPs5iRH5YLWtua', 'stef', 'Kapond', 'stef@sull.com', 'en');

-- --------------------------------------------------------

--
-- Structure de la table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE IF NOT EXISTS `users_roles` (
  `users_id` int(11) NOT NULL,
  `roles_id` int(11) NOT NULL,
  PRIMARY KEY (`users_id`,`roles_id`),
  KEY `IDX_51498A8E67B3B43D` (`users_id`),
  KEY `IDX_51498A8E38C751C4` (`roles_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users_roles`
--

INSERT INTO `users_roles` (`users_id`, `roles_id`) VALUES
(64, 133),
(65, 134),
(66, 134),
(66, 135);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `artists_types`
--
ALTER TABLE `artists_types`
  ADD CONSTRAINT `FK_29173A3AB7970CF8` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`),
  ADD CONSTRAINT `FK_29173A3AC54C8C93` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`);

--
-- Contraintes pour la table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `FK_17E64ABA88823A92` FOREIGN KEY (`locality_id`) REFERENCES `localities` (`id`);

--
-- Contraintes pour la table `representations`
--
ALTER TABLE `representations`
  ADD CONSTRAINT `FK_C90A40164D218E` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `FK_C90A401D0C1FC64` FOREIGN KEY (`show_id`) REFERENCES `shows` (`id`);

--
-- Contraintes pour la table `representationsusers`
--
ALTER TABLE `representationsusers`
  ADD CONSTRAINT `FK_BA4CF5F75DE745A2` FOREIGN KEY (`representations_id`) REFERENCES `representations` (`id`),
  ADD CONSTRAINT `FK_BA4CF5F767B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `shows`
--
ALTER TABLE `shows`
  ADD CONSTRAINT `FK_6C3BF14464D218E` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

--
-- Contraintes pour la table `shows_artists_types`
--
ALTER TABLE `shows_artists_types`
  ADD CONSTRAINT `FK_262F141DAD7ED998` FOREIGN KEY (`shows_id`) REFERENCES `shows` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_262F141DE9C7FEE1` FOREIGN KEY (`artists_types_id`) REFERENCES `artists_types` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `FK_51498A8E38C751C4` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_51498A8E67B3B43D` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
