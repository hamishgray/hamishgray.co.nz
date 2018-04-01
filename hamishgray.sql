-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 02, 2017 at 05:33 PM
-- Server version: 5.6.33
-- PHP Version: 7.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hamishgray`
--

-- --------------------------------------------------------

--
-- Table structure for table `Blog`
--

CREATE TABLE `Blog` (
  `ID` int(11) NOT NULL,
  `PostsPerPage` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Blog`
--

INSERT INTO `Blog` (`ID`, `PostsPerPage`, `ParentID`) VALUES
(23, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `BlogCategory`
--

CREATE TABLE `BlogCategory` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('BlogCategory') DEFAULT 'BlogCategory',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `BlogID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BlogEntry`
--

CREATE TABLE `BlogEntry` (
  `ID` int(11) NOT NULL,
  `Date` datetime DEFAULT NULL,
  `Author` mediumtext,
  `Tags` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BlogEntry_Live`
--

CREATE TABLE `BlogEntry_Live` (
  `ID` int(11) NOT NULL,
  `Date` datetime DEFAULT NULL,
  `Author` mediumtext,
  `Tags` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BlogEntry_versions`
--

CREATE TABLE `BlogEntry_versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `Date` datetime DEFAULT NULL,
  `Author` mediumtext,
  `Tags` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BlogHolder`
--

CREATE TABLE `BlogHolder` (
  `ID` int(11) NOT NULL,
  `AllowCustomAuthors` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ShowFullEntry` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BlogHolder_Live`
--

CREATE TABLE `BlogHolder_Live` (
  `ID` int(11) NOT NULL,
  `AllowCustomAuthors` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ShowFullEntry` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BlogHolder_versions`
--

CREATE TABLE `BlogHolder_versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `AllowCustomAuthors` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ShowFullEntry` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BlogPost`
--

CREATE TABLE `BlogPost` (
  `ID` int(11) NOT NULL,
  `PublishDate` datetime DEFAULT NULL,
  `AuthorNames` varchar(1024) DEFAULT NULL,
  `Summary` mediumtext,
  `FeaturedImageID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BlogPost_Authors`
--

CREATE TABLE `BlogPost_Authors` (
  `ID` int(11) NOT NULL,
  `BlogPostID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `BlogPost_Authors`
--

INSERT INTO `BlogPost_Authors` (`ID`, `BlogPostID`, `MemberID`) VALUES
(1, 24, 1),
(2, 25, 1),
(3, 26, 1),
(4, 28, 1),
(5, 33, 1);

-- --------------------------------------------------------

--
-- Table structure for table `BlogPost_Categories`
--

CREATE TABLE `BlogPost_Categories` (
  `ID` int(11) NOT NULL,
  `BlogPostID` int(11) NOT NULL DEFAULT '0',
  `BlogCategoryID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BlogPost_Live`
--

CREATE TABLE `BlogPost_Live` (
  `ID` int(11) NOT NULL,
  `PublishDate` datetime DEFAULT NULL,
  `AuthorNames` varchar(1024) DEFAULT NULL,
  `Summary` mediumtext,
  `FeaturedImageID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BlogPost_Tags`
--

CREATE TABLE `BlogPost_Tags` (
  `ID` int(11) NOT NULL,
  `BlogPostID` int(11) NOT NULL DEFAULT '0',
  `BlogTagID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BlogPost_versions`
--

CREATE TABLE `BlogPost_versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `PublishDate` datetime DEFAULT NULL,
  `AuthorNames` varchar(1024) DEFAULT NULL,
  `Summary` mediumtext,
  `FeaturedImageID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `BlogPost_versions`
--

INSERT INTO `BlogPost_versions` (`ID`, `RecordID`, `Version`, `PublishDate`, `AuthorNames`, `Summary`, `FeaturedImageID`) VALUES
(1, 33, 1, NULL, NULL, NULL, 0),
(2, 33, 2, NULL, NULL, NULL, 0),
(3, 33, 3, '2016-02-11 07:57:43', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `BlogTag`
--

CREATE TABLE `BlogTag` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('BlogTag') DEFAULT 'BlogTag',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `BlogID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BlogTree`
--

CREATE TABLE `BlogTree` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `LandingPageFreshness` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BlogTree_Live`
--

CREATE TABLE `BlogTree_Live` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `LandingPageFreshness` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `BlogTree_versions`
--

CREATE TABLE `BlogTree_versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `Name` varchar(255) DEFAULT NULL,
  `LandingPageFreshness` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Blog_Contributors`
--

CREATE TABLE `Blog_Contributors` (
  `ID` int(11) NOT NULL,
  `BlogID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Blog_Editors`
--

CREATE TABLE `Blog_Editors` (
  `ID` int(11) NOT NULL,
  `BlogID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Blog_Live`
--

CREATE TABLE `Blog_Live` (
  `ID` int(11) NOT NULL,
  `PostsPerPage` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Blog_Live`
--

INSERT INTO `Blog_Live` (`ID`, `PostsPerPage`, `ParentID`) VALUES
(23, 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Blog_versions`
--

CREATE TABLE `Blog_versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `PostsPerPage` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Blog_Writers`
--

CREATE TABLE `Blog_Writers` (
  `ID` int(11) NOT NULL,
  `BlogID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ContactRequest`
--

CREATE TABLE `ContactRequest` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('ContactRequest') DEFAULT 'ContactRequest',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Name` mediumtext,
  `Email` mediumtext,
  `Message` mediumtext,
  `Sort` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage`
--

CREATE TABLE `ErrorPage` (
  `ID` int(11) NOT NULL,
  `ErrorCode` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ErrorPage`
--

INSERT INTO `ErrorPage` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_Live`
--

CREATE TABLE `ErrorPage_Live` (
  `ID` int(11) NOT NULL,
  `ErrorCode` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ErrorPage_Live`
--

INSERT INTO `ErrorPage_Live` (`ID`, `ErrorCode`) VALUES
(4, 404),
(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_versions`
--

CREATE TABLE `ErrorPage_versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ErrorCode` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `File`
--

CREATE TABLE `File` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('File','Folder','Image','Image_Cached') DEFAULT 'File',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Filename` mediumtext,
  `Content` mediumtext,
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `File`
--

INSERT INTO `File` (`ID`, `ClassName`, `LastEdited`, `Created`, `Name`, `Title`, `Filename`, `Content`, `ShowInSearch`, `ParentID`, `OwnerID`) VALUES
(1, 'Folder', '2015-10-24 09:53:26', '2015-10-24 09:53:26', 'Uploads', 'Uploads', 'assets/Uploads/', NULL, 1, 0, 0),
(2, 'Image', '2015-10-24 09:53:26', '2015-10-24 09:53:26', 'SilverStripeLogo.png', 'SilverStripeLogo.png', 'assets/Uploads/SilverStripeLogo.png', NULL, 1, 1, 0),
(3, 'Image', '2015-10-24 01:49:50', '2015-10-24 01:49:50', 'logo.png', 'logo', 'assets/Uploads/logo.png', NULL, 1, 1, 1),
(4, 'Image', '2015-10-24 03:40:26', '2015-10-24 03:40:26', 'logo-graphic.png', 'logo graphic', 'assets/Uploads/logo-graphic.png', NULL, 1, 1, 1),
(5, 'Image', '2015-10-24 03:40:31', '2015-10-24 03:40:31', 'logo2.png', 'logo2', 'assets/Uploads/logo2.png', NULL, 1, 1, 1),
(6, 'Image', '2016-01-18 11:25:09', '2016-01-18 11:25:09', 'project-thumb-cadillac.jpg', 'project thumb cadillac', 'assets/Uploads/project-thumb-cadillac.jpg', NULL, 1, 1, 1),
(7, 'Image', '2016-01-18 11:25:19', '2016-01-18 11:25:19', 'project-thumb-godzilla.jpg', 'project thumb godzilla', 'assets/Uploads/project-thumb-godzilla.jpg', NULL, 1, 1, 1),
(8, 'Image', '2016-01-18 11:25:30', '2016-01-18 11:25:30', 'project-thumb-hangouts.jpg', 'project thumb hangouts', 'assets/Uploads/project-thumb-hangouts.jpg', NULL, 1, 1, 1),
(9, 'Image', '2016-01-18 11:48:00', '2016-01-18 11:48:00', 'project-thumb-onegiving.jpg', 'project thumb onegiving', 'assets/Uploads/project-thumb-onegiving.jpg', NULL, 1, 1, 1),
(10, 'Image', '2016-01-18 11:48:12', '2016-01-18 11:48:12', 'project-thumb-sins.jpg', 'project thumb sins', 'assets/Uploads/project-thumb-sins.jpg', NULL, 1, 1, 1),
(11, 'Image', '2016-01-18 12:29:28', '2016-01-18 12:29:28', 'projectthumb-ascot.jpg', 'projectthumb ascot', 'assets/Uploads/projectthumb-ascot.jpg', NULL, 1, 1, 1),
(12, 'Image', '2016-01-18 12:31:37', '2016-01-18 12:31:37', 'projectthumb-returntosender.jpg', 'projectthumb returntosender', 'assets/Uploads/projectthumb-returntosender.jpg', NULL, 1, 1, 1),
(13, 'Image', '2016-01-18 12:37:04', '2016-01-18 12:37:04', 'projectthumb-exhibit.jpg', 'projectthumb exhibit', 'assets/Uploads/projectthumb-exhibit.jpg', NULL, 1, 1, 1),
(14, 'Image', '2016-01-18 12:40:34', '2016-01-18 12:40:34', 'projectthumb-lifesagamble.jpg', 'projectthumb lifesagamble', 'assets/Uploads/projectthumb-lifesagamble.jpg', NULL, 1, 1, 1),
(15, 'Image', '2016-01-18 12:48:31', '2016-01-18 12:48:31', 'projectthumb-matsons.jpg', 'projectthumb matsons', 'assets/Uploads/projectthumb-matsons.jpg', NULL, 1, 1, 1),
(16, 'Image', '2016-01-18 12:52:09', '2016-01-18 12:52:09', 'projectthumb-mywordisyours.jpg', 'projectthumb mywordisyours', 'assets/Uploads/projectthumb-mywordisyours.jpg', NULL, 1, 1, 1),
(17, 'Image', '2016-01-18 12:54:13', '2016-01-18 12:54:13', 'projectthumb-reflections.jpg', 'projectthumb reflections', 'assets/Uploads/projectthumb-reflections.jpg', NULL, 1, 1, 1),
(18, 'Image', '2016-01-18 12:56:09', '2016-01-18 12:56:09', 'projectthumb-plainsfm.jpg', 'projectthumb plainsfm', 'assets/Uploads/projectthumb-plainsfm.jpg', NULL, 1, 1, 1),
(19, 'Image', '2016-01-18 12:59:29', '2016-01-18 12:59:29', 'projectthumb-playtime.jpg', 'projectthumb playtime', 'assets/Uploads/projectthumb-playtime.jpg', NULL, 1, 1, 1),
(20, 'Image', '2016-01-18 13:03:02', '2016-01-18 13:03:02', 'projectthumb-religion.jpg', 'projectthumb religion', 'assets/Uploads/projectthumb-religion.jpg', NULL, 1, 1, 1),
(21, 'Image', '2016-01-18 13:05:19', '2016-01-18 13:05:19', 'projectthumb-roadtorecovery.jpg', 'projectthumb roadtorecovery', 'assets/Uploads/projectthumb-roadtorecovery.jpg', NULL, 1, 1, 1),
(22, 'Image', '2016-01-18 13:08:00', '2016-01-18 13:08:00', 'projectthumb-treshna.jpg', 'projectthumb treshna', 'assets/Uploads/projectthumb-treshna.jpg', NULL, 1, 1, 1),
(23, 'Image', '2016-01-19 07:53:31', '2016-01-19 07:53:31', 'banner-mywordisyours.jpg', 'banner mywordisyours', 'assets/Uploads/banner-mywordisyours.jpg', NULL, 1, 1, 1),
(24, 'Image', '2016-01-19 08:10:52', '2016-01-19 08:10:52', 'image-mywordisyours1.png', 'image mywordisyours1', 'assets/Uploads/image-mywordisyours1.png', NULL, 1, 1, 1),
(25, 'Image', '2016-01-19 08:12:57', '2016-01-19 08:12:57', 'image-mywordisyours2.png', 'image mywordisyours2', 'assets/Uploads/image-mywordisyours2.png', NULL, 1, 1, 1),
(26, 'Image', '2016-01-19 08:15:57', '2016-01-19 08:15:57', 'image-mywordisyours2.jpg', 'image mywordisyours2', 'assets/Uploads/image-mywordisyours2.jpg', NULL, 1, 1, 1),
(27, 'Image', '2016-01-19 08:37:48', '2016-01-19 08:37:48', 'image-exhibit1.png', 'image exhibit1', 'assets/Uploads/image-exhibit1.png', NULL, 1, 1, 1),
(28, 'Image', '2016-01-19 08:44:57', '2016-01-19 08:44:57', 'banner-exhibit.jpg', 'banner exhibit', 'assets/Uploads/banner-exhibit.jpg', NULL, 1, 1, 1),
(29, 'Image', '2016-01-19 08:54:49', '2016-01-19 08:54:49', 'image-lifesagamble1.jpg', 'image lifesagamble1', 'assets/Uploads/image-lifesagamble1.jpg', NULL, 1, 1, 1),
(30, 'Image', '2016-01-19 09:27:45', '2016-01-19 09:27:45', 'banner-roadtorecovery.jpg', 'banner roadtorecovery', 'assets/Uploads/banner-roadtorecovery.jpg', NULL, 1, 1, 1),
(31, 'Image', '2016-01-19 09:29:28', '2016-01-19 09:29:28', 'image-roadtorecovery1.jpg', 'image roadtorecovery1', 'assets/Uploads/image-roadtorecovery1.jpg', NULL, 1, 1, 1),
(32, 'Image', '2016-01-19 09:37:27', '2016-01-19 09:37:27', 'image-roadtorecovery1.png', 'image roadtorecovery1', 'assets/Uploads/image-roadtorecovery1.png', NULL, 1, 1, 1),
(33, 'Image', '2016-01-19 09:47:37', '2016-01-19 09:47:37', 'banner-matsons.jpg', 'banner matsons', 'assets/Uploads/banner-matsons.jpg', NULL, 1, 1, 1),
(34, 'Image', '2016-01-19 09:50:54', '2016-01-19 09:50:54', 'image-matsons.png', 'image matsons', 'assets/Uploads/image-matsons.png', NULL, 1, 1, 1),
(35, 'Image', '2016-01-19 09:53:47', '2016-01-19 09:53:47', 'image-matsons2.png', 'image matsons2', 'assets/Uploads/image-matsons2.png', NULL, 1, 1, 1),
(36, 'Image', '2016-01-19 09:58:48', '2016-01-19 09:58:48', 'image-playtime.jpg', 'image playtime', 'assets/Uploads/image-playtime.jpg', NULL, 1, 1, 1),
(37, 'Image', '2016-01-19 10:02:04', '2016-01-19 10:02:04', 'banner-playtime.jpg', 'banner playtime', 'assets/Uploads/banner-playtime.jpg', NULL, 1, 1, 1),
(38, 'Image', '2016-01-19 10:05:50', '2016-01-19 10:05:50', 'banner-ascot.jpg', 'banner ascot', 'assets/Uploads/banner-ascot.jpg', NULL, 1, 1, 1),
(39, 'Image', '2016-01-19 10:10:40', '2016-01-19 10:10:40', 'image-ascot.jpg', 'image ascot', 'assets/Uploads/image-ascot.jpg', NULL, 1, 1, 1),
(40, 'Image', '2016-01-19 10:12:38', '2016-01-19 10:12:38', 'projectthumb-ascot2.jpg', 'projectthumb ascot2', 'assets/Uploads/projectthumb-ascot2.jpg', NULL, 1, 1, 1),
(41, 'Image', '2016-01-19 10:13:12', '2016-01-19 10:13:12', 'projectthumb-ascot3.jpg', 'projectthumb ascot3', 'assets/Uploads/projectthumb-ascot3.jpg', NULL, 1, 1, 1),
(42, 'Image', '2016-01-19 10:15:15', '2016-01-19 10:15:15', 'banner-reflections.jpg', 'banner reflections', 'assets/Uploads/banner-reflections.jpg', NULL, 1, 1, 1),
(43, 'Image', '2016-01-19 10:20:29', '2016-01-19 10:20:29', 'image-reflections1.png', 'image reflections1', 'assets/Uploads/image-reflections1.png', NULL, 1, 1, 1),
(44, 'Image', '2016-01-19 10:23:46', '2016-01-19 10:23:46', 'banner-plainsfm.jpg', 'banner plainsfm', 'assets/Uploads/banner-plainsfm.jpg', NULL, 1, 1, 1),
(45, 'Image', '2016-01-19 10:30:15', '2016-01-19 10:30:15', 'image-plainsfm.jpg', 'image plainsfm', 'assets/Uploads/image-plainsfm.jpg', NULL, 1, 1, 1),
(46, 'Image', '2016-01-19 10:31:40', '2016-01-19 10:31:40', 'image-plainsfm.png', 'image plainsfm', 'assets/Uploads/image-plainsfm.png', NULL, 1, 1, 1),
(47, 'Image', '2016-01-19 10:42:34', '2016-01-19 10:42:34', 'banner-treshna.jpg', 'banner treshna', 'assets/Uploads/banner-treshna.jpg', NULL, 1, 1, 1),
(48, 'Image', '2016-01-19 10:48:54', '2016-01-19 10:48:54', 'image-treshna1.png', 'image treshna1', 'assets/Uploads/image-treshna1.png', NULL, 1, 1, 1),
(49, 'Image', '2016-01-19 10:53:01', '2016-01-19 10:53:01', 'projectthumb-treshna2.jpg', 'projectthumb treshna2', 'assets/Uploads/projectthumb-treshna2.jpg', NULL, 1, 1, 1),
(50, 'Image', '2016-01-20 11:08:03', '2016-01-20 11:08:03', 'projectthumb-wtp.jpg', 'projectthumb wtp', 'assets/Uploads/projectthumb-wtp.jpg', NULL, 1, 1, 1),
(51, 'Image', '2016-01-20 11:24:01', '2016-01-20 11:24:01', 'image-wtp1.png', 'image wtp1', 'assets/Uploads/image-wtp1.png', NULL, 1, 1, 1),
(52, 'Image', '2016-01-20 11:27:48', '2016-01-20 11:27:48', 'image-wtp2.png', 'image wtp2', 'assets/Uploads/image-wtp2.png', NULL, 1, 1, 1),
(53, 'Image', '2016-01-20 11:30:08', '2016-01-20 11:30:08', 'banner-wtp.jpg', 'banner wtp', 'assets/Uploads/banner-wtp.jpg', NULL, 1, 1, 1),
(54, 'Image', '2016-01-20 11:38:31', '2016-01-20 11:38:31', 'projectthumb-dmi.jpg', 'projectthumb dmi', 'assets/Uploads/projectthumb-dmi.jpg', NULL, 1, 1, 1),
(55, 'Image', '2016-01-20 11:38:42', '2016-01-20 11:38:42', 'banner-dmi.jpg', 'banner dmi', 'assets/Uploads/banner-dmi.jpg', NULL, 1, 1, 1),
(56, 'Image', '2016-01-20 11:44:28', '2016-01-20 11:44:28', 'image-dmi1.png', 'image dmi1', 'assets/Uploads/image-dmi1.png', NULL, 1, 1, 1),
(57, 'Image', '2016-01-20 12:24:04', '2016-01-20 12:24:04', 'projectthumb-treshna3.jpg', 'projectthumb treshna3', 'assets/Uploads/projectthumb-treshna3.jpg', NULL, 1, 1, 1),
(58, 'Image', '2016-01-20 12:25:57', '2016-01-20 12:25:57', 'projectthumb-roadtorecovery2.jpg', 'projectthumb roadtorecovery2', 'assets/Uploads/projectthumb-roadtorecovery2.jpg', NULL, 1, 1, 1),
(59, 'Image', '2016-01-26 08:02:31', '2016-01-26 08:02:31', 'banner-religion.jpg', 'banner religion', 'assets/Uploads/banner-religion.jpg', NULL, 1, 1, 1),
(60, 'Image', '2016-01-26 08:06:45', '2016-01-26 08:06:45', 'banner-line7frontier.jpg', 'banner line7frontier', 'assets/Uploads/banner-line7frontier.jpg', NULL, 1, 1, 1),
(61, 'Image', '2016-01-26 08:09:24', '2016-01-26 08:09:24', 'projectthumb-line7frontier.jpg', 'projectthumb line7frontier', 'assets/Uploads/projectthumb-line7frontier.jpg', NULL, 1, 1, 1),
(62, 'Image', '2016-01-26 10:15:42', '2016-01-26 10:15:42', 'image-frontier1.jpg', 'image frontier1', 'assets/Uploads/image-frontier1.jpg', NULL, 1, 1, 1),
(63, 'Image', '2016-01-26 10:16:09', '2016-01-26 10:16:09', 'image-frontier1.png', 'image frontier1', 'assets/Uploads/image-frontier1.png', NULL, 1, 1, 1),
(64, 'Image', '2016-02-04 10:48:31', '2016-02-04 10:48:31', 'L7-Wide.jpg', 'L7 Wide', 'assets/Uploads/L7-Wide.jpg', NULL, 1, 1, 1),
(65, 'Image', '2016-02-22 10:23:43', '2016-02-22 10:23:43', 'projectthumb-dmi2.jpg', 'projectthumb dmi2', 'assets/Uploads/projectthumb-dmi2.jpg', NULL, 1, 1, 1),
(66, 'Image', '2016-02-22 10:26:56', '2016-02-22 10:26:56', 'projectthumb-wtp2.jpg', 'projectthumb wtp2', 'assets/Uploads/projectthumb-wtp2.jpg', NULL, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Group`
--

CREATE TABLE `Group` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('Group') DEFAULT 'Group',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Description` mediumtext,
  `Code` varchar(255) DEFAULT NULL,
  `Locked` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HtmlEditorConfig` mediumtext,
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Group`
--

INSERT INTO `Group` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Description`, `Code`, `Locked`, `Sort`, `HtmlEditorConfig`, `ParentID`) VALUES
(1, 'Group', '2015-10-23 22:53:25', '2015-10-23 22:53:25', 'Content Authors', NULL, 'content-authors', 0, 1, NULL, 0),
(2, 'Group', '2015-10-23 22:53:25', '2015-10-23 22:53:25', 'Administrators', NULL, 'administrators', 0, 0, NULL, 0),
(3, 'Group', '2015-10-24 05:10:42', '2015-10-24 05:10:42', 'Blog users', NULL, 'blog-users', 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Members`
--

CREATE TABLE `Group_Members` (
  `ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Group_Members`
--

INSERT INTO `Group_Members` (`ID`, `GroupID`, `MemberID`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Roles`
--

CREATE TABLE `Group_Roles` (
  `ID` int(11) NOT NULL,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `PermissionRoleID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `LoginAttempt`
--

CREATE TABLE `LoginAttempt` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('LoginAttempt') DEFAULT 'LoginAttempt',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Status` enum('Success','Failure') DEFAULT 'Success',
  `IP` varchar(255) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Member`
--

CREATE TABLE `Member` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('Member') DEFAULT 'Member',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `Surname` varchar(50) DEFAULT NULL,
  `Email` varchar(254) DEFAULT NULL,
  `TempIDHash` varchar(160) DEFAULT NULL,
  `TempIDExpired` datetime DEFAULT NULL,
  `Password` varchar(160) DEFAULT NULL,
  `RememberLoginToken` varchar(160) DEFAULT NULL,
  `NumVisit` int(11) NOT NULL DEFAULT '0',
  `LastVisited` datetime DEFAULT NULL,
  `AutoLoginHash` varchar(160) DEFAULT NULL,
  `AutoLoginExpired` datetime DEFAULT NULL,
  `PasswordEncryption` varchar(50) DEFAULT NULL,
  `Salt` varchar(50) DEFAULT NULL,
  `PasswordExpiry` date DEFAULT NULL,
  `LockedOutUntil` datetime DEFAULT NULL,
  `Locale` varchar(6) DEFAULT NULL,
  `FailedLoginCount` int(11) NOT NULL DEFAULT '0',
  `DateFormat` varchar(30) DEFAULT NULL,
  `TimeFormat` varchar(30) DEFAULT NULL,
  `URLSegment` varchar(50) DEFAULT NULL,
  `BlogProfileSummary` mediumtext,
  `BlogProfileImageID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Member`
--

INSERT INTO `Member` (`ID`, `ClassName`, `LastEdited`, `Created`, `FirstName`, `Surname`, `Email`, `TempIDHash`, `TempIDExpired`, `Password`, `RememberLoginToken`, `NumVisit`, `LastVisited`, `AutoLoginHash`, `AutoLoginExpired`, `PasswordEncryption`, `Salt`, `PasswordExpiry`, `LockedOutUntil`, `Locale`, `FailedLoginCount`, `DateFormat`, `TimeFormat`, `URLSegment`, `BlogProfileSummary`, `BlogProfileImageID`) VALUES
(1, 'Member', '2016-12-10 13:29:09', '2015-10-23 22:53:26', 'Default Admin', NULL, 'admin', 'cfe125800756c9ad9ba0cb882d6f36cd7d1fa4de', '2016-12-13 13:29:09', '$2y$10$d57538b925e4412d3fbdduUVvDgkpKSj5bkXpslHcqOd5a5UAQMlm', NULL, 16, '2016-12-10 16:29:09', NULL, NULL, 'blowfish', '10$d57538b925e4412d3fbdd4', NULL, NULL, 'en_US', 0, 'yyyy-MM-dd', 'H:mm', 'default-admin', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `MemberPassword`
--

CREATE TABLE `MemberPassword` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('MemberPassword') DEFAULT 'MemberPassword',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Password` varchar(160) DEFAULT NULL,
  `Salt` varchar(50) DEFAULT NULL,
  `PasswordEncryption` varchar(50) DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MemberPassword`
--

INSERT INTO `MemberPassword` (`ID`, `ClassName`, `LastEdited`, `Created`, `Password`, `Salt`, `PasswordEncryption`, `MemberID`) VALUES
(1, 'MemberPassword', '2015-10-23 22:53:26', '2015-10-23 22:53:26', '$2y$10$d57538b925e4412d3fbdduUVvDgkpKSj5bkXpslHcqOd5a5UAQMlm', '10$d57538b925e4412d3fbdd4', 'blowfish', 1);

-- --------------------------------------------------------

--
-- Table structure for table `Page`
--

CREATE TABLE `Page` (
  `ID` int(11) NOT NULL,
  `BannerImageID` int(11) NOT NULL DEFAULT '0',
  `PageColor` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `LightTheme` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `NoBannerImage` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Page`
--

INSERT INTO `Page` (`ID`, `BannerImageID`, `PageColor`, `LightTheme`, `NoBannerImage`) VALUES
(1, 0, NULL, 0, 0),
(7, 28, 'db1111', 0, 0),
(8, 23, 'efefe8', 1, 0),
(9, 30, 'ddcfb3', 1, 0),
(10, 37, 'ffffff', 1, 0),
(11, 33, '28150d', 0, 0),
(12, 59, '383838', 0, 0),
(14, 53, '24dbeb', 0, 0),
(15, 55, '1b9dd8', 0, 0),
(16, 60, 'f4f5e6', 1, 0),
(29, 0, 'f2efec', 1, 1),
(30, 42, '212001', 0, 0),
(31, 44, 'e62a2d', 0, 0),
(32, 47, 'bc2026', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Page_Live`
--

CREATE TABLE `Page_Live` (
  `ID` int(11) NOT NULL,
  `BannerImageID` int(11) NOT NULL DEFAULT '0',
  `PageColor` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `LightTheme` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `NoBannerImage` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Page_Live`
--

INSERT INTO `Page_Live` (`ID`, `BannerImageID`, `PageColor`, `LightTheme`, `NoBannerImage`) VALUES
(1, 0, NULL, 0, 0),
(7, 28, 'db1111', 0, 0),
(8, 23, 'efefe8', 1, 0),
(9, 30, 'ddcfb3', 1, 0),
(10, 37, 'ffffff', 1, 0),
(11, 33, '28150d', 0, 0),
(14, 53, '24dbeb', 0, 0),
(15, 55, '1b9dd8', 0, 0),
(16, 60, 'f4f5e6', 1, 0),
(29, 0, 'f2efec', 1, 1),
(32, 47, 'bc2026', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Page_versions`
--

CREATE TABLE `Page_versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `BannerImageID` int(11) NOT NULL DEFAULT '0',
  `PageColor` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `LightTheme` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `NoBannerImage` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Page_versions`
--

INSERT INTO `Page_versions` (`ID`, `RecordID`, `Version`, `BannerImageID`, `PageColor`, `LightTheme`, `NoBannerImage`) VALUES
(1, 8, 7, 0, 'acd40c', 0, 0),
(2, 8, 8, 0, 'acd40c', 0, 0),
(3, 8, 9, 0, 'acd40c', 1, 0),
(4, 8, 10, 0, 'eef0e7', 1, 0),
(5, 8, 11, 0, 'eef0e7', 1, 0),
(6, 8, 12, 0, 'f5f4ef', 1, 0),
(7, 8, 13, 0, 'efefe8', 1, 0),
(8, 8, 14, 23, 'efefe8', 1, 0),
(9, 8, 15, 23, 'efefe8', 1, 0),
(10, 8, 16, 23, 'efefe8', 1, 0),
(11, 7, 6, 0, 'db1111', 0, 0),
(12, 7, 7, 0, 'db1111', 0, 0),
(13, 7, 8, 0, 'db1111', 0, 0),
(14, 7, 9, 28, 'db1111', 0, 0),
(15, 29, 3, 0, NULL, 0, 1),
(16, 29, 4, 0, 'f2efec', 0, 1),
(17, 29, 5, 0, 'f2efec', 1, 1),
(18, 29, 6, 0, 'f2efec', 1, 1),
(19, 29, 7, 0, 'f2efec', 1, 1),
(20, 29, 8, 0, 'f2efec', 1, 1),
(21, 8, 17, 23, 'efefe8', 1, 0),
(22, 8, 18, 23, 'efefe8', 1, 0),
(23, 8, 19, 23, 'efefe8', 1, 0),
(24, 8, 20, 23, 'efefe8', 1, 0),
(25, 8, 21, 23, 'efefe8', 1, 0),
(26, 7, 10, 28, 'db1111', 0, 0),
(27, 9, 5, 30, 'ddcfb3', 1, 0),
(28, 9, 6, 30, 'ddcfb3', 1, 0),
(29, 9, 7, 30, 'ddcfb3', 1, 0),
(30, 9, 8, 30, 'ddcfb3', 1, 0),
(31, 9, 9, 30, 'ddcfb3', 1, 0),
(32, 11, 5, 33, NULL, 0, 0),
(33, 11, 6, 33, NULL, 0, 0),
(34, 11, 7, 33, '28150d', 0, 0),
(35, 11, 8, 33, '28150d', 0, 0),
(36, 10, 5, 0, 'ffffff', 1, 1),
(37, 10, 6, 0, 'ffffff', 1, 1),
(38, 10, 7, 0, 'ffffff', 1, 1),
(39, 10, 8, 37, 'ffffff', 1, 0),
(40, 13, 4, 0, '93232c', 0, 0),
(41, 13, 5, 38, '93232c', 0, 0),
(42, 13, 6, 38, '93232c', 0, 0),
(43, 13, 7, 38, '93232c', 0, 0),
(44, 30, 4, 42, '212001', 0, 0),
(45, 31, 3, 0, 'e62a2d', 0, 0),
(46, 31, 4, 44, 'e62a2d', 0, 0),
(47, 32, 3, 0, 'bc2026', 0, 0),
(48, 32, 4, 47, 'bc2026', 0, 0),
(49, 32, 5, 47, 'bc2026', 0, 0),
(50, 32, 6, 47, 'bc2026', 0, 0),
(51, 7, 11, 28, 'db1111', 0, 0),
(52, 7, 12, 28, 'db1111', 0, 0),
(53, 7, 13, 28, 'db1111', 0, 0),
(54, 8, 22, 23, 'efefe8', 1, 0),
(55, 8, 23, 23, 'efefe8', 1, 0),
(56, 8, 24, 23, 'efefe8', 1, 0),
(57, 8, 25, 23, 'efefe8', 1, 0),
(58, 8, 26, 23, 'efefe8', 1, 0),
(59, 32, 7, 47, 'bc2026', 0, 0),
(60, 32, 8, 47, 'bc2026', 0, 0),
(61, 32, 9, 47, 'bc2026', 0, 0),
(62, 32, 10, 47, 'bc2026', 0, 0),
(63, 10, 9, 37, 'ffffff', 1, 0),
(64, 11, 9, 33, '28150d', 0, 0),
(65, 13, 8, 38, '93232c', 0, 0),
(66, 13, 9, 38, '93232c', 0, 0),
(67, 13, 10, 38, '93232c', 0, 0),
(68, 14, 3, 0, NULL, 0, 0),
(69, 14, 4, 0, NULL, 0, 0),
(70, 14, 5, 0, '24dbeb', 0, 0),
(71, 14, 6, 53, '24dbeb', 0, 0),
(72, 15, 3, 0, NULL, 0, 0),
(73, 15, 4, 0, '1b9dd8', 0, 0),
(74, 15, 5, 0, '1b9dd8', 0, 0),
(75, 15, 6, 55, '1b9dd8', 0, 0),
(76, 15, 7, 55, '1b9dd8', 0, 0),
(77, 15, 8, 55, '1b9dd8', 0, 0),
(78, 15, 9, 55, '1b9dd8', 0, 0),
(79, 32, 11, 47, 'bc2026', 0, 0),
(80, 9, 10, 30, 'ddcfb3', 1, 0),
(81, 12, 4, 0, NULL, 0, 0),
(82, 12, 5, 0, '383838', 0, 0),
(83, 12, 6, 59, '383838', 0, 0),
(84, 29, 9, 0, 'f2efec', 1, 1),
(85, 31, 5, 44, 'e62a2d', 0, 0),
(86, 30, 5, 42, '212001', 0, 0),
(87, 32, 12, 47, 'bc2026', 0, 0),
(88, 16, 3, 0, 'f4f5e6', 0, 0),
(89, 16, 4, 60, 'f4f5e6', 1, 0),
(90, 16, 5, 60, 'f4f5e6', 1, 0),
(91, 16, 6, 60, 'f4f5e6', 1, 0),
(92, 16, 7, 60, 'f4f5e6', 1, 0),
(93, 16, 8, 60, 'f4f5e6', 1, 0),
(94, 16, 9, 60, 'f4f5e6', 1, 0),
(95, 16, 10, 60, 'f4f5e6', 1, 0),
(96, 16, 11, 60, 'f4f5e6', 1, 0),
(97, 16, 12, 60, 'f4f5e6', 1, 0),
(98, 16, 13, 60, 'f4f5e6', 1, 0),
(99, 16, 14, 60, 'f4f5e6', 1, 0),
(100, 16, 15, 60, 'f4f5e6', 1, 0),
(101, 16, 16, 60, 'f4f5e6', 1, 0),
(102, 16, 17, 60, 'f4f5e6', 1, 0),
(103, 16, 18, 60, 'f4f5e6', 1, 0),
(104, 16, 19, 60, 'f4f5e6', 1, 0),
(105, 16, 20, 60, 'f4f5e6', 1, 0),
(106, 12, 7, 59, '383838', 0, 0),
(107, 9, 11, 30, 'ddcfb3', 1, 0),
(108, 16, 21, 60, 'f4f5e6', 1, 0),
(109, 15, 10, 55, '1b9dd8', 0, 0),
(110, 14, 7, 53, '24dbeb', 0, 0),
(111, 9, 12, 30, 'ddcfb3', 1, 0),
(112, 9, 13, 30, 'ddcfb3', 1, 0),
(113, 29, 10, 0, 'f2efec', 1, 1),
(114, 29, 11, 0, 'f2efec', 1, 1),
(115, 33, 1, 0, NULL, 0, 0),
(116, 33, 2, 0, NULL, 0, 0),
(117, 33, 3, 0, NULL, 0, 0),
(118, 1, 8, 0, NULL, 0, 0),
(119, 1, 9, 0, NULL, 0, 0),
(120, 1, 10, 0, NULL, 0, 0),
(121, 1, 11, 0, NULL, 0, 0),
(122, 15, 11, 55, '1b9dd8', 0, 0),
(123, 1, 12, 0, NULL, 0, 0),
(124, 14, 8, 53, '24dbeb', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Permission`
--

CREATE TABLE `Permission` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('Permission') DEFAULT 'Permission',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `Arg` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '1',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Permission`
--

INSERT INTO `Permission` (`ID`, `ClassName`, `LastEdited`, `Created`, `Code`, `Arg`, `Type`, `GroupID`) VALUES
(1, 'Permission', '2015-10-23 22:53:25', '2015-10-23 22:53:25', 'CMS_ACCESS_CMSMain', 0, 1, 1),
(2, 'Permission', '2015-10-23 22:53:25', '2015-10-23 22:53:25', 'CMS_ACCESS_AssetAdmin', 0, 1, 1),
(3, 'Permission', '2015-10-23 22:53:25', '2015-10-23 22:53:25', 'CMS_ACCESS_ReportAdmin', 0, 1, 1),
(4, 'Permission', '2015-10-23 22:53:25', '2015-10-23 22:53:25', 'SITETREE_REORGANISE', 0, 1, 1),
(5, 'Permission', '2015-10-23 22:53:25', '2015-10-23 22:53:25', 'ADMIN', 0, 1, 2),
(6, 'Permission', '2015-10-24 05:10:42', '2015-10-24 05:10:42', 'CMS_ACCESS_CMSMain', 0, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionRole`
--

CREATE TABLE `PermissionRole` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('PermissionRole') DEFAULT 'PermissionRole',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `OnlyAdminCanApply` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PermissionRoleCode`
--

CREATE TABLE `PermissionRoleCode` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('PermissionRoleCode') DEFAULT 'PermissionRoleCode',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `RoleID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `PortfolioImage`
--

CREATE TABLE `PortfolioImage` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('PortfolioImage') CHARACTER SET utf8 DEFAULT 'PortfolioImage',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` mediumtext CHARACTER SET utf8,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `ImageID` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `Description` mediumtext CHARACTER SET utf8,
  `Format` mediumtext CHARACTER SET utf8
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `PortfolioImage`
--

INSERT INTO `PortfolioImage` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Sort`, `ImageID`, `ParentID`, `Description`, `Format`) VALUES
(1, 'PortfolioImage', '2016-01-19 08:13:00', '2016-01-19 08:10:57', NULL, 1, 25, 8, NULL, NULL),
(2, 'PortfolioImage', '2016-01-19 08:16:00', '2016-01-19 08:15:59', NULL, 2, 26, 8, NULL, NULL),
(3, 'PortfolioImage', '2016-01-19 11:54:55', '2016-01-19 08:37:50', 'Explore', 1, 27, 7, 'Explore is the website platform', NULL),
(4, 'PortfolioImage', '2016-01-19 08:54:51', '2016-01-19 08:54:50', NULL, 1, 29, 29, NULL, NULL),
(5, 'PortfolioImage', '2016-01-19 09:37:29', '2016-01-19 09:29:30', NULL, 1, 32, 9, NULL, NULL),
(6, 'PortfolioImage', '2016-01-19 09:50:58', '2016-01-19 09:50:57', NULL, 1, 34, 11, NULL, NULL),
(8, 'PortfolioImage', '2016-01-19 09:58:51', '2016-01-19 09:58:50', NULL, 1, 36, 10, NULL, NULL),
(9, 'PortfolioImage', '2016-01-19 10:10:43', '2016-01-19 10:10:42', NULL, 1, 39, 13, NULL, NULL),
(10, 'PortfolioImage', '2016-01-19 10:20:32', '2016-01-19 10:20:31', NULL, 1, 43, 30, NULL, NULL),
(11, 'PortfolioImage', '2016-01-19 10:31:42', '2016-01-19 10:30:17', NULL, 1, 46, 31, NULL, NULL),
(12, 'PortfolioImage', '2016-01-19 10:48:56', '2016-01-19 10:48:55', NULL, 1, 48, 32, NULL, NULL),
(13, 'PortfolioImage', '2016-01-20 11:24:05', '2016-01-20 11:24:04', NULL, 1, 51, 14, NULL, NULL),
(14, 'PortfolioImage', '2016-01-20 11:27:50', '2016-01-20 11:27:49', NULL, 2, 52, 14, NULL, NULL),
(15, 'PortfolioImage', '2016-01-20 11:44:31', '2016-01-20 11:44:30', NULL, 1, 56, 15, NULL, NULL),
(16, 'PortfolioImage', '2016-02-11 07:30:23', '2016-01-26 10:16:12', NULL, 1, 63, 16, 'Web experience', NULL),
(17, 'PortfolioImage', '2016-02-11 07:28:53', '2016-02-04 10:48:34', NULL, 2, 64, 16, 'Composition created from two images, to enhance visual effect', 'Wide');

-- --------------------------------------------------------

--
-- Table structure for table `PortfolioPage`
--

CREATE TABLE `PortfolioPage` (
  `ID` int(11) NOT NULL,
  `ThumbnailImageID` int(11) NOT NULL DEFAULT '0',
  `PublishDate` date DEFAULT NULL,
  `ShortDescription` mediumtext,
  `Client` mediumtext,
  `Scope` mediumtext,
  `Tagline` mediumtext,
  `Credits` mediumtext,
  `Link` mediumtext,
  `WebLink` mediumtext,
  `CreditCreativeDirector` mediumtext,
  `CreditArtDirector` mediumtext,
  `CreditDesigner` mediumtext,
  `CreditPhotographer` mediumtext,
  `Feature` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `VideoURL` mediumtext,
  `VimeoURL` mediumtext,
  `VimeoID` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PortfolioPage`
--

INSERT INTO `PortfolioPage` (`ID`, `ThumbnailImageID`, `PublishDate`, `ShortDescription`, `Client`, `Scope`, `Tagline`, `Credits`, `Link`, `WebLink`, `CreditCreativeDirector`, `CreditArtDirector`, `CreditDesigner`, `CreditPhotographer`, `Feature`, `VideoURL`, `VimeoURL`, `VimeoID`) VALUES
(7, 13, '2012-09-20', 'It\'s been predicted that newspapers and traditional news media will not survive the next 15 years', 'Personal', 'Print, Website', 'Exhibit Explore Expand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(8, 16, '2012-06-14', 'Take this burden from my shoulders that I may carry a child. He will see the distant horizons that we will achieve together.', 'Personal', 'Print', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(9, 58, '2012-11-01', 'A story of community wellbeing and strength, and support from peers and organisations in the aftermath of the disastrous Christchurch earthquakes', 'CERA', 'Short Video', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '54063097', '54063097'),
(10, 19, '2012-03-15', 'A tribute poster to the movie Playtime by Jacques Tati', 'Personal', 'Print', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(11, 15, '2011-07-14', 'Matson’s believe tradition and progress go hand in hand. Their beer is brewed using traditional, tried and tested recipes together with state of the art production processes.', 'Matsons Brewery', 'Brand, Print', 'God\'s own, for the godzone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(12, 20, '2013-07-18', 'Sinfully pure', 'Religion Tequila', 'Website, Photo Manipulation', 'We offer you tequila reborn...in the sinfully pure taste of Religion Tequila.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(14, 66, '2015-06-10', 'Building a great relationship with your child through the magic of play!', 'Autism NZ', 'Website', NULL, NULL, NULL, 'http://waytoplay.co.nz/', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(15, 65, '2015-10-01', 'Maori Innovation Challenge', 'Borderless Productions', 'Website', NULL, NULL, NULL, 'http://digmyidea.nz/', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(16, 61, '2015-10-15', NULL, 'Line 7', 'Website, Photo Retouching', NULL, '<ul class="lined"><li><strong>Agency:</strong> Gravitybureau</li>\n<li><strong>Creative Director:</strong> Ben Medina</li>\n</ul>', 'http://line7frontier.com/', 'http://line7frontier.com/', 'Ben Medina', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(17, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(18, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(20, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(21, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(22, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(29, 14, '2012-07-19', NULL, NULL, 'Poster', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(30, 17, '2012-03-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(31, 18, '2013-01-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(32, 57, '2013-02-03', 'Providing open source solutions that work', 'Treshna Enterprises', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PortfolioPage_Live`
--

CREATE TABLE `PortfolioPage_Live` (
  `ID` int(11) NOT NULL,
  `ThumbnailImageID` int(11) NOT NULL DEFAULT '0',
  `PublishDate` date DEFAULT NULL,
  `ShortDescription` mediumtext,
  `Client` mediumtext,
  `Scope` mediumtext,
  `Tagline` mediumtext,
  `Credits` mediumtext,
  `Link` mediumtext,
  `WebLink` mediumtext,
  `CreditCreativeDirector` mediumtext,
  `CreditArtDirector` mediumtext,
  `CreditDesigner` mediumtext,
  `CreditPhotographer` mediumtext,
  `Feature` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `VideoURL` mediumtext,
  `VimeoURL` mediumtext,
  `VimeoID` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PortfolioPage_Live`
--

INSERT INTO `PortfolioPage_Live` (`ID`, `ThumbnailImageID`, `PublishDate`, `ShortDescription`, `Client`, `Scope`, `Tagline`, `Credits`, `Link`, `WebLink`, `CreditCreativeDirector`, `CreditArtDirector`, `CreditDesigner`, `CreditPhotographer`, `Feature`, `VideoURL`, `VimeoURL`, `VimeoID`) VALUES
(7, 13, '2012-09-20', 'It\'s been predicted that newspapers and traditional news media will not survive the next 15 years', 'Personal', 'Print, Website', 'Exhibit Explore Expand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(8, 16, '2012-06-14', 'Take this burden from my shoulders that I may carry a child. He will see the distant horizons that we will achieve together.', 'Personal', 'Print', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(9, 58, '2012-11-01', 'A story of community wellbeing and strength, and support from peers and organisations in the aftermath of the disastrous Christchurch earthquakes', 'CERA', 'Short Video', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '54063097', '54063097'),
(10, 19, '2012-03-15', 'A tribute poster to the movie Playtime by Jacques Tati', 'Personal', 'Print', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(11, 15, '2011-07-14', 'Matson’s believe tradition and progress go hand in hand. Their beer is brewed using traditional, tried and tested recipes together with state of the art production processes.', 'Matsons Brewery', 'Brand, Print', 'God\'s own, for the godzone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(14, 66, '2015-06-10', 'Building a great relationship with your child through the magic of play!', 'Autism NZ', 'Website', NULL, NULL, NULL, 'http://waytoplay.co.nz/', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(15, 65, '2015-10-01', 'Maori Innovation Challenge', 'Borderless Productions', 'Website', NULL, NULL, NULL, 'http://digmyidea.nz/', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(16, 61, '2015-10-15', NULL, 'Line 7', 'Website, Photo Retouching', NULL, '<ul class="lined"><li><strong>Agency:</strong> Gravitybureau</li>\n<li><strong>Creative Director:</strong> Ben Medina</li>\n</ul>', 'http://line7frontier.com/', 'http://line7frontier.com/', 'Ben Medina', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(29, 14, '2012-07-19', NULL, NULL, 'Poster', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(32, 57, '2013-02-03', 'Providing open source solutions that work', 'Treshna Enterprises', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `PortfolioPage_versions`
--

CREATE TABLE `PortfolioPage_versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ThumbnailImageID` int(11) NOT NULL DEFAULT '0',
  `PublishDate` date DEFAULT NULL,
  `ShortDescription` mediumtext,
  `Client` mediumtext,
  `Scope` mediumtext,
  `Tagline` mediumtext,
  `Credits` mediumtext,
  `Link` mediumtext,
  `WebLink` mediumtext,
  `CreditCreativeDirector` mediumtext,
  `CreditArtDirector` mediumtext,
  `CreditDesigner` mediumtext,
  `CreditPhotographer` mediumtext,
  `Feature` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `VideoURL` mediumtext,
  `VimeoURL` mediumtext,
  `VimeoID` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PortfolioPage_versions`
--

INSERT INTO `PortfolioPage_versions` (`ID`, `RecordID`, `Version`, `ThumbnailImageID`, `PublishDate`, `ShortDescription`, `Client`, `Scope`, `Tagline`, `Credits`, `Link`, `WebLink`, `CreditCreativeDirector`, `CreditArtDirector`, `CreditDesigner`, `CreditPhotographer`, `Feature`, `VideoURL`, `VimeoURL`, `VimeoID`) VALUES
(57, 8, 7, 16, '2012-06-14', 'Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(58, 8, 8, 16, '2012-06-14', 'Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris.', NULL, NULL, 'Taku kupu ko koutou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(59, 8, 9, 16, '2012-06-14', 'Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris.', NULL, NULL, 'Taku kupu ko koutou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(60, 8, 10, 16, '2012-06-14', 'Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris.', NULL, NULL, 'Taku kupu ko koutou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(61, 8, 11, 16, '2012-06-14', 'Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris.', NULL, NULL, 'Taku kupu ko koutou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(62, 8, 12, 16, '2012-06-14', 'Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris.', NULL, NULL, 'Taku kupu ko koutou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(63, 8, 13, 16, '2012-06-14', 'Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris.', NULL, NULL, 'Taku kupu ko koutou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(64, 8, 14, 16, '2012-06-14', 'Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris.', NULL, NULL, 'Taku kupu ko koutou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(65, 8, 15, 16, '2012-06-14', 'Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris.', 'Personal', 'Print', 'Taku kupu ko koutou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(66, 8, 16, 16, '2012-06-14', 'Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris.', 'Personal', 'Print', 'Taku kupu ko koutou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(67, 7, 6, 13, '2012-09-20', NULL, NULL, NULL, 'Exhibit Explore Expand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(68, 7, 7, 13, '2012-09-20', 'Etiam porta sem malesuada magna mollis euismod. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', NULL, NULL, 'Exhibit Explore Expand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(69, 7, 8, 13, '2012-09-20', 'Etiam porta sem malesuada magna mollis euismod. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Personal', 'Print, Website', 'Exhibit Explore Expand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(70, 7, 9, 13, '2012-09-20', 'Etiam porta sem malesuada magna mollis euismod. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 'Personal', 'Print, Website', 'Exhibit Explore Expand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(71, 29, 3, 14, '2012-07-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(72, 29, 4, 14, '2012-07-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(73, 29, 5, 14, '2012-07-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(74, 29, 6, 14, '2012-07-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(75, 29, 7, 14, '2012-07-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(76, 29, 8, 14, '2012-07-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(77, 8, 17, 16, '2012-06-14', 'Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris.', 'Personal', 'Print', 'Taku kupu ko koutou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(78, 8, 18, 16, '2012-06-14', NULL, 'Personal', 'Print', 'Taku kupu ko koutou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(79, 8, 19, 16, '2012-06-14', NULL, 'Personal', 'Print', 'Taku kupu ko koutou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(80, 8, 20, 16, '2012-06-14', NULL, 'Personal', 'Print', 'Taku kupu ko koutou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(81, 8, 21, 16, '2012-06-14', NULL, 'Personal', 'Print', 'Taku kupu ko koutou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(82, 7, 10, 13, '2012-09-20', 'There is still a place in our future for news media in both print and digital formats', 'Personal', 'Print, Website', 'Exhibit Explore Expand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(83, 9, 5, 21, '2012-11-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(84, 9, 6, 21, '2012-11-01', NULL, 'CERA', 'Short Video', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(85, 9, 7, 21, '2012-11-01', 'A story of community wellbeing and strength, and support from peers and organisations in the aftermath of the disastrous Christchurch earthquakes', 'CERA', 'Short Video', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(86, 9, 8, 21, '2012-11-01', 'A story of community wellbeing and strength, and support from peers and organisations in the aftermath of the disastrous Christchurch earthquakes', 'CERA', 'Short Video', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(87, 9, 9, 21, '2012-11-01', 'A story of community wellbeing and strength, and support from peers and organisations in the aftermath of the disastrous Christchurch earthquakes', 'CERA', 'Short Video', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(88, 11, 5, 15, '2011-07-14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(89, 11, 6, 15, '2011-07-14', NULL, 'Client', 'Brand, Print', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(90, 11, 7, 15, '2011-07-14', NULL, 'Client', 'Brand, Print', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(91, 11, 8, 15, '2011-07-14', NULL, 'Matsons Brewery', 'Brand, Print', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(92, 10, 5, 19, '2012-03-15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(93, 10, 6, 19, '2012-03-15', 'A tribute poster to the move Playtime by Jacques Tati', 'Personal', 'Print', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(94, 10, 7, 19, '2012-03-15', 'A tribute poster to the movie Playtime by Jacques Tati', 'Personal', 'Print', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(95, 10, 8, 19, '2012-03-15', 'A tribute poster to the movie Playtime by Jacques Tati', 'Personal', 'Print', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(96, 13, 4, 11, '2013-05-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(97, 13, 5, 11, '2013-05-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(98, 13, 6, 40, '2013-05-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(99, 13, 7, 41, '2013-05-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(100, 30, 4, 17, '2012-03-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(101, 31, 3, 18, '2013-01-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(102, 31, 4, 18, '2013-01-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(103, 32, 3, 22, '2013-02-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(104, 32, 4, 22, '2013-02-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(105, 32, 5, 22, '2013-02-03', 'Providing open source solutions that work', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(106, 32, 6, 49, '2013-02-03', 'Providing open source solutions that work', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(107, 7, 11, 13, '2012-09-20', 'Contrary to popular belief, there is still a place in the world for news media - in both print and digital formats', 'Personal', 'Print, Website', 'Exhibit Explore Expand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(108, 7, 12, 13, '2012-09-20', 'It\'s been predicted that newspapers and traditional news media will not survive the next 15 years', 'Personal', 'Print, Website', 'Exhibit Explore Expand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(109, 7, 13, 13, '2012-09-20', 'It\'s been predicted that newspapers and traditional news media will not survive the next 15 years', 'Personal', 'Print, Website', 'Exhibit Explore Expand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(110, 8, 22, 16, '2012-06-14', NULL, 'Personal', 'Print', 'Taku kupu ko koutou', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(111, 8, 23, 16, '2012-06-14', 'Take this burden from my shoulders that I may carry a child. He will see the distant horizons that we will achieve together.', 'Personal', 'Print', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(112, 8, 24, 16, '2012-06-14', 'Take this burden from my shoulders that I may carry a child. He will see the distant horizons that we will achieve together.', 'Personal', 'Print', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(113, 8, 25, 16, '2012-06-14', 'Take this burden from my shoulders that I may carry a child. He will see the distant horizons that we will achieve together.', 'Personal', 'Print', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(114, 8, 26, 16, '2012-06-14', 'Take this burden from my shoulders that I may carry a child. He will see the distant horizons that we will achieve together.', 'Personal', 'Print', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(115, 32, 7, 49, '2013-02-03', 'Providing open source solutions that work', 'Treshna Enterprises', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(116, 32, 8, 49, '2013-02-03', 'Providing open source solutions that work', 'Treshna Enterprises', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(117, 32, 9, 49, '2013-02-03', 'Providing open source solutions that work', 'Treshna Enterprises', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(118, 32, 10, 49, '2013-02-03', 'Providing open source solutions that work', 'Treshna Enterprises', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(119, 10, 9, 19, '2012-03-15', 'A tribute poster to the movie Playtime by Jacques Tati', 'Personal', 'Print', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(120, 11, 9, 15, '2011-07-14', 'Matson’s believe tradition and progress go hand in hand. Their beer is brewed using traditional, tried and tested recipes together with state of the art production processes.', 'Matsons Brewery', 'Brand, Print', 'God\'s own, for the godzone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(121, 13, 8, 41, '2013-05-10', NULL, 'Ascot Angiography', 'Brand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(122, 13, 9, 41, '2013-05-10', NULL, 'Ascot Angiography', 'Brand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(123, 13, 10, 41, '2013-05-10', NULL, 'Ascot Angiography', 'Brand', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(124, 14, 3, 50, '2015-06-10', NULL, 'Autism NZ', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(125, 14, 4, 50, '2015-06-10', 'Building a great relationship with your child through the magic of play!', 'Autism NZ', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(126, 14, 5, 50, '2015-06-10', 'Building a great relationship with your child through the magic of play!', 'Autism NZ', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(127, 14, 6, 50, '2015-06-10', 'Building a great relationship with your child through the magic of play!', 'Autism NZ', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(128, 15, 3, 0, '2015-10-01', NULL, 'Borderless Productions', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(129, 15, 4, 0, '2015-10-01', 'Maori Innovation Challenge', 'Borderless Productions', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(130, 15, 5, 54, '2015-10-01', 'Maori Innovation Challenge', 'Borderless Productions', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(131, 15, 6, 54, '2015-10-01', 'Maori Innovation Challenge', 'Borderless Productions', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(132, 15, 7, 54, '2015-10-01', 'Maori Innovation Challenge', 'Borderless Productions', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(133, 15, 8, 54, '2015-10-01', 'Maori Innovation Challenge', 'Borderless Productions', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(134, 15, 9, 54, '2015-10-01', 'Maori Innovation Challenge', 'Borderless Productions', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(135, 32, 11, 57, '2013-02-03', 'Providing open source solutions that work', 'Treshna Enterprises', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(136, 9, 10, 58, '2012-11-01', 'A story of community wellbeing and strength, and support from peers and organisations in the aftermath of the disastrous Christchurch earthquakes', 'CERA', 'Short Video', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(137, 12, 4, 20, '2013-07-18', 'Sinfully pure', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(138, 12, 5, 20, '2013-07-18', 'Sinfully pure', 'Religion Tequila', 'Website, Photo Manipulation', 'We offer you tequila reborn...in the sinfully pure taste of Religion Tequila.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(139, 12, 6, 20, '2013-07-18', 'Sinfully pure', 'Religion Tequila', 'Website, Photo Manipulation', 'We offer you tequila reborn...in the sinfully pure taste of Religion Tequila.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(140, 29, 9, 14, '2012-07-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(141, 31, 5, 18, '2013-01-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(142, 30, 5, 17, '2012-03-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(143, 32, 12, 57, '2013-02-03', 'Providing open source solutions that work', 'Treshna Enterprises', 'Website', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(144, 16, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(145, 16, 4, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(146, 16, 5, 61, '2015-10-15', NULL, 'Line 7', 'Website, Photo Retouching', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(147, 16, 6, 61, '2015-10-15', 'Into the wonder', 'Line 7', 'Website, Photo Retouching', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(148, 16, 7, 61, '2015-10-15', 'Into the wonder', 'Line 7', 'Website, Photo Retouching', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(149, 16, 8, 61, '2015-10-15', 'Into the wonder', 'Line 7', 'Website, Photo Retouching', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(150, 16, 9, 61, '2015-10-15', 'Into the wonder', 'Line 7', 'Website, Photo Retouching', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(151, 16, 10, 61, '2015-10-15', 'Into the wonder', 'Line 7', 'Website, Photo Retouching', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(152, 16, 11, 61, '2015-10-15', 'Into the wonder', 'Line 7', 'Website, Photo Retouching', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(153, 16, 12, 61, '2015-10-15', NULL, 'Line 7', 'Website, Photo Retouching', NULL, NULL, 'http://line7frontier.com/', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(154, 16, 13, 61, '2015-10-15', NULL, 'Line 7', 'Website, Photo Retouching', NULL, NULL, NULL, 'http://line7frontier.com/', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(155, 16, 14, 61, '2015-10-15', NULL, 'Line 7', 'Website, Photo Retouching', NULL, '<p>Agency: Gravitybureau</p>', NULL, 'http://line7frontier.com/', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(156, 16, 15, 61, '2015-10-15', NULL, 'Line 7', 'Website, Photo Retouching', NULL, '<ul class="lined"><li>Agency: Gravitybureau</li>\n</ul>', NULL, 'http://line7frontier.com/', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(157, 16, 16, 61, '2015-10-15', NULL, 'Line 7', 'Website, Photo Retouching', NULL, '<ul class="lined"><li>Agency: Gravitybureau</li>\n<li>Creative Director: Ben Medina</li>\n</ul>', NULL, 'http://line7frontier.com/', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(158, 16, 17, 61, '2015-10-15', NULL, 'Line 7', 'Website, Photo Retouching', NULL, '<ul class="lined"><li><strong>Agency:</strong> Gravitybureau</li>\n<li>Creative Director: Ben Medina</li>\n</ul>', NULL, 'http://line7frontier.com/', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(159, 16, 18, 61, '2015-10-15', NULL, 'Line 7', 'Website, Photo Retouching', NULL, '<ul class="lined"><li><strong>Agency:</strong> Gravitybureau</li>\n<li><strong>Creative Director:</strong> Ben Medina</li>\n</ul>', NULL, 'http://line7frontier.com/', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(160, 16, 19, 61, '2015-10-15', NULL, 'Line 7', 'Website, Photo Retouching', NULL, NULL, NULL, 'http://line7frontier.com/', 'Ben Medina', NULL, NULL, NULL, 0, NULL, NULL, NULL),
(161, 16, 20, 61, '2015-10-15', NULL, 'Line 7', 'Website, Photo Retouching', NULL, NULL, NULL, 'http://line7frontier.com/', 'Ben Medina', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(162, 12, 7, 20, '2013-07-18', 'Sinfully pure', 'Religion Tequila', 'Website, Photo Manipulation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(163, 9, 11, 58, '2012-11-01', 'A story of community wellbeing and strength, and support from peers and organisations in the aftermath of the disastrous Christchurch earthquakes', 'CERA', 'Short Video', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL),
(164, 16, 21, 61, '2015-10-15', NULL, 'Line 7', 'Website, Photo Retouching', NULL, NULL, NULL, 'http://line7frontier.com/', 'Ben Medina', NULL, NULL, NULL, 1, NULL, NULL, NULL),
(165, 15, 10, 54, '2015-10-01', 'Maori Innovation Challenge', 'Borderless Productions', 'Website', NULL, NULL, NULL, 'http://digmyidea.nz/', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(166, 14, 7, 50, '2015-06-10', 'Building a great relationship with your child through the magic of play!', 'Autism NZ', 'Website', NULL, NULL, NULL, 'http://waytoplay.co.nz/', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(167, 9, 12, 58, '2012-11-01', 'A story of community wellbeing and strength, and support from peers and organisations in the aftermath of the disastrous Christchurch earthquakes', 'CERA', 'Short Video', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '54063097', NULL),
(168, 9, 13, 58, '2012-11-01', 'A story of community wellbeing and strength, and support from peers and organisations in the aftermath of the disastrous Christchurch earthquakes', 'CERA', 'Short Video', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, '54063097'),
(169, 29, 10, 14, '2012-07-19', 'Life is a gamble, so roll the dice.', NULL, 'Poster', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(170, 29, 11, 14, '2012-07-19', 'Life is a gamble, so roll the dice.', NULL, 'Poster', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(171, 15, 11, 65, '2015-10-01', 'Maori Innovation Challenge', 'Borderless Productions', 'Website', NULL, NULL, NULL, 'http://digmyidea.nz/', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL),
(172, 14, 8, 66, '2015-06-10', 'Building a great relationship with your child through the magic of play!', 'Autism NZ', 'Website', NULL, NULL, NULL, 'http://waytoplay.co.nz/', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage`
--

CREATE TABLE `RedirectorPage` (
  `ID` int(11) NOT NULL,
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_Live`
--

CREATE TABLE `RedirectorPage_Live` (
  `ID` int(11) NOT NULL,
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_versions`
--

CREATE TABLE `RedirectorPage_versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `RedirectionType` enum('Internal','External') DEFAULT 'Internal',
  `ExternalURL` varchar(2083) DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig`
--

CREATE TABLE `SiteConfig` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SiteConfig') DEFAULT 'SiteConfig',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `Tagline` varchar(255) DEFAULT NULL,
  `Theme` varchar(255) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers') DEFAULT 'Anyone',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers') DEFAULT 'LoggedInUsers',
  `CanCreateTopLevelType` enum('LoggedInUsers','OnlyTheseUsers') DEFAULT 'LoggedInUsers',
  `SiteDescription` mediumtext,
  `FacebookURL` varchar(250) DEFAULT NULL,
  `InstagramURL` varchar(250) DEFAULT NULL,
  `TwitterURL` varchar(250) DEFAULT NULL,
  `YoutubeURL` varchar(250) DEFAULT NULL,
  `Mailto` varchar(100) DEFAULT NULL,
  `SubmitText` mediumtext,
  `Address` varchar(250) DEFAULT NULL,
  `PhoneNumber` varchar(250) DEFAULT NULL,
  `Email` varchar(250) DEFAULT NULL,
  `LogoID` int(11) NOT NULL DEFAULT '0',
  `LogoAltID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SiteConfig`
--

INSERT INTO `SiteConfig` (`ID`, `ClassName`, `LastEdited`, `Created`, `Title`, `Tagline`, `Theme`, `CanViewType`, `CanEditType`, `CanCreateTopLevelType`, `SiteDescription`, `FacebookURL`, `InstagramURL`, `TwitterURL`, `YoutubeURL`, `Mailto`, `SubmitText`, `Address`, `PhoneNumber`, `Email`, `LogoID`, `LogoAltID`) VALUES
(1, 'SiteConfig', '2016-01-18 10:09:18', '2015-10-23 22:53:25', 'HGC', NULL, 'main', 'Anyone', 'LoggedInUsers', 'LoggedInUsers', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '027 343 2643', 'hamishjgray@gmail.com', 4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_CreateTopLevelGroups`
--

CREATE TABLE `SiteConfig_CreateTopLevelGroups` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_EditorGroups`
--

CREATE TABLE `SiteConfig_EditorGroups` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_ViewerGroups`
--

CREATE TABLE `SiteConfig_ViewerGroups` (
  `ID` int(11) NOT NULL,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree`
--

CREATE TABLE `SiteTree` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SiteTree','Page','Blog','BlogPost','BlogEntry','ErrorPage','RedirectorPage','VirtualPage','HomePage','PortfolioHolder','PortfolioPage','BlogTree','BlogHolder') DEFAULT 'SiteTree',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SiteTree`
--

INSERT INTO `SiteTree` (`ID`, `ClassName`, `LastEdited`, `Created`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Version`, `ParentID`) VALUES
(1, 'HomePage', '2016-02-22 10:23:59', '2015-10-23 22:53:25', 'home', 'Home', NULL, '<p class="lead"><span>Hi! I\'m Hamish. </span>Designer, developer, dreamer. </p>\n<p class="lead"><span>I have years of experience working in digital design, this is a selection of my recent projects. Take a look around and if you want to work together, please feel free to get in touch.</span></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 12, 0),
(4, 'ErrorPage', '2015-10-23 22:53:26', '2015-10-23 22:53:25', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 6, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(5, 'ErrorPage', '2015-10-23 22:53:26', '2015-10-23 22:53:26', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 7, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(6, 'PortfolioHolder', '2015-10-24 05:10:35', '2015-10-24 05:03:46', 'work', 'Work', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 3, 0),
(7, 'PortfolioPage', '2016-01-19 12:11:48', '2015-10-24 05:03:55', 'exhibit', 'Exhibit', NULL, '<p>The technological innovations of the past 10–20 years have made us change how we find information, how we interact, and what we expect of products and services. It\'s been predicted that newspapers and traditional news media will not survive the next 15 years. I wanted to prove that there is still a place for news media in print and digital formats. </p>\n<p>In todays technology driven age, we all desire total control over all of our devices and media platforms. It\'s no longer acceptable to sit back and simply accept what we\'re given. The level of customisation available in every facet of our lives is growing by the day. </p>\n<p>This led me to think of a new approach to news media. Where instead of having the same information repeated across all platforms, instead the user has control over a print magazine, a website, and an app, choosing relevant topics for the platforms and being served content to fit the purpose. The web platform will have up to the minute news and events with some long form pieces for developing stories. The app allows for tiny bitesize pieces and breaking news updates. And finally, the print magazine is broken into topics which are more heavily interest focused. These can be opted in or out of, so you only get what you\'re interested in. </p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 13, 6),
(8, 'PortfolioPage', '2016-01-19 12:14:59', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">The project goal was to take a Maori writing, and working directly with the author create two typographic artworks which resonated with the story.</p>\n<p>The author wrote the following to describe the writing and help guide my design:</p>\n<p>"As adults, we live in a modern world of cumbersome obligations and responsibilities that simply have us exist in, rather than allow ourselves to experience our environment.  We lose sight of the fact that our first responsibility is the protection of this environment for future generations.  We allow ourselves to be weighted with our perception of success and failure that we forget the delight of discovery and from our environment.  </p>\n<p>"The simple, innocent view of the world that is experienced by the child - a world that has seen physical, cultural and spiritual elements eroded.  The traditional narratives I grew up with, became myths and legends to having no meaning or relevance in the context of the \'modern\' world ... But with my learning of te reo, I have gone back to my childhood and those narratives to discover that their context and relevance were of significance in the world that existed then.  And with this discovery I am able to experience again the environment that I am in, with my renewed perspective.  </p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 26, 6),
(9, 'PortfolioPage', '2016-02-11 07:47:30', '2015-10-24 05:04:37', 'road-to-recovery', 'Road to Recovery', NULL, '<p class="lead">The aim of this project was to visually communicate the story of community wellbeing following the disastrous Christchurch earthquakes.</p>\n<p>Collaborating with a friend, we created a video for CERA, the Christchurch Earthquake Recovery Authority, to use in house and promotionally to spread the message of all that\'s being done for affected communities. From disaster response to recovery and the general support of the Christchurch residents.</p>\n<p>  In displaying this key information we decided to use the more human, expressive approach of stop motion revolving around the story of a character and his experience’s post earthquake; deciding the animation would follow a story. Our choice of materials reflects the nature of the message we wanted to convey; a raw and genuine warmth to an otherwise cold and serious subject. We chose to use paper with its creases and imperfections to express the feeling of the story. Paper is very effective in portraying the story based feeling, giving it a depth and authenticity that would be lacking in a purely digital animation. Our chosen audio adds to this impression with the natural, human sounding acoustic music combined with the realistic sounds of life on top, it’s effective in supporting the visuals throughout the story.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 13, 6),
(10, 'PortfolioPage', '2016-01-20 10:12:54', '2015-10-24 05:05:42', 'playtime', 'Playtime', NULL, '<p class="lead">In a collaboration project, we were asked to create a poster for a special screening event in tribute to Playtime by Jacques Tati.</p>\n<p>We used a style that was playful and exciting, showing the feeling of being lost and made to feel small and insignificant in a big city. The graphical elements reflect plot points from the film, things like the icon, the landmarks of France and the hero with his pipe. </p>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 9, 6),
(11, 'PortfolioPage', '2016-01-20 10:48:13', '2015-10-24 05:05:58', 'matsons', 'Matsons', NULL, '<div class="page" title="Page 1">\n<div class="layoutArea">\n<div class="column">\n<p><span>This logo was designed in keeping with the core values of the company, which is to produce and provide high quality, fresh, New Zealand made beverages. I’ve used water symbolically throughout the rebrand as a symbol of freshness and purity. </span></p>\n<p><span>The graphical logo design reminiscent of a waterfall or </span><span>fountain, reinforcing Matson’s dedication to pure and fresh ingredients, </span><span>and the natural artesian water they use. </span></p>\n<p><span>The typography has been manipulated to reflect the </span><span>look and feel of water.</span><span> I used Grendel font as it’s dynamic and modern, while carrying confidence and a sense of heritage.</span></p>\n</div>\n</div>\n</div>', NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 9, 6),
(12, 'PortfolioPage', '2016-02-11 07:40:31', '2015-10-24 05:06:12', 'religion-tequila', 'Religion Tequila', NULL, '<p>Our plan was monastically simple: use only the finest organic ingredients in a patient, natural process, allowing the true flavor of the blue agave to travel from the Amatitán valley all the way to our bottle, on the shelf before your eyes or the hands of a skilled mixologist, and into the glass wrapped in your fingers.</p>', NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 7, 6),
(14, 'PortfolioPage', '2016-02-22 10:26:59', '2015-10-24 05:06:34', 'way-to-play', 'Way to Play', NULL, '<p class="lead">Way to Play is a one-day introduction to playing with children on the Autism Spectrum.</p>\n<p>Playing with a child with autism can be challenging, so the Way to Play workshop offers simple, easy to use strategies to begin playing joyously together. </p>\n<p>The Way to Play website was created to be a supplementary tool for parents and caregivers after completing the one-day workshop. Parents and caregivers are able to engage with a community of like-minded people to share experiences, and get support and advice from peers. </p>\n<p>As part of the website, users are also able to contact the coaches directly with questions, and upload videos showing their efforts for more targeted help with their problems. This tool is invaluable for parents who have so often felt like they are on their own, and on a bad day have no one to turn to for support. </p>', NULL, NULL, 1, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 8, 6),
(15, 'PortfolioPage', '2016-02-22 10:23:45', '2015-10-24 05:06:59', 'dig-my-idea', 'Dig My Idea', NULL, '<p>DIGMYIDEA is the Māori Innovation Challenge, and presented people with a chance to submit a digital business idea that has the potential to go global.</p>\n<p>Our brief was to create a website that communicates extreme digital innovation, and combining this with Maori iconography.</p>\n<p>With the branding and image treatments already defined, I expanded on those ideas by creating repeating graphics of kowhaiwhai, and opting for a gradual colour change as the user scrolls. With these simple effects I was able to make the site feel quite cutting edge and fresh, but still hold onto some Maori influence through subtle patterns.</p>', NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', 11, 6),
(16, 'PortfolioPage', '2016-02-11 07:36:32', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, '<p class="lead">To launch Line 7 Frontier into the United States, we created a highly-responsive web experience integrating bold campaign commercial content.</p>\n<p>Visitors are encouraged to explore the product range, and discover what it means to go “Into the Wonder”. Products feature rich lifestyle imagery, and 360° rotating  shots to show the products from all angles. </p>\n<p> Line 7 Frontier now has all the tools to become globally-recognised for engineered and intrepid adventure design.</p>', NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 21, 6),
(17, 'PortfolioPage', '2016-02-11 06:52:38', '2015-10-24 05:07:21', 'line-7', 'Line 7', NULL, NULL, NULL, NULL, 1, 1, 15, 0, 0, NULL, 'Inherit', 'Inherit', 2, 6),
(18, 'PortfolioPage', '2016-02-11 06:52:52', '2015-10-24 05:07:30', 'gravitybureau', 'Gravitybureau', NULL, NULL, NULL, NULL, 1, 1, 16, 0, 0, NULL, 'Inherit', 'Inherit', 2, 6),
(20, 'PortfolioPage', '2016-02-11 06:52:52', '2015-10-24 05:08:13', 'the-invitation', 'The Invitation', NULL, NULL, NULL, NULL, 1, 1, 17, 0, 0, NULL, 'Inherit', 'Inherit', 2, 6),
(21, 'PortfolioPage', '2016-02-11 06:52:52', '2015-10-24 05:08:52', 'borderless-productions', 'Borderless Productions', NULL, NULL, NULL, NULL, 1, 1, 18, 0, 0, NULL, 'Inherit', 'Inherit', 2, 6),
(22, 'PortfolioPage', '2016-02-11 06:52:52', '2015-10-24 05:09:07', 'ecast', 'Ecast', NULL, NULL, NULL, NULL, 1, 1, 19, 0, 0, NULL, 'Inherit', 'Inherit', 2, 6),
(23, 'Blog', '2015-10-24 05:11:16', '2015-10-24 05:10:42', 'thoughts', 'Thoughts', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 3, 0),
(29, 'PortfolioPage', '2016-02-11 07:56:11', '2015-10-24 05:03:55', 'lifes-a-gamble', 'Life\'s a Gamble', NULL, '<p class="lead">Life is a gamble, so roll the dice.</p>\n<p>This poster design was a personal project to practice photo manipulation and technical editing in Photoshop. </p>', NULL, NULL, 1, 1, 10, 0, 0, NULL, 'Inherit', 'Inherit', 11, 6),
(30, 'PortfolioPage', '2016-02-11 07:56:34', '2016-01-18 12:52:50', 'reflections', 'Reflections', NULL, NULL, NULL, NULL, 1, 1, 12, 0, 0, NULL, 'Inherit', 'Inherit', 5, 6),
(31, 'PortfolioPage', '2016-02-11 07:57:04', '2016-01-18 12:55:44', 'plains-fm', 'Plains FM', NULL, NULL, NULL, NULL, 1, 1, 11, 0, 0, NULL, 'Inherit', 'Inherit', 5, 6),
(32, 'PortfolioPage', '2016-01-26 08:04:15', '2016-01-18 13:07:39', 'treshna', 'Treshna', NULL, '<p class="lead">Treshna Enterprises required a redesign of their website to portray them as a modern, innovative and exciting local company.</p>\n<p>It was important the website communicate clearly the business services and goals so that a visitor knows exactly what Treshna does the moment they arrive. A short company story was also placed front and centre. By understanding the target audience we knew the importance of a local team with history and commitment to quality. </p>\n<p>The design was successful through its use of bold typography, vivid imagery, and designing with a clear purpose and audience in mind.</p>', NULL, NULL, 1, 1, 13, 0, 0, NULL, 'Inherit', 'Inherit', 12, 6);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_EditorGroups`
--

CREATE TABLE `SiteTree_EditorGroups` (
  `ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ImageTracking`
--

CREATE TABLE `SiteTree_ImageTracking` (
  `ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `FileID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_LinkTracking`
--

CREATE TABLE `SiteTree_LinkTracking` (
  `ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_Live`
--

CREATE TABLE `SiteTree_Live` (
  `ID` int(11) NOT NULL,
  `ClassName` enum('SiteTree','Page','Blog','BlogPost','BlogEntry','ErrorPage','RedirectorPage','VirtualPage','HomePage','PortfolioHolder','PortfolioPage','BlogTree','BlogHolder') DEFAULT 'SiteTree',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SiteTree_Live`
--

INSERT INTO `SiteTree_Live` (`ID`, `ClassName`, `LastEdited`, `Created`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `Version`, `ParentID`) VALUES
(1, 'HomePage', '2016-02-22 10:23:59', '2015-10-23 22:53:25', 'home', 'Home', NULL, '<p class="lead"><span>Hi! I\'m Hamish. </span>Designer, developer, dreamer. </p>\n<p class="lead"><span>I have years of experience working in digital design, this is a selection of my recent projects. Take a look around and if you want to work together, please feel free to get in touch.</span></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 12, 0),
(4, 'ErrorPage', '2015-10-23 22:53:35', '2015-10-23 22:53:25', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 6, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(5, 'ErrorPage', '2015-10-23 22:53:26', '2015-10-23 22:53:26', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 7, 0, 0, NULL, 'Inherit', 'Inherit', 1, 0),
(6, 'PortfolioHolder', '2015-10-24 05:10:35', '2015-10-24 05:03:46', 'work', 'Work', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 3, 0),
(7, 'PortfolioPage', '2016-01-19 12:11:48', '2015-10-24 05:03:55', 'exhibit', 'Exhibit', NULL, '<p>The technological innovations of the past 10–20 years have made us change how we find information, how we interact, and what we expect of products and services. It\'s been predicted that newspapers and traditional news media will not survive the next 15 years. I wanted to prove that there is still a place for news media in print and digital formats. </p>\n<p>In todays technology driven age, we all desire total control over all of our devices and media platforms. It\'s no longer acceptable to sit back and simply accept what we\'re given. The level of customisation available in every facet of our lives is growing by the day. </p>\n<p>This led me to think of a new approach to news media. Where instead of having the same information repeated across all platforms, instead the user has control over a print magazine, a website, and an app, choosing relevant topics for the platforms and being served content to fit the purpose. The web platform will have up to the minute news and events with some long form pieces for developing stories. The app allows for tiny bitesize pieces and breaking news updates. And finally, the print magazine is broken into topics which are more heavily interest focused. These can be opted in or out of, so you only get what you\'re interested in. </p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 13, 6),
(8, 'PortfolioPage', '2016-01-19 12:15:00', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">The project goal was to take a Maori writing, and working directly with the author create two typographic artworks which resonated with the story.</p>\n<p>The author wrote the following to describe the writing and help guide my design:</p>\n<p>"As adults, we live in a modern world of cumbersome obligations and responsibilities that simply have us exist in, rather than allow ourselves to experience our environment.  We lose sight of the fact that our first responsibility is the protection of this environment for future generations.  We allow ourselves to be weighted with our perception of success and failure that we forget the delight of discovery and from our environment.  </p>\n<p>"The simple, innocent view of the world that is experienced by the child - a world that has seen physical, cultural and spiritual elements eroded.  The traditional narratives I grew up with, became myths and legends to having no meaning or relevance in the context of the \'modern\' world ... But with my learning of te reo, I have gone back to my childhood and those narratives to discover that their context and relevance were of significance in the world that existed then.  And with this discovery I am able to experience again the environment that I am in, with my renewed perspective.  </p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 26, 6),
(9, 'PortfolioPage', '2016-02-11 07:47:31', '2015-10-24 05:04:37', 'road-to-recovery', 'Road to Recovery', NULL, '<p class="lead">The aim of this project was to visually communicate the story of community wellbeing following the disastrous Christchurch earthquakes.</p>\n<p>Collaborating with a friend, we created a video for CERA, the Christchurch Earthquake Recovery Authority, to use in house and promotionally to spread the message of all that\'s being done for affected communities. From disaster response to recovery and the general support of the Christchurch residents.</p>\n<p>  In displaying this key information we decided to use the more human, expressive approach of stop motion revolving around the story of a character and his experience’s post earthquake; deciding the animation would follow a story. Our choice of materials reflects the nature of the message we wanted to convey; a raw and genuine warmth to an otherwise cold and serious subject. We chose to use paper with its creases and imperfections to express the feeling of the story. Paper is very effective in portraying the story based feeling, giving it a depth and authenticity that would be lacking in a purely digital animation. Our chosen audio adds to this impression with the natural, human sounding acoustic music combined with the realistic sounds of life on top, it’s effective in supporting the visuals throughout the story.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 13, 6),
(10, 'PortfolioPage', '2016-01-20 10:12:54', '2015-10-24 05:05:42', 'playtime', 'Playtime', NULL, '<p class="lead">In a collaboration project, we were asked to create a poster for a special screening event in tribute to Playtime by Jacques Tati.</p>\n<p>We used a style that was playful and exciting, showing the feeling of being lost and made to feel small and insignificant in a big city. The graphical elements reflect plot points from the film, things like the icon, the landmarks of France and the hero with his pipe. </p>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 9, 6),
(11, 'PortfolioPage', '2016-01-20 10:48:13', '2015-10-24 05:05:58', 'matsons', 'Matsons', NULL, '<div class="page" title="Page 1">\n<div class="layoutArea">\n<div class="column">\n<p><span>This logo was designed in keeping with the core values of the company, which is to produce and provide high quality, fresh, New Zealand made beverages. I’ve used water symbolically throughout the rebrand as a symbol of freshness and purity. </span></p>\n<p><span>The graphical logo design reminiscent of a waterfall or </span><span>fountain, reinforcing Matson’s dedication to pure and fresh ingredients, </span><span>and the natural artesian water they use. </span></p>\n<p><span>The typography has been manipulated to reflect the </span><span>look and feel of water.</span><span> I used Grendel font as it’s dynamic and modern, while carrying confidence and a sense of heritage.</span></p>\n</div>\n</div>\n</div>', NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 9, 6),
(14, 'PortfolioPage', '2016-02-22 10:26:59', '2015-10-24 05:06:34', 'way-to-play', 'Way to Play', NULL, '<p class="lead">Way to Play is a one-day introduction to playing with children on the Autism Spectrum.</p>\n<p>Playing with a child with autism can be challenging, so the Way to Play workshop offers simple, easy to use strategies to begin playing joyously together. </p>\n<p>The Way to Play website was created to be a supplementary tool for parents and caregivers after completing the one-day workshop. Parents and caregivers are able to engage with a community of like-minded people to share experiences, and get support and advice from peers. </p>\n<p>As part of the website, users are also able to contact the coaches directly with questions, and upload videos showing their efforts for more targeted help with their problems. This tool is invaluable for parents who have so often felt like they are on their own, and on a bad day have no one to turn to for support. </p>', NULL, NULL, 1, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 8, 6),
(15, 'PortfolioPage', '2016-02-22 10:23:45', '2015-10-24 05:06:59', 'dig-my-idea', 'Dig My Idea', NULL, '<p>DIGMYIDEA is the Māori Innovation Challenge, and presented people with a chance to submit a digital business idea that has the potential to go global.</p>\n<p>Our brief was to create a website that communicates extreme digital innovation, and combining this with Maori iconography.</p>\n<p>With the branding and image treatments already defined, I expanded on those ideas by creating repeating graphics of kowhaiwhai, and opting for a gradual colour change as the user scrolls. With these simple effects I was able to make the site feel quite cutting edge and fresh, but still hold onto some Maori influence through subtle patterns.</p>', NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', 11, 6),
(16, 'PortfolioPage', '2016-02-11 07:36:32', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, '<p class="lead">To launch Line 7 Frontier into the United States, we created a highly-responsive web experience integrating bold campaign commercial content.</p>\n<p>Visitors are encouraged to explore the product range, and discover what it means to go “Into the Wonder”. Products feature rich lifestyle imagery, and 360° rotating  shots to show the products from all angles. </p>\n<p> Line 7 Frontier now has all the tools to become globally-recognised for engineered and intrepid adventure design.</p>', NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 21, 6),
(23, 'Blog', '2015-10-24 05:11:16', '2015-10-24 05:10:42', 'thoughts', 'Thoughts', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 3, 0),
(29, 'PortfolioPage', '2016-02-11 07:56:11', '2015-10-24 05:03:55', 'lifes-a-gamble', 'Life\'s a Gamble', NULL, '<p class="lead">Life is a gamble, so roll the dice.</p>\n<p>This poster design was a personal project to practice photo manipulation and technical editing in Photoshop. </p>', NULL, NULL, 1, 1, 10, 0, 0, NULL, 'Inherit', 'Inherit', 11, 6),
(32, 'PortfolioPage', '2016-01-26 08:04:15', '2016-01-18 13:07:39', 'treshna', 'Treshna', NULL, '<p class="lead">Treshna Enterprises required a redesign of their website to portray them as a modern, innovative and exciting local company.</p>\n<p>It was important the website communicate clearly the business services and goals so that a visitor knows exactly what Treshna does the moment they arrive. A short company story was also placed front and centre. By understanding the target audience we knew the importance of a local team with history and commitment to quality. </p>\n<p>The design was successful through its use of bold typography, vivid imagery, and designing with a clear purpose and audience in mind.</p>', NULL, NULL, 1, 1, 13, 0, 0, NULL, 'Inherit', 'Inherit', 12, 6);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_versions`
--

CREATE TABLE `SiteTree_versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('SiteTree','Page','Blog','BlogPost','BlogEntry','ErrorPage','RedirectorPage','VirtualPage','HomePage','PortfolioHolder','PortfolioPage','BlogTree','BlogHolder') DEFAULT 'SiteTree',
  `LastEdited` datetime DEFAULT NULL,
  `Created` datetime DEFAULT NULL,
  `URLSegment` varchar(255) DEFAULT NULL,
  `Title` varchar(255) DEFAULT NULL,
  `MenuTitle` varchar(100) DEFAULT NULL,
  `Content` mediumtext,
  `MetaDescription` mediumtext,
  `ExtraMeta` mediumtext,
  `ShowInMenus` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ReportClass` varchar(50) DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') DEFAULT 'Inherit',
  `ParentID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `SiteTree_versions`
--

INSERT INTO `SiteTree_versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `AuthorID`, `PublisherID`, `ClassName`, `LastEdited`, `Created`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `ParentID`) VALUES
(1, 1, 1, 1, 0, 0, 'Page', '2015-10-23 22:53:25', '2015-10-23 22:53:25', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>.</p><p>You can now access the <a href="http://docs.silverstripe.org">developer documentation</a>, or begin the <a href="http://www.silverstripe.org/learn/lessons">SilverStripe lessons</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(2, 2, 1, 1, 0, 0, 'Page', '2015-10-23 22:53:25', '2015-10-23 22:53:25', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br></p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(3, 3, 1, 1, 0, 0, 'Page', '2015-10-23 22:53:25', '2015-10-23 22:53:25', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br></p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(4, 4, 1, 1, 0, 0, 'ErrorPage', '2015-10-23 22:53:25', '2015-10-23 22:53:25', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn\'t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, 0, 0, 4, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(5, 5, 1, 1, 0, 0, 'ErrorPage', '2015-10-23 22:53:26', '2015-10-23 22:53:26', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, 0, 0, 5, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(6, 1, 2, 1, 1, 1, 'HomePage', '2015-10-24 03:37:40', '2015-10-23 22:53:25', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>.</p><p>You can now access the <a href="http://docs.silverstripe.org">developer documentation</a>, or begin the <a href="http://www.silverstripe.org/learn/lessons">SilverStripe lessons</a>.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(7, 1, 3, 1, 1, 1, 'HomePage', '2015-10-24 03:46:16', '2015-10-23 22:53:25', 'home', 'Home', NULL, '<p class="lead">Material Good is an inviting space housing the rarest objects and desires of a life well-lived. Here, the most exclusive of timepieces, jewelry, art, and accessories can be contemplated, studied, and acquired in the warmth and comfort of an expressive new loft, where customers are welcomed guests, and design is not an exhibition — it’s an experience.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(8, 1, 4, 1, 1, 1, 'HomePage', '2015-10-24 03:47:14', '2015-10-23 22:53:25', 'home', 'Home', NULL, '<p class="lead">Material Good is an inviting space housing the rarest objects and desires of a life well-lived. <em>Here, the most exclusive of timepieces, jewelry, art, and accessories can be contemplated, studied, and acquired in the warmth and comfort of an expressive new loft, where customers are welcomed guests, and design is not an exhibition — it’s an experience.</em></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(9, 6, 1, 0, 1, 0, 'PortfolioHolder', '2015-10-24 05:03:46', '2015-10-24 05:03:46', 'new-portfolio-holder', 'New Portfolio Holder', NULL, NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(10, 6, 2, 1, 1, 1, 'PortfolioHolder', '2015-10-24 05:03:52', '2015-10-24 05:03:46', 'work', 'Work', NULL, NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(11, 7, 1, 0, 1, 0, 'PortfolioPage', '2015-10-24 05:03:55', '2015-10-24 05:03:55', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(12, 7, 2, 1, 1, 1, 'PortfolioPage', '2015-10-24 05:04:08', '2015-10-24 05:03:55', 'exhibit', 'Exhibit', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(13, 8, 1, 0, 1, 0, 'PortfolioPage', '2015-10-24 05:04:11', '2015-10-24 05:04:11', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(14, 8, 2, 1, 1, 1, 'PortfolioPage', '2015-10-24 05:04:29', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(15, 9, 1, 0, 1, 0, 'PortfolioPage', '2015-10-24 05:04:37', '2015-10-24 05:04:37', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(16, 9, 2, 1, 1, 1, 'PortfolioPage', '2015-10-24 05:04:42', '2015-10-24 05:04:37', 'road-to-recovery', 'Road to Recovery', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(17, 10, 1, 0, 1, 0, 'PortfolioPage', '2015-10-24 05:05:42', '2015-10-24 05:05:42', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(18, 10, 2, 1, 1, 1, 'PortfolioPage', '2015-10-24 05:05:53', '2015-10-24 05:05:42', 'playtime', 'Playtime', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(19, 11, 1, 0, 1, 0, 'PortfolioPage', '2015-10-24 05:05:58', '2015-10-24 05:05:58', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(20, 11, 2, 1, 1, 1, 'PortfolioPage', '2015-10-24 05:06:03', '2015-10-24 05:05:58', 'matsons', 'Matsons', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(21, 12, 1, 0, 1, 0, 'PortfolioPage', '2015-10-24 05:06:12', '2015-10-24 05:06:12', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(22, 12, 2, 1, 1, 1, 'PortfolioPage', '2015-10-24 05:06:18', '2015-10-24 05:06:12', 'religion-tequila', 'Religion Tequila', NULL, NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(23, 13, 1, 0, 1, 0, 'PortfolioPage', '2015-10-24 05:06:23', '2015-10-24 05:06:23', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(24, 13, 2, 1, 1, 1, 'PortfolioPage', '2015-10-24 05:06:31', '2015-10-24 05:06:23', 'ascot-angiography', 'Ascot Angiography', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(25, 14, 1, 0, 1, 0, 'PortfolioPage', '2015-10-24 05:06:34', '2015-10-24 05:06:34', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(26, 14, 2, 1, 1, 1, 'PortfolioPage', '2015-10-24 05:06:56', '2015-10-24 05:06:34', 'way-to-play', 'Way to Play', NULL, NULL, NULL, NULL, 1, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(27, 15, 1, 0, 1, 0, 'PortfolioPage', '2015-10-24 05:06:59', '2015-10-24 05:06:59', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(28, 15, 2, 1, 1, 1, 'PortfolioPage', '2015-10-24 05:07:06', '2015-10-24 05:06:59', 'dig-my-idea', 'Dig My Idea', NULL, NULL, NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(29, 16, 1, 0, 1, 0, 'PortfolioPage', '2015-10-24 05:07:10', '2015-10-24 05:07:10', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 10, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(30, 16, 2, 1, 1, 1, 'PortfolioPage', '2015-10-24 05:07:18', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, NULL, NULL, NULL, 1, 1, 10, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(31, 17, 1, 0, 1, 0, 'PortfolioPage', '2015-10-24 05:07:21', '2015-10-24 05:07:21', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 11, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(32, 17, 2, 1, 1, 1, 'PortfolioPage', '2015-10-24 05:07:26', '2015-10-24 05:07:21', 'line-7', 'Line 7', NULL, NULL, NULL, NULL, 1, 1, 11, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(33, 18, 1, 0, 1, 0, 'PortfolioPage', '2015-10-24 05:07:30', '2015-10-24 05:07:30', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 12, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(34, 18, 2, 1, 1, 1, 'PortfolioPage', '2015-10-24 05:07:45', '2015-10-24 05:07:30', 'gravitybureau', 'Gravitybureau', NULL, NULL, NULL, NULL, 1, 1, 12, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(35, 19, 1, 0, 1, 0, 'PortfolioHolder', '2015-10-24 05:07:56', '2015-10-24 05:03:46', 'work-2', 'Work', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(36, 20, 1, 0, 1, 0, 'PortfolioPage', '2015-10-24 05:08:13', '2015-10-24 05:08:13', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 13, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(37, 20, 2, 1, 1, 1, 'PortfolioPage', '2015-10-24 05:08:48', '2015-10-24 05:08:13', 'the-invitation', 'The Invitation', NULL, NULL, NULL, NULL, 1, 1, 13, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(38, 21, 1, 0, 1, 0, 'PortfolioPage', '2015-10-24 05:08:52', '2015-10-24 05:08:52', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(39, 21, 2, 1, 1, 1, 'PortfolioPage', '2015-10-24 05:09:02', '2015-10-24 05:08:52', 'borderless-productions', 'Borderless Productions', NULL, NULL, NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(40, 22, 1, 0, 1, 0, 'PortfolioPage', '2015-10-24 05:09:07', '2015-10-24 05:09:07', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 15, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(41, 22, 2, 1, 1, 1, 'PortfolioPage', '2015-10-24 05:09:16', '2015-10-24 05:09:07', 'ecast', 'Ecast', NULL, NULL, NULL, NULL, 1, 1, 15, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(42, 6, 3, 1, 1, 1, 'PortfolioHolder', '2015-10-24 05:10:31', '2015-10-24 05:03:46', 'work', 'Work', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(43, 23, 1, 0, 1, 0, 'Blog', '2015-10-24 05:10:42', '2015-10-24 05:10:42', 'new-blog', 'New Blog', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(44, 23, 2, 1, 1, 1, 'Blog', '2015-10-24 05:10:52', '2015-10-24 05:10:42', 'thoughts', 'Thoughts', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(45, 23, 3, 1, 1, 1, 'Blog', '2015-10-24 05:11:13', '2015-10-24 05:10:42', 'thoughts', 'Thoughts', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(46, 24, 1, 0, 1, 0, 'BlogPost', '2015-10-24 05:11:23', '2015-10-24 05:11:23', 'new-blog-post', 'New Blog Post', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 23),
(47, 24, 2, 1, 1, 1, 'BlogPost', '2015-10-24 05:11:27', '2015-10-24 05:11:23', 'new-blog-post', 'New Blog Post', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 23),
(48, 25, 1, 0, 1, 0, 'BlogPost', '2015-10-24 05:11:30', '2015-10-24 05:11:23', 'new-blog-post-2', 'New Blog Post', NULL, NULL, NULL, NULL, 0, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 23),
(49, 25, 2, 1, 1, 1, 'BlogPost', '2015-10-24 05:11:35', '2015-10-24 05:11:23', 'new-blog-post-2', 'New Blog Post', NULL, NULL, NULL, NULL, 0, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 23),
(50, 26, 1, 1, 1, 1, 'BlogPost', '2015-10-24 05:11:38', '2015-10-24 05:11:23', 'new-blog-post-3', 'New Blog Post', NULL, NULL, NULL, NULL, 0, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 23),
(51, 1, 5, 1, 1, 1, 'HomePage', '2015-10-24 05:12:25', '2015-10-23 22:53:25', 'home', 'Home', NULL, '<p class="lead">Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas faucibus mollis interdum. <em>Sed posuere consectetur est at lobortis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</em></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(52, 27, 1, 1, 1, 1, 'PortfolioPage', '2016-01-17 12:03:48', '2016-01-17 12:03:48', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 16, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(53, 28, 1, 0, 1, 0, 'BlogPost', '2016-01-17 12:03:59', '2016-01-17 12:03:59', 'new-blog-post-4', 'New Blog Post', NULL, NULL, NULL, NULL, 0, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 23),
(54, 28, 2, 0, 1, 0, 'BlogPost', '2016-01-17 12:04:06', '2016-01-17 12:03:59', 'new-blog-post-4', 'New Blog Post 2', NULL, NULL, NULL, NULL, 0, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 23),
(55, 28, 3, 1, 1, 1, 'BlogPost', '2016-01-17 12:04:06', '2016-01-17 12:03:59', 'new-blog-post-4', 'New Blog Post 2', NULL, NULL, NULL, NULL, 0, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 23),
(56, 1, 6, 1, 1, 1, 'HomePage', '2016-01-18 11:11:14', '2015-10-23 22:53:25', 'home', 'Home', NULL, '<p class="lead"><span>I have extensive real world experience in the design industry, ranging from branding and advertising, to digital design, motion graphics and website design and development.</span></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(57, 1, 7, 1, 1, 1, 'HomePage', '2016-01-18 11:11:32', '2015-10-23 22:53:25', 'home', 'Home', NULL, '<p class="lead"><span>Hi, I\'m Hamish!</span></p>\n<p class="lead">I have extensive real world experience in the design industry, ranging from branding and advertising, to digital design, motion graphics and website design and development.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(58, 7, 3, 1, 1, 1, 'PortfolioPage', '2016-01-18 11:25:11', '2015-10-24 05:03:55', 'exhibit', 'Exhibit', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(59, 8, 3, 1, 1, 1, 'PortfolioPage', '2016-01-18 11:25:22', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(60, 9, 3, 1, 1, 1, 'PortfolioPage', '2016-01-18 11:25:32', '2015-10-24 05:04:37', 'road-to-recovery', 'Road to Recovery', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(61, 28, 4, 1, 1, 1, 'BlogPost', '2016-01-18 11:39:42', '2016-01-17 12:03:59', 'new-blog-post-4', 'New Blog Post 2', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aliquet erat sed justo condimentum, id congue tellus tristique. Quisque malesuada vitae nisl eget mattis. Suspendisse lobortis accumsan viverra. Pellentesque maximus sollicitudin porttitor. Cras congue turpis eget ipsum mattis vehicula.</p>\n<p>In pellentesque vestibulum nisi vel semper. Duis et magna non purus aliquet volutpat. Aenean a quam est. Aenean ac dolor dignissim, pellentesque purus at, hendrerit ipsum.</p>', NULL, NULL, 0, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 23),
(62, 24, 3, 1, 1, 1, 'BlogPost', '2016-01-18 11:39:51', '2015-10-24 05:11:23', 'new-blog-post', 'New Blog Post', NULL, '<p>In pellentesque vestibulum nisi vel semper. Duis et magna non purus aliquet volutpat. Aenean a quam est. Aenean ac dolor dignissim, pellentesque purus at, hendrerit ipsum.</p>', NULL, NULL, 0, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 23),
(63, 25, 3, 1, 1, 1, 'BlogPost', '2016-01-18 11:40:01', '2015-10-24 05:11:23', 'new-blog-post-2', 'New Blog Post', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aliquet erat sed justo condimentum, id congue tellus tristique. Quisque malesuada vitae nisl eget mattis. Suspendisse lobortis accumsan viverra. Pellentesque maximus sollicitudin porttitor. Cras congue turpis eget ipsum mattis vehicula. </p>\n<p>In pellentesque vestibulum nisi vel semper. Duis et magna non purus aliquet volutpat. Aenean a quam est. Aenean ac dolor dignissim, pellentesque purus at, hendrerit ipsum.</p>', NULL, NULL, 0, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 23),
(64, 10, 3, 1, 1, 1, 'PortfolioPage', '2016-01-18 11:48:01', '2015-10-24 05:05:42', 'playtime', 'Playtime', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(65, 11, 3, 1, 1, 1, 'PortfolioPage', '2016-01-18 11:48:13', '2015-10-24 05:05:58', 'matsons', 'Matsons', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(66, 7, 4, 1, 1, 1, 'PortfolioPage', '2016-01-18 12:16:54', '2015-10-24 05:03:55', 'exhibit', 'Exhibit', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(67, 13, 3, 1, 1, 1, 'PortfolioPage', '2016-01-18 12:29:29', '2015-10-24 05:06:23', 'ascot-angiography', 'Ascot Angiography', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(68, 27, 2, 1, 1, 1, 'PortfolioPage', '2016-01-18 12:31:39', '2016-01-17 12:03:48', 'return-to-sender', 'Return to Sender', NULL, NULL, NULL, NULL, 1, 1, 16, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(69, 7, 5, 1, 1, 1, 'PortfolioPage', '2016-01-18 12:37:05', '2015-10-24 05:03:55', 'exhibit', 'Exhibit', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(70, 29, 1, 0, 1, 0, 'PortfolioPage', '2016-01-18 12:39:58', '2015-10-24 05:03:55', 'exhibit-2', 'Exhibit', NULL, NULL, NULL, NULL, 1, 1, 17, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(71, 29, 2, 1, 1, 1, 'PortfolioPage', '2016-01-18 12:40:36', '2015-10-24 05:03:55', 'lifes-a-gamble', 'Life\'s a Gamble', NULL, NULL, NULL, NULL, 1, 1, 17, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(72, 11, 4, 1, 1, 1, 'PortfolioPage', '2016-01-18 12:48:50', '2015-10-24 05:05:58', 'matsons', 'Matsons', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(73, 8, 4, 1, 1, 1, 'PortfolioPage', '2016-01-18 12:52:11', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, NULL, NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(74, 30, 1, 0, 1, 0, 'PortfolioPage', '2016-01-18 12:52:50', '2016-01-18 12:52:50', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 18, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(75, 30, 2, 1, 1, 1, 'PortfolioPage', '2016-01-18 12:53:11', '2016-01-18 12:52:50', 'reflections', 'Reflections', NULL, NULL, NULL, NULL, 1, 1, 18, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(76, 30, 3, 1, 1, 1, 'PortfolioPage', '2016-01-18 12:54:14', '2016-01-18 12:52:50', 'reflections', 'Reflections', NULL, NULL, NULL, NULL, 1, 1, 18, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(77, 31, 1, 0, 1, 0, 'PortfolioPage', '2016-01-18 12:55:44', '2016-01-18 12:55:44', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 19, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(78, 31, 2, 1, 1, 1, 'PortfolioPage', '2016-01-18 12:56:11', '2016-01-18 12:55:44', 'plains-fm', 'Plains FM', NULL, NULL, NULL, NULL, 1, 1, 19, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(79, 24, 4, 1, 1, 1, 'BlogPost', '2016-01-18 12:56:55', '2015-10-24 05:11:23', 'new-blog-post', 'New Blog Post', NULL, '<p>In pellentesque vestibulum nisi vel semper. Duis et magna non purus aliquet volutpat. Aenean a quam est. Aenean ac dolor dignissim, pellentesque purus at, hendrerit ipsum.</p>', NULL, NULL, 0, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 23),
(80, 28, 5, 1, 1, 1, 'BlogPost', '2016-01-18 12:57:26', '2016-01-17 12:03:59', 'new-blog-post-4', 'New Blog Post 2', NULL, '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed aliquet erat sed justo condimentum, id congue tellus tristique. Quisque malesuada vitae nisl eget mattis. Suspendisse lobortis accumsan viverra. Pellentesque maximus sollicitudin porttitor. Cras congue turpis eget ipsum mattis vehicula.</p>\n<p>In pellentesque vestibulum nisi vel semper. Duis et magna non purus aliquet volutpat. Aenean a quam est. Aenean ac dolor dignissim, pellentesque purus at, hendrerit ipsum.</p>', NULL, NULL, 0, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 23),
(81, 10, 4, 1, 1, 1, 'PortfolioPage', '2016-01-18 12:59:42', '2015-10-24 05:05:42', 'playtime', 'Playtime', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(82, 12, 3, 1, 1, 1, 'PortfolioPage', '2016-01-18 13:03:09', '2015-10-24 05:06:12', 'religion-tequila', 'Religion Tequila', NULL, NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(83, 9, 4, 1, 1, 1, 'PortfolioPage', '2016-01-18 13:05:36', '2015-10-24 05:04:37', 'road-to-recovery', 'Road to Recovery', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(84, 32, 1, 0, 1, 0, 'PortfolioPage', '2016-01-18 13:07:39', '2016-01-18 13:07:39', 'new-portfolio-page', 'New Portfolio Page', NULL, NULL, NULL, NULL, 1, 1, 20, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(85, 32, 2, 1, 1, 1, 'PortfolioPage', '2016-01-18 13:08:02', '2016-01-18 13:07:39', 'treshna', 'Treshna', NULL, NULL, NULL, NULL, 1, 1, 20, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(86, 8, 5, 1, 1, 1, 'PortfolioPage', '2016-01-19 07:18:46', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(87, 8, 6, 1, 1, 1, 'PortfolioPage', '2016-01-19 07:29:08', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(88, 8, 7, 1, 1, 1, 'PortfolioPage', '2016-01-19 07:38:48', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(89, 8, 8, 1, 1, 1, 'PortfolioPage', '2016-01-19 07:44:55', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(90, 8, 9, 1, 1, 1, 'PortfolioPage', '2016-01-19 07:47:29', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(91, 8, 10, 1, 1, 1, 'PortfolioPage', '2016-01-19 07:48:40', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(92, 8, 11, 1, 1, 1, 'PortfolioPage', '2016-01-19 07:48:54', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(93, 8, 12, 1, 1, 1, 'PortfolioPage', '2016-01-19 07:51:31', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(94, 8, 13, 1, 1, 1, 'PortfolioPage', '2016-01-19 07:53:19', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(95, 8, 14, 1, 1, 1, 'PortfolioPage', '2016-01-19 07:53:33', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(96, 8, 15, 1, 1, 1, 'PortfolioPage', '2016-01-19 07:57:58', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>\n<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(97, 8, 16, 1, 1, 1, 'PortfolioPage', '2016-01-19 08:11:12', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam.</p>\n<p>Pellentesque ornare sem lacinia quam venenatis vestibulum. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Cras mattis consectetur purus sit amet fermentum.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(98, 7, 6, 1, 1, 1, 'PortfolioPage', '2016-01-19 08:36:58', '2015-10-24 05:03:55', 'exhibit', 'Exhibit', NULL, NULL, NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(99, 7, 7, 1, 1, 1, 'PortfolioPage', '2016-01-19 08:37:20', '2015-10-24 05:03:55', 'exhibit', 'Exhibit', NULL, '<p class="lead">Donec sed odio dui.</p>\n<p>Maecenas sed diam eget risus varius blandit sit amet non magna. Nulla vitae elit libero, a pharetra augue. Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(100, 7, 8, 1, 1, 1, 'PortfolioPage', '2016-01-19 08:37:37', '2015-10-24 05:03:55', 'exhibit', 'Exhibit', NULL, '<p class="lead">Donec sed odio dui.</p>\n<p>Maecenas sed diam eget risus varius blandit sit amet non magna. Nulla vitae elit libero, a pharetra augue. Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(101, 7, 9, 1, 1, 1, 'PortfolioPage', '2016-01-19 08:45:00', '2015-10-24 05:03:55', 'exhibit', 'Exhibit', NULL, '<p class="lead">Donec sed odio dui.</p>\n<p>Maecenas sed diam eget risus varius blandit sit amet non magna. Nulla vitae elit libero, a pharetra augue. Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(102, 29, 3, 1, 1, 1, 'PortfolioPage', '2016-01-19 08:47:49', '2015-10-24 05:03:55', 'lifes-a-gamble', 'Life\'s a Gamble', NULL, NULL, NULL, NULL, 1, 1, 17, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(103, 29, 4, 1, 1, 1, 'PortfolioPage', '2016-01-19 08:54:38', '2015-10-24 05:03:55', 'lifes-a-gamble', 'Life\'s a Gamble', NULL, NULL, NULL, NULL, 1, 1, 17, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(104, 29, 5, 1, 1, 1, 'PortfolioPage', '2016-01-19 08:55:01', '2015-10-24 05:03:55', 'lifes-a-gamble', 'Life\'s a Gamble', NULL, NULL, NULL, NULL, 1, 1, 17, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(105, 29, 6, 1, 1, 1, 'PortfolioPage', '2016-01-19 08:55:24', '2015-10-24 05:03:55', 'lifes-a-gamble', 'Life\'s a Gamble', NULL, '<p class="lead">Curabitur blandit tempus porttitor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean lacinia bibendum nulla sed consectetur.</p>', NULL, NULL, 1, 1, 17, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(106, 29, 7, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:03:58', '2015-10-24 05:03:55', 'lifes-a-gamble', 'Life\'s a Gamble', NULL, '<p class="lead">Take this burden from my shoulders that I may carry a child. He will see the distant horizons that we will achieve together.</p>\n<p>This </p>\n<p> </p>', NULL, NULL, 1, 1, 17, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(107, 29, 8, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:04:09', '2015-10-24 05:03:55', 'lifes-a-gamble', 'Life\'s a Gamble', NULL, '<p class="lead">Take this burden from my shoulders that I may carry a child. He will see the distant horizons that we will achieve together.</p>\n<p>This </p>\n<p> </p>', NULL, NULL, 1, 1, 17, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(108, 8, 17, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:04:39', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">Take this burden from my shoulders that I may carry a child. He will see the distant horizons that we will achieve together.</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(109, 8, 18, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:07:27', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">Take this burden from my shoulders that I may carry a child. He will see the distant horizons that we will achieve together.</p>\n<p>The project goal was to take a Maori writing, and working directly with the author create two typographic artworks which resonated with the story. </p>\n<p>The author wrote the following as the meaning behind the story:</p>\n<p>"As adults, we live in a modern world of cumbersome obligations and responsibilities that simply have us exist in, rather than allow ourselves to experience our environment.  We lose sight of the fact that our first responsibility is the protection of this environment for future generations.  We allow ourselves to be weighted with our perception of success and failure that we forget the delight of discovery and from our environment.  </p>\n<p>"The simple, innocent view of the world that is experienced by the child - a world that has seen physical, cultural and spiritual elements eroded.  The traditional narratives I grew up with, became myths and legends to having no meaning or relevance in the context of the \'modern\' world ... But with my learning of te reo, I have gone back to my childhood and those narratives to discover that their context and relevance were of significance in the world that existed then.  And with this discovery I am able to experience again the environment that I am in, with my renewed perspective.  </p>\n<p>"I am Māori, I am a descendent of the tribes of Waikato and Te Riu o Tūwharetoa, my maunga tapu are Pūtauaki and Taupiri.  My awa tapu are Waikato and Tarawera. My ancestors travelled across the Pacific, navigating by star and tide in the waka Tainui and Te Arawa, to their landing places of Whangaparaoa and Maketū.  </p>\n<p>"These narratives were taught to me as a child along with the practices of my people that ensured their physical and spiritual well-being - kai tiākitanga ... guardianship of resources that would be preserved for future generations.  In essence, by allowing myself to view my environment with \'the eyes of a child\' once again, the \'distant horizon\' (goals, responsibilities) became clearer"</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(110, 8, 19, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:08:12', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">Take this burden from my shoulders that I may carry a child. He will see the distant horizons that we will achieve together.</p>\n<p>The project goal was to take a Maori writing, and working directly with the author create two typographic artworks which resonated with the story. </p>\n<p>The author wrote the following to describe the writing, and guide my design:</p>\n<p>"As adults, we live in a modern world of cumbersome obligations and responsibilities that simply have us exist in, rather than allow ourselves to experience our environment.  We lose sight of the fact that our first responsibility is the protection of this environment for future generations.  We allow ourselves to be weighted with our perception of success and failure that we forget the delight of discovery and from our environment.  </p>\n<p>"The simple, innocent view of the world that is experienced by the child - a world that has seen physical, cultural and spiritual elements eroded.  The traditional narratives I grew up with, became myths and legends to having no meaning or relevance in the context of the \'modern\' world ... But with my learning of te reo, I have gone back to my childhood and those narratives to discover that their context and relevance were of significance in the world that existed then.  And with this discovery I am able to experience again the environment that I am in, with my renewed perspective.  </p>\n<p>"I am Māori, I am a descendent of the tribes of Waikato and Te Riu o Tūwharetoa, my maunga tapu are Pūtauaki and Taupiri.  My awa tapu are Waikato and Tarawera. My ancestors travelled across the Pacific, navigating by star and tide in the waka Tainui and Te Arawa, to their landing places of Whangaparaoa and Maketū.  </p>\n<p>"These narratives were taught to me as a child along with the practices of my people that ensured their physical and spiritual well-being - kai tiākitanga ... guardianship of resources that would be preserved for future generations.  In essence, by allowing myself to view my environment with \'the eyes of a child\' once again, the \'distant horizon\' (goals, responsibilities) became clearer"</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(111, 8, 20, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:10:58', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">Take this burden from my shoulders that I may carry a child. He will see the distant horizons that we will achieve together.</p>\n<p>The project goal was to take a Maori writing, and working directly with the author create two typographic artworks which resonated with the story. </p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(112, 8, 21, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:11:16', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">Take this burden from my shoulders that I may carry a child. He will see the distant horizons that we will achieve together.</p>\n<p>The project goal was to take a Maori writing, and working directly with the author create two typographic artworks which resonated with the story. </p>\n<p>The author wrote the following to describe the writing, and guide my design:</p>\n<p>"As adults, we live in a modern world of cumbersome obligations and responsibilities that simply have us exist in, rather than allow ourselves to experience our environment.  We lose sight of the fact that our first responsibility is the protection of this environment for future generations.  We allow ourselves to be weighted with our perception of success and failure that we forget the delight of discovery and from our environment.  </p>\n<p>"The simple, innocent view of the world that is experienced by the child - a world that has seen physical, cultural and spiritual elements eroded.  The traditional narratives I grew up with, became myths and legends to having no meaning or relevance in the context of the \'modern\' world ... But with my learning of te reo, I have gone back to my childhood and those narratives to discover that their context and relevance were of significance in the world that existed then.  And with this discovery I am able to experience again the environment that I am in, with my renewed perspective.  </p>\n<p>"I am Māori, I am a descendent of the tribes of Waikato and Te Riu o Tūwharetoa, my maunga tapu are Pūtauaki and Taupiri.  My awa tapu are Waikato and Tarawera. My ancestors travelled across the Pacific, navigating by star and tide in the waka Tainui and Te Arawa, to their landing places of Whangaparaoa and Maketū.  </p>\n<p>"These narratives were taught to me as a child along with the practices of my people that ensured their physical and spiritual well-being - kai tiākitanga ... guardianship of resources that would be preserved for future generations.  In essence, by allowing myself to view my environment with \'the eyes of a child\' once again, the \'distant horizon\' (goals, responsibilities) became clearer"</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(113, 7, 10, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:13:52', '2015-10-24 05:03:55', 'exhibit', 'Exhibit', NULL, '<p>The technological innovations of the past 10 – 20 years have made us change how we find information, how we interact, and what we expect of products and services. It has been predicted that newspapers and traditional news media will not survive the next 15 years, but I wanted to prove that there is still a place in our future for news media in print and digital formats. </p>\n<p>The need for interaction and control is something born out of using the internet, and is something that must be taken into account. Splitting the news up into sections to entertain and inform based on the readers interests seems like an obvious solution to suit our changed lifestyles. We can enjoy and appreciate things we’re interested in and care about, in a well designed physical print format that reduces the amount of wasted resources. My solutions used together will create a cohesive service to inform, educate, entertain and update in an efficient way.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(114, 9, 5, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:27:57', '2015-10-24 05:04:37', 'road-to-recovery', 'Road to Recovery', NULL, NULL, NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6);
INSERT INTO `SiteTree_versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `AuthorID`, `PublisherID`, `ClassName`, `LastEdited`, `Created`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `ParentID`) VALUES
(115, 9, 6, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:31:44', '2015-10-24 05:04:37', 'road-to-recovery', 'Road to Recovery', NULL, '<p>For our last project of the year we opted to work on a collaborative 3 minute animation piece for CERA, the Christchurch Earthquake Recovery Authority.</p>\n<p>Having been supplied with the brief, the aim was to visually communicate the story of community wellbeing, from disaster response to recovery and the general support of the Christchurch residents.  In displaying this key information we decided to use the more human, expressive approach of stop motion revolving around the story of a character and his experience’s post earthquake; deciding the animation would follow a story. Our choice of materials reflects the nature of the message we wanted to convey; a raw and genuine warmth to an otherwise cold and serious subject. We chose to use paper with its creases and imperfections to express the feeling of the story. The paper is very effective in portraying the story based feeling, giving it a depth of feeling and a genuineness that would be lacking in a purely digital animation. Our chosen audio adds to this impression with the natural, human sounding acoustic music combined with the realistic sounds of life on top, it’s effective in supporting the visuals throughout the story.</p>\n<p>For the short time we had and having worked together before we were familiar with each others working styles and used this to our advantage. As a result the project came together really well. In both of our cases, as a first time for stop motion animation, majority of the time we were learning on the project and as we progressed the models and techniques became more sophisticated; this tied in well with the unfolding journey of our main character. The idea behind having him as a continual feature within the animation was to allow the viewer to follow the story and to be able to identify with him through their own experiences.</p>\n<p>In our final video all of our research, ideas and working is put into effect. Keeping a workbook and making to do lists helped to downsize the scale of the project into more manageable sections. Given more time, a budget and better resources we would have been able to experiment further with areas like lighting and more complex animation techniques.</p>\n<p>Overall given the scale of the project and the restrictions we faced, we are both proud of our achievements and our persevering creative problem solving. Three words- Double. Sided. Tape.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(116, 9, 7, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:34:28', '2015-10-24 05:04:37', 'road-to-recovery', 'Road to Recovery', NULL, '<p class="lead">The aim of this project was to visually communicate the story of community wellbeing following the disastrous Christchurch earthquakes.</p>\n<p>We created a video for CERA, the Christchurch Earthquake Recovery Authority, to use in house and promotionally to spread the message of all that\'s being done for affected communities. From disaster response to recovery and the general support of the Christchurch residents.</p>\n<p>  In displaying this key information we decided to use the more human, expressive approach of stop motion revolving around the story of a character and his experience’s post earthquake; deciding the animation would follow a story. Our choice of materials reflects the nature of the message we wanted to convey; a raw and genuine warmth to an otherwise cold and serious subject. We chose to use paper with its creases and imperfections to express the feeling of the story. The paper is very effective in portraying the story based feeling, giving it a depth of feeling and a genuineness that would be lacking in a purely digital animation. Our chosen audio adds to this impression with the natural, human sounding acoustic music combined with the realistic sounds of life on top, it’s effective in supporting the visuals throughout the story.</p>\n<p>For the short time we had and having worked together before we were familiar with each others working styles and used this to our advantage. As a result the project came together really well. In both of our cases, as a first time for stop motion animation, majority of the time we were learning on the project and as we progressed the models and techniques became more sophisticated; this tied in well with the unfolding journey of our main character. The idea behind having him as a continual feature within the animation was to allow the viewer to follow the story and to be able to identify with him through their own experiences.</p>\n<p>In our final video all of our research, ideas and working is put into effect. Keeping a workbook and making to do lists helped to downsize the scale of the project into more manageable sections. Given more time, a budget and better resources we would have been able to experiment further with areas like lighting and more complex animation techniques.</p>\n<p>Overall given the scale of the project and the restrictions we faced, we are both proud of our achievements and our persevering creative problem solving. Three words- Double. Sided. Tape.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(117, 9, 8, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:35:04', '2015-10-24 05:04:37', 'road-to-recovery', 'Road to Recovery', NULL, '<p class="lead">The aim of this project was to visually communicate the story of community wellbeing following the disastrous Christchurch earthquakes.</p>\n<p>Collaborating with a friend, we created a video for CERA, the Christchurch Earthquake Recovery Authority, to use in house and promotionally to spread the message of all that\'s being done for affected communities. From disaster response to recovery and the general support of the Christchurch residents.</p>\n<p>  In displaying this key information we decided to use the more human, expressive approach of stop motion revolving around the story of a character and his experience’s post earthquake; deciding the animation would follow a story. Our choice of materials reflects the nature of the message we wanted to convey; a raw and genuine warmth to an otherwise cold and serious subject. We chose to use paper with its creases and imperfections to express the feeling of the story. The paper is very effective in portraying the story based feeling, giving it a depth of feeling and a genuineness that would be lacking in a purely digital animation. Our chosen audio adds to this impression with the natural, human sounding acoustic music combined with the realistic sounds of life on top, it’s effective in supporting the visuals throughout the story.</p>\n<p>For the short time we had and having worked together before we were familiar with each others working styles and used this to our advantage. As a result the project came together really well. In both of our cases, as a first time for stop motion animation, majority of the time we were learning on the project and as we progressed the models and techniques became more sophisticated; this tied in well with the unfolding journey of our main character. The idea behind having him as a continual feature within the animation was to allow the viewer to follow the story and to be able to identify with him through their own experiences.</p>\n<p>In our final video all of our research, ideas and working is put into effect. Keeping a workbook and making to do lists helped to downsize the scale of the project into more manageable sections. Given more time, a budget and better resources we would have been able to experiment further with areas like lighting and more complex animation techniques.</p>\n<p>Overall given the scale of the project and the restrictions we faced, we are both proud of our achievements and our persevering creative problem solving. Three words- Double. Sided. Tape.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(118, 9, 9, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:36:04', '2015-10-24 05:04:37', 'road-to-recovery', 'Road to Recovery', NULL, '<p class="lead">The aim of this project was to visually communicate the story of community wellbeing following the disastrous Christchurch earthquakes.</p>\n<p>Collaborating with a friend, we created a video for CERA, the Christchurch Earthquake Recovery Authority, to use in house and promotionally to spread the message of all that\'s being done for affected communities. From disaster response to recovery and the general support of the Christchurch residents.</p>\n<p>  In displaying this key information we decided to use the more human, expressive approach of stop motion revolving around the story of a character and his experience’s post earthquake; deciding the animation would follow a story. Our choice of materials reflects the nature of the message we wanted to convey; a raw and genuine warmth to an otherwise cold and serious subject. We chose to use paper with its creases and imperfections to express the feeling of the story. Paper is very effective in portraying the story based feeling, giving it a depth and authenticity that would be lacking in a purely digital animation. Our chosen audio adds to this impression with the natural, human sounding acoustic music combined with the realistic sounds of life on top, it’s effective in supporting the visuals throughout the story.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(119, 11, 5, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:47:40', '2015-10-24 05:05:58', 'matsons', 'Matsons', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(120, 11, 6, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:47:52', '2015-10-24 05:05:58', 'matsons', 'Matsons', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(121, 11, 7, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:48:30', '2015-10-24 05:05:58', 'matsons', 'Matsons', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(122, 11, 8, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:48:45', '2015-10-24 05:05:58', 'matsons', 'Matsons', NULL, NULL, NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(123, 10, 5, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:55:06', '2015-10-24 05:05:42', 'playtime', 'Playtime', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(124, 10, 6, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:59:50', '2015-10-24 05:05:42', 'playtime', 'Playtime', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(125, 10, 7, 1, 1, 1, 'PortfolioPage', '2016-01-19 09:59:58', '2015-10-24 05:05:42', 'playtime', 'Playtime', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(126, 10, 8, 1, 1, 1, 'PortfolioPage', '2016-01-19 10:02:09', '2015-10-24 05:05:42', 'playtime', 'Playtime', NULL, NULL, NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(127, 13, 4, 1, 1, 1, 'PortfolioPage', '2016-01-19 10:05:07', '2015-10-24 05:06:23', 'ascot-angiography', 'Ascot Angiography', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(128, 13, 5, 1, 1, 1, 'PortfolioPage', '2016-01-19 10:05:52', '2015-10-24 05:06:23', 'ascot-angiography', 'Ascot Angiography', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(129, 13, 6, 1, 1, 1, 'PortfolioPage', '2016-01-19 10:12:39', '2015-10-24 05:06:23', 'ascot-angiography', 'Ascot Angiography', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(130, 13, 7, 1, 1, 1, 'PortfolioPage', '2016-01-19 10:13:14', '2015-10-24 05:06:23', 'ascot-angiography', 'Ascot Angiography', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(131, 30, 4, 1, 1, 1, 'PortfolioPage', '2016-01-19 10:15:38', '2016-01-18 12:52:50', 'reflections', 'Reflections', NULL, NULL, NULL, NULL, 1, 1, 18, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(132, 31, 3, 1, 1, 1, 'PortfolioPage', '2016-01-19 10:23:38', '2016-01-18 12:55:44', 'plains-fm', 'Plains FM', NULL, NULL, NULL, NULL, 1, 1, 19, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(133, 31, 4, 1, 1, 1, 'PortfolioPage', '2016-01-19 10:23:49', '2016-01-18 12:55:44', 'plains-fm', 'Plains FM', NULL, NULL, NULL, NULL, 1, 1, 19, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(134, 32, 3, 1, 1, 1, 'PortfolioPage', '2016-01-19 10:42:07', '2016-01-18 13:07:39', 'treshna', 'Treshna', NULL, NULL, NULL, NULL, 1, 1, 20, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(135, 32, 4, 1, 1, 1, 'PortfolioPage', '2016-01-19 10:42:36', '2016-01-18 13:07:39', 'treshna', 'Treshna', NULL, NULL, NULL, NULL, 1, 1, 20, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(136, 32, 5, 1, 1, 1, 'PortfolioPage', '2016-01-19 10:49:38', '2016-01-18 13:07:39', 'treshna', 'Treshna', NULL, NULL, NULL, NULL, 1, 1, 20, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(137, 32, 6, 1, 1, 1, 'PortfolioPage', '2016-01-19 10:53:03', '2016-01-18 13:07:39', 'treshna', 'Treshna', NULL, NULL, NULL, NULL, 1, 1, 20, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(138, 7, 11, 1, 1, 1, 'PortfolioPage', '2016-01-19 11:53:43', '2015-10-24 05:03:55', 'exhibit', 'Exhibit', NULL, '<p>The technological innovations of the past 10 – 20 years have made us change how we find information, how we interact, and what we expect of products and services. It has been predicted that newspapers and traditional news media will not survive the next 15 years, but I wanted to prove that there is still a place in our future for news media in print and digital formats. </p>\n<p>The need for interaction and control is something born out of using the internet, and is something that must be taken into account. Splitting the news up into sections to entertain and inform based on the readers interests seems like an obvious solution to suit our changed lifestyles. We can enjoy and appreciate things we’re interested in and care about, in a well designed physical print format that reduces the amount of wasted resources. My solutions used together will create a cohesive service to inform, educate, entertain and update in an efficient way.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(139, 7, 12, 1, 1, 1, 'PortfolioPage', '2016-01-19 11:59:20', '2015-10-24 05:03:55', 'exhibit', 'Exhibit', NULL, '<p>The technological innovations of the past 10–20 years have made us change how we find information, how we interact, and what we expect of products and services. It\'s been predicted that newspapers and traditional news media will not survive the next 15 years. I wanted to prove that there is still a place in our future for news media in print and digital formats. </p>\n<p>The need for interaction and control is something born out of using the internet, and is something that must be taken into account. Splitting the news up into sections to entertain and inform based on the readers interests seems like an obvious solution to suit our changed lifestyles. We can enjoy and appreciate things we’re interested in and care about, in a well designed physical print format that reduces the amount of wasted resources. My solutions used together will create a cohesive service to inform, educate, entertain and update in an efficient way.</p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(140, 7, 13, 1, 1, 1, 'PortfolioPage', '2016-01-19 12:11:48', '2015-10-24 05:03:55', 'exhibit', 'Exhibit', NULL, '<p>The technological innovations of the past 10–20 years have made us change how we find information, how we interact, and what we expect of products and services. It\'s been predicted that newspapers and traditional news media will not survive the next 15 years. I wanted to prove that there is still a place for news media in print and digital formats. </p>\n<p>In todays technology driven age, we all desire total control over all of our devices and media platforms. It\'s no longer acceptable to sit back and simply accept what we\'re given. The level of customisation available in every facet of our lives is growing by the day. </p>\n<p>This led me to think of a new approach to news media. Where instead of having the same information repeated across all platforms, instead the user has control over a print magazine, a website, and an app, choosing relevant topics for the platforms and being served content to fit the purpose. The web platform will have up to the minute news and events with some long form pieces for developing stories. The app allows for tiny bitesize pieces and breaking news updates. And finally, the print magazine is broken into topics which are more heavily interest focused. These can be opted in or out of, so you only get what you\'re interested in. </p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(141, 8, 22, 1, 1, 1, 'PortfolioPage', '2016-01-19 12:12:35', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">Take this burden from my shoulders that I may carry a child. He will see the distant horizons that we will achieve together.</p>\n<p>The project goal was to take a Maori writing, and working directly with the author create two typographic artworks which resonated with the story. </p>\n<p>The author wrote the following to describe the writing and help guide my design:</p>\n<p>"As adults, we live in a modern world of cumbersome obligations and responsibilities that simply have us exist in, rather than allow ourselves to experience our environment.  We lose sight of the fact that our first responsibility is the protection of this environment for future generations.  We allow ourselves to be weighted with our perception of success and failure that we forget the delight of discovery and from our environment.  </p>\n<p>"The simple, innocent view of the world that is experienced by the child - a world that has seen physical, cultural and spiritual elements eroded.  The traditional narratives I grew up with, became myths and legends to having no meaning or relevance in the context of the \'modern\' world ... But with my learning of te reo, I have gone back to my childhood and those narratives to discover that their context and relevance were of significance in the world that existed then.  And with this discovery I am able to experience again the environment that I am in, with my renewed perspective.  </p>\n<p>"I am Māori, I am a descendent of the tribes of Waikato and Te Riu o Tūwharetoa, my maunga tapu are Pūtauaki and Taupiri.  My awa tapu are Waikato and Tarawera. My ancestors travelled across the Pacific, navigating by star and tide in the waka Tainui and Te Arawa, to their landing places of Whangaparaoa and Maketū.  </p>\n<p>"These narratives were taught to me as a child along with the practices of my people that ensured their physical and spiritual well-being - kai tiākitanga ... guardianship of resources that would be preserved for future generations.  In essence, by allowing myself to view my environment with \'the eyes of a child\' once again, the \'distant horizon\' (goals, responsibilities) became clearer"</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(142, 8, 23, 1, 1, 1, 'PortfolioPage', '2016-01-19 12:12:45', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead"><span style="font-family: &#039;Maisonneue Book&#039;, &#039;Helvetica Neue&#039;, Helvetica, Arial, sans-serif; font-size: 13px;">The project goal was to take a Maori writing, and working directly with the author create two typographic artworks which resonated with the story. </span></p>\n<p>The author wrote the following to describe the writing and help guide my design:</p>\n<p>"As adults, we live in a modern world of cumbersome obligations and responsibilities that simply have us exist in, rather than allow ourselves to experience our environment.  We lose sight of the fact that our first responsibility is the protection of this environment for future generations.  We allow ourselves to be weighted with our perception of success and failure that we forget the delight of discovery and from our environment.  </p>\n<p>"The simple, innocent view of the world that is experienced by the child - a world that has seen physical, cultural and spiritual elements eroded.  The traditional narratives I grew up with, became myths and legends to having no meaning or relevance in the context of the \'modern\' world ... But with my learning of te reo, I have gone back to my childhood and those narratives to discover that their context and relevance were of significance in the world that existed then.  And with this discovery I am able to experience again the environment that I am in, with my renewed perspective.  </p>\n<p>"I am Māori, I am a descendent of the tribes of Waikato and Te Riu o Tūwharetoa, my maunga tapu are Pūtauaki and Taupiri.  My awa tapu are Waikato and Tarawera. My ancestors travelled across the Pacific, navigating by star and tide in the waka Tainui and Te Arawa, to their landing places of Whangaparaoa and Maketū.  </p>\n<p>"These narratives were taught to me as a child along with the practices of my people that ensured their physical and spiritual well-being - kai tiākitanga ... guardianship of resources that would be preserved for future generations.  In essence, by allowing myself to view my environment with \'the eyes of a child\' once again, the \'distant horizon\' (goals, responsibilities) became clearer"</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(143, 8, 24, 1, 1, 1, 'PortfolioPage', '2016-01-19 12:13:19', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p>The project goal was to take a Maori writing, and working directly with the author create two typographic artworks which resonated with the story.</p>\n<p>The author wrote the following to describe the writing and help guide my design:</p>\n<p>"As adults, we live in a modern world of cumbersome obligations and responsibilities that simply have us exist in, rather than allow ourselves to experience our environment.  We lose sight of the fact that our first responsibility is the protection of this environment for future generations.  We allow ourselves to be weighted with our perception of success and failure that we forget the delight of discovery and from our environment.  </p>\n<p>"The simple, innocent view of the world that is experienced by the child - a world that has seen physical, cultural and spiritual elements eroded.  The traditional narratives I grew up with, became myths and legends to having no meaning or relevance in the context of the \'modern\' world ... But with my learning of te reo, I have gone back to my childhood and those narratives to discover that their context and relevance were of significance in the world that existed then.  And with this discovery I am able to experience again the environment that I am in, with my renewed perspective.  </p>\n<p>"I am Māori, I am a descendent of the tribes of Waikato and Te Riu o Tūwharetoa, my maunga tapu are Pūtauaki and Taupiri.  My awa tapu are Waikato and Tarawera. My ancestors travelled across the Pacific, navigating by star and tide in the waka Tainui and Te Arawa, to their landing places of Whangaparaoa and Maketū.  </p>\n<p>"These narratives were taught to me as a child along with the practices of my people that ensured their physical and spiritual well-being - kai tiākitanga ... guardianship of resources that would be preserved for future generations.  In essence, by allowing myself to view my environment with \'the eyes of a child\' once again, the \'distant horizon\' (goals, responsibilities) became clearer"</p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(144, 8, 25, 1, 1, 1, 'PortfolioPage', '2016-01-19 12:14:46', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p>The project goal was to take a Maori writing, and working directly with the author create two typographic artworks which resonated with the story.</p>\n<p>The author wrote the following to describe the writing and help guide my design:</p>\n<p>"As adults, we live in a modern world of cumbersome obligations and responsibilities that simply have us exist in, rather than allow ourselves to experience our environment.  We lose sight of the fact that our first responsibility is the protection of this environment for future generations.  We allow ourselves to be weighted with our perception of success and failure that we forget the delight of discovery and from our environment.  </p>\n<p>"The simple, innocent view of the world that is experienced by the child - a world that has seen physical, cultural and spiritual elements eroded.  The traditional narratives I grew up with, became myths and legends to having no meaning or relevance in the context of the \'modern\' world ... But with my learning of te reo, I have gone back to my childhood and those narratives to discover that their context and relevance were of significance in the world that existed then.  And with this discovery I am able to experience again the environment that I am in, with my renewed perspective.  </p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(145, 8, 26, 1, 1, 1, 'PortfolioPage', '2016-01-19 12:14:59', '2015-10-24 05:04:11', 'my-word-is-yours', 'My Word Is Yours', NULL, '<p class="lead">The project goal was to take a Maori writing, and working directly with the author create two typographic artworks which resonated with the story.</p>\n<p>The author wrote the following to describe the writing and help guide my design:</p>\n<p>"As adults, we live in a modern world of cumbersome obligations and responsibilities that simply have us exist in, rather than allow ourselves to experience our environment.  We lose sight of the fact that our first responsibility is the protection of this environment for future generations.  We allow ourselves to be weighted with our perception of success and failure that we forget the delight of discovery and from our environment.  </p>\n<p>"The simple, innocent view of the world that is experienced by the child - a world that has seen physical, cultural and spiritual elements eroded.  The traditional narratives I grew up with, became myths and legends to having no meaning or relevance in the context of the \'modern\' world ... But with my learning of te reo, I have gone back to my childhood and those narratives to discover that their context and relevance were of significance in the world that existed then.  And with this discovery I am able to experience again the environment that I am in, with my renewed perspective.  </p>', NULL, NULL, 1, 1, 2, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(146, 32, 7, 1, 1, 1, 'PortfolioPage', '2016-01-19 12:15:27', '2016-01-18 13:07:39', 'treshna', 'Treshna', NULL, NULL, NULL, NULL, 1, 1, 20, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(147, 32, 8, 1, 1, 1, 'PortfolioPage', '2016-01-19 12:21:50', '2016-01-18 13:07:39', 'treshna', 'Treshna', NULL, '<p class="lead">Treshna Enterprises required a redesign to their website, which would portray them as a modern, innovative and exciting company.</p>\n<p>It was important the website communicate clearly the business services and goals so that a visitor knows exactly what Treshna does the moment they arrive. A short company story was also placed front and centre. By understanding the target audience we knew the importance of a local team with history and commitment to quality. </p>\n<p>The design was successful through its use of bold typography, vivid imagery, and designing with a clear purpose and audience in mind.</p>\n<p> </p>', NULL, NULL, 1, 1, 20, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(148, 32, 9, 1, 1, 1, 'PortfolioPage', '2016-01-19 12:23:01', '2016-01-18 13:07:39', 'treshna', 'Treshna', NULL, '<p class="lead">Treshna Enterprises required a redesign of their website to portray them as a modern, innovative and exciting local company.</p>\n<p>It was important the website communicate clearly the business services and goals so that a visitor knows exactly what Treshna does the moment they arrive. A short company story was also placed front and centre. By understanding the target audience we knew the importance of a local team with history and commitment to quality. </p>\n<p>The design was successful through its use of bold typography, vivid imagery, and designing with a clear purpose and audience in mind.</p>\n<p> </p>', NULL, NULL, 1, 1, 20, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(149, 32, 10, 1, 1, 1, 'PortfolioPage', '2016-01-20 10:05:59', '2016-01-18 13:07:39', 'treshna', 'Treshna', NULL, '<p class="lead">Treshna Enterprises required a redesign of their website to portray them as a modern, innovative and exciting local company.</p>\n<p>It was important the website communicate clearly the business services and goals so that a visitor knows exactly what Treshna does the moment they arrive. A short company story was also placed front and centre. By understanding the target audience we knew the importance of a local team with history and commitment to quality. </p>\n<p>The design was successful through its use of bold typography, vivid imagery, and designing with a clear purpose and audience in mind.</p>', NULL, NULL, 1, 1, 20, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(150, 10, 9, 1, 1, 1, 'PortfolioPage', '2016-01-20 10:12:54', '2015-10-24 05:05:42', 'playtime', 'Playtime', NULL, '<p class="lead">In a collaboration project, we were asked to create a poster for a special screening event in tribute to Playtime by Jacques Tati.</p>\n<p>We used a style that was playful and exciting, showing the feeling of being lost and made to feel small and insignificant in a big city. The graphical elements reflect plot points from the film, things like the icon, the landmarks of France and the hero with his pipe. </p>', NULL, NULL, 1, 1, 4, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(151, 11, 9, 1, 1, 1, 'PortfolioPage', '2016-01-20 10:48:13', '2015-10-24 05:05:58', 'matsons', 'Matsons', NULL, '<div class="page" title="Page 1">\n<div class="layoutArea">\n<div class="column">\n<p><span>This logo was designed in keeping with the core values of the company, which is to produce and provide high quality, fresh, New Zealand made beverages. I’ve used water symbolically throughout the rebrand as a symbol of freshness and purity. </span></p>\n<p><span>The graphical logo design reminiscent of a waterfall or </span><span>fountain, reinforcing Matson’s dedication to pure and fresh ingredients, </span><span>and the natural artesian water they use. </span></p>\n<p><span>The typography has been manipulated to reflect the </span><span>look and feel of water.</span><span> I used Grendel font as it’s dynamic and modern, while carrying confidence and a sense of heritage.</span></p>\n</div>\n</div>\n</div>', NULL, NULL, 1, 1, 5, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(152, 13, 8, 1, 1, 1, 'PortfolioPage', '2016-01-20 10:48:50', '2015-10-24 05:06:23', 'ascot-angiography', 'Ascot Angiography', NULL, NULL, NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(153, 13, 9, 1, 1, 1, 'PortfolioPage', '2016-01-20 10:54:46', '2015-10-24 05:06:23', 'ascot-angiography', 'Ascot Angiography', NULL, '<p>The logo is inspired by the intricate process of coronary stenting. <span>This involves a tiny balloon being inflated inside the artery to improve blood flow, by pushing open the blocked area. Both logo concepts took inspiration from the design of coronary stents which are like a matrix of thin metal, curled into a long cylinder. </span></p>\n<p><span>While these logos weren\'t accepted by the client in the end, they do show good exploration of an idea, and execution in an interesting way. </span></p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(154, 13, 10, 1, 1, 1, 'PortfolioPage', '2016-01-20 10:55:43', '2015-10-24 05:06:23', 'ascot-angiography', 'Ascot Angiography', NULL, '<p class="lead">Ascot Angiography is a private angiography theatre at Ascot Hospital.</p>\n<p>The logo is inspired by the intricate process of coronary stenting. <span>This involves a tiny balloon being inflated inside the artery to improve blood flow, by pushing open the blocked area. Both logo concepts took inspiration from the design of coronary stents which are like a matrix of thin metal, curled into a long cylinder. </span></p>\n<p><span>While these logos weren\'t accepted by the client in the end, they do show good exploration of an idea, and execution in an interesting way. </span></p>', NULL, NULL, 1, 1, 7, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(155, 14, 3, 1, 1, 1, 'PortfolioPage', '2016-01-20 11:08:23', '2015-10-24 05:06:34', 'way-to-play', 'Way to Play', NULL, NULL, NULL, NULL, 1, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(156, 14, 4, 1, 1, 1, 'PortfolioPage', '2016-01-20 11:18:59', '2015-10-24 05:06:34', 'way-to-play', 'Way to Play', NULL, '<p class="lead">Way to Play is a one-day introduction to playing with children on the Autism Spectrum.</p>\n<p>Playing with a child with autism can be challenging, so the Way to Play workshop offers simple, easy to use strategies to begin playing joyously together. </p>\n<p>The Way to Play website was created to be a supplementary tool for parents and caregivers after completing the one-day workshop. Parents and caregivers are able to engage with a community of like-minded people to share experiences, and get support and advice from peers. </p>\n<p>As part of the website, users are also able to contact the coaches directly with questions, and upload videos showing their efforts for more targeted help with their problems. This tool is invaluable for parents who have so often felt like they are on their own, and on a bad day have no one to turn to for support. </p>', NULL, NULL, 1, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(157, 14, 5, 1, 1, 1, 'PortfolioPage', '2016-01-20 11:22:11', '2015-10-24 05:06:34', 'way-to-play', 'Way to Play', NULL, '<p class="lead">Way to Play is a one-day introduction to playing with children on the Autism Spectrum.</p>\n<p>Playing with a child with autism can be challenging, so the Way to Play workshop offers simple, easy to use strategies to begin playing joyously together. </p>\n<p>The Way to Play website was created to be a supplementary tool for parents and caregivers after completing the one-day workshop. Parents and caregivers are able to engage with a community of like-minded people to share experiences, and get support and advice from peers. </p>\n<p>As part of the website, users are also able to contact the coaches directly with questions, and upload videos showing their efforts for more targeted help with their problems. This tool is invaluable for parents who have so often felt like they are on their own, and on a bad day have no one to turn to for support. </p>', NULL, NULL, 1, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(158, 14, 6, 1, 1, 1, 'PortfolioPage', '2016-01-20 11:30:11', '2015-10-24 05:06:34', 'way-to-play', 'Way to Play', NULL, '<p class="lead">Way to Play is a one-day introduction to playing with children on the Autism Spectrum.</p>\n<p>Playing with a child with autism can be challenging, so the Way to Play workshop offers simple, easy to use strategies to begin playing joyously together. </p>\n<p>The Way to Play website was created to be a supplementary tool for parents and caregivers after completing the one-day workshop. Parents and caregivers are able to engage with a community of like-minded people to share experiences, and get support and advice from peers. </p>\n<p>As part of the website, users are also able to contact the coaches directly with questions, and upload videos showing their efforts for more targeted help with their problems. This tool is invaluable for parents who have so often felt like they are on their own, and on a bad day have no one to turn to for support. </p>', NULL, NULL, 1, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(159, 15, 3, 1, 1, 1, 'PortfolioPage', '2016-01-20 11:33:13', '2015-10-24 05:06:59', 'dig-my-idea', 'Dig My Idea', NULL, NULL, NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(160, 15, 4, 1, 1, 1, 'PortfolioPage', '2016-01-20 11:34:34', '2015-10-24 05:06:59', 'dig-my-idea', 'Dig My Idea', NULL, '<p>DIGMYIDEA is the Māori Innovation Challenge and your chance to submit a digital business idea that has the potential to go global.</p>\n<p> </p>', NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(161, 15, 5, 1, 1, 1, 'PortfolioPage', '2016-01-20 11:38:33', '2015-10-24 05:06:59', 'dig-my-idea', 'Dig My Idea', NULL, '<p>DIGMYIDEA is the Māori Innovation Challenge and your chance to submit a digital business idea that has the potential to go global.</p>\n<p> </p>', NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(162, 15, 6, 1, 1, 1, 'PortfolioPage', '2016-01-20 11:38:46', '2015-10-24 05:06:59', 'dig-my-idea', 'Dig My Idea', NULL, '<p>DIGMYIDEA is the Māori Innovation Challenge and your chance to submit a digital business idea that has the potential to go global.</p>\n<p> </p>', NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(163, 15, 7, 1, 1, 1, 'PortfolioPage', '2016-01-20 11:52:40', '2015-10-24 05:06:59', 'dig-my-idea', 'Dig My Idea', NULL, '<p>Our brief was to create a website that communicates extreme digital innovation, and combining this with Maori iconography.</p>\n<p>With the branding and image treatments already defined, I expanded on those ideas by creating repeating graphics of kowhaiwhai, and opting for a gradual colour change as the user scrolls. With these simple effects I was able to make the site feel quite cutting edge and fresh, but still hold onto some Maori influence through subtle patterns.</p>', NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(164, 15, 8, 1, 1, 1, 'PortfolioPage', '2016-01-20 11:53:21', '2015-10-24 05:06:59', 'dig-my-idea', 'Dig My Idea', NULL, '<p>DIGMYIDEA is the Māori Innovation Challenge, and peoples chance to submit a digital business idea that has the potential to go global.</p>\n<p>Our brief was to create a website that communicates extreme digital innovation, and combining this with Maori iconography.</p>\n<p>With the branding and image treatments already defined, I expanded on those ideas by creating repeating graphics of kowhaiwhai, and opting for a gradual colour change as the user scrolls. With these simple effects I was able to make the site feel quite cutting edge and fresh, but still hold onto some Maori influence through subtle patterns.</p>', NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(165, 15, 9, 1, 1, 1, 'PortfolioPage', '2016-01-20 11:53:32', '2015-10-24 05:06:59', 'dig-my-idea', 'Dig My Idea', NULL, '<p>DIGMYIDEA is the Māori Innovation Challenge, and presented people with a chance to submit a digital business idea that has the potential to go global.</p>\n<p>Our brief was to create a website that communicates extreme digital innovation, and combining this with Maori iconography.</p>\n<p>With the branding and image treatments already defined, I expanded on those ideas by creating repeating graphics of kowhaiwhai, and opting for a gradual colour change as the user scrolls. With these simple effects I was able to make the site feel quite cutting edge and fresh, but still hold onto some Maori influence through subtle patterns.</p>', NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(166, 32, 11, 1, 1, 1, 'PortfolioPage', '2016-01-20 12:24:07', '2016-01-18 13:07:39', 'treshna', 'Treshna', NULL, '<p class="lead">Treshna Enterprises required a redesign of their website to portray them as a modern, innovative and exciting local company.</p>\n<p>It was important the website communicate clearly the business services and goals so that a visitor knows exactly what Treshna does the moment they arrive. A short company story was also placed front and centre. By understanding the target audience we knew the importance of a local team with history and commitment to quality. </p>\n<p>The design was successful through its use of bold typography, vivid imagery, and designing with a clear purpose and audience in mind.</p>', NULL, NULL, 1, 1, 20, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(167, 9, 10, 1, 1, 1, 'PortfolioPage', '2016-01-20 12:25:59', '2015-10-24 05:04:37', 'road-to-recovery', 'Road to Recovery', NULL, '<p class="lead">The aim of this project was to visually communicate the story of community wellbeing following the disastrous Christchurch earthquakes.</p>\n<p>Collaborating with a friend, we created a video for CERA, the Christchurch Earthquake Recovery Authority, to use in house and promotionally to spread the message of all that\'s being done for affected communities. From disaster response to recovery and the general support of the Christchurch residents.</p>\n<p>  In displaying this key information we decided to use the more human, expressive approach of stop motion revolving around the story of a character and his experience’s post earthquake; deciding the animation would follow a story. Our choice of materials reflects the nature of the message we wanted to convey; a raw and genuine warmth to an otherwise cold and serious subject. We chose to use paper with its creases and imperfections to express the feeling of the story. Paper is very effective in portraying the story based feeling, giving it a depth and authenticity that would be lacking in a purely digital animation. Our chosen audio adds to this impression with the natural, human sounding acoustic music combined with the realistic sounds of life on top, it’s effective in supporting the visuals throughout the story.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(168, 12, 4, 1, 1, 1, 'PortfolioPage', '2016-01-21 08:17:45', '2015-10-24 05:06:12', 'religion-tequila', 'Religion Tequila', NULL, NULL, NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(169, 12, 5, 1, 1, 1, 'PortfolioPage', '2016-01-26 08:00:49', '2015-10-24 05:06:12', 'religion-tequila', 'Religion Tequila', NULL, '<p>Our plan was monastically simple: use only the finest organic ingredients in a patient, natural process, allowing the true flavor of the blue agave to travel from the Amatitán valley all the way to our bottle, on the shelf before your eyes or the hands of a skilled mixologist, and into the glass wrapped in your fingers.</p>', NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(170, 12, 6, 1, 1, 1, 'PortfolioPage', '2016-01-26 08:02:33', '2015-10-24 05:06:12', 'religion-tequila', 'Religion Tequila', NULL, '<p>Our plan was monastically simple: use only the finest organic ingredients in a patient, natural process, allowing the true flavor of the blue agave to travel from the Amatitán valley all the way to our bottle, on the shelf before your eyes or the hands of a skilled mixologist, and into the glass wrapped in your fingers.</p>', NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(171, 29, 9, 1, 1, 1, 'PortfolioPage', '2016-01-26 08:03:45', '2015-10-24 05:03:55', 'lifes-a-gamble', 'Life\'s a Gamble', NULL, NULL, NULL, NULL, 1, 1, 10, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(172, 31, 5, 1, 1, 1, 'PortfolioPage', '2016-01-26 08:03:50', '2016-01-18 12:55:44', 'plains-fm', 'Plains FM', NULL, NULL, NULL, NULL, 1, 1, 11, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(173, 30, 5, 1, 1, 1, 'PortfolioPage', '2016-01-26 08:03:57', '2016-01-18 12:52:50', 'reflections', 'Reflections', NULL, NULL, NULL, NULL, 1, 1, 12, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(174, 32, 12, 1, 1, 1, 'PortfolioPage', '2016-01-26 08:04:02', '2016-01-18 13:07:39', 'treshna', 'Treshna', NULL, '<p class="lead">Treshna Enterprises required a redesign of their website to portray them as a modern, innovative and exciting local company.</p>\n<p>It was important the website communicate clearly the business services and goals so that a visitor knows exactly what Treshna does the moment they arrive. A short company story was also placed front and centre. By understanding the target audience we knew the importance of a local team with history and commitment to quality. </p>\n<p>The design was successful through its use of bold typography, vivid imagery, and designing with a clear purpose and audience in mind.</p>', NULL, NULL, 1, 1, 13, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(175, 16, 3, 1, 1, 1, 'PortfolioPage', '2016-01-26 08:06:32', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, NULL, NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(176, 16, 4, 1, 1, 1, 'PortfolioPage', '2016-01-26 08:06:48', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, NULL, NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(177, 16, 5, 1, 1, 1, 'PortfolioPage', '2016-01-26 08:09:43', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, NULL, NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(178, 16, 6, 1, 1, 1, 'PortfolioPage', '2016-01-26 09:50:14', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, NULL, NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(179, 16, 7, 1, 1, 1, 'PortfolioPage', '2016-01-26 10:07:15', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, '<p>To launch Line 7 Frontier into the United States, we created a highly-responsive web experience integrating bold campaign commercial content. Visitors are encouraged to explore the product range, and to go “Into the Wonder”. Line 7 Frontier now has all the tools to become globally-recognised for engineered and intrepid adventure design.</p>', NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(180, 16, 8, 1, 1, 1, 'PortfolioPage', '2016-01-26 10:07:34', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, '<p class="lead">To launch Line 7 Frontier into the United States, we created a highly-responsive web experience integrating bold campaign commercial content.</p>\n<p>Visitors are encouraged to explore the product range, and to go “Into the Wonder”. Line 7 Frontier now has all the tools to become globally-recognised for engineered and intrepid adventure design.</p>', NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(181, 16, 9, 1, 1, 1, 'PortfolioPage', '2016-01-26 10:09:54', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, '<p class="lead">To launch Line 7 Frontier into the United States, we created a highly-responsive web experience integrating bold campaign commercial content.</p>\n<p>Visitors are encouraged to explore the product range, and to go “Into the Wonder”. Products feature rich lifestyle imagery, and 360° rotating  shots to show the products from all angles. </p>\n<p> </p>\n<p>Line 7 Frontier now has all the tools to become globally-recognised for engineered and intrepid adventure design.</p>', NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(182, 16, 10, 1, 1, 1, 'PortfolioPage', '2016-01-26 10:10:23', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, '<p class="lead">To launch Line 7 Frontier into the United States, we created a highly-responsive web experience integrating bold campaign commercial content.</p>\n<p>Visitors are encouraged to explore the product range, and to go “Into the Wonder”. Products feature rich lifestyle imagery, and 360° rotating  shots to show the products from all angles. </p>\n<p> Line 7 Frontier now has all the tools to become globally-recognised for engineered and intrepid adventure design.</p>', NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(183, 16, 11, 1, 1, 1, 'PortfolioPage', '2016-01-26 10:18:29', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, '<p class="lead">To launch Line 7 Frontier into the United States, we created a highly-responsive web experience integrating bold campaign commercial content.</p>\n<p>Visitors are encouraged to explore the product range, and to go “Into the Wonder”. Products feature rich lifestyle imagery, and 360° rotating  shots to show the products from all angles. </p>\n<p> Line 7 Frontier now has all the tools to become globally-recognised for engineered and intrepid adventure design.</p>', NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(184, 16, 12, 1, 1, 1, 'PortfolioPage', '2016-01-26 10:28:17', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, '<p class="lead">To launch Line 7 Frontier into the United States, we created a highly-responsive web experience integrating bold campaign commercial content.</p>\n<p>Visitors are encouraged to explore the product range, and to go “Into the Wonder”. Products feature rich lifestyle imagery, and 360° rotating  shots to show the products from all angles. </p>\n<p> Line 7 Frontier now has all the tools to become globally-recognised for engineered and intrepid adventure design.</p>', NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(185, 16, 13, 1, 1, 1, 'PortfolioPage', '2016-01-26 10:29:49', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, '<p class="lead">To launch Line 7 Frontier into the United States, we created a highly-responsive web experience integrating bold campaign commercial content.</p>\n<p>Visitors are encouraged to explore the product range, and to go “Into the Wonder”. Products feature rich lifestyle imagery, and 360° rotating  shots to show the products from all angles. </p>\n<p> Line 7 Frontier now has all the tools to become globally-recognised for engineered and intrepid adventure design.</p>', NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6);
INSERT INTO `SiteTree_versions` (`ID`, `RecordID`, `Version`, `WasPublished`, `AuthorID`, `PublisherID`, `ClassName`, `LastEdited`, `Created`, `URLSegment`, `Title`, `MenuTitle`, `Content`, `MetaDescription`, `ExtraMeta`, `ShowInMenus`, `ShowInSearch`, `Sort`, `HasBrokenFile`, `HasBrokenLink`, `ReportClass`, `CanViewType`, `CanEditType`, `ParentID`) VALUES
(186, 16, 14, 1, 1, 1, 'PortfolioPage', '2016-01-26 10:36:35', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, '<p class="lead">To launch Line 7 Frontier into the United States, we created a highly-responsive web experience integrating bold campaign commercial content.</p>\n<p>Visitors are encouraged to explore the product range, and to go “Into the Wonder”. Products feature rich lifestyle imagery, and 360° rotating  shots to show the products from all angles. </p>\n<p> Line 7 Frontier now has all the tools to become globally-recognised for engineered and intrepid adventure design.</p>', NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(187, 16, 15, 1, 1, 1, 'PortfolioPage', '2016-01-26 10:37:07', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, '<p class="lead">To launch Line 7 Frontier into the United States, we created a highly-responsive web experience integrating bold campaign commercial content.</p>\n<p>Visitors are encouraged to explore the product range, and to go “Into the Wonder”. Products feature rich lifestyle imagery, and 360° rotating  shots to show the products from all angles. </p>\n<p> Line 7 Frontier now has all the tools to become globally-recognised for engineered and intrepid adventure design.</p>', NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(188, 16, 16, 1, 1, 1, 'PortfolioPage', '2016-01-26 10:38:46', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, '<p class="lead">To launch Line 7 Frontier into the United States, we created a highly-responsive web experience integrating bold campaign commercial content.</p>\n<p>Visitors are encouraged to explore the product range, and to go “Into the Wonder”. Products feature rich lifestyle imagery, and 360° rotating  shots to show the products from all angles. </p>\n<p> Line 7 Frontier now has all the tools to become globally-recognised for engineered and intrepid adventure design.</p>', NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(189, 16, 17, 1, 1, 1, 'PortfolioPage', '2016-01-26 10:39:11', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, '<p class="lead">To launch Line 7 Frontier into the United States, we created a highly-responsive web experience integrating bold campaign commercial content.</p>\n<p>Visitors are encouraged to explore the product range, and to go “Into the Wonder”. Products feature rich lifestyle imagery, and 360° rotating  shots to show the products from all angles. </p>\n<p> Line 7 Frontier now has all the tools to become globally-recognised for engineered and intrepid adventure design.</p>', NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(190, 16, 18, 1, 1, 1, 'PortfolioPage', '2016-01-26 10:39:48', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, '<p class="lead">To launch Line 7 Frontier into the United States, we created a highly-responsive web experience integrating bold campaign commercial content.</p>\n<p>Visitors are encouraged to explore the product range, and to go “Into the Wonder”. Products feature rich lifestyle imagery, and 360° rotating  shots to show the products from all angles. </p>\n<p> Line 7 Frontier now has all the tools to become globally-recognised for engineered and intrepid adventure design.</p>', NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(191, 16, 19, 1, 1, 1, 'PortfolioPage', '2016-02-05 11:11:46', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, '<p class="lead">To launch Line 7 Frontier into the United States, we created a highly-responsive web experience integrating bold campaign commercial content.</p>\n<p>Visitors are encouraged to explore the product range, and to go “Into the Wonder”. Products feature rich lifestyle imagery, and 360° rotating  shots to show the products from all angles. </p>\n<p> Line 7 Frontier now has all the tools to become globally-recognised for engineered and intrepid adventure design.</p>', NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(192, 16, 20, 1, 1, 1, 'PortfolioPage', '2016-02-11 06:51:44', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, '<p class="lead">To launch Line 7 Frontier into the United States, we created a highly-responsive web experience integrating bold campaign commercial content.</p>\n<p>Visitors are encouraged to explore the product range, and to go “Into the Wonder”. Products feature rich lifestyle imagery, and 360° rotating  shots to show the products from all angles. </p>\n<p> Line 7 Frontier now has all the tools to become globally-recognised for engineered and intrepid adventure design.</p>', NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(193, 12, 7, 1, 1, 1, 'PortfolioPage', '2016-02-11 06:52:05', '2015-10-24 05:06:12', 'religion-tequila', 'Religion Tequila', NULL, '<p>Our plan was monastically simple: use only the finest organic ingredients in a patient, natural process, allowing the true flavor of the blue agave to travel from the Amatitán valley all the way to our bottle, on the shelf before your eyes or the hands of a skilled mixologist, and into the glass wrapped in your fingers.</p>', NULL, NULL, 1, 1, 6, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(194, 9, 11, 1, 1, 1, 'PortfolioPage', '2016-02-11 06:52:16', '2015-10-24 05:04:37', 'road-to-recovery', 'Road to Recovery', NULL, '<p class="lead">The aim of this project was to visually communicate the story of community wellbeing following the disastrous Christchurch earthquakes.</p>\n<p>Collaborating with a friend, we created a video for CERA, the Christchurch Earthquake Recovery Authority, to use in house and promotionally to spread the message of all that\'s being done for affected communities. From disaster response to recovery and the general support of the Christchurch residents.</p>\n<p>  In displaying this key information we decided to use the more human, expressive approach of stop motion revolving around the story of a character and his experience’s post earthquake; deciding the animation would follow a story. Our choice of materials reflects the nature of the message we wanted to convey; a raw and genuine warmth to an otherwise cold and serious subject. We chose to use paper with its creases and imperfections to express the feeling of the story. Paper is very effective in portraying the story based feeling, giving it a depth and authenticity that would be lacking in a purely digital animation. Our chosen audio adds to this impression with the natural, human sounding acoustic music combined with the realistic sounds of life on top, it’s effective in supporting the visuals throughout the story.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(195, 16, 21, 1, 1, 1, 'PortfolioPage', '2016-02-11 07:36:32', '2015-10-24 05:07:10', 'line-7-frontier', 'Line 7 Frontier', NULL, '<p class="lead">To launch Line 7 Frontier into the United States, we created a highly-responsive web experience integrating bold campaign commercial content.</p>\n<p>Visitors are encouraged to explore the product range, and discover what it means to go “Into the Wonder”. Products feature rich lifestyle imagery, and 360° rotating  shots to show the products from all angles. </p>\n<p> Line 7 Frontier now has all the tools to become globally-recognised for engineered and intrepid adventure design.</p>', NULL, NULL, 1, 1, 14, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(196, 15, 10, 1, 1, 1, 'PortfolioPage', '2016-02-11 07:39:01', '2015-10-24 05:06:59', 'dig-my-idea', 'Dig My Idea', NULL, '<p>DIGMYIDEA is the Māori Innovation Challenge, and presented people with a chance to submit a digital business idea that has the potential to go global.</p>\n<p>Our brief was to create a website that communicates extreme digital innovation, and combining this with Maori iconography.</p>\n<p>With the branding and image treatments already defined, I expanded on those ideas by creating repeating graphics of kowhaiwhai, and opting for a gradual colour change as the user scrolls. With these simple effects I was able to make the site feel quite cutting edge and fresh, but still hold onto some Maori influence through subtle patterns.</p>', NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(197, 14, 7, 1, 1, 1, 'PortfolioPage', '2016-02-11 07:39:31', '2015-10-24 05:06:34', 'way-to-play', 'Way to Play', NULL, '<p class="lead">Way to Play is a one-day introduction to playing with children on the Autism Spectrum.</p>\n<p>Playing with a child with autism can be challenging, so the Way to Play workshop offers simple, easy to use strategies to begin playing joyously together. </p>\n<p>The Way to Play website was created to be a supplementary tool for parents and caregivers after completing the one-day workshop. Parents and caregivers are able to engage with a community of like-minded people to share experiences, and get support and advice from peers. </p>\n<p>As part of the website, users are also able to contact the coaches directly with questions, and upload videos showing their efforts for more targeted help with their problems. This tool is invaluable for parents who have so often felt like they are on their own, and on a bad day have no one to turn to for support. </p>', NULL, NULL, 1, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(198, 9, 12, 1, 1, 1, 'PortfolioPage', '2016-02-11 07:46:44', '2015-10-24 05:04:37', 'road-to-recovery', 'Road to Recovery', NULL, '<p class="lead">The aim of this project was to visually communicate the story of community wellbeing following the disastrous Christchurch earthquakes.</p>\n<p>Collaborating with a friend, we created a video for CERA, the Christchurch Earthquake Recovery Authority, to use in house and promotionally to spread the message of all that\'s being done for affected communities. From disaster response to recovery and the general support of the Christchurch residents.</p>\n<p>  In displaying this key information we decided to use the more human, expressive approach of stop motion revolving around the story of a character and his experience’s post earthquake; deciding the animation would follow a story. Our choice of materials reflects the nature of the message we wanted to convey; a raw and genuine warmth to an otherwise cold and serious subject. We chose to use paper with its creases and imperfections to express the feeling of the story. Paper is very effective in portraying the story based feeling, giving it a depth and authenticity that would be lacking in a purely digital animation. Our chosen audio adds to this impression with the natural, human sounding acoustic music combined with the realistic sounds of life on top, it’s effective in supporting the visuals throughout the story.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(199, 9, 13, 1, 1, 1, 'PortfolioPage', '2016-02-11 07:47:30', '2015-10-24 05:04:37', 'road-to-recovery', 'Road to Recovery', NULL, '<p class="lead">The aim of this project was to visually communicate the story of community wellbeing following the disastrous Christchurch earthquakes.</p>\n<p>Collaborating with a friend, we created a video for CERA, the Christchurch Earthquake Recovery Authority, to use in house and promotionally to spread the message of all that\'s being done for affected communities. From disaster response to recovery and the general support of the Christchurch residents.</p>\n<p>  In displaying this key information we decided to use the more human, expressive approach of stop motion revolving around the story of a character and his experience’s post earthquake; deciding the animation would follow a story. Our choice of materials reflects the nature of the message we wanted to convey; a raw and genuine warmth to an otherwise cold and serious subject. We chose to use paper with its creases and imperfections to express the feeling of the story. Paper is very effective in portraying the story based feeling, giving it a depth and authenticity that would be lacking in a purely digital animation. Our chosen audio adds to this impression with the natural, human sounding acoustic music combined with the realistic sounds of life on top, it’s effective in supporting the visuals throughout the story.</p>', NULL, NULL, 1, 1, 3, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(200, 29, 10, 1, 1, 1, 'PortfolioPage', '2016-02-11 07:55:33', '2015-10-24 05:03:55', 'lifes-a-gamble', 'Life\'s a Gamble', NULL, '<p>This poster design was a personal project to practice photo manipulation and technical editing in Photoshop. </p>', NULL, NULL, 1, 1, 10, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(201, 29, 11, 1, 1, 1, 'PortfolioPage', '2016-02-11 07:56:11', '2015-10-24 05:03:55', 'lifes-a-gamble', 'Life\'s a Gamble', NULL, '<p class="lead">Life is a gamble, so roll the dice.</p>\n<p>This poster design was a personal project to practice photo manipulation and technical editing in Photoshop. </p>', NULL, NULL, 1, 1, 10, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(202, 33, 1, 0, 1, 0, 'BlogPost', '2016-02-11 07:57:22', '2016-02-11 07:57:22', 'new-blog-post', 'New Blog Post', NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 23),
(203, 33, 2, 0, 1, 0, 'BlogPost', '2016-02-11 07:57:43', '2016-02-11 07:57:22', 'new-blog-post', 'New Blog Post', NULL, '<p class="lead">Donec id elit non mi porta gravida at eget metus. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Curabitur blandit tempus porttitor.</p>\n<p>Nullam id dolor id nibh ultricies vehicula ut id elit. Aenean lacinia bibendum nulla sed consectetur. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Maecenas faucibus mollis interdum.</p>', NULL, NULL, 0, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 23),
(204, 33, 3, 1, 1, 1, 'BlogPost', '2016-02-11 07:57:43', '2016-02-11 07:57:22', 'new-blog-post', 'New Blog Post', NULL, '<p class="lead">Donec id elit non mi porta gravida at eget metus. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Donec sed odio dui. Curabitur blandit tempus porttitor.</p>\n<p>Nullam id dolor id nibh ultricies vehicula ut id elit. Aenean lacinia bibendum nulla sed consectetur. Vestibulum id ligula porta felis euismod semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Maecenas faucibus mollis interdum.</p>', NULL, NULL, 0, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 23),
(205, 1, 8, 1, 1, 1, 'HomePage', '2016-02-11 08:09:35', '2015-10-23 22:53:25', 'home', 'Home', NULL, '<p class="lead"><span>Ahoy! I\'m Hamish.</span></p>\n<p class="lead"><span>Designer, developer, dreamer. </span></p>\n<p class="lead"><span>I have years of experience working in digital design, this is a selection of my recent projects. Take a look around and if you want to work together, please feel free to get in touch.</span></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(206, 1, 9, 1, 1, 1, 'HomePage', '2016-02-11 08:09:53', '2015-10-23 22:53:25', 'home', 'Home', NULL, '<p class="lead"><span>Ahoy! I\'m Hamish. </span>Designer, developer, dreamer. </p>\n<p class="lead"><span>I have years of experience working in digital design, this is a selection of my recent projects. Take a look around and if you want to work together, please feel free to get in touch.</span></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(207, 1, 10, 1, 1, 1, 'HomePage', '2016-02-11 08:10:23', '2015-10-23 22:53:25', 'home', 'Home', NULL, '<p class="lead"><span><strong>Ahoy! I\'m Hamish.</strong> </span>Designer, developer, dreamer. </p>\n<p class="lead"><span>I have years of experience working in digital design, this is a selection of my recent projects. Take a look around and if you want to work together, please feel free to get in touch.</span></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(208, 1, 11, 1, 1, 1, 'HomePage', '2016-02-11 08:10:37', '2015-10-23 22:53:25', 'home', 'Home', NULL, '<p class="lead"><span>Ahoy! I\'m Hamish. </span>Designer, developer, dreamer. </p>\n<p class="lead"><span>I have years of experience working in digital design, this is a selection of my recent projects. Take a look around and if you want to work together, please feel free to get in touch.</span></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(209, 15, 11, 1, 1, 1, 'PortfolioPage', '2016-02-22 10:23:45', '2015-10-24 05:06:59', 'dig-my-idea', 'Dig My Idea', NULL, '<p>DIGMYIDEA is the Māori Innovation Challenge, and presented people with a chance to submit a digital business idea that has the potential to go global.</p>\n<p>Our brief was to create a website that communicates extreme digital innovation, and combining this with Maori iconography.</p>\n<p>With the branding and image treatments already defined, I expanded on those ideas by creating repeating graphics of kowhaiwhai, and opting for a gradual colour change as the user scrolls. With these simple effects I was able to make the site feel quite cutting edge and fresh, but still hold onto some Maori influence through subtle patterns.</p>', NULL, NULL, 1, 1, 9, 0, 0, NULL, 'Inherit', 'Inherit', 6),
(210, 1, 12, 1, 1, 1, 'HomePage', '2016-02-22 10:23:59', '2015-10-23 22:53:25', 'home', 'Home', NULL, '<p class="lead"><span>Hi! I\'m Hamish. </span>Designer, developer, dreamer. </p>\n<p class="lead"><span>I have years of experience working in digital design, this is a selection of my recent projects. Take a look around and if you want to work together, please feel free to get in touch.</span></p>', NULL, NULL, 1, 1, 1, 0, 0, NULL, 'Inherit', 'Inherit', 0),
(211, 14, 8, 1, 1, 1, 'PortfolioPage', '2016-02-22 10:26:59', '2015-10-24 05:06:34', 'way-to-play', 'Way to Play', NULL, '<p class="lead">Way to Play is a one-day introduction to playing with children on the Autism Spectrum.</p>\n<p>Playing with a child with autism can be challenging, so the Way to Play workshop offers simple, easy to use strategies to begin playing joyously together. </p>\n<p>The Way to Play website was created to be a supplementary tool for parents and caregivers after completing the one-day workshop. Parents and caregivers are able to engage with a community of like-minded people to share experiences, and get support and advice from peers. </p>\n<p>As part of the website, users are also able to contact the coaches directly with questions, and upload videos showing their efforts for more targeted help with their problems. This tool is invaluable for parents who have so often felt like they are on their own, and on a bad day have no one to turn to for support. </p>', NULL, NULL, 1, 1, 8, 0, 0, NULL, 'Inherit', 'Inherit', 6);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ViewerGroups`
--

CREATE TABLE `SiteTree_ViewerGroups` (
  `ID` int(11) NOT NULL,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage`
--

CREATE TABLE `VirtualPage` (
  `ID` int(11) NOT NULL,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_Live`
--

CREATE TABLE `VirtualPage_Live` (
  `ID` int(11) NOT NULL,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_versions`
--

CREATE TABLE `VirtualPage_versions` (
  `ID` int(11) NOT NULL,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Blog`
--
ALTER TABLE `Blog`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ParentID` (`ParentID`);

--
-- Indexes for table `BlogCategory`
--
ALTER TABLE `BlogCategory`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BlogID` (`BlogID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `BlogEntry`
--
ALTER TABLE `BlogEntry`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `BlogEntry_Live`
--
ALTER TABLE `BlogEntry_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `BlogEntry_versions`
--
ALTER TABLE `BlogEntry_versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indexes for table `BlogHolder`
--
ALTER TABLE `BlogHolder`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `OwnerID` (`OwnerID`);

--
-- Indexes for table `BlogHolder_Live`
--
ALTER TABLE `BlogHolder_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `OwnerID` (`OwnerID`);

--
-- Indexes for table `BlogHolder_versions`
--
ALTER TABLE `BlogHolder_versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `OwnerID` (`OwnerID`);

--
-- Indexes for table `BlogPost`
--
ALTER TABLE `BlogPost`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FeaturedImageID` (`FeaturedImageID`);

--
-- Indexes for table `BlogPost_Authors`
--
ALTER TABLE `BlogPost_Authors`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BlogPostID` (`BlogPostID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `BlogPost_Categories`
--
ALTER TABLE `BlogPost_Categories`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BlogPostID` (`BlogPostID`),
  ADD KEY `BlogCategoryID` (`BlogCategoryID`);

--
-- Indexes for table `BlogPost_Live`
--
ALTER TABLE `BlogPost_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FeaturedImageID` (`FeaturedImageID`);

--
-- Indexes for table `BlogPost_Tags`
--
ALTER TABLE `BlogPost_Tags`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BlogPostID` (`BlogPostID`),
  ADD KEY `BlogTagID` (`BlogTagID`);

--
-- Indexes for table `BlogPost_versions`
--
ALTER TABLE `BlogPost_versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `FeaturedImageID` (`FeaturedImageID`);

--
-- Indexes for table `BlogTag`
--
ALTER TABLE `BlogTag`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BlogID` (`BlogID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `BlogTree`
--
ALTER TABLE `BlogTree`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `BlogTree_Live`
--
ALTER TABLE `BlogTree_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `BlogTree_versions`
--
ALTER TABLE `BlogTree_versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indexes for table `Blog_Contributors`
--
ALTER TABLE `Blog_Contributors`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BlogID` (`BlogID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `Blog_Editors`
--
ALTER TABLE `Blog_Editors`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BlogID` (`BlogID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `Blog_Live`
--
ALTER TABLE `Blog_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ParentID` (`ParentID`);

--
-- Indexes for table `Blog_versions`
--
ALTER TABLE `Blog_versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `ParentID` (`ParentID`);

--
-- Indexes for table `Blog_Writers`
--
ALTER TABLE `Blog_Writers`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BlogID` (`BlogID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `ContactRequest`
--
ALTER TABLE `ContactRequest`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `ErrorPage`
--
ALTER TABLE `ErrorPage`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ErrorPage_Live`
--
ALTER TABLE `ErrorPage_Live`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ErrorPage_versions`
--
ALTER TABLE `ErrorPage_versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`);

--
-- Indexes for table `File`
--
ALTER TABLE `File`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `OwnerID` (`OwnerID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `Group`
--
ALTER TABLE `Group`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `Group_Members`
--
ALTER TABLE `Group_Members`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `GroupID` (`GroupID`),
  ADD KEY `MemberID` (`MemberID`);

--
-- Indexes for table `Group_Roles`
--
ALTER TABLE `Group_Roles`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `GroupID` (`GroupID`),
  ADD KEY `PermissionRoleID` (`PermissionRoleID`);

--
-- Indexes for table `LoginAttempt`
--
ALTER TABLE `LoginAttempt`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `Member`
--
ALTER TABLE `Member`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Email` (`Email`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `BlogProfileImageID` (`BlogProfileImageID`);

--
-- Indexes for table `MemberPassword`
--
ALTER TABLE `MemberPassword`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `MemberID` (`MemberID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `Page`
--
ALTER TABLE `Page`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BannerImageID` (`BannerImageID`);

--
-- Indexes for table `Page_Live`
--
ALTER TABLE `Page_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `BannerImageID` (`BannerImageID`);

--
-- Indexes for table `Page_versions`
--
ALTER TABLE `Page_versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `BannerImageID` (`BannerImageID`);

--
-- Indexes for table `Permission`
--
ALTER TABLE `Permission`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `GroupID` (`GroupID`),
  ADD KEY `Code` (`Code`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `PermissionRole`
--
ALTER TABLE `PermissionRole`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `PermissionRoleCode`
--
ALTER TABLE `PermissionRoleCode`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RoleID` (`RoleID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `PortfolioImage`
--
ALTER TABLE `PortfolioImage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ImageID` (`ImageID`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `PortfolioPage`
--
ALTER TABLE `PortfolioPage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ThumbnailImageID` (`ThumbnailImageID`);

--
-- Indexes for table `PortfolioPage_Live`
--
ALTER TABLE `PortfolioPage_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ThumbnailImageID` (`ThumbnailImageID`);

--
-- Indexes for table `PortfolioPage_versions`
--
ALTER TABLE `PortfolioPage_versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `ThumbnailImageID` (`ThumbnailImageID`);

--
-- Indexes for table `RedirectorPage`
--
ALTER TABLE `RedirectorPage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LinkToID` (`LinkToID`);

--
-- Indexes for table `RedirectorPage_Live`
--
ALTER TABLE `RedirectorPage_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `LinkToID` (`LinkToID`);

--
-- Indexes for table `RedirectorPage_versions`
--
ALTER TABLE `RedirectorPage_versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `LinkToID` (`LinkToID`);

--
-- Indexes for table `SiteConfig`
--
ALTER TABLE `SiteConfig`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ClassName` (`ClassName`),
  ADD KEY `LogoID` (`LogoID`),
  ADD KEY `LogoAltID` (`LogoAltID`);

--
-- Indexes for table `SiteConfig_CreateTopLevelGroups`
--
ALTER TABLE `SiteConfig_CreateTopLevelGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `SiteConfig_EditorGroups`
--
ALTER TABLE `SiteConfig_EditorGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `SiteConfig_ViewerGroups`
--
ALTER TABLE `SiteConfig_ViewerGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteConfigID` (`SiteConfigID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `SiteTree`
--
ALTER TABLE `SiteTree`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `URLSegment` (`URLSegment`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `SiteTree_EditorGroups`
--
ALTER TABLE `SiteTree_EditorGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteTreeID` (`SiteTreeID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `SiteTree_ImageTracking`
--
ALTER TABLE `SiteTree_ImageTracking`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteTreeID` (`SiteTreeID`),
  ADD KEY `FileID` (`FileID`);

--
-- Indexes for table `SiteTree_LinkTracking`
--
ALTER TABLE `SiteTree_LinkTracking`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteTreeID` (`SiteTreeID`),
  ADD KEY `ChildID` (`ChildID`);

--
-- Indexes for table `SiteTree_Live`
--
ALTER TABLE `SiteTree_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `URLSegment` (`URLSegment`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `SiteTree_versions`
--
ALTER TABLE `SiteTree_versions`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `AuthorID` (`AuthorID`),
  ADD KEY `PublisherID` (`PublisherID`),
  ADD KEY `ParentID` (`ParentID`),
  ADD KEY `URLSegment` (`URLSegment`),
  ADD KEY `ClassName` (`ClassName`);

--
-- Indexes for table `SiteTree_ViewerGroups`
--
ALTER TABLE `SiteTree_ViewerGroups`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SiteTreeID` (`SiteTreeID`),
  ADD KEY `GroupID` (`GroupID`);

--
-- Indexes for table `VirtualPage`
--
ALTER TABLE `VirtualPage`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CopyContentFromID` (`CopyContentFromID`);

--
-- Indexes for table `VirtualPage_Live`
--
ALTER TABLE `VirtualPage_Live`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CopyContentFromID` (`CopyContentFromID`);

--
-- Indexes for table `VirtualPage_versions`
--
ALTER TABLE `VirtualPage_versions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  ADD KEY `RecordID` (`RecordID`),
  ADD KEY `Version` (`Version`),
  ADD KEY `CopyContentFromID` (`CopyContentFromID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Blog`
--
ALTER TABLE `Blog`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `BlogCategory`
--
ALTER TABLE `BlogCategory`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `BlogEntry`
--
ALTER TABLE `BlogEntry`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `BlogEntry_Live`
--
ALTER TABLE `BlogEntry_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `BlogEntry_versions`
--
ALTER TABLE `BlogEntry_versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `BlogHolder`
--
ALTER TABLE `BlogHolder`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `BlogHolder_Live`
--
ALTER TABLE `BlogHolder_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `BlogHolder_versions`
--
ALTER TABLE `BlogHolder_versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `BlogPost`
--
ALTER TABLE `BlogPost`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `BlogPost_Authors`
--
ALTER TABLE `BlogPost_Authors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `BlogPost_Categories`
--
ALTER TABLE `BlogPost_Categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `BlogPost_Live`
--
ALTER TABLE `BlogPost_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `BlogPost_Tags`
--
ALTER TABLE `BlogPost_Tags`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `BlogPost_versions`
--
ALTER TABLE `BlogPost_versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `BlogTag`
--
ALTER TABLE `BlogTag`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `BlogTree`
--
ALTER TABLE `BlogTree`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `BlogTree_Live`
--
ALTER TABLE `BlogTree_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `BlogTree_versions`
--
ALTER TABLE `BlogTree_versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Blog_Contributors`
--
ALTER TABLE `Blog_Contributors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Blog_Editors`
--
ALTER TABLE `Blog_Editors`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Blog_Live`
--
ALTER TABLE `Blog_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `Blog_versions`
--
ALTER TABLE `Blog_versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Blog_Writers`
--
ALTER TABLE `Blog_Writers`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ContactRequest`
--
ALTER TABLE `ContactRequest`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ErrorPage`
--
ALTER TABLE `ErrorPage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ErrorPage_Live`
--
ALTER TABLE `ErrorPage_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `ErrorPage_versions`
--
ALTER TABLE `ErrorPage_versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `File`
--
ALTER TABLE `File`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `Group`
--
ALTER TABLE `Group`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `Group_Members`
--
ALTER TABLE `Group_Members`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Group_Roles`
--
ALTER TABLE `Group_Roles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `LoginAttempt`
--
ALTER TABLE `LoginAttempt`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Member`
--
ALTER TABLE `Member`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `MemberPassword`
--
ALTER TABLE `MemberPassword`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `Page`
--
ALTER TABLE `Page`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `Page_Live`
--
ALTER TABLE `Page_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `Page_versions`
--
ALTER TABLE `Page_versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=125;
--
-- AUTO_INCREMENT for table `Permission`
--
ALTER TABLE `Permission`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `PermissionRole`
--
ALTER TABLE `PermissionRole`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `PermissionRoleCode`
--
ALTER TABLE `PermissionRoleCode`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `PortfolioImage`
--
ALTER TABLE `PortfolioImage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `PortfolioPage`
--
ALTER TABLE `PortfolioPage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `PortfolioPage_Live`
--
ALTER TABLE `PortfolioPage_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `PortfolioPage_versions`
--
ALTER TABLE `PortfolioPage_versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=173;
--
-- AUTO_INCREMENT for table `RedirectorPage`
--
ALTER TABLE `RedirectorPage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `RedirectorPage_Live`
--
ALTER TABLE `RedirectorPage_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `RedirectorPage_versions`
--
ALTER TABLE `RedirectorPage_versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SiteConfig`
--
ALTER TABLE `SiteConfig`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `SiteConfig_CreateTopLevelGroups`
--
ALTER TABLE `SiteConfig_CreateTopLevelGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SiteConfig_EditorGroups`
--
ALTER TABLE `SiteConfig_EditorGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SiteConfig_ViewerGroups`
--
ALTER TABLE `SiteConfig_ViewerGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SiteTree`
--
ALTER TABLE `SiteTree`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `SiteTree_EditorGroups`
--
ALTER TABLE `SiteTree_EditorGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SiteTree_ImageTracking`
--
ALTER TABLE `SiteTree_ImageTracking`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SiteTree_LinkTracking`
--
ALTER TABLE `SiteTree_LinkTracking`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `SiteTree_Live`
--
ALTER TABLE `SiteTree_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `SiteTree_versions`
--
ALTER TABLE `SiteTree_versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;
--
-- AUTO_INCREMENT for table `SiteTree_ViewerGroups`
--
ALTER TABLE `SiteTree_ViewerGroups`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `VirtualPage`
--
ALTER TABLE `VirtualPage`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `VirtualPage_Live`
--
ALTER TABLE `VirtualPage_Live`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `VirtualPage_versions`
--
ALTER TABLE `VirtualPage_versions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
