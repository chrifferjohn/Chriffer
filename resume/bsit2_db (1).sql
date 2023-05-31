-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2023 at 10:31 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bsit2_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `2a`
--

CREATE TABLE `2a` (
  `Student_ID` varchar(30) NOT NULL,
  `Lastname` varchar(30) DEFAULT NULL,
  `Firstname` varchar(30) DEFAULT NULL,
  `Midname` varchar(30) DEFAULT NULL,
  `Birthdate` varchar(30) DEFAULT NULL,
  `Age` int(2) DEFAULT NULL,
  `Address_ID` varchar(20) DEFAULT NULL,
  `Subject_ID` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `2b`
--

CREATE TABLE `2b` (
  `Student_ID` varchar(30) NOT NULL,
  `Lastname` varchar(30) DEFAULT NULL,
  `Firstname` varchar(30) DEFAULT NULL,
  `Midname` varchar(30) DEFAULT NULL,
  `Birthdate` varchar(30) DEFAULT NULL,
  `Age` int(2) DEFAULT NULL,
  `Address_ID` varchar(20) DEFAULT NULL,
  `Subject_ID` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `2c`
--

CREATE TABLE `2c` (
  `Student_ID` varchar(30) NOT NULL,
  `Lastname` varchar(30) DEFAULT NULL,
  `Firstname` varchar(30) DEFAULT NULL,
  `Midname` varchar(30) DEFAULT NULL,
  `Birthdate` varchar(30) DEFAULT NULL,
  `Age` int(2) DEFAULT NULL,
  `Address_ID` varchar(20) DEFAULT NULL,
  `Subject_ID` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `Address_ID` varchar(20) NOT NULL,
  `Poruk_Sitio` varchar(20) DEFAULT NULL,
  `Barangay` varchar(20) DEFAULT NULL,
  `Municipality` varchar(20) DEFAULT NULL,
  `Province` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `instructor`
--

CREATE TABLE `instructor` (
  `instructor_ID` varchar(10) NOT NULL,
  `Fullname` varchar(50) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `ins_subj`
--

CREATE TABLE `ins_subj` (
  `instructor_ID` varchar(10) DEFAULT NULL,
  `Subject_no` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `Subject_no` varchar(10) NOT NULL,
  `Subject_code` varchar(10) DEFAULT NULL,
  `Subject_descript_title` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `2a`
--
ALTER TABLE `2a`
  ADD PRIMARY KEY (`Student_ID`),
  ADD KEY `Address_ID` (`Address_ID`),
  ADD KEY `Subject_ID` (`Subject_ID`);

--
-- Indexes for table `2b`
--
ALTER TABLE `2b`
  ADD PRIMARY KEY (`Student_ID`),
  ADD KEY `Address_ID` (`Address_ID`),
  ADD KEY `Subject_ID` (`Subject_ID`);

--
-- Indexes for table `2c`
--
ALTER TABLE `2c`
  ADD PRIMARY KEY (`Student_ID`),
  ADD KEY `Subject_ID` (`Subject_ID`),
  ADD KEY `Address_ID` (`Address_ID`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`Address_ID`);

--
-- Indexes for table `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`instructor_ID`),
  ADD KEY `Address` (`Address`);

--
-- Indexes for table `ins_subj`
--
ALTER TABLE `ins_subj`
  ADD KEY `Subject_no` (`Subject_no`),
  ADD KEY `instructor_ID` (`instructor_ID`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`Subject_no`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `2a`
--
ALTER TABLE `2a`
  ADD CONSTRAINT `2a_ibfk_1` FOREIGN KEY (`Address_ID`) REFERENCES `address` (`Address_ID`),
  ADD CONSTRAINT `2a_ibfk_2` FOREIGN KEY (`Subject_ID`) REFERENCES `subject` (`Subject_no`);

--
-- Constraints for table `2b`
--
ALTER TABLE `2b`
  ADD CONSTRAINT `2b_ibfk_1` FOREIGN KEY (`Address_ID`) REFERENCES `address` (`Address_ID`),
  ADD CONSTRAINT `2b_ibfk_2` FOREIGN KEY (`Subject_ID`) REFERENCES `subject` (`Subject_no`);

--
-- Constraints for table `2c`
--
ALTER TABLE `2c`
  ADD CONSTRAINT `2c_ibfk_1` FOREIGN KEY (`Subject_ID`) REFERENCES `subject` (`Subject_no`),
  ADD CONSTRAINT `2c_ibfk_2` FOREIGN KEY (`Address_ID`) REFERENCES `address` (`Address_ID`);

--
-- Constraints for table `instructor`
--
ALTER TABLE `instructor`
  ADD CONSTRAINT `instructor_ibfk_1` FOREIGN KEY (`Address`) REFERENCES `address` (`Address_ID`);

--
-- Constraints for table `ins_subj`
--
ALTER TABLE `ins_subj`
  ADD CONSTRAINT `ins_subj_ibfk_1` FOREIGN KEY (`Subject_no`) REFERENCES `subject` (`Subject_no`),
  ADD CONSTRAINT `ins_subj_ibfk_2` FOREIGN KEY (`instructor_ID`) REFERENCES `instructor` (`instructor_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
