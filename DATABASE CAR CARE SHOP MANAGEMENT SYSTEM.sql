-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2023 at 11:18 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_care_admin`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_on_service`
--

CREATE TABLE `add_on_service` (
  `add_on_id` int(100) NOT NULL,
  `car_type` varchar(255) NOT NULL,
  `add_onservice` varchar(255) NOT NULL,
  `add_onservice_charge` double(16,2) NOT NULL,
  `ms_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cart_customer`
--

CREATE TABLE `cart_customer` (
  `cus_id` int(100) NOT NULL,
  `cus_fname` varchar(100) NOT NULL,
  `cus_lname` varchar(100) NOT NULL,
  `cus_tel` varchar(100) NOT NULL,
  `car_brand` varchar(100) NOT NULL,
  `car_series` varchar(100) NOT NULL,
  `car_id` varchar(100) NOT NULL,
  `ms_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cart_service`
--

CREATE TABLE `cart_service` (
  `cart_id` int(100) NOT NULL,
  `add_on_id` int(100) NOT NULL,
  `cus_id` int(100) NOT NULL,
  `add_onservice` varchar(100) NOT NULL,
  `add_onservice_charge` double(16,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cus_id` int(100) NOT NULL,
  `cus_fname` varchar(100) NOT NULL,
  `cus_lname` varchar(100) NOT NULL,
  `cus_tel` varchar(100) NOT NULL,
  `car_brand` varchar(100) NOT NULL,
  `car_series` varchar(100) NOT NULL,
  `car_id` varchar(100) NOT NULL,
  `car_type` varchar(100) NOT NULL,
  `ms_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `main_service`
--

CREATE TABLE `main_service` (
  `ms_id` int(100) NOT NULL,
  `car_type` varchar(255) NOT NULL,
  `service` varchar(255) DEFAULT NULL,
  `ms_charge` double(16,2) DEFAULT NULL,
  `img_car` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_add_on`
--

CREATE TABLE `order_add_on` (
  `order_id` int(100) NOT NULL,
  `add_on_id` int(100) NOT NULL,
  `cus_id` int(10) NOT NULL,
  `ms_id` int(10) NOT NULL,
  `add_service` varchar(100) NOT NULL,
  `add_charge` double(16,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_main`
--

CREATE TABLE `order_main` (
  `order_id` int(100) NOT NULL,
  `cus_id` int(100) NOT NULL,
  `date` datetime NOT NULL,
  `update_date` datetime NOT NULL,
  `status` varchar(100) NOT NULL,
  `total` double(16,2) NOT NULL,
  `admin` varchar(100) NOT NULL,
  `payment` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `service` varchar(100) NOT NULL,
  `charge` double(16,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `user_status` varchar(100) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `img_profile` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `firstname`, `lastname`, `username`, `password`, `address`, `gender`, `tel`, `email`, `user_status`, `created`, `img_profile`) VALUES
(1, NULL, NULL, 'the_admin', '063c98343a06ca92e95705e141f82d3f', NULL, NULL, NULL, NULL, 'Admin', '2023-02-02 02:35:38', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_on_service`
--
ALTER TABLE `add_on_service`
  ADD PRIMARY KEY (`add_on_id`),
  ADD KEY `ms_id` (`ms_id`);

--
-- Indexes for table `cart_customer`
--
ALTER TABLE `cart_customer`
  ADD PRIMARY KEY (`cus_id`),
  ADD KEY `ms_id` (`ms_id`);

--
-- Indexes for table `cart_service`
--
ALTER TABLE `cart_service`
  ADD PRIMARY KEY (`cart_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cus_id`);

--
-- Indexes for table `main_service`
--
ALTER TABLE `main_service`
  ADD PRIMARY KEY (`ms_id`);

--
-- Indexes for table `order_add_on`
--
ALTER TABLE `order_add_on`
  ADD PRIMARY KEY (`order_id`,`add_on_id`),
  ADD KEY `fk_order_id_idx` (`order_id`),
  ADD KEY `cus_id` (`cus_id`),
  ADD KEY `add_on_id` (`add_on_id`);

--
-- Indexes for table `order_main`
--
ALTER TABLE `order_main`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `cus_id` (`cus_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_on_service`
--
ALTER TABLE `add_on_service`
  MODIFY `add_on_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `cart_customer`
--
ALTER TABLE `cart_customer`
  MODIFY `cus_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `cart_service`
--
ALTER TABLE `cart_service`
  MODIFY `cart_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=618;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cus_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `main_service`
--
ALTER TABLE `main_service`
  MODIFY `ms_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `order_main`
--
ALTER TABLE `order_main`
  MODIFY `order_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `add_on_service`
--
ALTER TABLE `add_on_service`
  ADD CONSTRAINT `add_on_service_ibfk_1` FOREIGN KEY (`ms_id`) REFERENCES `main_service` (`ms_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_customer`
--
ALTER TABLE `cart_customer`
  ADD CONSTRAINT `ms_id_ibfk_1` FOREIGN KEY (`ms_id`) REFERENCES `main_service` (`ms_id`);

--
-- Constraints for table `order_add_on`
--
ALTER TABLE `order_add_on`
  ADD CONSTRAINT `fk_cus_id` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_order_id` FOREIGN KEY (`order_id`) REFERENCES `order_main` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_main`
--
ALTER TABLE `order_main`
  ADD CONSTRAINT `order_main_ibfk_1` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
