-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2022 at 05:47 AM
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
  `comments` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_resolved` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `requestor`, `department`, `contact_no`, `issue`, `request_category`, `description`, `justification`, `status`, `assigned_engineer`, `sla`, `diagnostic`, `resolution`, `comments`, `date_created`, `date_resolved`) VALUES
(1, '', '', '', '', '', '', '', '', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(2, '', '', '', '', '', '', '', '', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(3, '', '', '', '', '', '', '', '', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(4, '', '', '', '', '', '', '', '', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(5, '', '', '', '', '', '', '', '', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(6, '', '', '', '', '', '', '', '', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(7, '', '', '', '', '', '', '', '', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(8, '', '', '', '', '', '', '', '', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(9, 'Me', 'IICS', '09 local 23323', 'sample_category1', 'Request', '2323', '2323', 'Pending', 'sample_assigned-engineer', 'sample_sla', 'sample_diagnostic232323', 'wwqeqwe', 'asdasd', '2022-04-19 10:41:19', NULL),
(16, 'Jules Test', 'TESTING DEPT', '09209546453', 'sample_category1', '', '23912039012isifjsoidfjoxcvkxcnvkxcnvkfoiajwdiojdw HABA\nHABAHABAHABAHABAHABAHABA HABA\nHABA\nHABA\n', '23912039012isifjsoidfjoxcvkxcnvkxcnvkfoiajwdiojdw HABA\nHABAHABAHABAHABAHABAHABA HABA\nHABA\nHABA\n', 'Resolved', '232323', 'asd', 'asdasd', 'michael-pangilinan', 'asdasd', '2022-04-19 10:41:19', NULL),
(19, 'requestor 1', 'department of foreign affairs', '09 local 23', 'sample_category2', 'Problem', 'sdasd', 'asdasd', 'Pending', 'ashley', '8 hours', 'can do this ', '', '', '2022-04-19 10:41:19', NULL),
(20, 'Patrick Adrian Bolivar', 'Development Team', '09342323231', 'sample_category2', 'Incident', 'sample description', 'sample description', 'available', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(21, 'try', 'try', '02392039023', 'sample_category1', '', '343434', '343434', 'available', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(22, 'Tester Data', 'Test department', '09204232123', 'sample_category2', 'Problem', 'sample description', ' sample uletttsample uletttsample uletttsample uletttsample uletttsample ulettt sample uletttsample ulettt sample ulettt', 'available', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(23, '', '', '', '', '', '', '', 'available', 'Jules Mayo', 'asdasd', '', '', '', '2022-04-19 10:41:19', NULL),
(24, 'sample', 'sample', '293091023', 'sample_category2', 'Incident', '1231231', '23123123', 'Ongoing', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(25, 'request1', 'dept1', 'contact1', 'issue-issuehan', '', 'desc1', 'justify1', 'Resolved', 'testing-engineer2', '', 'asdasd', '', '', '2022-04-19 10:41:19', NULL),
(26, 'requestor2', 'department of foreign affairs', '0920-453-2341', 'sample_category2', '', 'description 2', 'justify!! justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!ju', 'Resolved', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(27, 'rewr', 'qweqwe', 'qweqwe', 'sample_category2', '', 'qweqwe', 'qweqweqwe', 'Cancelled', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(28, 'qweqwe', 'qweqweq', 'weqweqweq', 'sample_category2', '', 'qweqwe', 'qweqweqwe', 'Closed', 'assigned-engr', '', 'Diagnostic-1', 'Resolution---1', 'Comments', '2022-04-19 10:41:19', NULL),
(29, 'requestor 3', 'qwkeqpowek', 'opqwkpeok', 'sample_category1', '', 'qqwoekpqwoek', 'wqopekkqwoe', 'Pending', 'asdasd', 'asdasd', 'asdasd', 'asd', 'adasd', '2022-04-19 10:41:19', NULL),
(30, '123123', '12312312', '3123123', 'sample_category2', '', '1231231', '123123', 'resolved', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(31, '21312', '3123', '123123', 'sample_category1', '', '123123123 sd', 'sdfsdfsdf asdf ', 'Ongoing', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(32, 'testing', 'testing', 'testing', 'sample_category1', '', 'asdasd', 'asdasdasd', 'ongoing', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(33, 'Test1', 'CICS', '0920-444-3332', 'sample_category2', 'Problem', 'description-test', 'justification-test justification-testjustification-testjustification-testjustification-testjustification-test', 'cancelled', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(34, 'Jules', 'Department of Foreign Affairs', '099023932', 'sample_category1', 'Request', 'description', 'justification', 'Ongoing', 'assignment', 's-l A! ', 'sdasdasd', 'asdasd', 'Resolution!!', '2022-04-19 10:41:19', NULL),
(35, 'Lala', 'sdsdsad', '023023', 'sample_category2', '', 'qweqwe', 'qweqweqwe', 'Ongoing', 'ako, bakit?!', '8 hours', '', 'resolution', 'resolved!', '2022-04-19 10:41:19', NULL),
(36, 'testing', 'dept of testing', '09203432321', 'sample_category3', '', 'describe yourself', 'justify yourself', 'New', '', '', '', '', '', '2022-04-19 10:41:19', NULL),
(37, 'hello', 'sadasd', '023929', 'sample_category3', '', 'asdasd', 'asdasdasd', 'New', '', '', '', '', '', '2022-04-19 10:41:44', NULL),
(38, 'qweqwe', 'wqewewe', 'qwewew', 'sample_category3', '', 'zoom-in', 'zoom-out', 'New', '', '', '', '', '', '2022-04-19 10:46:04', NULL),
(39, 'requesting223', 'asdasd', '0920-440-3023', 'sample_category2', '', 'asdasd', 'asdasdasdasd', 'New', 'assignment-engineering!!1112', '', '', '', '', '2022-04-19 11:21:18', NULL);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `user_management`
--
ALTER TABLE `user_management`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
