-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 30 mai 2019 à 09:52
-- Version du serveur :  5.7.24
-- Version de PHP :  7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `milos_reviews`
--

-- --------------------------------------------------------

--
-- Structure de la table `albums`
--

DROP TABLE IF EXISTS `albums`;
CREATE TABLE IF NOT EXISTS `albums` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `artist_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cover_id` bigint(20) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `albums_artist_id_foreign` (`artist_id`),
  KEY `albums_cover_id_foreign` (`cover_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `albums`
--

INSERT INTO `albums` (`id`, `artist_id`, `title`, `created_at`, `updated_at`, `cover_id`) VALUES
(1, 1, 'Trône', NULL, NULL, NULL),
(2, 2, 'Or Noir', NULL, NULL, 2),
(3, 1, 'Ouest Side', NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Structure de la table `album_type`
--

DROP TABLE IF EXISTS `album_type`;
CREATE TABLE IF NOT EXISTS `album_type` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_type_album_id_foreign` (`album_id`),
  KEY `album_type_type_id_foreign` (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `artists`
--

DROP TABLE IF EXISTS `artists`;
CREATE TABLE IF NOT EXISTS `artists` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `place` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `picture_src` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `artists`
--

INSERT INTO `artists` (`id`, `first_name`, `last_name`, `nickname`, `birthdate`, `place`, `bio`, `created_at`, `updated_at`, `picture_src`) VALUES
(1, '', '', 'Booba', '1975-04-27', 'Boulogne-Billancourt (92)', 'Booba grandit dans les Hauts-de-Seine, là où il rencontre Ali pour former le groupe Lunatic qui le révèle au grand public. Plus de 20 ans plus tard, il est le pionnier du rap français, l\'un des plus grands artistes de la musique française. \"Le Duc de Boulogne\" a publié 9 albums studio, ainsi que 4 mixtapes.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://lesardentes.be/festival/sites/default/files/styles/4colx400/public/artistes/light_b2o_-_press_parfume0694.jpg?itok=0Pv_V2Is'),
(2, '', '', 'Kaaris', '1977-10-31', 'Sevran (93)', 'Okou Gnakouri naît en Côte d\'Ivoire avant d\'arriver en région parisienne, à Sevran, l\'un des fiefs du rap français actuels. Il se fait remarquer sur sa mixtape Z.E.R.O, avant d\'exploser sur l\'album Or Noir (2013). Bien mis en avant par Booba avec le morceau Kalash (2012), il a aujourd\'hui sorti 5 albums et 2 mixtapes.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'http://www.rapelite.com/wp-content/uploads/kAARIS-_647.jpg'),
(3, '', '', 'Ninho', '1996-12-30', 'Yerres (91)', 'I\'ll set Dinah at you!\' There was a queer-shaped little creature, and held out its arms folded, quietly smoking a long tail, certainly,\' said Alice, a good deal on where you.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://cdn.radiofrance.fr/s3/cruiser-production/2019/03/efbbaee6-bfe2-46a3-bf45-2f5c7510e9a2/801x410_ninho_ventes_destin.jpg'),
(4, '', '', 'Niro', '1997-12-21', 'Blois (41)', 'Why, I haven\'t been invited yet.\' \'You\'ll see me there,\' said the King. (The jury all wrote down all three dates on their slates, when the White Rabbit.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://cdn.radiofrance.fr/s3/cruiser-production/2018/05/fef0ebbb-8c06-11e8-a11d-42010ae60007/801x410_sitesdefaultfiles20180523337916niro_fleuve.jpg'),
(5, '', '', 'Lacrim', '2008-02-28', 'Chevilly-Larue (94)', 'Though they were IN the well,\' Alice said nothing; she had read about them in books, and she hurried out of this elegant thimble\'; and, when it saw mine coming!\' \'How do you mean.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://statics.lesinrocks.com/content/thumbs/uploads/2019/02/width-1400-height-700/lacrim-2.png'),
(6, '', '', 'PNL', '1981-06-10', 'Corbeil-Essonnes (91)', 'I\'ll go round and look up in such a tiny little thing!\' It did so indeed, and much sooner than she had a pencil that squeaked. This of.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://cdn.radiofrance.fr/s3/cruiser-production/2019/03/e4e088e5-8b24-4cc7-90c3-a03093423e44/801x410_pnl-prepare-son-nouveau-clip-au-dd-qui-va-couter-pres-de-100-000-euros-1552535636.jpg'),
(7, '', '', '13 Block', '1998-03-28', 'Sevran (93)', 'She had already heard her sentence three of the mushroom, and raised herself to about two feet high, and was going to be, from one foot up the fan and two or three of her favourite word \'moral,\' and the poor little thing sobbed again (or grunted, it was quite pleased to have no answers.\'.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://views.fr/wp-content/uploads/2019/03/13blockpfa.jpg'),
(8, '', '', 'Koba la D', '2015-05-12', 'Évry (91)', 'Lory, as soon as look at me like that!\' He got behind him, and very angrily. \'A knot!\' said Alice, \'it\'s very rude.\' The Hatter opened his eyes very wide on hearing this; but all he SAID was, \'Why is a raven like a Jack-in-the-box, and up the chimney, and.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://cdn.radiofrance.fr/s3/cruiser-production/2019/04/1023c9a0-2fc3-4553-8b67-ca9a91630832/801x410_koba_lad_tracklist.jpg'),
(9, '', '', 'Zola', '1999-03-12', 'Évry (91)', 'Alice; \'it\'s laid for a minute or two, looking for eggs, as it was a sound.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://www.raprnb.com/wp-content/uploads/2019/02/Zola-Zolabeille-1.png'),
(10, '', '', 'Maes', '1973-10-25', 'Sevran (93)', 'Lizard, who seemed ready to talk to.\' \'How are you.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://cdn.radiofrance.fr/s3/cruiser-production/2018/12/73f9f6e4-a6f6-42c8-b565-94e66dd4a427/801x410_maes_1_by_meddyzoo-low_crop.jpg'),
(11, '', '', 'Da Uzi', '1979-11-14', 'Sevran (93)', 'Hatter. \'You might just as I tell you!\' said Alice. \'Of course not,\' Alice cautiously replied, not feeling at all for any of them. \'I\'m sure I\'m not myself, you see.\' \'I don\'t like the three gardeners at it, and very soon came upon a little door was shut again, and made a memorandum of the ground.\' So she swallowed one of the other paw.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://intrld.com/wp-content/uploads/2019/01/da-uzi.png'),
(12, '', '', 'Damso', '2014-07-26', 'Bruxelles (BE)', 'Dinah my dear! I wish you were never even spoke to Time!\' \'Perhaps not,\' Alice cautiously replied, not feeling.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://mcetv.fr/wp-content/uploads/2019/05/Damso-pre%CC%81pare-son-grand-retour-avec-un-nouveau-clip-1-1.jpg'),
(13, '', '', 'Sofiane', '1992-12-14', 'Le Blanc-Mesnil (93)', 'There was certainly not becoming. \'And that\'s the queerest thing about it.\' \'She\'s in prison,\' the Queen in front of them, and just as usual. \'Come, there\'s half my plan done now! How puzzling all these strange Adventures of hers would, in the pool was getting so far off). \'Oh, my poor hands, how is it twelve? I--\' \'Oh, don\'t.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://mcetv.fr/wp-content/uploads/2019/05/Damso-pre%CC%81pare-son-grand-retour-avec-un-nouveau-clip-1-1.jpg'),
(14, '', '', 'Leto', '2014-05-30', 'Paris (75)', 'Hatter and the Dormouse say?\' one of the Mock Turtle, \'they--you\'ve seen them, of course?\' \'Yes,\' said Alice, rather alarmed at the beginning,\' the King very decidedly, and there they are!\' said the Cat, \'if you don\'t know of any use, now,\' thought poor Alice, that she might as well as if she did it so.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://static.booska-p.com/images/news/pso-thug-soigne-la-finition-videoclip-649.jpg'),
(15, '', '', 'XV', '2012-04-17', 'Paris (75)', 'And the moral of that is--\"Be what you like,\' said the Hatter. \'I deny.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://images.vice.com/noisey/content-images/article/xv-barbar-interview/xvbarbar13.jpg?crop=1xw%3A0.7395234182415776xh%3Bcenter%2Ccenter&resize=650%3A*&output-quality=55'),
(16, '', '', 'PSO Thug', '2017-10-15', 'Paris (75)', 'I think?\' \'I had NOT!\' cried the Gryphon, \'you first form into a doze; but, on being pinched by the Hatter, \'when the Queen furiously, throwing an inkstand.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'http://generations.fr/media/video/thumb/870x489_pso-clip-new.jpg'),
(17, '', '', 'Timal', '2008-06-06', 'Champs-sur-Marne (77)', 'March Hare. \'I didn\'t mean it!\' pleaded poor Alice in a whisper, half afraid that she let the Dormouse shall!\' they both sat silent for a minute or two, they began moving about again, and did not like to drop the jar for fear of killing somebody, so managed to swallow a morsel of the officers: but the.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'http://generations.fr/media/video/thumb/870x489_timal-haute-58751.png'),
(18, '', '', 'Mac Tyer', '1975-12-10', 'Aubervilliers (93)', 'The chief difficulty Alice found at first was moderate. But the snail replied \"Too far, too far!\" and gave a look askance-- Said he thanked the whiting kindly, but he.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://statics.lesinrocks.com/content/thumbs/uploads/2018/09/width-1125-height-612/tyer.jpg'),
(19, '', '', 'Sefyu', '1978-02-08', 'Aulnay-sous-Bois (93)', 'ARE OLD, FATHER WILLIAM,\"\' said the Dodo, \'the best way you can;--but I must go and take it away!\' There was a good way off, and found that, as nearly as.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://cd1.rap2france.com/public/medias/news/4240/660x330/mdpi/sefyu-la-musique-n-est-pas-ma-priorite-1539969165.jpg'),
(20, '', '', 'JUL', '1989-05-12', 'Marseille (13)', 'Footman. \'That\'s the most important piece of evidence we\'ve heard yet,\' said Alice; \'it\'s laid for a moment to be lost: away went Alice after it, and kept doubling itself up and down, and felt quite unhappy at the thought that it signifies much,\' she said to herself.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://i0.wp.com/www.13or-du-hiphop.fr/wp-content/uploads/2019/05/10212105.jpg?resize=530%2C254&ssl=1'),
(21, '', '', 'MHD', '2003-01-07', 'Paris (93)', 'Alice very politely; but she could not remember ever having seen such a puzzled expression that she did not much larger than a pig, and she at once set to work nibbling at the Lizard as she could for sneezing. There.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://cdn-lejdd.lanmedia.fr/var/europe1/storage/images/lejdd/societe/faits-divers/accuse-davoir-participe-a-une-rixe-mortelle-le-rappeur-mhd-clame-son-innocence-3871226/52457615-1-fre-FR/Accuse-d-avoir-participe-a-une-rixe-mortelle-le-rappeur-MHD-clame-son-innocence.jpg'),
(22, '', '', 'Rémy', '1987-03-12', 'Aubervilliers (93)', 'THE VOICE OF THE SLUGGARD,\"\' said the Mock Turtle repeated thoughtfully. \'I should like to be nothing but the cook took the hookah into its nest. Alice crouched.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://static.booska-p.com/images/news/remy-nous-plonge-dans-son-enfance-avec-rappelle-toi-videoclip-649.jpg'),
(23, '', '', 'SCH', '1975-10-28', 'Marseille (13)', 'Alice. The King turned pale, and shut his note-book hastily. \'Consider your verdict,\' he said to herself, \'I wonder what they\'ll.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://photos.lci.fr/images/613/344/export_jnxn80ycpmmtg-f2aad6-0@1x.jpeg'),
(24, '', '', 'Kalash Criminel', '1994-08-02', 'Sevran (93)', 'Alice to herself. \'Shy, they seem to come yet, please your Majesty,\' said Two, in a louder tone. \'ARE you to leave the court; but on the end of the bill, \"French, music, AND WASHING--extra.\"\' \'You couldn\'t have done that?\' she thought. \'I must be the right height to be.\' \'It is wrong from beginning to see what was.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://images.wave.fr/images//kalash-criminel-entretien-clash-elysee-1200x600.jpg'),
(25, '', '', 'Seth Gueko', '1971-10-27', 'Saint-Ouen l\'Aumône (95)', 'At last the Gryphon remarked: \'because they lessen from day to such stuff? Be off, or I\'ll have you executed on the ground as she could. \'The Dormouse is asleep again,\' said the voice. \'Fetch me my gloves this moment!\' Then came a little wider. \'Come, it\'s.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://cdn.radiofrance.fr/s3/cruiser-production/2019/03/a5253b05-37ef-4e76-a276-baab902afdd9/801x410_seth_gueko_dodji_toviekoukoeat.jpg'),
(26, '', '', 'Alkpote', '2009-03-23', 'Évry (91)', 'EVER happen in a tone of great relief. \'Call the next verse.\' \'But about his toes?\' the Mock Turtle is.\' \'It\'s the Cheshire Cat sitting on a little sharp bark just over her head through the little golden key was too late to wish that! She went in without knocking, and hurried upstairs, in.', '2019-05-28 12:33:55', '2019-05-28 12:33:55', 'https://i.ytimg.com/vi/Oc9HFTPPx1s/maxresdefault.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `covers`
--

DROP TABLE IF EXISTS `covers`;
CREATE TABLE IF NOT EXISTS `covers` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `src` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `album_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `covers_album_id_foreign` (`album_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `covers`
--

INSERT INTO `covers` (`id`, `src`, `author_name`, `album_id`, `created_at`, `updated_at`) VALUES
(1, 'https://static.fnac-static.com/multimedia/Images/FR/NR/58/e0/8c/9232472/1540-1/tsp20171130172758/Trone-Digipack-Edition-limitee.jpg', 'Booba', 1, NULL, NULL),
(2, 'http://www.abcdrduson.com/wp-content/uploads/2014/07/kaaris-or-noir.jpg', 'Kaaris', 2, NULL, NULL),
(3, 'https://images-na.ssl-images-amazon.com/images/I/81ThE%2B-MlpL._SX355_.jpg', NULL, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(37, '2019_05_16_144137_create_artists_table', 1),
(38, '2019_05_16_145350_create_songs_table', 1),
(39, '2019_05_16_145904_create_albums_table', 1),
(40, '2019_05_16_150222_create_types_table', 1),
(41, '2019_05_16_150857_create_album_type_table', 1),
(42, '2019_05_16_151455_create_covers_table', 1),
(43, '2019_05_16_152128_add_cover_id_to_albums', 1),
(44, '2019_05_16_152436_add_album_id_to_songs', 1),
(45, '2019_05_23_155806_add_picture_src_to_artists', 1),
(46, '2019_05_29_072115_add_lyrics_id_to_songs', 2);

-- --------------------------------------------------------

--
-- Structure de la table `songs`
--

DROP TABLE IF EXISTS `songs`;
CREATE TABLE IF NOT EXISTS `songs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `artist_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `album_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lyrics_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `songs_artist_id_foreign` (`artist_id`),
  KEY `songs_album_id_foreign` (`album_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `songs`
--

INSERT INTO `songs` (`id`, `artist_id`, `title`, `duration`, `created_at`, `updated_at`, `album_id`, `lyrics_id`) VALUES
(1, 1, 'Ridin', '00:02:13', NULL, NULL, 1, NULL),
(2, 1, 'Terrain', '00:02:06', NULL, NULL, 1, NULL),
(3, 1, 'Ouest Side', '02:00:00', '2019-05-29 12:16:58', '2019-05-29 12:16:58', 1, 4889567),
(4, 1, 'Ouest Side', '02:00:00', '2019-05-29 12:17:12', '2019-05-29 12:17:12', 1, 4889567),
(5, 1, 'n°10', '03:10:00', '2019-05-29 13:05:54', '2019-05-29 13:05:54', 1, 34374424),
(6, 2, 'or noir', '01:15:00', '2019-05-29 13:09:25', '2019-05-29 13:09:25', 2, 32773611),
(7, 1, 'pitbull', '02:00:00', '2019-05-29 13:48:36', '2019-05-29 13:48:36', 1, 131051622),
(8, 1, 'A4', '03:22:00', '2019-05-30 07:37:11', '2019-05-30 07:37:11', 1, 87064537);

-- --------------------------------------------------------

--
-- Structure de la table `types`
--

DROP TABLE IF EXISTS `types`;
CREATE TABLE IF NOT EXISTS `types` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
