-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2022 at 07:46 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `helpdesk`
--

-- --------------------------------------------------------

--
-- Table structure for table `issue_category`
--

CREATE TABLE `issue_category` (
  `id` int(10) NOT NULL,
  `title` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issue_category`
--

INSERT INTO `issue_category` (`id`, `title`) VALUES
(1, 'sample_category1'),
(2, 'sample_category2'),
(3, 'sample_category3');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(10) NOT NULL,
  `requestor` varchar(50) NOT NULL,
  `department` varchar(60) NOT NULL,
  `contact_no` varchar(80) NOT NULL,
  `issue` varchar(60) NOT NULL,
  `request_category` varchar(40) NOT NULL,
  `description` varchar(255) NOT NULL,
  `justification` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `assigned_engineer` varchar(50) NOT NULL,
  `sla` varchar(20) NOT NULL,
  `diagnostic` varchar(255) NOT NULL,
  `resolution` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `requestor`, `department`, `contact_no`, `issue`, `request_category`, `description`, `justification`, `status`, `assigned_engineer`, `sla`, `diagnostic`, `resolution`, `comments`) VALUES
(1, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(2, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(3, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(4, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(5, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(6, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(7, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(8, '', '', '', '', '', '', '', '', '', '', '', '', ''),
(9, 'Me', 'IICS', '09 local 23323', 'sample_category1', 'sample_request', '2323', '2323', 'sample_status', 'sample_assigned-engineer', 'sample_sla', 'sample_diagnostic', 'sample_resolution', 'sample_comments'),
(16, 'Jules Test', 'TESTING DEPT', '09209546453', 'sample_category1', '', '23912039012isifjsoidfjoxcvkxcnvkxcnvkfoiajwdiojdw HABA\nHABAHABAHABAHABAHABAHABA HABA\nHABA\nHABA\n', '23912039012isifjsoidfjoxcvkxcnvkxcnvkfoiajwdiojdw HABA\nHABAHABAHABAHABAHABAHABA HABA\nHABA\nHABA\n', 'available', '', '', '', '', ''),
(19, 'requestor 1', 'department of foreign affairs', '09 local 23', 'sample_category2', '', 'sdasd', 'asdasd', 'resolved', '', '', '', '', ''),
(20, 'Patrick Adrian Bolivar', 'Development Team', '09342323231', 'sample_category2', '', 'sample description', 'sample description', 'available', '', '', '', '', ''),
(21, 'try', 'try', '02392039023', 'sample_category1', '', '343434', '343434', 'available', '', '', '', '', ''),
(22, 'Tester Data', 'Test department', '09204232123', 'sample_category2', '', 'sample description', ' sample uletttsample uletttsample uletttsample uletttsample uletttsample ulettt sample uletttsample ulettt sample ulettt', 'available', '', '', '', '', ''),
(23, 'Ashley Dominique Quinto', 'CICS', '09277779949', 'sample_category1', '', 'Hiiii, HIIII HIIII HIIII', 'justify justify justify justify justify justify justify justify\n\njustify justify\n\njustify justifyjustify justifyjustify justifyjustify justifyjustify justify\n\n\n\njustify justifyjustify justifyjustify justifyjustify justifyjustify justify', 'available', '', '', '', '', ''),
(24, 'sample', 'sample', '293091023', 'sample_category2', '', '1231231', '23123123', 'ongoing', '', '', '', '', ''),
(25, 'request1', 'dept1', 'contact1', 'issue-issuehan', '', 'desc1', 'justify1', '', '', '', '', '', ''),
(26, 'requestor2', 'department of foreign affairs', '0920-453-2341', 'sample_category2', '', 'description 2', 'justify!! justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!ju', 'closed', '', '', '', '', ''),
(27, 'rewr', 'qweqwe', 'qweqwe', 'sample_category2', '', 'qweqwe', 'qweqweqwe', '', '', '', '', '', ''),
(28, 'qweqwe', 'qweqweq', 'weqweqweq', 'sample_category2', '', 'qweqwe', 'qweqweqwe', 'pending', '', '', '', '', ''),
(29, 'requestor 3', 'qwkeqpowek', 'opqwkpeok', 'sample_category1', '', 'qqwoekpqwoek', 'wqopekkqwoe', 'unavailable', '', '', '', '', ''),
(30, '123123', '12312312', '3123123', 'sample_category2', '', '1231231', '123123', 'resolved', '', '', '', '', ''),
(31, '21312', '3123', '123123', 'sample_category1', '', '123123123 sd', 'sdfsdfsdf asdf ', 'unavailable', '', '', '', '', ''),
(32, 'testing', 'testing', 'testing', 'sample_category1', '', 'asdasd', 'asdasdasd', 'ongoing', '', '', '', '', ''),
(33, 'Test1', 'CICS', '0920-444-3332', 'sample_category2', '', 'description-test', 'justification-test justification-testjustification-testjustification-testjustification-testjustification-test', 'cancelled', '', '', '', '', ''),
(34, 'Jules', 'Department of Foreign Affairs', '099023932', 'sample_category1', '', 'description', 'justification', 'available', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `user_management`
--

CREATE TABLE `user_management` (
  `id` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(20) NOT NULL,
  `status` varchar(50) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_management`
--

INSERT INTO `user_management` (`id`, `name`, `email`, `role`, `status`, `username`, `password`) VALUES
(1, 'Admin 1', 'admin@gmail.com', 'administrator', 'available', 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `issue_category`
--
ALTER TABLE `issue_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_management`
--
ALTER TABLE `user_management`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `issue_category`
--
ALTER TABLE `issue_category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user_management`
--
ALTER TABLE `user_management`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
