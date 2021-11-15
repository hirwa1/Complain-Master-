-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2021 at 08:58 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

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
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '18-07-2019 14:18:16');

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
(9, 2, 'closed', 'dfsfsf', '2019-08-06 02:37:57');

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
(3, 'Uttar Pradesh', 'UP', '2019-07-18 11:35:02', '2019-08-06 02:58:51'),
(4, 'Punjab', 'Punjab', '2019-07-18 11:35:58', '2019-08-06 02:59:03'),
(5, 'Haryana', 'Haryana', '2019-03-27 21:20:36', '2019-08-06 02:59:13'),
(6, 'Delhi', 'Delhi', '2019-07-11 06:54:12', '2019-08-06 02:59:29');

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
(1, 7, 1, 'E-wllaet', 'hvxrthh', 'Uttar Pradesh', '', '7ytfff', 'complaintdocs/hvxrthh.png', '2021-10-11 11:03:29', NULL, NULL),
(3, 6, 1, 'Women abuse', 'General Query', 'Uttar Pradesh', 'erye', 'etyywryey', 'aDyY00ltlDiJ6gu17ja5YJOuXp7Vvqo5hjVAw7kW.jpg', '2021-10-13 13:47:39', NULL, NULL);

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
(43, 6, 'seba@gmail.com', 0x3a3a3100000000000000000000000000, '2021-10-13 13:47:14', '13-10-2021 07:17:45 PM', 1);

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
(1, 'Amandeep Singh', 'aman@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 9874563210, 'Shakarpur', 'Uttar Pradesh', 'India', 110092, '6e8024ec26c292f258ec30f01e0392dc.png', '2017-03-28 11:44:52', '2019-08-06 02:57:08', 1),
(2, 'Deepak', 'deepak@gmail.com', '498b5924adc469aa7b660f457e0fc7e5', 1234567890, 'Faridabad', 'Haryana', 'India', 112266, '2ec5514b65bdb23768402fdc9382e502.jpg', '2019-08-06 02:47:39', '2019-08-06 02:56:59', 1),
(4, 'NEZA Toussaint', 'tousaintneza@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 788844934, 'Kicukiro', NULL, NULL, NULL, NULL, '2021-09-15 09:11:42', '0000-00-00 00:00:00', NULL),
(5, 'NEZA Toussaint', 'toussaint@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 788844934, 'Kicukiro', NULL, NULL, NULL, NULL, '2021-09-15 09:20:22', '0000-00-00 00:00:00', NULL),
(6, 'Seba Groupe', 'seba@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 123456, 'seba@gmail.com', NULL, NULL, NULL, NULL, '2021-09-21 07:24:29', '0000-00-00 00:00:00', NULL),
(7, 'neme', 'sasa@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 123456, 'sasa@gmail.com', NULL, NULL, NULL, NULL, '2021-10-10 17:58:56', '0000-00-00 00:00:00', NULL);

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
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
