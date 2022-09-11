-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2022 at 07:30 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `universitydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `crn` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `startTime` time DEFAULT NULL,
  `endTime` time DEFAULT NULL,
  `room_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`crn`, `name`, `startTime`, `endTime`, `room_id`) VALUES
(2, 'Math201', '08:00:00', '09:00:00', 1),
(3, 'math202', '07:00:00', '08:00:00', 8),
(4, 'bio210', '12:00:00', '13:00:00', 3),
(5, 'arab211', '18:00:00', '19:00:00', 4),
(6, ' CSC275', '08:00:00', '09:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `office` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `name`, `office`) VALUES
(1, 'Mechanical', 1),
(2, 'Electrical', 2),
(3, 'biology', 34),
(4, 'chemistry', 123),
(5, 'business', 56),
(6, 'mathematics', 87),
(7, 'CS', 99),
(8, 'BIF', 17);

-- --------------------------------------------------------

--
-- Table structure for table `enrolled`
--

CREATE TABLE `enrolled` (
  `student_id` int(11) NOT NULL,
  `Course_crn` int(11) NOT NULL,
  `credit_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enrolled`
--

INSERT INTO `enrolled` (`student_id`, `Course_crn`, `credit_status`) VALUES
(1, 3, 3),
(1, 6, 3),
(2, 5, 3),
(4, 4, 3),
(7, 6, 3),
(8, 6, 3),
(9, 2, 3),
(9, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `majorin`
--

CREATE TABLE `majorin` (
  `student_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `majorin`
--

INSERT INTO `majorin` (`student_id`, `department_id`) VALUES
(1, 6),
(3, 5),
(3, 7),
(4, 3),
(4, 8),
(5, 1),
(10, 7);

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `capacity` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `name`, `capacity`) VALUES
(1, 'bliss', '120'),
(2, 'bathish', '200'),
(3, 'nicely500', '300'),
(4, 'nicely210', '30'),
(5, 'jaffet', '400'),
(6, 'bechtel201', '20'),
(7, 'oxy211', '15'),
(8, 'hostler', '10');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`student_id`, `name`) VALUES
(1, 'Housam'),
(2, 'Naruto'),
(3, 'Sasuke'),
(4, 'abbas'),
(5, 'hinata'),
(6, 'aaa'),
(7, 'bbb'),
(8, 'ccc'),
(9, 'asdads'),
(10, 'ewrwe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`crn`,`room_id`),
  ADD KEY `fk_Course_room1_idx` (`room_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `enrolled`
--
ALTER TABLE `enrolled`
  ADD PRIMARY KEY (`student_id`,`Course_crn`),
  ADD KEY `fk_student_has_Course_Course1_idx` (`Course_crn`),
  ADD KEY `fk_student_has_Course_student1_idx` (`student_id`);

--
-- Indexes for table `majorin`
--
ALTER TABLE `majorin`
  ADD PRIMARY KEY (`student_id`,`department_id`),
  ADD KEY `fk_student_has_department_department1_idx` (`department_id`),
  ADD KEY `fk_student_has_department_student1_idx` (`student_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `crn` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `fk_Course_room1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `enrolled`
--
ALTER TABLE `enrolled`
  ADD CONSTRAINT `fk_student_has_Course_Course1` FOREIGN KEY (`Course_crn`) REFERENCES `course` (`crn`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_student_has_Course_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `majorin`
--
ALTER TABLE `majorin`
  ADD CONSTRAINT `fk_student_has_department_department1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_student_has_department_student1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
