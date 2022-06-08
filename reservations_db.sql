-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mer. 08 juin 2022 à 09:03
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
) ENGINE=InnoDB AUTO_INCREMENT=1288 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `artists`
--

INSERT INTO `artists` (`id`, `firstname`, `lastname`) VALUES
(1275, 'Daniel', 'Marcelin'),
(1276, 'Philippe', 'Laurent'),
(1277, 'Marius', 'Von Mayenburg'),
(1278, 'Olivier', 'Boudon'),
(1279, 'Anne Marie', 'Loop'),
(1280, 'Pietro', 'Varasso'),
(1281, 'Laurent', 'Caron'),
(1282, 'Élena', 'Perez'),
(1283, 'Guillaume', 'Alexandre'),
(1284, 'Claude', 'Semal'),
(1285, 'Laurence', 'Warin'),
(1286, 'Pierre', 'Wayburn'),
(1287, 'Gwendoline', 'Gauthier');

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
) ENGINE=InnoDB AUTO_INCREMENT=323 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `artists_types`
--

INSERT INTO `artists_types` (`id`, `artist_id`, `type_id`) VALUES
(307, 1275, 252),
(308, 1276, 252),
(309, 1277, 252),
(310, 1278, 251),
(311, 1279, 250),
(312, 1280, 250),
(313, 1281, 250),
(314, 1282, 250),
(315, 1283, 250),
(318, 1284, 250),
(316, 1284, 252),
(317, 1285, 251),
(321, 1286, 250),
(319, 1286, 252),
(322, 1287, 250),
(320, 1287, 252);

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
('DoctrineMigrations\\Version20220427132533', '2022-04-27 13:27:59', 7221),
('DoctrineMigrations\\Version20220512133041', '2022-05-12 21:10:15', 546),
('DoctrineMigrations\\Version20220512205511', '2022-05-12 21:10:16', 2513);

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
) ENGINE=InnoDB AUTO_INCREMENT=634 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `localities`
--

INSERT INTO `localities` (`id`, `postal_code`, `locality`) VALUES
(627, '1170', 'Watermael-Boitsfort'),
(628, '1000', 'Bruxelles'),
(629, '1020', 'Laeken'),
(630, '1030', 'Schaerbeek'),
(631, '1050', 'Ixelles'),
(632, '1070', 'Anderlecht'),
(633, '1180', 'Uccle');

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
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `locations`
--

INSERT INTO `locations` (`id`, `locality_id`, `slug`, `designation`, `address`, `website`, `phone`) VALUES
(177, 627, 'espace-delvaux-la-venerie', 'Espace Delvaux / La Vénerie', '3 rue Gratès', 'https://www.lavenerie.be', '+32 (0)2/663.85.50'),
(178, 628, 'dexia-art-center', 'Dexia Art Center', '50 rue de l\'Ecuyer', NULL, NULL),
(179, 628, 'la-samaritaine', 'La Samaritaine', '16 rue de la samaritaine', 'http://www.lasamaritaine.be/', NULL),
(180, 628, 'espace-magh', 'Espace Magh', '17 rue du Poinçon', 'http://www.espacemagh.be', '+32 (0)2/274.05.10');

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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `representations`
--

INSERT INTO `representations` (`id`, `show_id`, `location_id`, `schedule`) VALUES
(98, 137, 177, '2012-10-12 13:30:00'),
(99, 137, 178, '2012-10-12 20:30:00'),
(100, 138, 178, '2012-10-02 20:30:00'),
(101, 139, NULL, '2012-10-16 20:30:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `representationsusers`
--

INSERT INTO `representationsusers` (`id`, `representations_id`, `users_id`, `places`) VALUES
(29, 98, 174, '2'),
(30, 99, 175, '4'),
(31, 100, 176, '6'),
(32, 101, 176, '8'),
(33, 100, 174, '3'),
(34, 99, 174, '4'),
(35, 101, 181, '5'),
(36, 98, 181, '6'),
(37, 100, 181, '1');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(100) CHARACTER SET latin1 NOT NULL DEFAULT 'ROLE_MEMBER',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(166, 'ROLE_ADMIN'),
(167, 'ROLE_MEMBER'),
(168, 'ROLE_AFFILIATE'),
(169, 'ROLE_MEMBER'),
(170, 'ROLE_MEMBER'),
(171, 'ROLE_MEMBER'),
(172, 'ROLE_MEMBER'),
(173, 'ROLE_MEMBER'),
(174, 'ROLE_MEMBER'),
(175, 'ROLE_MEMBER');

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
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `shows`
--

INSERT INTO `shows` (`id`, `location_id`, `slug`, `title`, `description`, `poster_url`, `bookable`, `price`) VALUES
(137, 177, 'ayiti', 'Ayiti', 'Un homme est bloqué à l’aéroport.\n Questionné par les douaniers, il doit alors justifier son identité, et surtout prouver qu\'il est haïtien – qu\'est-ce qu\'être haïtien ?', 'ayiti.jpg', 1, '8.50'),
(138, 178, 'cible-mouvante', 'Cible mouvante', 'Dans ce « thriller d’anticipation », des adultes semblent alimenter et véhiculer une crainte féroce envers les enfants âgés entre 10 et 12 ans.', 'cible.jpg', 1, '9.00'),
(139, NULL, 'ceci-n-est-pas-un-chanteur-belge', 'Ceci n\'est pas un chanteur belge', 'Non peut-être ?!\nEntre Magritte (pour le surréalisme comique) et Maigret (pour le réalisme mélancolique), ce dixième opus semalien propose quatorze nouvelles chansons mêlées à de petits textes humoristiques et à quelques fortes images poétiques.', 'claudebelgesaison220.jpg', 0, '5.50'),
(140, 179, 'manneke', 'Manneke… !', 'A tour de rôle, Pierre se joue de ses oncles, tantes, grands-parents et surtout de sa mère.', 'wayburn.jpg', 1, '10.50');

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
(137, 307),
(137, 308),
(138, 309),
(138, 310),
(138, 311),
(138, 312),
(138, 313),
(138, 314),
(138, 315),
(139, 316),
(139, 317),
(139, 318),
(140, 319),
(140, 320),
(140, 321),
(140, 322);

-- --------------------------------------------------------

--
-- Structure de la table `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `types`
--

INSERT INTO `types` (`id`, `type`) VALUES
(250, 'comédien'),
(251, 'scénographe'),
(252, 'auteur');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `langue` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `firstname`, `lastname`, `email`, `langue`) VALUES
(174, 'bob', '$2y$10$bu.WMn8zbL3kyI9ZsFXZAecFIrpM8hvAM6sSbv4XvPHMOJTvdMSze', 'bob', 'Dylan', 'bab@sull.com', 'fr'),
(175, 'fred', '$2y$13$dfwiyCA6Qu5WBuKpa3ieCuKGD4ugqhoAG3OX/SxaV3x7T6fCSmLKi', 'fred', 'Mercuri', 'fredo@sull.com', 'en'),
(176, 'stef', '$2y$13$dfwiyCA6Qu5WBuKpa3ieCuKGD4ugqhoAG3OX/SxaV3x7T6fCSmLKi', 'stef', 'Kapond', 'stefa@sull.com', 'en'),
(177, 'magic', '$2y$10$ogR5ZrbWPbdBB/KXUbzkwOgECpDb3ICqyu2Bb/WGAZ/noBo3O7yXO', 'magic', 'mag', 'mag@gmail.com', 'fr'),
(178, 'tshuma', '$2y$13$ARIPHH94o8QffP8bn1F.KukI4/Y4EJOHvst4TxJoVNuCg4PS52ipa', 'tshuma', 'mumpe', 'tshuma@gmail.com', 'fr'),
(179, 'doli', '$2y$10$OxfecJ1wmx5ogcwqGl8VcOvZjo6zJtBs2kmy5Swk.zpuhnd2Icv6.', 'doli', 'doli', 'dolidoli@gmail.com', 'fr'),
(180, 'frank', '$2y$13$CalHiKDs3arhKjUZN63EDe15ydyiLCe3elZSGOkURmQH6t1UF/pU6', 'frank', 'milpas', 'frankymilpas@gmail.com', 'fr'),
(181, 'bibine', '$2y$13$dfwiyCA6Qu5WBuKpa3ieCuKGD4ugqhoAG3OX/SxaV3x7T6fCSmLKi', 'bibine', 'dubot', 'dubot@gmail', 'fr'),
(182, 'benz', '$2y$13$ZD/0nwHKavGBjshqHls/YuQiMVZb5g8dWnNnWjwU0pHoy6JLsZg0G', 'benz', 'benz', 'benz@gmail.com', 'en'),
(183, 'kalev', '$2y$13$fpqeTHtpVWVSa4HHyT4SPuoSztrwINuJJJKn988MCdqpybH.rrW/K', 'kalev', 'kal', 'kal@gmail.com', 'en'),
(184, 'vivi', '$2y$13$KV8drxRgrV8ym8ewRO2YYecOEvMSHQLo1rCTrIIj9e7ZI6MOheeJu', 'vivi', 'vivi', 'vivi@gmail.com', 'fr'),
(185, 'meta', '$2y$13$asT.lyG.e3D49UAL.BUD5u2FUmZzcSJtkGRTTxD9HXHRgf2K8jPAy', 'meta', 'meta', 'meta@yhaoo.fr', 'fr'),
(186, 'wenge', '$2y$13$PUm0y0DMJW25jEt8J06F0.THHNQMd3m2/fcEYB/W3SmgwH2OspSAK', 'stef', 'stef', 'wenge@yahoo.fr', 'fr'),
(187, 'pastor', '$2y$13$5Cwp8BRbyFcMS4KKPu88Q.uts9LHPrQPmnkei0uX3r5K7CcOToGxK', 'pastor', 'pastor', 'pastor@gmail.com', 'fr'),
(188, 'laura', '$2y$13$LViUbpk2n0SrWKSU5tOvJ.rEl8sHwQY2TfmxX10YG.hSWRnlFF/8S', 'laura', 'laura', 'laura@gmail.com', 'fr'),
(189, 'pascale', '$2y$13$hjunFwCrwPfEKxUGW25KdemdZ6QroQmci6Q/DQS.mI1e6VSLfk33G', 'pascale', 'pascale', 'pascale@h.com', 'fr'),
(190, 'gina', '$2y$13$2eqr6DxNBCc5kdOE375qB.ntoYIKd0MjfFqaDLcrxnr8kYv/ds93a', 'gina', 'gina', 'gina@yahoo.fr', 'fr'),
(191, 'felix', '$2y$13$wenlSVSYf6mK9E2FTOzXDunAuh28m036qn5gKo2sc/bYZJ.t6wxjG', 'felix', 'felix', 'felix@mol.com', 'fr'),
(192, 'francine', '$2y$13$CnhL06PyyIn9WJsH7KwZkOw1yH3G.8qwd8295MfOZzgFgYWwOWW9q', 'f', 'f', 'f@f.com', 'fr'),
(193, 'satan', '$2y$13$IrOmRQWYE8zMdYj7lXo0nOBNfHoIj16Jdmrgs4fyNsKm4iCde7R7a', 'sa', 'sa', 'sa@h.com', 'fr'),
(194, 'sim', '$2y$13$j39WQyHNIBu13czcfzX5CuJI07vnBtuYDP66oxxtuKnu5668KJSCO', 'sim', 'sim', 'sim@g.com', 'fr'),
(195, 'chico', '$2y$13$2lNsZNjzDaltcyv6dzr0BuYwoPBcpVa5mj5KgGfaRbHJAGlqlKQFO', 'chico', 'chico', 'chico@gmail.com', 'fr'),
(196, 'justine', '$2y$13$Da5XQXDX8xgMEp61RYRZleJBZFcEYldI.wnib47NsjRLv25/L7BFC', 'ju', 'ju', 'ju@yahoo.fr', 'fr'),
(197, 'justin', '$2y$13$Z5Cu1jI8VQkv/.G1D0B1YeyXQmKAiRlSr0R.1EfZksi26o4xaBihm', 'ju', 'ju', 'jus@j.o', 'fr'),
(198, 'pilote', '$2y$13$Fhi2VdJmfByH/6276ktGj.qyvRZnzy43yOABX0IZHx3CTcNQWvk32', 'pil', 'pil', 'pil@pil.com', 'fr'),
(199, 'bulot', '$2y$13$WfPkh/raig2/bUUKwAVK1.z4TuoyqpxuQInC4tBtGjPctd0f80rfa', 'bul', 'bul', 'bul@bul.com', 'fr'),
(200, 'denzel', '$2y$13$3D5II/m83s0ciaEkSGuF4.3frWq0XBhwepcpJTjL3QZtJMLYmS/32', 'den', 'den', 'den@den.com', 'fr'),
(201, 'stina', '$2y$13$qnOutuXTHQt3HtbdzKpFi.FSJVU3GyXkFrJQPieQ54yprCD4fvbse', 'sti', 'sti', 'sti@s.c', 'fr'),
(202, 'pela', '$2y$13$1d4OA/TPw9cpuOFFCSqsX.pvTIr9ZcwNlViQnAzLG/6/ShvX22VAu', 'p', 'p', 'p@p.p', 'fr'),
(203, 'dema', '$2y$13$sS8kstWc.0QIzsz8bQoIzu2TWlN57BLOFZTpuHm24v.IDXfvyY4om', 'dem', 'dem', 'dem@d.d', 'fr'),
(204, 'rol', '$2y$13$ahWDF7EQNaKllgiEQnbj0.ptB7yhAmD.0s47gHxk3dvbLOILLlDzq', 'rol', 'rol', 'rol@y.y', 'fr'),
(205, 'lala', '$2y$13$VmcN2tp10EOByO6jW9IW8.9f7WWhwdSreShWtKBH6Lu3w2SxdV/ra', 'la', 'la', 'la@la.com', 'fr'),
(206, 'malu', '$2y$13$wCF8XXoPSUIzt5UKE8WUCu9e3BNLeD1Pp9wB5YNAHq1fma.QTuj2.', 'malu', 'malu', 'malu@m.m', 'fr'),
(207, 'francois', '$2y$13$O.d4FLRTisHXqHv2lKu0i.WwlxeCNvrMeS/sKtKG9vfPyZ2jeaHoe', 'fra', 'fra', 'fra@fr.fr', 'fr'),
(208, 'gate', '$2y$13$mBJzgv5Zl00Ez3xHx6oHjuj98rQ14CqMngNlNYpQn6yXLvQMf0gUS', 'gate', 'gate', 'gate@g.g', 'fr'),
(209, 'verbist', '$2y$13$D/tvBtO/6xHftDDGzqJbEOmcptnnYi15XT2SgDZUm2GbXU.ABbjPG', 'stephane', 'kaponda', 'stefkap1@yahoo.fr', 'fr'),
(210, 'sylva', '$2y$13$lBByQ6va1K9LyNOgX8PzPuPAka8yX3G5Er/EbdumUrn1Dan3TRR2q', 'sy', 'sy', 'sy@sy.sy', 'fr'),
(211, 'bet', '$2y$13$fgtc8IG9iI2nBhk2dUPPa.l/dN9EDJHEPC08ryn1rwE36Wh3r.G2K', 'bet', 'bet', 'bet@b.b', 'fr'),
(212, 'doly', '$2y$13$nCBUI7RaYqq.jia2eQ.utu6ZreFKX3khdIM3MgWmsE7.ILtHEfy8u', 'dol', 'dol', 'dol@d.d', 'en'),
(213, 'amin', '$2y$13$xipUpj0vNkm5.j7oP2h9QemJMZfavC9NQjHkmuwwJzq3jGPsWmQiK', 'amin', 'amin', 'amin@mi.mi', 'fr'),
(214, 'miss', '$2y$13$cm..mLYwcdD70E0x/WxwDeT86OjG44VPOmb/b/yImN/aSw0Zj2Tea', 'mi', 'mi', 'mi@mi.mi', 'fr'),
(215, 'soku', '$2y$13$3A/nAMwulet.xA9zIGAy8.kcLqxn.c1D64H7Uj4DgZyPbUwNfjMHu', 'sok', 'sok', 'sok@so.so', 'fr'),
(216, 'phil', '$2y$13$q/wpziC15Zf8YKV15K9M1uzPRtgKXSDrxEb5csy0ADIHClTQmZumy', 'phil', 'phil', 'phil@p.p', 'fr'),
(217, 'betal', '$2y$13$BpvZSq9K8V8CybLmRjh8GuxX5QwVS37Ry2vjlUE7iIc8.//Y1Tlmy', 'stephane', 'kaponda', 'stefkap13@yahoo.fr', 'fr'),
(218, 'pilipili', '$2y$13$zV2DQ48u8xBIvwB2rtGoIebnEwLPg0C9xIYBhuf4O9CxSPAxGus5.', 'stephane', 'kaponda', 'stefkap14@yahoo.fr', 'fr'),
(219, 'beat', '$2y$13$fF7vB7N5LbAlG5wZNDtyyO5zXS0PUjfRw7/2u5cNWg5IK28gELX8i', 'beat', 'beat', 'beat@b.b', 'fr'),
(220, 'gil', '$2y$13$9oCDfpAMgvkOJQwZiP/JAunqUP8sbjTtYfmbQUj9saVZPZ/.H5gEK', 'gil', 'gil', 'gil@gil.c', 'fr'),
(221, 'zoo', '$2y$13$P1Lln0Je0uNxwVFXwDXtueG/epd//UZ4aUofir7a4pQByDrrNk0lm', 'zoo', 'zo', 'zo@zo.zo', 'fr'),
(222, 'simon', '$2y$13$NplhR0GlPCsNR6vWf7eJbOUb3rGeRoewQMW5iSPICMlDprpm5CSsO', 'sim', 'sim', 'sim@s.s', 'fr'),
(223, 'matie', '$2y$13$zPwv1VksQEjaBQ2x4ow7.uM0gCFNyx4di0u5iM4XzJuUSLMD6N9Bm', 'mati', 'm', 'm@mati.fr', 'fr'),
(224, 'gila', '$2y$13$Wa.pliZPJcN/ANsPcCkROu3k70mu1r8Y9tssSKvbl6S8yYo/cFCfK', 'gil', 'gil', 'gil@g.g', 'fr'),
(225, 'serge', '$2y$13$bQTEGP2KlucpOwJO0f1M3OZNf/2uHyN0Xh2Oui8x3T1EWk3wVzRqe', 'serge', 'serge', 'serge@s.s', 'fr'),
(226, 'zoe', '$2y$13$F/uAK/T/D2u0frsLiEv6rO3wK.zlgmm8WU/RjJTwd8yRS27h3md9i', 'zoe', 'zoe', 'zoe@z.z', 'fr'),
(227, 'mata', '$2y$13$VMEnBi5vgth/kYqDY0U9uurz/wU8CdnFzBHL4lbCnxo9Y91DBBF66', 'mata', 'mata', 'mata@ma.ma', 'fr'),
(228, 'string', '$2y$13$YKMO2x2YvrNhacoq4QTdmeQl7DBMNWkcdUT1vOMoizN7AKddaPlRG', 'str', 'str', 'str@str.str', 'fr'),
(229, 'polo', '$2y$13$zUVGe5jY3TzQhEE9ajUSjei/LhBO4SmzNhC1qnWmY/b/OyUglJJSy', 'polo', 'polo', 'pol@pol.pol', 'fr'),
(230, 'moto', '$2y$13$ZEQTgKkfQefcJdH34gzd7u34rvT3L5HEYrFSu.GctfAvpq8aZX2/2', 'mot', 'mot', 'mot@m.m', 'fr'),
(231, 'colin', '$2y$13$4LxGXmrPh7rm/8N/SjPLB.kPW7eTOaolgSgenku3qAeyxDFh/oV6C', 'colin', 'colin', 'colin@col.col', 'fr');

-- --------------------------------------------------------

--
-- Structure de la table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE IF NOT EXISTS `users_roles` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `users_id` int(11) UNSIGNED NOT NULL,
  `roles_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_id` (`users_id`),
  KEY `roles_id` (`roles_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users_roles`
--

INSERT INTO `users_roles` (`id`, `users_id`, `roles_id`) VALUES
(10, 174, 166),
(11, 175, 167),
(12, 176, 168),
(13, 174, 167),
(14, 209, 167),
(15, 210, 166),
(16, 211, 166),
(17, 212, 168),
(18, 213, 166),
(19, 214, 166),
(20, 215, 168),
(21, 217, 167),
(22, 219, 168),
(23, 220, 166),
(24, 221, 166),
(25, 223, 168),
(26, 224, 166),
(27, 225, 168),
(28, 225, 169),
(29, 226, 166),
(30, 226, 170),
(31, 227, 166),
(32, 227, 171),
(33, 228, 166),
(34, 228, 172),
(35, 229, 166),
(36, 229, 173),
(37, 230, 174),
(38, 231, 175);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
