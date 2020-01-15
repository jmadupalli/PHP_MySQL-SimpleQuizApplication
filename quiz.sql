-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 15, 2020 at 01:36 PM
-- Server version: 5.7.27-0ubuntu0.19.04.1
-- PHP Version: 7.2.24-0ubuntu0.19.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `aid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  `qid` int(11) NOT NULL,
  `ans` varchar(11) NOT NULL,
  `correct` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`aid`, `tid`, `qid`, `ans`, `correct`) VALUES
(1, 1, 6, 'c2', 'c2'),
(2, 1, 21, 'c3', 'c4'),
(3, 1, 15, 'c2', 'c2'),
(4, 1, 2, 'c2', 'c2'),
(5, 1, 18, 'c1', 'c1'),
(6, 1, 14, 'c1', 'c1'),
(7, 1, 29, 'c3', 'c3'),
(8, 1, 35, 'c4', 'c2'),
(9, 1, 10, 'c1', 'c2'),
(10, 1, 23, 'c2', 'c1'),
(11, 1, 30, 'c1', 'c3'),
(12, 1, 31, 'c2', 'c2'),
(13, 1, 34, 'c4', 'c4'),
(14, 1, 8, 'c1', 'c1'),
(15, 1, 4, 'c3', 'c3'),
(16, 1, 33, 'c3', 'c3'),
(17, 1, 19, 'c1', 'c2'),
(18, 1, 12, 'c4', 'c2'),
(19, 1, 17, 'c1', 'c1'),
(20, 1, 27, 'c4', 'c4');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `qid` int(11) NOT NULL,
  `ques` varchar(500) NOT NULL,
  `c1` varchar(255) NOT NULL,
  `c2` varchar(255) NOT NULL,
  `c3` varchar(255) NOT NULL,
  `c4` varchar(255) NOT NULL,
  `correct` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`qid`, `ques`, `c1`, `c2`, `c3`, `c4`, `correct`) VALUES
(1, 'Exapand SMS', 'Short Message Service', 'Signal Message Service', 'Software Message Servics', 'Software Mail Service', 'c1'),
(2, 'Which IT companys nickname is \"The Big Blue\"', 'Facebook', 'IBM', 'Microsoft', 'Google', 'c2'),
(3, 'Computer hard disk was first introduced by?', 'Intel', 'IBM', 'Motorola', 'Sun microsystems', 'c2'),
(4, 'In computer world trojan reffer to?', 'Memory', 'Hardware', 'Malware', 'Network', 'c3'),
(5, 'Extension type of 2007 excel files?', '.excel', '.xls', '.csv', '.xlsx', 'c4'),
(6, 'Expand ISP', 'Internet Service Protocol', 'Internet Service Provider', 'Internet System Provider', 'Internet System Protocol', 'c2'),
(7, 'Slogan(tagline) of Microsoft', 'Be whats next', 'Connecting people', 'Just do it', 'Building future', 'c1'),
(8, 'How many types of hacking', '7', '6', '2', '4', 'c1'),
(9, 'Who is the father of Indian Super Computer?', 'Narayana murthy', 'Ajim premji', 'Vijay bandurang batkhar', 'Shiv nadar', 'c3'),
(10, 'First emoji was created by?', 'Jack ma', 'Shigitaka kurita', 'Yan wang', 'Tim berners lee', 'c2'),
(11, 'Which is the first company to launch mobile phone in India?', 'Nokia', 'Motorola', 'Samsung', 'Apple', 'c2'),
(12, 'Instagram was invented by?', 'Guido van Rossum', 'Kevin Systrom', 'Larry elison', 'Carlos slim', 'c2'),
(13, '\"Do no evil\" is tagline of?', 'Google', 'Facebook', 'Microsoft', 'Apple', 'c1'),
(14, 'What is the extension of PDF', 'Portable Document Format', 'Portable Device File', 'Personal Document Format', 'Personal Device File', 'c1'),
(15, 'ipad wass manufactured by?', 'Nokia', 'Apple', 'Motorola', 'Samsung', 'c2'),
(16, 'Which is an optical disk?', 'CDROM', 'Floppy disk', 'Magnetic tape', 'pendrive', 'c1'),
(17, 'What is used for computer communication between users?', 'Email', 'Disks', 'Busses', 'None', 'c1'),
(18, 'FIFO stands for ', 'First In First Out', 'File In File Out', 'First In File Out', 'Format In File Out', 'c1'),
(19, '4GL stands for', '4th Geometric Line', '4th Generation Language', '4th Graphical Language', '4th Group Line', 'c2'),
(20, 'Who is the inventor of \"Difference Engine\"?', 'Ada Lovelace', 'Charles babbage', 'Newmann', 'Dennis Ritchie', 'c2'),
(21, 'Who is the father of personal computers', 'Newmann', 'Dennis Ritchie', 'Charles Babbage', 'Edward robert', 'c4'),
(22, 'Who is the father of Computer Science?', 'Alan turing', 'James gosling', 'Dennis Ritchie', 'Bill gates', 'c1'),
(23, 'We organise files by storing them in?', 'Folders', 'Directory', 'Drive', 'Disk', 'c1'),
(24, 'VGA stands for', 'Visual Graphics Architecture', 'Video Graphics Array', 'Visual Geometric Architecture', 'Video Graphics Architecture', 'c2'),
(25, 'Junk email is also called as?', 'Draft', 'Spam', 'Deleted', 'None', 'c2'),
(26, 'What is the other name of programming chip?', 'Lisc', 'Disc', 'Misc', 'All of the above', 'c1'),
(27, 'Which of the folowing is not an operating system?', 'Windows98', 'BSD unix', 'Red Hat unix', 'Microsoft office xp', 'c4'),
(28, 'Who is known as human computer', 'Shakunthala devi', 'Ada lovelace', 'Dennis ritchie', 'James gosling', 'c1'),
(29, 'First graphical game is?', 'Super mario', 'Road rash', 'tic-tac-toe', 'Snake', 'c3'),
(30, 'FORTRAN is acronym for?', 'Format Translator', 'File Translator', 'Formula Translator', 'Format Tester', 'c3'),
(31, 'Slogan of McDonalds', 'Good food', 'Im lovin it', 'Finger licking good', 'just do it', 'c2'),
(32, 'Return value of printf()?', '1', '0', 'no.of characters printed', 'adress of a variable', 'c3'),
(33, 'Header file that contains function prototypes for data conversion?', 'stdio.h', 'iostream.h', 'stdlib.h', 'string.h', 'c3'),
(34, 'Keywords that are also used to declare a class other than class?', 'struct', 'union', 'main', 'both a & b', 'c4'),
(35, 'Return value of scanf()?', '1', 'no.of characters printed', 'adress of a variable', '0', 'c2');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(255) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `rollno` varchar(15) DEFAULT NULL,
  `clg` varchar(64) DEFAULT NULL,
  `clgcode` varchar(6) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `dept` varchar(15) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL,
  `clgevent` int(10) DEFAULT NULL,
  `events` set('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28','29','30','31','32','33','40','42') DEFAULT NULL,
  `tid` int(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `rollno`, `clg`, `clgcode`, `email`, `phone`, `dept`, `regtime`, `clgevent`, `events`, `tid`) VALUES
(1, 'Jayanth M', '15a81a0586', 'sri vasavi engineering college', 'a8', 'gldmarketplace@gmail.com', '9999999999', NULL, NULL, NULL, NULL, 1),
(2, 'Krish', '15a81a05b4', 'sri vasavi engineering college', 'a8', 'test@test.com', '9999999999', NULL, NULL, NULL, NULL, 1),
(3, 'test test', '15a81a0561', 'sri vasavi engineering college', 'a8', 'test@test.com', '9999999999', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `tid` int(32) NOT NULL,
  `mem1` varchar(11) NOT NULL,
  `mem2` varchar(11) NOT NULL,
  `mem3` varchar(11) NOT NULL,
  `noq` int(11) NOT NULL DEFAULT '0',
  `noc` int(11) NOT NULL DEFAULT '0',
  `noi` int(11) NOT NULL DEFAULT '0',
  `start` int(255) DEFAULT NULL,
  `end` int(255) DEFAULT NULL,
  `duration` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`tid`, `mem1`, `mem2`, `mem3`, `noq`, `noc`, `noi`, `start`, `end`, `duration`) VALUES
(1, '15A81A0586', '15A81A0561', '15A81A05B4', 20, 13, 7, 1579075023, 1579075228, 205);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`qid`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`tid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `tid` int(32) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
