-- Adminer 4.8.4 MySQL 8.0.35 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `archive`;
CREATE TABLE `archive` (
  `archiveID` int NOT NULL AUTO_INCREMENT,
  `eventID` int NOT NULL,
  `report` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`archiveID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `choirevents`;
CREATE TABLE `choirevents` (
  `eventID` int NOT NULL AUTO_INCREMENT,
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `eventDate` date NOT NULL,
  `startTime` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `endTime` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `meetingPoint` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `invitation` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`eventID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `clips`;
CREATE TABLE `clips` (
  `clipID` int unsigned NOT NULL AUTO_INCREMENT,
  `clipURL` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `eventID` int DEFAULT NULL,
  `caption` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`clipID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `imageID` int NOT NULL AUTO_INCREMENT,
  `filename` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `caption` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `eventID` int NOT NULL DEFAULT '0',
  `height` int NOT NULL DEFAULT '1',
  `width` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`imageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `imagetypes`;
CREATE TABLE `imagetypes` (
  `imagetypesID` int unsigned NOT NULL AUTO_INCREMENT,
  `imagetype` varchar(45) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`imagetypesID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `messageID` int NOT NULL AUTO_INCREMENT,
  `messageDate` timestamp NULL DEFAULT NULL,
  `messageFrom` varchar(60) DEFAULT NULL,
  `messageContent` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '''''',
  `eventName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '''''',
  `eventDate` timestamp NOT NULL,
  `eventTime` varchar(25) NOT NULL DEFAULT '''''',
  `contactEmail` varchar(100) DEFAULT NULL,
  `contactPhone` varchar(20) NOT NULL DEFAULT '''''',
  `eventLocation` varchar(100) NOT NULL DEFAULT '''''',
  PRIMARY KEY (`messageID`),
  UNIQUE KEY `messageID_UNIQUE` (`messageID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `music`;
CREATE TABLE `music` (
  `musicTrackID` int NOT NULL AUTO_INCREMENT,
  `trackName` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `artist` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lyrics` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `soprano` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alto` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tenor` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `allParts` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `piano` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`musicTrackID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `playlists`;
CREATE TABLE `playlists` (
  `playlistID` int NOT NULL AUTO_INCREMENT,
  `eventID` int NOT NULL,
  `musicID` int NOT NULL,
  `playorder` int NOT NULL,
  PRIMARY KEY (`playlistID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


DROP TABLE IF EXISTS `siteinfo`;
CREATE TABLE `siteinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `HomeTitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `HomeText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `AboutTitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `AboutText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `ArchiveTitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `ArchiveText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `NoticesTitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `NoticesText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `BookingTitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `BookingText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `MembersTitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `MembersText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `AppealTitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `AppealText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `SettingsTitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `SettingsText` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `siteinfo` (`id`, `HomeTitle`, `HomeText`, `AboutTitle`, `AboutText`, `ArchiveTitle`, `ArchiveText`, `NoticesTitle`, `NoticesText`, `BookingTitle`, `BookingText`, `MembersTitle`, `MembersText`, `AppealTitle`, `AppealText`, `SettingsTitle`, `SettingsText`) VALUES
(1,	'Welcome to the RWT Choir',	'Welcome to the RWT Choir website. We are a community choir based in the heart of the city of London. We are a friendly group of people who love to sing and perform. We have a wide range of music in our repertoire, from classical to pop, and we perform at a variety of events throughout the year. We are always looking for new members, so if you love to sing, why not come along and join us? We meet every Tuesday evening at 7.30pm at the RWT Centre. We look forward to seeing you soon!',	'About Us',	'The RWT Choir is a community choir based in the heart of the city of London. We are a friendly group of people who love to sing and perform. We have a wide range of music in our repertoire, from classical to pop, and we perform at a variety of events throughout the year. We are always looking for new members, so if you love to sing, why not come along and join us? We meet every Tuesday evening at 7.30pm at the RWT Centre. We look forward to seeing you soon!',	'Archive',	'Welcome to the RWT Choir website. We are a community choir based in the heart of the city of Wolverhampton. We are a friendly group of people who love to sing and perform. We have a wide range of music in our repertoire, from classical to pop, and we perform at a variety of events throughout the year. We are always looking for new members, so if you love to sing, why not come along and join us? We meet every Tuesday evening at 7.30pm at the RWT Centre. We look forward to seeing you soon!',	'Notices',	'Welcome to the RWT Choir website. We are a community choir based in the heart of the city of London. We are a friendly group of people who love to sing and perform. We have a wide range of music in our repertoire, from classical to pop, and we perform at a variety of events throughout the year. We are always looking for new members, so if you love to sing, why not come along and join us? We meet every Tuesday evening at 7.30pm at the RWT Centre. We look forward to seeing you soon!',	'Booking',	'Welcome to the RWT Choir website. We are a community choir based in the heart of the city of London. We are a friendly group of people who love to sing and perform. We have a wide range of music in our repertoire, from classical to pop, and we perform at a variety of events throughout the year. We are always looking for new members, so if you love to sing, why not come along and join us? We meet every Tuesday evening at 7.30pm at the RWT Centre. We look forward to seeing you soon!',	'Members',	'Welcome to the RWT Choir website. We are a community choir based in the heart of the city of London. We are a friendly group of people who love to sing and perform. We have a wide range of music in our repertoire, from classical to pop, and we perform at a variety of events throughout the year. We are always looking for new members, so if you love to sing, why not come along and join us? We meet every Tuesday evening at 7.30pm at the RWT Centre. We look forward to seeing you soon!',	'Appeal',	'Welcome to the RWT Choir website. We are a community choir based in the heart of the city of London. We are a friendly group of people who love to sing and perform. We have a wide range of music in our repertoire, from classical to pop, and we perform at a variety of events throughout the year. We are always looking for new members, so if you love to sing, why not come along and join us? We meet every Tuesday evening at 7.30pm at the RWT Centre. We look forward to seeing you soon!',	'Settings',	'Welcome to the RWT Choir website. We are a community choir based in the heart of the city of London. We are a friendly group of people who love to sing and perform. We have a wide range of music in our repertoire, from classical to pop, and we perform at a variety of events throughout the year. We are always looking for new members, so if you love to sing, why not come along and join us? We meet every Tuesday evening at 7.30pm at the RWT Centre. We look forward to seeing you soon!');

DROP TABLE IF EXISTS `themedetails`;
CREATE TABLE `themedetails` (
  `themeDetails` int NOT NULL,
  `boxColour` varchar(7) DEFAULT NULL,
  `textColour` varchar(7) DEFAULT NULL,
  `textFont` varchar(45) DEFAULT NULL,
  `backgroundImage` varchar(100) DEFAULT NULL,
  `textboxColour` varchar(7) DEFAULT NULL,
  `logoImage` varchar(100) DEFAULT NULL,
  `bannerColour` varchar(7) DEFAULT NULL,
  `menuColour` varchar(7) DEFAULT NULL,
  `buttonColour` varchar(7) DEFAULT NULL,
  `buttonHover` varchar(7) DEFAULT NULL,
  `buttonTextColour` varchar(7) DEFAULT NULL,
  `menuTextColour` varchar(7) DEFAULT NULL,
  `textSize` smallint DEFAULT '0',
  PRIMARY KEY (`themeDetails`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `themedetails` (`themeDetails`, `boxColour`, `textColour`, `textFont`, `backgroundImage`, `textboxColour`, `logoImage`, `bannerColour`, `menuColour`, `buttonColour`, `buttonHover`, `buttonTextColour`, `menuTextColour`, `textSize`) VALUES
(0,	'#3c3f99',	'#f43edc',	'Impact',	NULL,	'#d7d49b',	NULL,	'#a575a1',	'#effb46',	'#0bd47b',	'#50396f',	'#336d68',	'#f3dc83',	12);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userID` int NOT NULL AUTO_INCREMENT,
  `user` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `role` varchar(25) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `users` (`userID`, `user`, `password`, `role`) VALUES
(1,	'admin',	'admin@123',	'administrator');

-- 2024-11-20 22:34:21