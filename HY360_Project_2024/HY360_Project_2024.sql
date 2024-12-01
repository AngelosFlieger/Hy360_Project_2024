-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 01, 2024 at 02:01 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `HY360_Project_2024`
--

-- --------------------------------------------------------

--
-- Table structure for table `Booking`
--

CREATE TABLE `Booking` (
  `bookingID` int(11) NOT NULL,
  `customerID` int(11) DEFAULT NULL,
  `eventID` int(11) DEFAULT NULL,
  `number_of_tickets` int(11) DEFAULT NULL CHECK (`number_of_tickets` > 0),
  `booking_date` date NOT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL CHECK (`total_amount` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Booking`
--

INSERT INTO `Booking` (`bookingID`, `customerID`, `eventID`, `number_of_tickets`, `booking_date`, `total_amount`) VALUES
(1, 1, 1, 2, '2023-12-01', 200.00),
(2, 2, 2, 1, '2023-12-05', 80.00);

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `customerID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `credit_card_name` varchar(100) DEFAULT NULL,
  `credit_card_number` char(16) DEFAULT NULL,
  `credit_card_expiration_date` date DEFAULT NULL,
  `credit_card_security_code` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`customerID`, `name`, `email`, `credit_card_name`, `credit_card_number`, `credit_card_expiration_date`, `credit_card_security_code`) VALUES
(1, 'John Doe', 'john@example.com', 'John Doe', '1234567812345678', '2025-12-31', '123'),
(2, 'Jane Smith', 'jane@example.com', 'Jane Smith', '8765432187654321', '2024-08-30', '456');

-- --------------------------------------------------------

--
-- Table structure for table `Event`
--

CREATE TABLE `Event` (
  `eventID` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL CHECK (`capacity` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Event`
--

INSERT INTO `Event` (`eventID`, `name`, `date`, `time`, `type`, `capacity`) VALUES
(1, 'Rock Concert', '2024-01-15', '20:00:00', 'Concert', 500),
(2, 'Classical Music Night', '2024-02-10', '19:00:00', 'Music', 300);

-- --------------------------------------------------------

--
-- Table structure for table `Ticket`
--

CREATE TABLE `Ticket` (
  `ticketID` int(11) NOT NULL,
  `eventID` int(11) DEFAULT NULL,
  `type` varchar(50) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL CHECK (`price` > 0),
  `availability` int(11) DEFAULT NULL CHECK (`availability` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Ticket`
--

INSERT INTO `Ticket` (`ticketID`, `eventID`, `type`, `price`, `availability`) VALUES
(1, 1, 'VIP', 100.00, 50),
(2, 1, 'General Admission', 50.00, 450),
(3, 2, 'VIP', 80.00, 30),
(4, 2, 'General Admission', 40.00, 270);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Booking`
--
ALTER TABLE `Booking`
  ADD PRIMARY KEY (`bookingID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `eventID` (`eventID`);

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`customerID`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `credit_card_number` (`credit_card_number`);

--
-- Indexes for table `Event`
--
ALTER TABLE `Event`
  ADD PRIMARY KEY (`eventID`);

--
-- Indexes for table `Ticket`
--
ALTER TABLE `Ticket`
  ADD PRIMARY KEY (`ticketID`),
  ADD KEY `eventID` (`eventID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Booking`
--
ALTER TABLE `Booking`
  ADD CONSTRAINT `Booking_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `Customer` (`customerID`) ON DELETE CASCADE,
  ADD CONSTRAINT `Booking_ibfk_2` FOREIGN KEY (`eventID`) REFERENCES `Event` (`eventID`) ON DELETE CASCADE;

--
-- Constraints for table `Ticket`
--
ALTER TABLE `Ticket`
  ADD CONSTRAINT `Ticket_ibfk_1` FOREIGN KEY (`eventID`) REFERENCES `Event` (`eventID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
