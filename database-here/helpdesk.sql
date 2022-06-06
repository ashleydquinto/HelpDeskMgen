-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2022 at 12:21 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

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
-- Table structure for table `incident_table`
--

CREATE TABLE `incident_table` (
  `id` int(10) NOT NULL,
  `rid` int(10) NOT NULL,
  `requestor` varchar(50) NOT NULL,
  `department` varchar(60) NOT NULL,
  `contact_no` varchar(80) NOT NULL,
  `issue` varchar(60) NOT NULL,
  `sub` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `justification` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `priority` varchar(60) NOT NULL,
  `assigned_engineer` varchar(50) NOT NULL,
  `sla` varchar(20) NOT NULL,
  `diagnostic` varchar(255) NOT NULL,
  `resolution` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `rating` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_resolved` datetime DEFAULT NULL,
  `date_responded` datetime DEFAULT NULL,
  `attached_file` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `incident_table`
--

INSERT INTO `incident_table` (`id`, `rid`, `requestor`, `department`, `contact_no`, `issue`, `sub`, `description`, `justification`, `status`, `priority`, `assigned_engineer`, `sla`, `diagnostic`, `resolution`, `comments`, `rating`, `date_created`, `date_resolved`, `date_responded`, `attached_file`) VALUES
(1, 0, 'sample-incident', 'sample-incident', '09209542323', 'Laptop', '', 'sample-incident', 'sample-incident', 'Resolved', 'Medium', 'ticket1-incident', '', '', '2.78 days ', '', '', '2022-05-02 17:11:54', '2022-05-05 11:55:11', '2022-05-17 04:24:46', NULL),
(2, 0, 'sample-2323', 'asdsad', '21312312312', 'sample_category2', '', 'describe this sample describe this sampledescribe this sampledescribe this sample', 'describe this sample describe this sample describe this sample describe this sample', 'Pending', 'High', 'Engineer1-forticket2', '1 hour', 'diagnosis', 'asdasd', '', '', '2022-05-02 17:16:44', '2022-05-05 10:43:17', NULL, NULL),
(3, 0, 'sample-343434', 'asdasd', '23232323231', 'Laptop', '', ' describe this sample vdescribe this sample describe this sample describe this sample', 'describe this sample describe this sample describe this sample  describe this sample describe this sample', 'Closed', 'High', 'John Eric Diwa', '2 hours', 'working on it.', 'this has been done', '', '', '2022-05-02 17:17:18', '2022-05-05 11:00:32', NULL, 'Pics.png'),
(4, 0, 'incident-4', 'sadasd', '09343423232', 'Television_sample', '', 'asdasda', 'asdasdasd', 'New', 'Medium', 'asdasd', '', '', 'could not proceed', 'a:3:{i:0;s:5:\": try\";i:1;s:13:\"Admin 1: try2\";i:2;s:13:\"Admin 1: try2\";}', '', '2022-05-04 14:04:00', NULL, '2022-05-23 11:38:51', 'mypic-cropped .jpeg'),
(5, 0, 'incident-5', 'cdasda', '09232343242', 'sample_category3', '', 'describe-me', 'justify-me', 'Resolved', 'High', 'hello1', '', '', '2.07 minutes ', '', '', '2022-05-12 17:27:48', '2022-05-12 17:29:52', '2022-05-23 11:24:28', NULL),
(7, 1, 'test', 'test', 'test', 'sample_category1', '', 'test', 'test', 'New', 'Low', '', '', '', '', '', '', '2022-06-01 09:25:47', NULL, NULL, NULL),
(8, 1, 'test', 'test', 'test', 'Laptop12', 'Slow', 'test', 'test', 'New', 'Low', '', '', '', '', '', '', '2022-06-01 10:23:32', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `issue_category`
--

CREATE TABLE `issue_category` (
  `id` int(10) NOT NULL,
  `title` varchar(30) NOT NULL,
  `sub_category` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issue_category`
--

INSERT INTO `issue_category` (`id`, `title`, `sub_category`) VALUES
(1, 'sample_category1', NULL),
(2, 'sample_category2', NULL),
(3, 'sample_category3', NULL),
(5, 'Laptop', NULL),
(6, 'Wifi', NULL),
(7, 'Television_sample', NULL),
(8, 'Mobile', NULL),
(10, 'Laptop12', 'a:2:{i:0;s:4:\"Slow\";i:1;s:4:\"Test\";}'),
(12, 'Test', 'a:3:{i:0;s:3:\"bug\";i:1;s:4:\"test\";i:2;s:3:\"try\";}');

-- --------------------------------------------------------

--
-- Table structure for table `problem_table`
--

CREATE TABLE `problem_table` (
  `id` int(10) NOT NULL,
  `rid` int(10) NOT NULL,
  `requestor` varchar(50) NOT NULL,
  `department` varchar(60) NOT NULL,
  `contact_no` varchar(80) NOT NULL,
  `issue` varchar(60) NOT NULL,
  `sub` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `justification` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `priority` varchar(60) NOT NULL,
  `assigned_engineer` varchar(50) NOT NULL,
  `sla` varchar(20) NOT NULL,
  `diagnostic` varchar(255) NOT NULL,
  `resolution` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `rating` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_resolved` datetime DEFAULT NULL,
  `date_responded` datetime DEFAULT NULL,
  `attached_file` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `problem_table`
--

INSERT INTO `problem_table` (`id`, `rid`, `requestor`, `department`, `contact_no`, `issue`, `sub`, `description`, `justification`, `status`, `priority`, `assigned_engineer`, `sla`, `diagnostic`, `resolution`, `comments`, `rating`, `date_created`, `date_resolved`, `date_responded`, `attached_file`) VALUES
(1, 0, 'problem#1', 'problem-no1', '09324214234', 'Laptop', '', 'asdasd', 'asdasdasd', 'Closed', 'Medium', 'engineer-for-problem1', '', '', '', '', NULL, '2022-05-04 14:19:17', '2022-05-05 11:57:30', NULL, NULL),
(2, 0, 'problem#2-withpic', 'problem-no2', '09343232323', 'sample_category3', '', 'asdasdasd', 'asdasdasd', 'Resolved', 'Low', 'ticket-2-i- need-engineer', '2 hours', 'please resolve', 'please resolve', '', NULL, '2022-05-04 14:28:36', '2022-05-12 17:46:17', NULL, NULL),
(3, 0, 'problem#3', 'problem-no3', '09232324234', 'Laptop', '', 'asdasas', 'asdasdasd', 'Resolved', 'Medium', 'hello123', '2 hours', 'diagnosis3', 'resolution3', '', NULL, '2022-05-04 14:30:18', '2022-05-12 17:44:43', NULL, 'jules-portrait.jpg'),
(4, 0, 'problem#4', 'problem-dept', '09232413123', 'Laptop', '', 'adasd', 'asdasd', '', '', '', '', '', '', 'a:2:{i:0;s:12:\"Admin 1: try\";i:1;s:9:\"Admin 1: \";}', NULL, '2022-05-12 17:51:09', '2022-05-12 17:54:41', '2022-05-20 10:12:59', NULL),
(5, 0, 'Problem#5', 'dept#5', '09234234234', 'Television_sample', '', 'dept5', 'pprob5', 'Pending', 'Medium', 'Mark', '30 days', 'qqweqwewq', 'could not proceed', 'a:15:{i:0;s:25:\"<b>Admin 1</b>: test1<br>\";i:1;s:24:\"<b>Admin 1</b>: next<br>\";i:2;s:9:\"Admin 1: \";i:3;s:13:\"Admin 1: okay\";i:4;s:9:\"Admin 1: \";i:5;s:14:\"Admin 1: test2\";i:6;s:9:\"Admin 1: \";i:7;s:9:\"Admin 1: \";i:8;s:9:\"Admin 1: \";i:9;s:14:\"Admin 1: test2\";i:10;s:16:\"Admin 1: test434\";i:11;s:18:\"Admin 1: asdasdasd\";i:12;s:12:\"Admin 1: add\";i:13;s:17:\"Admin 1: qeqweqwe\";i:14;s:12:\"Admin 1: aye\";}', NULL, '2022-05-12 19:22:46', NULL, '2022-05-23 11:25:53', NULL),
(9, 1, 'test', 'tester', '09168803224', 'Laptop12', 'Test', 'test', 'test', 'New', 'Low', '', '', '', '', '', NULL, '2022-06-01 09:22:56', NULL, NULL, NULL),
(10, 1, 'test', 'tset', 'test', 'sample_category1', 'No sub-category', 'test', 'test', 'New', 'Low', '', '', '', '', '', NULL, '2022-06-01 09:48:20', NULL, NULL, NULL),
(11, 1, 'test', 'test', 'test', 'Test', 'test', 'test', 'test', 'New', 'Low', '', '', '', '', '', NULL, '2022-06-01 10:25:21', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `request_table`
--

CREATE TABLE `request_table` (
  `id` int(10) NOT NULL,
  `rid` int(10) NOT NULL,
  `requestor` varchar(50) NOT NULL,
  `department` varchar(60) NOT NULL,
  `contact_no` varchar(80) NOT NULL,
  `issue` varchar(60) NOT NULL,
  `sub` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `justification` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL,
  `priority` varchar(60) NOT NULL,
  `assigned_engineer` varchar(50) NOT NULL,
  `sla` varchar(20) NOT NULL,
  `diagnostic` varchar(255) NOT NULL,
  `resolution` varchar(255) NOT NULL,
  `comments` varchar(255) NOT NULL,
  `rating` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_resolved` datetime DEFAULT NULL,
  `date_responded` datetime DEFAULT NULL,
  `attached_file` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request_table`
--

INSERT INTO `request_table` (`id`, `rid`, `requestor`, `department`, `contact_no`, `issue`, `sub`, `description`, `justification`, `status`, `priority`, `assigned_engineer`, `sla`, `diagnostic`, `resolution`, `comments`, `rating`, `date_created`, `date_resolved`, `date_responded`, `attached_file`) VALUES
(1, 1, 'Test-requestor', 'Test-department', '09209546233', 'asdasd', '', 'testing testing testin', 'testing testing testintesting testing testintesting testing testin', 'Resolved', 'Medium', 'ticket1-request', '', '', '', '', '', '2022-05-02 16:18:09', '2022-05-05 11:55:19', NULL, NULL),
(2, 0, 'hello', 'test-dept', 'helloeeee', 'sample_category3', '', 'asdasdasd', 'its a justification', 'Closed', '', '', '2 hours', 'cannot be done', '', '', '', '2022-05-02 16:23:06', '2022-05-05 10:59:20', NULL, NULL),
(3, 0, 'requestor3', 'asdasd', '09333333333', 'Laptop', '', 'asdasd', 'asdasdasd', 'Resolved', '', '', '8 hours', '', '', '', '', '2022-05-02 16:26:38', '2022-05-05 11:21:59', NULL, 'mgen-black.png'),
(4, 0, 'request#4', '4th-request', '09203543434', 'sample_category3', '', 'asdasd', 'asdasdasd', 'Closed', 'Critical', '', '', '', '', '', '', '2022-05-04 13:59:12', '2022-05-05 10:43:44', NULL, 'MEME HINA.png'),
(5, 0, 'Request#5', 'department#5', '09343242342', 'Wifi', '', 'dept5', 'dept5', 'Resolved', 'Critical', '', '', '', '', '', '', '2022-05-05 10:04:42', '2022-05-05 15:08:09', NULL, NULL),
(6, 0, 'another-request', 'asdasd', '09434234234', 'sample_category3', '', 'qweqwe', 'qweqwe', 'Resolved', 'High', '', '', '', '', '', 'a:11:{s:2:\"r1\";s:21:\"4 (Very Satisfactory)\";s:2:\"r2\";s:21:\"4 (Very Satisfactory)\";s:2:\"r3\";s:21:\"4 (Very Satisfactory)\";s:2:\"r4\";s:21:\"4 (Very Satisfactory)\";s:4:\"qow1\";s:0:\"\";s:4:\"qow2\";s:0:\"\";s:4:\"qow3\";s:0:\"\";s:2:\"d1\";s:0:\"\";s:2:\"d2\";s:0:\"\";s:3:\"ss1\";s:21:\"4 (Very Satisfactory)\";s:3:\"ss2\";s:21:\"4 (Very Satisfactory)\";}', '2022-05-06 12:52:43', '2022-05-06 13:00:04', NULL, NULL),
(7, 0, 'requestor-7', 'asdasdas', '09322131231', 'Television_sample', '', 'describe-me', 'describe-me', 'New', 'Medium', '', '2 hours', '', '', '', '', '2022-05-06 13:40:12', NULL, NULL, 'university.png'),
(8, 0, 'sample-requestor-8', 'Development Team', '09204343434', 'Laptop', '', 'Description', 'Justification', 'Closed', 'High', 'assigned-engineer1', '14 days', 'diagnostic-1', 'resolution', '', '', '2022-05-06 16:14:51', '2022-05-06 16:19:08', NULL, 'image1.png'),
(9, 0, 'test-for-time', 'DFA', '09322323232', 'Wifi', '', 'asdasd', 'asdasdasd', 'Resolved', 'Medium', 'Jules Stephen Mayo', '2 hours', 'diagnosis', '6.28 hours ', 'a:1:{i:0;s:5:\": add\";}', 'a:11:{s:2:\"r1\";s:21:\"4 (Very Satisfactory)\";s:2:\"r2\";s:21:\"4 (Very Satisfactory)\";s:2:\"r3\";s:21:\"4 (Very Satisfactory)\";s:2:\"r4\";s:21:\"4 (Very Satisfactory)\";s:4:\"qow1\";s:21:\"4 (Very Satisfactory)\";s:4:\"qow2\";s:21:\"4 (Very Satisfactory)\";s:4:\"qow3\";s:21:\"4 (Very Satisfactory)\";s:2:\"d1\";s:0:\"\";s:2:\"d2\";s:0:\"\";s:3:\"ss1\";s:21:\"4 (Very Satisfactory)\";s:3:\"ss2\";s:21:\"4 (Very Satisfactory)\";}', '2022-05-12 15:08:24', '2022-05-12 21:25:24', '2022-05-23 09:29:06', NULL),
(10, 0, 'test-responded', 'trying-21', '09232323232', 'sample_category3', '', 'trying-21', 'trying-21', 'New', 'High', 'try-this-one', '', '', 'NaN hours ', 'a:1:{i:0;s:13:\"Admin 1: test\";}', '', '2022-05-12 17:05:07', NULL, '2022-05-23 11:44:06', NULL),
(11, 0, 'test-responded2', 'test-123', '09342342342', 'Laptop', 'test', 'test-me', 'test-me', 'New', 'Low', '', '', '', 'NaN hours ', '', '', '2022-05-12 17:07:03', NULL, NULL, NULL),
(14, 1, 'test', 'tset', 'test', 'Laptop12', 'Slow', 'test', 'test', 'New', 'Low', '', '', '', '', '', '', '2022-06-01 09:22:03', NULL, NULL, NULL),
(15, 1, 'test', 'test', '09168803224', 'Laptop', '', 'test', 'test', 'New', 'Low', '', '', '', '', '', '', '2022-06-01 09:26:23', NULL, NULL, NULL),
(16, 1, 'test', 'test', 'test', 'sample_category1', NULL, 'test', 'test', 'New', '', '', '', '', '', '', '', '2022-06-01 09:31:40', NULL, NULL, NULL),
(17, 1, 'test', 'test', 'test', 'Test', 'bug', 'test', 'test', 'New', 'Low', '', '', '', '', '', '', '2022-06-01 10:24:34', NULL, NULL, NULL);

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
(1, 'Admin 1', 'admin@gmail.com', 'Administrator', 'Active', 'admin', 'c0cba06f0350f6ded419ad1855a80d736522d393', '2022-04-22 11:46:31'),
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
(13, 'hello-admin', 'hello-admin@admin.com', 'Administrator', 'Active', 'hello-admin', 'fa98de29b7a2b4a10fb2d592501925747d1d9061', '2022-04-23 19:51:41'),
(14, 'test-user', 'test-user@user.com', 'Users', 'Active', 'test-user', 'c56486f8b638f63e04251d0c8ab0b4fbfee8e06b', '2022-05-10 11:52:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `incident_table`
--
ALTER TABLE `incident_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issue_category`
--
ALTER TABLE `issue_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `problem_table`
--
ALTER TABLE `problem_table`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_table`
--
ALTER TABLE `request_table`
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
-- AUTO_INCREMENT for table `incident_table`
--
ALTER TABLE `incident_table`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `issue_category`
--
ALTER TABLE `issue_category`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `problem_table`
--
ALTER TABLE `problem_table`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `request_table`
--
ALTER TABLE `request_table`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `user_management`
--
ALTER TABLE `user_management`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
