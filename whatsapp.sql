-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 07, 2021 at 10:39 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `whatsapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `receiver` int(11) NOT NULL,
  `body` text NOT NULL,
  `sent_time` varchar(25) NOT NULL,
  `receive_time` varchar(25) NOT NULL,
  `chat_thread` varchar(10) NOT NULL,
  `seen` tinyint(1) NOT NULL,
  `message_type` varchar(10) NOT NULL,
  `last_update` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`message_id`, `sender`, `receiver`, `body`, `sent_time`, `receive_time`, `chat_thread`, `seen`, `message_type`, `last_update`) VALUES
(1, 4, 7, 'hello, how are you', '1624694332', '0', '4_7', 0, 'text', 1624694332),
(2, 4, 3, 'hi', '1624696079', '0', '4_3', 0, 'text', 1624696079),
(3, 4, 7, 'I hope you are fine today!', '1624696927', '0', '4_7', 0, 'text', 1624696927),
(4, 4, 7, 'I wish you a nice day!', '1624696942', '0', '4_7', 0, 'text', 1624696942),
(5, 4, 7, 'I love you!', '1624696953', '0', '4_7', 0, 'text', 1624696953),
(6, 4, 7, '😘😘😘😘', '1624696962', '0', '4_7', 0, 'text', 1624696962),
(7, 4, 3, 'tHIS IS MUHINDO', '1624700171', '0', '4_3', 0, 'text', 1624700171),
(8, 4, 3, 'JUST WANTED TO SAY HI', '1624700184', '0', '4_3', 0, 'text', 1624700184),
(9, 4, 6, 'good night', '1624700494', '0', '4_6', 0, 'text', 1624700494),
(10, 4, 6, 'this is simple\nthanks', '1624700556', '0', '4_6', 0, 'text', 1624700556),
(11, 4, 6, 'i love you too', '1624700565', '0', '4_6', 0, 'text', 1624700565),
(12, 4, 3, 'so sorry', '1624700894', '0', '4_3', 0, 'text', 1624700894),
(13, 4, 3, 'there are', '1624700902', '0', '4_3', 0, 'text', 1624700902),
(14, 4, 3, 'just say it', '1624700929', '0', '4_3', 0, 'text', 1624700929),
(15, 4, 3, 'ahjsv', '1624701015', '0', '4_3', 0, 'text', 1624701015),
(16, 4, 3, 'so eassy', '1624701024', '0', '4_3', 0, 'text', 1624701024),
(17, 4, 3, 'abalala', '1624701033', '0', '4_3', 0, 'text', 1624701033),
(18, 4, 3, 'sunday', '1624701044', '0', '4_3', 0, 'text', 1624701044),
(19, 4, 3, 'are you there?', '1624702989', '0', '4_3', 0, 'text', 1624702989),
(20, 4, 3, 'i will see you tomorrow!', '1624703001', '0', '4_3', 0, 'text', 1624703001),
(21, 4, 3, 'now', '1624703507', '0', '4_3', 0, 'text', 1624703507),
(22, 1, 2, 'Good morning!', '1624703702', '0', '1_2', 0, 'text', 1624703702),
(23, 4, 3, 'simple', '1624703714', '0', '4_3', 0, 'text', 1624703714),
(24, 4, 3, 'nice day', '1624704759', '0', '4_3', 0, 'text', 1624704759),
(25, 4, 3, 'hi', '1624704836', '0', '4_3', 0, 'text', 1624704836),
(26, 4, 3, 'kasa', '1624705735', '0', '4_3', 0, 'text', 1624705735),
(27, 4, 6, 'good day!', '1624705864', '0', '4_6', 0, 'text', 1624705864),
(28, 4, 3, 'this', '1624707491', '0', '4_3', 0, 'text', 1624707491),
(29, 4, 3, 'hi', '1624707558', 'sent', '4_3', 0, 'text', 1624707558),
(30, 4, 3, 'hi', '1624707991', 'sent', '4_3', 0, 'text', 1624707991),
(31, 4, 3, 'this is muhindo', '1624708008', 'sent', '4_3', 0, 'text', 1624708008),
(32, 4, 3, 'i wish u a agood day!', '1624708017', 'sent', '4_3', 0, 'text', 1624708017),
(33, 4, 3, 'hi sabia', '1624729507', 'sent', '4_3', 0, 'text', 1624729507),
(34, 4, 7, 'Hello Halima', '1624729539', 'sent', '4_7', 0, 'text', 1624729539),
(35, 7, 4, 'hi', '1624732874', 'sent', '4_7', 0, 'text', 1624732874),
(36, 7, 4, 'this is amazing', '1624732929', 'sent', '4_7', 0, 'text', 1624732929),
(37, 7, 4, 'i love it!', '1624732936', 'sent', '4_7', 0, 'text', 1624732936);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `reg_date` int(11) NOT NULL,
  `last_seen` int(11) NOT NULL,
  `profile_photo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `phone_number`, `reg_date`, `last_seen`, `profile_photo`) VALUES
(1, 'Muhindo', '0779755798', 1621957325, 1621957325, ''),
(2, 'John Doe', '01632257609', 1621957576, 1621957576, ''),
(3, 'Biira Sabia', '+880163225711', 1624348437, 1624348437, ''),
(4, 'qwqwqw', '55555', 1624351120, 1624351120, ''),
(5, 'John Test', '0882972612', 1624351228, 1624351228, ''),
(6, 'John Cole', '0882686213', 1624351587, 1624351587, ''),
(7, 'Biirah Halima', '123456', 1624530275, 1624530275, ''),
(8, 'Biira', 'Sumayya', 1625752750, 1625752750, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
