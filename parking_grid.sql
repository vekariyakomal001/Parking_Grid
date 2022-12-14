-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2022 at 03:45 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parking_grid`
--

-- --------------------------------------------------------

--
-- Table structure for table `date_check`
--

CREATE TABLE `date_check` (
  `id` int(11) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `timing` varchar(25) DEFAULT NULL,
  `spot` int(11) DEFAULT NULL,
  `floors` int(11) DEFAULT NULL,
  `vehicle_type` varchar(25) DEFAULT NULL,
  `plat_number` int(11) DEFAULT NULL,
  `total_cost` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `date_check`
--

INSERT INTO `date_check` (`id`, `from_date`, `to_date`, `timing`, `spot`, `floors`, `vehicle_type`, `plat_number`, `total_cost`, `location_id`, `user_id`) VALUES
(42, '2022-09-15', '2022-09-16', 'afternoon', 2, 10, 'MUV', 787878, 20, 3, 15),
(43, '2022-09-20', '2022-09-23', 'night', 3, 3, 'Sedan', 334567, 80, 1, 15),
(44, '2022-09-20', '2022-09-23', 'night', 9, 3, 'HatchBook', 555555, 80, 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `floors`
--

CREATE TABLE `floors` (
  `id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `floor_status` tinyint(1) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `floors`
--

INSERT INTO `floors` (`id`, `name`, `floor_status`, `location_id`) VALUES
(1, 'floor1', 0, 1),
(2, 'floor2', 0, 1),
(3, 'floor3', 0, 1),
(4, 'floor4', 0, 1),
(5, 'floor1', 0, 2),
(6, 'floor2', 0, 2),
(7, 'floor3', 0, 2),
(8, 'floor4', 0, 2),
(9, 'floor1', 0, 3),
(10, 'floor2', 0, 3),
(11, 'floor3', 0, 3),
(12, 'floor4', 0, 3),
(13, 'floor1', 0, 4),
(14, 'floor2', 0, 4),
(15, 'floor3', 0, 4),
(16, 'floor4', 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `location_name` varchar(25) DEFAULT NULL,
  `location_image` varchar(25) DEFAULT NULL,
  `location_status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `location_name`, `location_image`, `location_status`) VALUES
(1, 'Location 1', 'images/location1.jpg', 0),
(2, 'Location 2', 'images/location2.jpg', 0),
(3, 'Location 3', 'images/location3.jpg', 0),
(4, 'Location 4', 'images/location4.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `fname` varchar(60) NOT NULL,
  `lname` varchar(60) NOT NULL,
  `gender` varchar(60) NOT NULL,
  `card` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `password` varchar(60) NOT NULL,
  `user_role` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `motherName` varchar(25) NOT NULL,
  `petName` varchar(25) NOT NULL,
  `birthPlace` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `fname`, `lname`, `gender`, `card`, `email`, `phone`, `password`, `user_role`, `status`, `motherName`, `petName`, `birthPlace`) VALUES
(14, 'Vidhi', '', 'Female', '8909856787', 'vidhi@gmail.com', '4567856789', 'Vidhi!123', 1, 0, 'Jayshreeben', 'Dog', 'Surat'),
(15, 'Komal', '', 'Female', '8567485769', 'komal@gmail.com', '5467898768', 'Komal@123', 2, 0, 'Jayshreeben', 'Cat', 'Surat');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `user_role_id` int(11) NOT NULL,
  `user_role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`user_role_id`, `user_role`) VALUES
(1, 'admin'),
(2, 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `date_check`
--
ALTER TABLE `date_check`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_floors` (`floors`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `floors`
--
ALTER TABLE `floors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_location_id` (`location_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`user_role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `date_check`
--
ALTER TABLE `date_check`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `floors`
--
ALTER TABLE `floors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `user_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `date_check`
--
ALTER TABLE `date_check`
  ADD CONSTRAINT `date_check_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `date_check_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `registration` (`id`),
  ADD CONSTRAINT `fk_floors` FOREIGN KEY (`floors`) REFERENCES `floors` (`id`);

--
-- Constraints for table `floors`
--
ALTER TABLE `floors`
  ADD CONSTRAINT `fk_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
