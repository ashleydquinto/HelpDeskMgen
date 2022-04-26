-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2022 at 11:13 AM
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
  `title` varchar(30) NOT NULL,
  `sub_category` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issue_category`
--

INSERT INTO `issue_category` (`id`, `title`, `sub_category`) VALUES
(1, 'sample_category1', 'this_is_a_sub'),
(2, 'sample_category2', ''),
(3, 'sample_category3', ''),
(5, 'Laptop', ''),
(6, 'Wifi', ''),
(7, 'Television_sample', '');

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
  `date_resolved` datetime DEFAULT NULL,
  `attached_file` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `requestor`, `department`, `contact_no`, `issue`, `request_category`, `description`, `justification`, `status`, `assigned_engineer`, `sla`, `diagnostic`, `resolution`, `comments`, `date_created`, `date_resolved`, `attached_file`) VALUES
(1, '', '', '', '', '', '', '', '', '', '', '', '', '', '2022-04-19 10:41:19', NULL, NULL),
(2, '', '', '', '', '', '', '', '', '', '', '', '', '', '2022-04-19 10:41:19', NULL, NULL),
(3, '', '', '', '', '', '', '', '', '', '', '', '', '', '2022-04-19 10:41:19', NULL, NULL),
(4, '', '', '', '', '', '', '', '', '', '', '', '', '', '2022-04-19 10:41:19', NULL, NULL),
(5, '', '', '', '', '', '', '', '', '', '', '', '', '', '2022-04-19 10:41:19', NULL, NULL),
(6, '', '', '', '', '', '', '', '', '', '', '', '', '', '2022-04-19 10:41:19', NULL, NULL),
(7, '', '', '', '', '', '', '', '', '', '', '', '', '', '2022-04-19 10:41:19', NULL, NULL),
(8, '', '', '', '', '', '', '', '', '', '', '', '', '', '2022-04-19 10:41:19', NULL, NULL),
(9, 'Me', 'IICS', '09 local 23323', 'sample_category1', 'Request', '2323', '2323', 'Closed', 'sample_assigned-engineer', 'sample_sla', 'sample_diagnostic232323', 'wwqeqwe', 'asdasd', '2022-04-19 10:41:19', NULL, NULL),
(16, 'Jules Test', 'TESTING DEPT', '09209546453', 'sample_category1', '', '23912039012isifjsoidfjoxcvkxcnvkxcnvkfoiajwdiojdw HABA\nHABAHABAHABAHABAHABAHABA HABA\nHABA\nHABA\n', '23912039012isifjsoidfjoxcvkxcnvkxcnvkfoiajwdiojdw HABA\nHABAHABAHABAHABAHABAHABA HABA\nHABA\nHABA\n', 'Closed', '232323', 'asd', 'asdasd', 'michael-pangilinan', 'asdasd', '2022-04-19 10:41:19', NULL, NULL),
(19, 'requestor 1', 'department of foreign affairs', '09 local 23', 'sample_category2', 'Problem', 'sdasd', 'asdasd', 'Pending', 'ashley', '8 hours', 'can do this ', '', '', '2022-04-19 10:41:19', NULL, NULL),
(20, 'Patrick Adrian Bolivar', 'Development Team', '09342323231', 'sample_category2', 'Incident', 'sample description', 'sample description', 'Resolved', '', '', '', '', '', '2022-04-19 10:41:19', '2022-04-25 01:37:04', NULL),
(21, 'try', 'try', '02392039023', 'sample_category1', '', '343434', '343434', 'available', '', '', '', '', '', '2022-04-19 10:41:19', NULL, NULL),
(22, 'Tester Data', 'Test department', '09204232123', 'sample_category2', 'Problem', 'sample description', ' sample uletttsample uletttsample uletttsample uletttsample uletttsample ulettt sample uletttsample ulettt sample ulettt', 'available', '', '', '', '', '', '2022-04-19 10:41:19', NULL, NULL),
(23, '', '', '', '', '', '', '', 'available', 'Jules Mayo', 'asdasd', '', '', '', '2022-04-19 10:41:19', NULL, NULL),
(24, 'sample', 'sample', '293091023', 'sample_category2', 'Incident', '1231231', '23123123', 'Resolved', '', '', '', '', '', '2022-04-19 10:41:19', '2022-04-25 23:55:10', NULL),
(25, 'request1', 'dept1', 'contact1', 'issue-issuehan', '', 'desc1', 'justify1', 'Resolved', 'testing-engineer2', '', 'asdasd', '', '', '2022-04-19 10:41:19', NULL, NULL),
(26, 'requestor2', 'department of foreign affairs', '0920-453-2341', 'sample_category2', '', 'description 2', 'justify!! justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!justify!!ju', 'Closed', '', '', '', '', '', '2022-04-19 10:41:19', NULL, NULL),
(27, 'rewr', 'qweqwe', 'qweqwe', 'sample_category2', '', 'qweqwe', 'qweqweqwe', 'Cancelled', '', '', '', '', '', '2022-04-19 10:41:19', NULL, NULL),
(28, 'qweqwe', 'qweqweq', 'weqweqweq', 'sample_category2', '', 'qweqwe', 'qweqweqwe', 'Closed', 'assigned-engr', '', 'Diagnostic-1', 'Resolution---1', 'Comments', '2022-04-19 10:41:19', NULL, NULL),
(29, 'requestor 3', 'qwkeqpowek', 'opqwkpeok', 'sample_category1', '', 'qqwoekpqwoek', 'wqopekkqwoe', 'Pending', 'asdasd', 'asdasd', 'asdasd', 'asd', 'adasd', '2022-04-19 10:41:19', NULL, NULL),
(30, '123123', '12312312', '3123123', 'sample_category2', 'Request', '1231231', '123123', 'resolved', '', '', '', '', '', '2022-04-19 10:41:19', NULL, NULL),
(31, '21312', '3123', '123123', 'sample_category1', '', '123123123 sd', 'sdfsdfsdf asdf ', 'Ongoing', '', '', '', '', '', '2022-04-19 10:41:19', NULL, NULL),
(32, 'testing', 'testing', 'testing', 'sample_category1', '', 'asdasd', 'asdasdasd', 'ongoing', '', '', '', '', '', '2022-04-19 10:41:19', NULL, NULL),
(33, 'Test1', 'CICS', '0920-444-3332', 'sample_category2', 'Problem', 'description-test', 'justification-test justification-testjustification-testjustification-testjustification-testjustification-test', 'cancelled', '', '', '', '', '', '2022-04-19 10:41:19', NULL, NULL),
(34, 'Jules', 'Department of Foreign Affairs', '099023932', 'sample_category1', 'Request', 'description', 'justification', 'Ongoing', 'assignment', 's-l A! ', 'sdasdasd', 'asdasd', 'Resolution!!', '2022-04-19 10:41:19', NULL, NULL),
(35, 'Lala', 'sdsdsad', '023023', 'sample_category2', '', 'qweqwe', 'qweqweqwe', 'Ongoing', 'assignment_engineer', '8 hours', '', 'resolution', 'resolved!', '2022-04-19 10:41:19', NULL, NULL),
(36, 'testing', 'dept of testing', '09203432321', 'sample_category3', '', 'describe yourself', 'justify yourself', 'New', '', '', '', '', '', '2022-04-19 10:41:19', NULL, NULL),
(37, 'hello', 'sadasd', '023929', 'sample_category3', '', 'asdasd', 'asdasdasd', 'Resolved', '', '', '', '', '', '2022-04-19 10:41:44', NULL, NULL),
(38, 'qweqwe', 'wqewewe', 'qwewew', 'sample_category3', '', 'zoom-in', 'zoom-out', 'Closed', '', '', '', '', '', '2022-04-19 10:46:04', NULL, NULL),
(39, 'requesting223', 'asdasd', '0920-440-3023', 'sample_category2', '', 'asdasd', 'asdasdasdasd', 'Closed', 'assignment-engineering!!1112', '', '', '', '', '2022-04-19 11:21:18', NULL, NULL),
(40, 'diwa', 'asdasd', '1239123', 'sample_category2', 'Incident', 'asdasd', 'asdasd', 'Closed', '', '', 'this is a sample diagnostic....', 'this is a sample resolution....', 'hello ', '2022-04-19 14:31:51', NULL, NULL),
(41, 'Jules Stephen L. Mayo', 'CICS', '0920-933-6233', 'sample_category3', '', 'Describe me', 'Justify me', 'Closed', '', '', '', '', '', '2022-04-23 11:03:03', NULL, NULL),
(42, 'Lala ', 'House', 'Mayo', 'sample_category3', 'Problem', 'asdasd', 'asdasdasd', 'Resolved', 'Jules', '', 'it is a problem ', 'This can still be solved.', 'Please do it immediately.', '2022-04-25 01:23:38', NULL, NULL),
(43, 'asdasd', 'asdasd', 'asdasd', 'Television_sample', '', 'asdasd', 'asdasd', 'New', '', '', '', '', '', '2022-04-26 01:32:12', NULL, ''),
(44, 'asdasd', 'asdasd', 'asdasd', 'Television_sample', '', 'asdasd', 'asdasd', 'New', '', '', '', '', '', '2022-04-26 01:51:34', NULL, NULL),
(45, 'Requestor 1', 'CICS', '09209546423', 'Television_sample', '', 'asdasd', 'asdasdasd', 'New', '', '', '', '', '', '2022-04-26 11:01:44', NULL, 'email-icon.png'),
(47, 'Jules Mayo', 'Department of Agriculture', '09209546453', 'Television_sample', '', 'Describe me', 'Hello World!', 'New', '', '', '', '', '', '2022-04-26 11:18:42', NULL, '4386078.jpg'),
(48, 'no-file', 'no-file', '09239232323', 'Laptop', '', 'no-file', 'no-file', 'New', '', '', '', '', '', '2022-04-26 11:25:43', NULL, NULL),
(49, 'no-file2', 'no-file232323', '09239203232', 'Wifi', '', 'jdiowjodiwjqiowdj', 'jasodijasiojasiodjasd', 'New', '', '', '', '', '', '2022-04-26 11:42:24', NULL, NULL),
(50, 'no-file3', 'asdasdas', '02932039203', 'Laptop', '', 'asdasd', 'asdasdasd', 'New', '', '', '', '', '', '2022-04-26 12:01:37', NULL, 'dino-void.jpg'),
(51, 'no-file4', 'asdasd', 'sadasdasd', 'Laptop', '', 'describe', 'asdasdasd', 'New', '', '', '', '', '', '2022-04-26 12:02:36', NULL, NULL),
(52, 'test-sla', 'test-sla', '09209543434', 'Wifi', '', 'test-sla', 'test-sla', 'New', '', '', '', '', '', '2022-04-26 13:56:41', NULL, 'bmi.PNG'),
(53, 'test-sla_part2', 'test-sla_part2', '09209546423', 'sample_category2', '', 'test-sla_part2', 'test-sla_part2', 'New', '', '4 hours', '', '', '', '2022-04-26 14:00:37', NULL, 'about-us.PNG'),
(54, 'asdasd123456', '12323sdasd', 'asdasd', 'Wifi', '', 'asdasd', 'asdasda', 'New', '', '4 hours', '', '', '', '2022-04-26 14:01:56', NULL, '3_OOP_Functions.PNG'),
(55, 'asdas', 'asdasd', 'asdasdas', 'Laptop', '', 'qweqwe', '121213', 'New', '', '2 hours', '', '', '', '2022-04-26 14:02:36', NULL, 'tdee.PNG'),
(56, 'test-sla_part3_no-file', 'test-sla_part3', '23123123123', 'sample_category2', '', 'test-sla_part3', 'test-sla_part3', 'Resolved', '', '4 hours', '', '', '', '2022-04-26 14:03:55', '2022-04-26 14:15:42', NULL),
(57, 'test-ticket', 'test-ticket', '09209546453', 'Laptop', 'Problem', 'test-ticket', 'test-ticket', 'Pending', 'jules mayo', '8 hours', '', '', '', '2022-04-26 14:38:16', NULL, 'register.PNG');

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
  `password` varchar(255) NOT NULL,
  `datecreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_management`
--

INSERT INTO `user_management` (`id`, `name`, `email`, `role`, `status`, `username`, `password`, `datecreated`) VALUES
(1, 'Admin 1', 'admin@gmail.com', 'administrator', 'Disabled', 'admin', 'admin', '2022-04-22 11:46:31'),
(2, 'asdasdasd', 'asdasd@gmail.com', 'Administrator', 'Active', 'jules11', 'd6893b6e03230bd6d13aadda6c3c25', '2022-04-22 11:46:31'),
(3, 'jules', 'julesmayo15@gmail.com', 'Administrator', 'Active', 'julesmayo', '09c1feae48bdc8d94d007d362f14d2', '2022-04-22 11:46:31'),
(4, 'administrator', 'admin@email.com', 'Administrator', 'Active', 'administrator', 'b3aca92c793ee0e9b1a9b0a5f5fc04', '2022-04-22 13:16:46'),
(5, 'julesmayo21', 'jules21@email.com', 'Administrator', 'Active', 'julesmayo21', '96ee80fc53820b5a54ea2d52359de8', '2022-04-22 13:34:11'),
(6, 'try-lang', 'julesstephen.mayo.iics@ust.edu.ph', 'Administrator', 'Active', 'try-lang', '9dacd8ae4cecc37b40daf34130d451', '2022-04-22 13:36:18'),
(7, 'trial_account', 'trial@email.com', 'Administrator', 'Active', 'trialaccount', 'b60c93a787032792a096dae0a911fa6485b53f32', '2022-04-22 15:15:24'),
(8, 'Jules Stephen L. Mayo', 'julesmayo@rocketmail.com', 'Administrator', 'Active', 'joulesmayo', 'ec93f7e5005ab28dc92b3aa045479b6e2d984c79', '2022-04-22 17:03:36'),
(9, 'sample-user', 'sample_user@gmail.com', 'Users', 'Active', 'sample-user', '41cb2f7cc5e5bbcd19097509bdd941616e50510b', '2022-04-22 17:04:55'),
(10, 'sample-engineer', 'sampleengineer@user.com', 'Engineer', 'Active', 'sample-engineer', '3f950aa58e41a4b03dcaab7490cdf5a1a7d5f44f', '2022-04-22 17:24:43'),
(11, 'sample-manager', 'sample-manager@user.com', 'Manager', 'Active', 'sample-manager', '2374e519d64a40ff2957f5970edc66824a34ec30', '2022-04-22 17:28:25'),
(12, 'testing-manager', 'manager@test.com', 'Manager', 'Active', 'testing-manager', '024247fe63da4e19ee34da93d4e08dae6c410ad0', '2022-04-23 19:49:40'),
(13, 'hello-admin', 'hello-admin@admin.com', 'Administrator', 'Active', 'hello-admin', 'fa98de29b7a2b4a10fb2d592501925747d1d9061', '2022-04-23 19:51:41');

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `user_management`
--
ALTER TABLE `user_management`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
