-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2021 at 12:17 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `complaint`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL,
  `Name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `keyx` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`, `Name`, `email`, `keyx`) VALUES
(1, 'admin', 'admin', '18-07-2019 14:18:16', 'Kicukiro', 'kicukiro@kicukiro.gov.rw', 'tuyitf');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(1, 'Security', 'Security', '2019-07-28 06:10:55', '2021-10-11 11:14:46'),
(2, 'Mutuel', 'Mutuel', '2019-06-10 10:54:06', '2021-10-11 11:14:56');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(200) NOT NULL,
  `sender` varchar(200) NOT NULL,
  `receiver` varchar(200) NOT NULL,
  `msg` varchar(5000) NOT NULL,
  `time` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL,
  `complaintNumber` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaintremark`
--

INSERT INTO `complaintremark` (`id`, `complaintNumber`, `status`, `remark`, `remarkDate`) VALUES
(1, 2, 'in process', 'Hi this for demo', '2019-07-01 07:29:19'),
(2, 9, 'in process', 'hiiiiiiiiiiiiiiiiiiii', '2019-07-01 18:37:59'),
(3, 3, 'in process', 'test', '2019-05-02 15:57:43'),
(4, 19, 'closed', 'case solved', '2019-06-11 11:18:33'),
(5, 1, 'closed', 'This sample text for testing', '2019-09-05 17:08:26'),
(6, 5, 'in process', 'test Data', '2019-06-24 07:26:17'),
(7, 23, 'in process', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2019-06-24 10:34:47'),
(8, 23, 'closed', 'Issue resolved ', '2019-06-24 10:37:08'),
(9, 2, 'closed', 'dfsfsf', '2019-08-06 02:37:57'),
(10, 1, 'in process', '12', '2021-11-17 08:09:06'),
(11, 4, 'in process', 'fu', '2021-11-18 14:23:02'),
(12, 5, 'in process', 'fg', '2021-11-18 14:37:53'),
(13, 5, 'closed', 'Z', '2021-11-18 14:53:33'),
(14, 6, 'closed', 'yu', '2021-11-18 15:02:29');

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `stateName` varchar(255) DEFAULT NULL,
  `stateDescription` tinytext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `stateName`, `stateDescription`, `postingDate`, `updationDate`) VALUES
(7, 'Kicukiro ', NULL, '2021-11-18 07:40:04', NULL),
(8, 'Gasharu', NULL, '2021-11-18 07:40:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub`
--

CREATE TABLE `sub` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `cat` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub`
--

INSERT INTO `sub` (`id`, `name`, `password`, `cat`) VALUES
(1, 'hirwa@gmail.com', 'hirwa', 'kicukiro'),
(2, 'saidi@gmail.com', 'saidi', 'Gasharu');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(1, 1, 'Women abuse', '2021-10-11 11:15:52', NULL),
(2, 2, 'Ubwisungane bwanyerejwe', '2021-10-11 11:16:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `complaintType` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `noc` varchar(255) DEFAULT NULL,
  `complaintDetails` mediumtext DEFAULT NULL,
  `complaintFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcomplaints`
--

INSERT INTO `tblcomplaints` (`complaintNumber`, `userId`, `category`, `subcategory`, `complaintType`, `state`, `noc`, `complaintDetails`, `complaintFile`, `regDate`, `status`, `lastUpdationDate`) VALUES
(4, 7, 2, 'Ubwisungane bwanyerejwe', 'General Query', 'Kicukiro ', 'gffnfn', 'fgnfgnfgnfgnfgnfgnfgnfnfnfnfnnfnfggn', 'How to Lose Weight Fast in 3 Simple Steps.png', '2021-11-18 14:22:15', 'in process', '2021-11-18 14:23:02'),
(5, 7, 2, 'Ubwisungane bwanyerejwe', 'General Query', 'Gasharu', 'hirwa', 'dsdsd', '3-surprising-facts-about-stds-stis-that-you-should-know.jpg', '2021-11-18 14:37:09', 'closed', '2021-11-18 14:53:33'),
(6, 7, 1, 'Women abuse', 'General Query', 'Gasharu', 'KOngwe', 'KOngwe', '3-surprising-facts-about-stds-stis-that-you-should-know.jpg', '2021-11-18 14:56:14', 'closed', '2021-11-18 15:02:29');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(27, 2, 'deepak@gmail.com', 0x3a3a3100000000000000000000000000, '2019-08-06 02:47:52', '', 1),
(28, 2, 'deepak@gmail.com', 0x3a3a3100000000000000000000000000, '2019-08-06 02:54:39', '06-08-2019 10:33:46 AM', 1),
(29, 0, 'aman@gmail.com', 0x3132372e302e302e3100000000000000, '2021-09-11 06:38:24', '', 0),
(30, 0, 'aman@gmail.com', 0x3132372e302e302e3100000000000000, '2021-09-11 06:38:32', '', 0),
(31, 1, 'aman@gmail.com', 0x3132372e302e302e3100000000000000, '2021-09-11 06:39:10', '11-09-2021 12:09:54 PM', 1),
(32, 1, 'aman@gmail.com', 0x3132372e302e302e3100000000000000, '2021-09-11 06:41:45', '11-09-2021 12:15:01 PM', 1),
(33, 1, 'aman@gmail.com', 0x3132372e302e302e3100000000000000, '2021-09-11 06:46:03', '11-09-2021 02:27:38 PM', 1),
(34, 1, 'aman@gmail.com', 0x3132372e302e302e3100000000000000, '2021-09-11 09:02:05', '', 1),
(35, 0, 'deepak@gmail.com', 0x3a3a3100000000000000000000000000, '2021-09-11 11:04:28', '', 0),
(36, 0, 'deepak@gmail.com', 0x3a3a3100000000000000000000000000, '2021-09-11 11:04:44', '', 0),
(37, 1, 'aman@gmail.com', 0x3a3a3100000000000000000000000000, '2021-09-11 11:05:25', '11-09-2021 06:28:35 PM', 1),
(38, 0, 'deepak@gmail.com', 0x3a3a3100000000000000000000000000, '2021-09-11 14:06:24', '', 0),
(39, 1, 'aman@gmail.com', 0x3a3a3100000000000000000000000000, '2021-09-11 14:06:33', '11-09-2021 07:56:00 PM', 1),
(40, 1, 'aman@gmail.com', 0x3a3a3100000000000000000000000000, '2021-09-11 14:27:51', '11-09-2021 07:58:01 PM', 1),
(41, 0, 'admin', 0x3a3a3100000000000000000000000000, '2021-09-20 10:15:19', '', 0),
(42, 0, 'seba@gmail.com', 0x3a3a3100000000000000000000000000, '2021-10-13 13:47:07', '', 0),
(43, 6, 'seba@gmail.com', 0x3a3a3100000000000000000000000000, '2021-10-13 13:47:14', '13-10-2021 07:17:45 PM', 1),
(44, 7, 'hirwa@gmail.com', 0x3132372e302e302e3100000000000000, '2021-11-18 07:34:47', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contactNo` bigint(11) DEFAULT NULL,
  `address` tinytext DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `userEmail`, `password`, `contactNo`, `address`, `State`, `country`, `pincode`, `userImage`, `regDate`, `updationDate`, `status`) VALUES
(7, 'Hirwa', 'hirwa@gmail.com', 'hirwa', 123456, 'hirwa@gmail.com', 'Gasharu', 'Rwanda', 12345, '9175536fffdf1eb41d7cb9ec12c2429b.png', '2021-10-10 17:58:56', '2021-11-18 15:26:04', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub`
--
ALTER TABLE `sub`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  ADD PRIMARY KEY (`complaintNumber`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(200) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sub`
--
ALTER TABLE `sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
