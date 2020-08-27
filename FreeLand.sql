-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 27 août 2020 à 00:06
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `freeland`
--

-- --------------------------------------------------------

--
-- Structure de la table `addon_account`
--

DROP TABLE IF EXISTS `addon_account`;
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('society_cardealer', 'Concessionnaire', 1),
('society_police', 'Police', 1);

-- --------------------------------------------------------

--
-- Structure de la table `addon_account_data`
--

DROP TABLE IF EXISTS `addon_account_data`;
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(1, 'society_cardealer', 0, NULL),
(2, 'society_police', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory`
--

DROP TABLE IF EXISTS `addon_inventory`;
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('society_cardealer', 'Concesionnaire', 1),
('society_police', 'Police', 1);

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory_items`
--

DROP TABLE IF EXISTS `addon_inventory_items`;
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `billing`
--

DROP TABLE IF EXISTS `billing`;
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(40) NOT NULL,
  `sender` varchar(40) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `cardealer_vehicles`
--

DROP TABLE IF EXISTS `cardealer_vehicles`;
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `datastore`
--

DROP TABLE IF EXISTS `datastore`;
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('user_ears', 'Ears', 0),
('user_glasses', 'Glasses', 0),
('user_helmet', 'Helmet', 0),
('user_mask', 'Mask', 0),
('society_police', 'Police', 1);

-- --------------------------------------------------------

--
-- Structure de la table `datastore_data`
--

DROP TABLE IF EXISTS `datastore_data`;
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(5, 'user_glasses', 'steam:11000013c16e034', '{}'),
(6, 'user_helmet', 'steam:11000013c16e034', '{}'),
(7, 'user_ears', 'steam:11000013c16e034', '{}'),
(8, 'user_mask', 'steam:11000013c16e034', '{}'),
(9, 'society_police', NULL, '{}');

-- --------------------------------------------------------

--
-- Structure de la table `fine_types`
--

DROP TABLE IF EXISTS `fine_types`;
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `fine_types`
--

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
(1, 'Usage abusif du klaxon', 30, 0),
(2, 'Franchir une ligne continue', 40, 0),
(3, 'Circulation à contresens', 250, 0),
(4, 'Demi-tour non autorisé', 250, 0),
(5, 'Circulation hors-route', 170, 0),
(6, 'Non-respect des distances de sécurité', 30, 0),
(7, 'Arrêt dangereux / interdit', 150, 0),
(8, 'Stationnement gênant / interdit', 70, 0),
(9, 'Non respect  de la priorité à droite', 70, 0),
(10, 'Non-respect à un véhicule prioritaire', 90, 0),
(11, 'Non-respect d\'un stop', 105, 0),
(12, 'Non-respect d\'un feu rouge', 130, 0),
(13, 'Dépassement dangereux', 100, 0),
(14, 'Véhicule non en état', 100, 0),
(15, 'Conduite sans permis', 1500, 0),
(16, 'Délit de fuite', 800, 0),
(17, 'Excès de vitesse < 5 kmh', 90, 0),
(18, 'Excès de vitesse 5-15 kmh', 120, 0),
(19, 'Excès de vitesse 15-30 kmh', 180, 0),
(20, 'Excès de vitesse > 30 kmh', 300, 0),
(21, 'Entrave de la circulation', 110, 1),
(22, 'Dégradation de la voie publique', 90, 1),
(23, 'Trouble à l\'ordre publique', 90, 1),
(24, 'Entrave opération de police', 130, 1),
(25, 'Insulte envers / entre civils', 75, 1),
(26, 'Outrage à agent de police', 110, 1),
(27, 'Menace verbale ou intimidation envers civil', 90, 1),
(28, 'Menace verbale ou intimidation envers policier', 150, 1),
(29, 'Manifestation illégale', 250, 1),
(30, 'Tentative de corruption', 1500, 1),
(31, 'Arme blanche sortie en ville', 120, 2),
(32, 'Arme léthale sortie en ville', 300, 2),
(33, 'Port d\'arme non autorisé (défaut de license)', 600, 2),
(34, 'Port d\'arme illégal', 700, 2),
(35, 'Pris en flag lockpick', 300, 2),
(36, 'Vol de voiture', 1800, 2),
(37, 'Vente de drogue', 1500, 2),
(38, 'Fabriquation de drogue', 1500, 2),
(39, 'Possession de drogue', 650, 2),
(40, 'Prise d\'ôtage civil', 1500, 2),
(41, 'Prise d\'ôtage agent de l\'état', 2000, 2),
(42, 'Braquage particulier', 650, 2),
(43, 'Braquage magasin', 650, 2),
(44, 'Braquage de banque', 1500, 2),
(45, 'Tir sur civil', 2000, 3),
(46, 'Tir sur agent de l\'état', 2500, 3),
(47, 'Tentative de meurtre sur civil', 3000, 3),
(48, 'Tentative de meurtre sur agent de l\'état', 5000, 3),
(49, 'Meurtre sur civil', 10000, 3),
(50, 'Meurte sur agent de l\'état', 30000, 3),
(51, 'Meurtre involontaire', 1800, 3),
(52, 'Escroquerie à l\'entreprise', 2000, 2);

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT '1',
  `limit` int(5) NOT NULL DEFAULT '10',
  `rare` tinyint(1) NOT NULL DEFAULT '0',
  `can_remove` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`name`, `label`, `weight`, `limit`, `rare`, `can_remove`) VALUES
('bread', 'Pain', 1, 10, 0, 1),
('water', 'Eau', 1, 10, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`name`, `label`) VALUES
('unemployed', 'RSA'),
('cardealer', 'Concessionnaire'),
('police', 'LSPD');

-- --------------------------------------------------------

--
-- Structure de la table `job_grades`
--

DROP TABLE IF EXISTS `job_grades`;
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
(1, 'unemployed', 0, 'unemployed', 'Chômeur', 50, '{}', '{}'),
(2, 'cardealer', 0, 'recruit', 'Recrue', 10, '{}', '{}'),
(3, 'cardealer', 1, 'novice', 'Novice', 25, '{}', '{}'),
(4, 'cardealer', 2, 'experienced', 'Experimente', 40, '{}', '{}'),
(5, 'cardealer', 3, 'boss', 'Patron', 0, '{}', '{}'),
(6, 'police', 0, 'recruit', 'Recrue', 20, '{}', '{}'),
(7, 'police', 1, 'officer', 'Officier', 40, '{}', '{}'),
(8, 'police', 2, 'sergeant', 'Sergent', 60, '{}', '{}'),
(9, 'police', 3, 'lieutenant', 'Lieutenant', 85, '{}', '{}'),
(10, 'police', 4, 'boss', 'Commandant', 100, '{}', '{}');

-- --------------------------------------------------------

--
-- Structure de la table `licenses`
--

DROP TABLE IF EXISTS `licenses`;
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `owned_vehicles`
--

DROP TABLE IF EXISTS `owned_vehicles`;
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(40) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`plate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `owned_vehicles`
--

INSERT INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `job`, `stored`) VALUES
('steam:11000013c16e034', 'MJN 488', '{\"model\":1672195559,\"plate\":\"MJN 488\"}', 'car', NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `rented_vehicles`
--

DROP TABLE IF EXISTS `rented_vehicles`;
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `shops`
--

DROP TABLE IF EXISTS `shops`;
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `shops`
--

INSERT INTO `shops` (`id`, `store`, `item`, `price`) VALUES
(1, 'TwentyFourSeven', 'bread', 30),
(2, 'TwentyFourSeven', 'water', 15),
(3, 'RobsLiquor', 'bread', 30),
(4, 'RobsLiquor', 'water', 15),
(5, 'LTDgasoline', 'bread', 30),
(6, 'LTDgasoline', 'water', 15);

-- --------------------------------------------------------

--
-- Structure de la table `society_moneywash`
--

DROP TABLE IF EXISTS `society_moneywash`;
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(60) NOT NULL,
  `license` varchar(60) DEFAULT NULL,
  `accounts` longtext,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT '0',
  `loadout` longtext,
  `position` varchar(255) DEFAULT NULL,
  `skin` longtext,
  `status` longtext,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`identifier`, `license`, `accounts`, `group`, `inventory`, `job`, `job_grade`, `loadout`, `position`, `skin`, `status`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`) VALUES
('steam:11000013c16e034', 'license:b56365ccffe896ea64f400b42c457934979d215f', '{\"money\":2500,\"bank\":50900,\"black_money\":0}', 'admin', '[]', 'police', 4, '{\"WEAPON_APPISTOL\":{\"ammo\":99},\"WEAPON_BZGAS\":{\"ammo\":5},\"WEAPON_CARBINERIFLE\":{\"ammo\":247},\"WEAPON_STUNGUN\":{\"ammo\":999},\"WEAPON_PISTOL\":{\"ammo\":999},\"WEAPON_NIGHTSTICK\":{\"ammo\":999},\"WEAPON_SMG\":{\"ammo\":999},\"WEAPON_PUMPSHOTGUN\":{\"ammo\":999}}', '{\"heading\":61.4,\"x\":427.5,\"y\":-980.7,\"z\":30.7}', '{\"helmet_2\":0,\"lipstick_1\":0,\"pants_1\":0,\"arms_2\":0,\"blush_2\":0,\"moles_2\":0,\"ears_1\":-1,\"complexion_2\":0,\"eyebrows_4\":0,\"sun_1\":0,\"decals_2\":0,\"hair_color_1\":0,\"age_1\":0,\"makeup_1\":0,\"eyebrows_3\":0,\"complexion_1\":0,\"lipstick_3\":0,\"tshirt_2\":0,\"bracelets_1\":-1,\"chest_2\":0,\"glasses_1\":0,\"watches_1\":-1,\"bags_1\":0,\"eye_color\":0,\"hair_2\":0,\"makeup_4\":0,\"chest_1\":0,\"beard_4\":0,\"beard_2\":0,\"blemishes_2\":0,\"blush_1\":0,\"tshirt_1\":0,\"pants_2\":0,\"chain_2\":0,\"eyebrows_1\":0,\"chain_1\":0,\"face\":0,\"decals_1\":0,\"eyebrows_2\":0,\"torso_1\":0,\"skin\":0,\"makeup_3\":0,\"helmet_1\":-1,\"blemishes_1\":0,\"hair_1\":0,\"blush_3\":0,\"mask_2\":0,\"beard_3\":0,\"arms\":0,\"moles_1\":0,\"glasses_2\":0,\"mask_1\":0,\"bracelets_2\":0,\"bodyb_1\":0,\"hair_color_2\":0,\"shoes_1\":0,\"shoes_2\":0,\"chest_3\":0,\"sun_2\":0,\"lipstick_2\":0,\"torso_2\":0,\"ears_2\":0,\"watches_2\":0,\"beard_1\":0,\"bags_2\":0,\"bodyb_2\":0,\"bproof_2\":0,\"sex\":0,\"lipstick_4\":0,\"age_2\":0,\"bproof_1\":0,\"makeup_2\":0}', '[{\"percent\":98.86,\"name\":\"hunger\",\"val\":988600},{\"percent\":99.14500000000001,\"name\":\"thirst\",\"val\":991450}]', 'James', 'Trema', '01/16/1996', 'm', 59);

-- --------------------------------------------------------

--
-- Structure de la table `user_licenses`
--

DROP TABLE IF EXISTS `user_licenses`;
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vehicles`
--

INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
('Blade', 'blade', 15000, 'muscle'),
('Buccaneer', 'buccaneer', 18000, 'muscle'),
('Buccaneer Rider', 'buccaneer2', 24000, 'muscle'),
('Chino', 'chino', 15000, 'muscle'),
('Chino Luxe', 'chino2', 19000, 'muscle'),
('Coquette BlackFin', 'coquette3', 55000, 'muscle'),
('Dominator', 'dominator', 35000, 'muscle'),
('Dukes', 'dukes', 28000, 'muscle'),
('Gauntlet', 'gauntlet', 30000, 'muscle'),
('Hotknife', 'hotknife', 125000, 'muscle'),
('Faction', 'faction', 20000, 'muscle'),
('Faction Rider', 'faction2', 30000, 'muscle'),
('Faction XL', 'faction3', 40000, 'muscle'),
('Nightshade', 'nightshade', 65000, 'muscle'),
('Phoenix', 'phoenix', 12500, 'muscle'),
('Picador', 'picador', 18000, 'muscle'),
('Sabre Turbo', 'sabregt', 20000, 'muscle'),
('Sabre GT', 'sabregt2', 25000, 'muscle'),
('Slam Van', 'slamvan3', 11500, 'muscle'),
('Tampa', 'tampa', 16000, 'muscle'),
('Virgo', 'virgo', 14000, 'muscle'),
('Vigero', 'vigero', 12500, 'muscle'),
('Voodoo', 'voodoo', 7200, 'muscle'),
('Blista', 'blista', 8000, 'compacts'),
('Brioso R/A', 'brioso', 18000, 'compacts'),
('Issi', 'issi2', 10000, 'compacts'),
('Panto', 'panto', 10000, 'compacts'),
('Prairie', 'prairie', 12000, 'compacts'),
('Bison', 'bison', 45000, 'vans'),
('Bobcat XL', 'bobcatxl', 32000, 'vans'),
('Burrito', 'burrito3', 19000, 'vans'),
('Burrito', 'gburrito2', 29000, 'vans'),
('Camper', 'camper', 42000, 'vans'),
('Gang Burrito', 'gburrito', 45000, 'vans'),
('Journey', 'journey', 6500, 'vans'),
('Minivan', 'minivan', 13000, 'vans'),
('Moonbeam', 'moonbeam', 18000, 'vans'),
('Moonbeam Rider', 'moonbeam2', 35000, 'vans'),
('Paradise', 'paradise', 19000, 'vans'),
('Rumpo', 'rumpo', 15000, 'vans'),
('Rumpo Trail', 'rumpo3', 19500, 'vans'),
('Surfer', 'surfer', 12000, 'vans'),
('Youga', 'youga', 10800, 'vans'),
('Youga Luxuary', 'youga2', 14500, 'vans'),
('Asea', 'asea', 5500, 'sedans'),
('Cognoscenti', 'cognoscenti', 55000, 'sedans'),
('Emperor', 'emperor', 8500, 'sedans'),
('Fugitive', 'fugitive', 12000, 'sedans'),
('Glendale', 'glendale', 6500, 'sedans'),
('Intruder', 'intruder', 7500, 'sedans'),
('Premier', 'premier', 8000, 'sedans'),
('Primo Custom', 'primo2', 14000, 'sedans'),
('Regina', 'regina', 5000, 'sedans'),
('Schafter', 'schafter2', 25000, 'sedans'),
('Stretch', 'stretch', 90000, 'sedans'),
('Super Diamond', 'superd', 130000, 'sedans'),
('Tailgater', 'tailgater', 30000, 'sedans'),
('Warrener', 'warrener', 4000, 'sedans'),
('Washington', 'washington', 9000, 'sedans'),
('Baller', 'baller2', 40000, 'suvs'),
('Baller Sport', 'baller3', 60000, 'suvs'),
('Cavalcade', 'cavalcade2', 55000, 'suvs'),
('Contender', 'contender', 70000, 'suvs'),
('Dubsta', 'dubsta', 45000, 'suvs'),
('Dubsta Luxuary', 'dubsta2', 60000, 'suvs'),
('Fhantom', 'fq2', 17000, 'suvs'),
('Grabger', 'granger', 50000, 'suvs'),
('Gresley', 'gresley', 47500, 'suvs'),
('Huntley S', 'huntley', 40000, 'suvs'),
('Landstalker', 'landstalker', 35000, 'suvs'),
('Mesa', 'mesa', 16000, 'suvs'),
('Mesa Trail', 'mesa3', 40000, 'suvs'),
('Patriot', 'patriot', 55000, 'suvs'),
('Radius', 'radi', 29000, 'suvs'),
('Rocoto', 'rocoto', 45000, 'suvs'),
('Seminole', 'seminole', 25000, 'suvs'),
('XLS', 'xls', 32000, 'suvs'),
('Btype', 'btype', 62000, 'sportsclassics'),
('Btype Luxe', 'btype3', 85000, 'sportsclassics'),
('Btype Hotroad', 'btype2', 155000, 'sportsclassics'),
('Casco', 'casco', 30000, 'sportsclassics'),
('Coquette Classic', 'coquette2', 40000, 'sportsclassics'),
('Manana', 'manana', 12800, 'sportsclassics'),
('Monroe', 'monroe', 55000, 'sportsclassics'),
('Pigalle', 'pigalle', 20000, 'sportsclassics'),
('Stinger', 'stinger', 80000, 'sportsclassics'),
('Stinger GT', 'stingergt', 75000, 'sportsclassics'),
('Stirling GT', 'feltzer3', 65000, 'sportsclassics'),
('Z-Type', 'ztype', 220000, 'sportsclassics'),
('Bifta', 'bifta', 12000, 'offroad'),
('Bf Injection', 'bfinjection', 16000, 'offroad'),
('Blazer', 'blazer', 6500, 'offroad'),
('Blazer Sport', 'blazer4', 8500, 'offroad'),
('Brawler', 'brawler', 45000, 'offroad'),
('Bubsta 6x6', 'dubsta3', 120000, 'offroad'),
('Dune Buggy', 'dune', 8000, 'offroad'),
('Guardian', 'guardian', 45000, 'offroad'),
('Rebel', 'rebel2', 35000, 'offroad'),
('Sandking', 'sandking', 55000, 'offroad'),
('The Liberator', 'monster', 210000, 'offroad'),
('Trophy Truck', 'trophytruck', 60000, 'offroad'),
('Trophy Truck Limited', 'trophytruck2', 80000, 'offroad'),
('Cognoscenti Cabrio', 'cogcabrio', 55000, 'coupes'),
('Exemplar', 'exemplar', 32000, 'coupes'),
('F620', 'f620', 40000, 'coupes'),
('Felon', 'felon', 42000, 'coupes'),
('Felon GT', 'felon2', 55000, 'coupes'),
('Jackal', 'jackal', 38000, 'coupes'),
('Oracle XS', 'oracle2', 35000, 'coupes'),
('Sentinel', 'sentinel', 32000, 'coupes'),
('Sentinel XS', 'sentinel2', 40000, 'coupes'),
('Windsor', 'windsor', 95000, 'coupes'),
('Windsor Drop', 'windsor2', 125000, 'coupes'),
('Zion', 'zion', 36000, 'coupes'),
('Zion Cabrio', 'zion2', 45000, 'coupes'),
('9F', 'ninef', 65000, 'sports'),
('9F Cabrio', 'ninef2', 80000, 'sports'),
('Alpha', 'alpha', 60000, 'sports'),
('Banshee', 'banshee', 70000, 'sports'),
('Bestia GTS', 'bestiagts', 55000, 'sports'),
('Buffalo', 'buffalo', 12000, 'sports'),
('Buffalo S', 'buffalo2', 20000, 'sports'),
('Carbonizzare', 'carbonizzare', 75000, 'sports'),
('Comet', 'comet2', 65000, 'sports'),
('Coquette', 'coquette', 65000, 'sports'),
('Drift Tampa', 'tampa2', 80000, 'sports'),
('Elegy', 'elegy2', 38500, 'sports'),
('Feltzer', 'feltzer2', 55000, 'sports'),
('Furore GT', 'furoregt', 45000, 'sports'),
('Fusilade', 'fusilade', 40000, 'sports'),
('Jester', 'jester', 65000, 'sports'),
('Jester(Racecar)', 'jester2', 135000, 'sports'),
('Khamelion', 'khamelion', 38000, 'sports'),
('Kuruma', 'kuruma', 30000, 'sports'),
('Lynx', 'lynx', 40000, 'sports'),
('Mamba', 'mamba', 70000, 'sports'),
('Massacro', 'massacro', 65000, 'sports'),
('Massacro(Racecar)', 'massacro2', 130000, 'sports'),
('Omnis', 'omnis', 35000, 'sports'),
('Penumbra', 'penumbra', 28000, 'sports'),
('Rapid GT', 'rapidgt', 35000, 'sports'),
('Rapid GT Convertible', 'rapidgt2', 45000, 'sports'),
('Schafter V12', 'schafter3', 50000, 'sports'),
('Seven 70', 'seven70', 39500, 'sports'),
('Sultan', 'sultan', 15000, 'sports'),
('Surano', 'surano', 50000, 'sports'),
('Tropos', 'tropos', 40000, 'sports'),
('Verlierer', 'verlierer2', 70000, 'sports'),
('Adder', 'adder', 900000, 'super'),
('Banshee 900R', 'banshee2', 255000, 'super'),
('Bullet', 'bullet', 90000, 'super'),
('Cheetah', 'cheetah', 375000, 'super'),
('Entity XF', 'entityxf', 425000, 'super'),
('ETR1', 'sheava', 220000, 'super'),
('FMJ', 'fmj', 185000, 'super'),
('Infernus', 'infernus', 180000, 'super'),
('Osiris', 'osiris', 160000, 'super'),
('Pfister', 'pfister811', 85000, 'super'),
('RE-7B', 'le7b', 325000, 'super'),
('Reaper', 'reaper', 150000, 'super'),
('Sultan RS', 'sultanrs', 65000, 'super'),
('T20', 't20', 300000, 'super'),
('Turismo R', 'turismor', 350000, 'super'),
('Tyrus', 'tyrus', 600000, 'super'),
('Vacca', 'vacca', 120000, 'super'),
('Voltic', 'voltic', 90000, 'super'),
('X80 Proto', 'prototipo', 2500000, 'super'),
('Zentorno', 'zentorno', 1500000, 'super'),
('Akuma', 'AKUMA', 7500, 'motorcycles'),
('Avarus', 'avarus', 18000, 'motorcycles'),
('Bagger', 'bagger', 13500, 'motorcycles'),
('Bati 801', 'bati', 12000, 'motorcycles'),
('Bati 801RR', 'bati2', 19000, 'motorcycles'),
('BF400', 'bf400', 6500, 'motorcycles'),
('BMX (velo)', 'bmx', 160, 'motorcycles'),
('Carbon RS', 'carbonrs', 18000, 'motorcycles'),
('Chimera', 'chimera', 38000, 'motorcycles'),
('Cliffhanger', 'cliffhanger', 9500, 'motorcycles'),
('Cruiser (velo)', 'cruiser', 510, 'motorcycles'),
('Daemon', 'daemon', 11500, 'motorcycles'),
('Daemon High', 'daemon2', 13500, 'motorcycles'),
('Defiler', 'defiler', 9800, 'motorcycles'),
('Double T', 'double', 28000, 'motorcycles'),
('Enduro', 'enduro', 5500, 'motorcycles'),
('Esskey', 'esskey', 4200, 'motorcycles'),
('Faggio', 'faggio', 1900, 'motorcycles'),
('Vespa', 'faggio2', 2800, 'motorcycles'),
('Fixter (velo)', 'fixter', 225, 'motorcycles'),
('Gargoyle', 'gargoyle', 16500, 'motorcycles'),
('Hakuchou', 'hakuchou', 31000, 'motorcycles'),
('Hakuchou Sport', 'hakuchou2', 55000, 'motorcycles'),
('Hexer', 'hexer', 12000, 'motorcycles'),
('Innovation', 'innovation', 23500, 'motorcycles'),
('Manchez', 'manchez', 5300, 'motorcycles'),
('Nemesis', 'nemesis', 5800, 'motorcycles'),
('Nightblade', 'nightblade', 35000, 'motorcycles'),
('PCJ-600', 'pcj', 6200, 'motorcycles'),
('Ruffian', 'ruffian', 6800, 'motorcycles'),
('Sanchez', 'sanchez', 5300, 'motorcycles'),
('Sanchez Sport', 'sanchez2', 5300, 'motorcycles'),
('Sanctus', 'sanctus', 25000, 'motorcycles'),
('Scorcher (velo)', 'scorcher', 280, 'motorcycles'),
('Sovereign', 'sovereign', 22000, 'motorcycles'),
('Shotaro Concept', 'shotaro', 320000, 'motorcycles'),
('Thrust', 'thrust', 24000, 'motorcycles'),
('Tri bike (velo)', 'tribike3', 520, 'motorcycles'),
('Vader', 'vader', 7200, 'motorcycles'),
('Vortex', 'vortex', 9800, 'motorcycles'),
('Woflsbane', 'wolfsbane', 9000, 'motorcycles'),
('Zombie', 'zombiea', 9500, 'motorcycles'),
('Zombie Luxuary', 'zombieb', 12000, 'motorcycles'),
('blazer5', 'blazer5', 1755600, 'offroad'),
('Ruiner 2', 'ruiner2', 5745600, 'muscle'),
('Voltic 2', 'voltic2', 3830400, 'super'),
('Ardent', 'ardent', 1150000, 'sportsclassics'),
('Oppressor', 'oppressor', 3524500, 'super'),
('Visione', 'visione', 2250000, 'super'),
('Retinue', 'retinue', 615000, 'sportsclassics'),
('Cyclone', 'cyclone', 1890000, 'super'),
('Rapid GT3', 'rapidgt3', 885000, 'sportsclassics'),
('raiden', 'raiden', 1375000, 'sports'),
('Yosemite', 'yosemite', 485000, 'muscle'),
('Deluxo', 'deluxo', 4721500, 'sportsclassics'),
('Pariah', 'pariah', 1420000, 'sports'),
('Stromberg', 'stromberg', 3185350, 'sports'),
('SC 1', 'sc1', 1603000, 'super'),
('riata', 'riata', 380000, 'offroad'),
('Hermes', 'hermes', 535000, 'muscle'),
('Savestra', 'savestra', 990000, 'sportsclassics'),
('Streiter', 'streiter', 500000, 'sports'),
('Kamacho', 'kamacho', 345000, 'offroad'),
('GT 500', 'gt500', 785000, 'sportsclassics'),
('Z190', 'z190', 900000, 'sportsclassics'),
('Viseris', 'viseris', 875000, 'sportsclassics'),
('Autarch', 'autarch', 1955000, 'super'),
('Comet 5', 'comet5', 1145000, 'sports'),
('Neon', 'neon', 1500000, 'sports'),
('Revolter', 'revolter', 1610000, 'sports'),
('Sentinel3', 'sentinel3', 650000, 'sports'),
('Hustler', 'hustler', 625000, 'muscle');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_categories`
--

DROP TABLE IF EXISTS `vehicle_categories`;
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('compacts', 'Compacts'),
('coupes', 'Coupés'),
('sedans', 'Sedans'),
('sports', 'Sports'),
('sportsclassics', 'Sports Classics'),
('super', 'Super'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('suvs', 'SUVs'),
('vans', 'Vans'),
('motorcycles', 'Motos');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_sold`
--

DROP TABLE IF EXISTS `vehicle_sold`;
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
