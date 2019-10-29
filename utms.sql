-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2019 at 09:02 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `utms`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_student`
--

CREATE TABLE `accounts_student` (
  `id` int(11) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `phone_number` varchar(200) NOT NULL,
  `emergency_number` varchar(200) NOT NULL,
  `birth_date` date NOT NULL,
  `nid_number` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `height` decimal(2,1) NOT NULL,
  `weight` int(11) NOT NULL,
  `religion` varchar(200) NOT NULL,
  `marital_status` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `address_line_1` varchar(200) NOT NULL,
  `address_line_2` varchar(200) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `updated_by` varchar(200) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `student_id` varchar(200) NOT NULL,
  `department_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_student`
--

INSERT INTO `accounts_student` (`id`, `first_name`, `last_name`, `phone_number`, `emergency_number`, `birth_date`, `nid_number`, `gender`, `height`, `weight`, `religion`, `marital_status`, `email`, `slug`, `address_line_1`, `address_line_2`, `created_by`, `updated_by`, `created_date`, `updated_date`, `student_id`, `department_id`, `is_active`) VALUES
(1, 'Mahadi', 'Hassan', '01644342973', '', '2019-10-26', '', '0', '5.6', 68, '0', '', '16103046@iubat.edu', '16103046', 'Uttara, Dhaka', '', 'mahadi', 'mahadi', '2019-10-25 19:22:16.452839', '2019-10-25 19:22:16.452854', '16103046', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_teacher`
--

CREATE TABLE `accounts_teacher` (
  `id` int(11) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `phone_number` varchar(200) NOT NULL,
  `emergency_number` varchar(200) NOT NULL,
  `birth_date` date NOT NULL,
  `nid_number` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `height` decimal(2,1) NOT NULL,
  `weight` int(11) NOT NULL,
  `religion` varchar(200) NOT NULL,
  `marital_status` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `address_line_1` varchar(200) NOT NULL,
  `address_line_2` varchar(200) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `updated_by` varchar(200) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `employee_id` varchar(50) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `department_id` int(11) NOT NULL,
  `experience` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `previous_employment` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_teacher`
--

INSERT INTO `accounts_teacher` (`id`, `first_name`, `last_name`, `phone_number`, `emergency_number`, `birth_date`, `nid_number`, `gender`, `height`, `weight`, `religion`, `marital_status`, `email`, `slug`, `address_line_1`, `address_line_2`, `created_by`, `updated_by`, `created_date`, `updated_date`, `employee_id`, `designation`, `department_id`, `experience`, `is_active`, `previous_employment`) VALUES
(2, 'Krishna', 'Das', '2345679', '', '2019-10-27', '', '0', '5.8', 80, '1', '0', 'krishna.das@iubat.edu', 'cse191', 'Uttara, Dhaka', '', 'mahadi', 'mahadi', '2019-10-27 16:34:03.325328', '2019-10-27 16:46:01.202887', 'CSE191', '4', 1, 5, 1, ''),
(3, 'Saheenur', 'Alam', '456789', '', '2019-10-27', '', '0', '5.6', 70, '0', '0', 'saheen@iubat.edu', 'cse192', 'Uttara, Dhaka', '', 'mahadi', 'mahadi', '2019-10-27 16:35:15.903260', '2019-10-27 16:35:15.903260', 'CSE192', '1', 1, 3, 1, ''),
(4, 'Sajid', 'Shahriar', '2345678', '', '2019-10-27', '', '0', '5.8', 80, '0', '1', 'sajid@iubat.edu', 'cse193', 'Uttara, Dhaka', '', 'mahadi', 'mahadi', '2019-10-27 16:49:20.749325', '2019-10-27 16:49:20.749325', 'CSE193', '1', 1, 3, 1, ''),
(5, 'Ayesha', 'Siddique', '2345678', '', '2019-10-27', '', '1', '5.3', 60, '0', '1', 'ayesha.siddique@iubat.edu', 'cse194', 'Uttara, Dhaka', '', 'mahadi', 'mahadi', '2019-10-27 16:50:49.626376', '2019-10-27 16:50:49.626376', 'CSE194', '0', 1, 2, 1, ''),
(7, 'Fawziya', 'Yakub', '345678', '', '2019-10-27', '', '1', '5.3', 52, '0', '0', 'fawziya.yakub@iubat.edu', 'eng195', 'Uttara, Dhaka', '', 'mahadi', 'mahadi', '2019-10-27 16:56:08.461751', '2019-10-27 16:56:08.461751', 'Eng195', '1', 6, 4, 1, ''),
(8, 'Rashida', 'Parvin', '3456789', '', '2019-10-27', '', '1', '5.6', 60, '0', '0', 'rashida.parvin@iubat.edu', 'mat196', 'Uttara, Dhaka', '', 'mahadi', 'mahadi', '2019-10-27 16:57:38.327270', '2019-10-27 16:57:38.327270', 'Mat196', '4', 10, 5, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'passenger');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add department', 7, 'add_department'),
(26, 'Can change department', 7, 'change_department'),
(27, 'Can delete department', 7, 'delete_department'),
(28, 'Can view department', 7, 'view_department'),
(29, 'Can add teacher', 8, 'add_teacher'),
(30, 'Can change teacher', 8, 'change_teacher'),
(31, 'Can delete teacher', 8, 'delete_teacher'),
(32, 'Can view teacher', 8, 'view_teacher'),
(33, 'Can add student', 9, 'add_student'),
(34, 'Can change student', 9, 'change_student'),
(35, 'Can delete student', 9, 'delete_student'),
(36, 'Can view student', 9, 'view_student'),
(37, 'Can add driver', 10, 'add_driver'),
(38, 'Can change driver', 10, 'change_driver'),
(39, 'Can delete driver', 10, 'delete_driver'),
(40, 'Can view driver', 10, 'view_driver'),
(41, 'Can add staff', 11, 'add_staff'),
(42, 'Can change staff', 11, 'change_staff'),
(43, 'Can delete staff', 11, 'delete_staff'),
(44, 'Can view staff', 11, 'view_staff'),
(45, 'Can add complaint', 12, 'add_complaint'),
(46, 'Can change complaint', 12, 'change_complaint'),
(47, 'Can delete complaint', 12, 'delete_complaint'),
(48, 'Can view complaint', 12, 'view_complaint'),
(49, 'Can add vehicle info', 13, 'add_vehicleinfo'),
(50, 'Can change vehicle info', 13, 'change_vehicleinfo'),
(51, 'Can delete vehicle info', 13, 'delete_vehicleinfo'),
(52, 'Can view vehicle info', 13, 'view_vehicleinfo'),
(53, 'Can add route info', 14, 'add_routeinfo'),
(54, 'Can change route info', 14, 'change_routeinfo'),
(55, 'Can delete route info', 14, 'delete_routeinfo'),
(56, 'Can view route info', 14, 'view_routeinfo'),
(57, 'Can add stoppage', 15, 'add_stoppage'),
(58, 'Can change stoppage', 15, 'change_stoppage'),
(59, 'Can delete stoppage', 15, 'delete_stoppage'),
(60, 'Can view stoppage', 15, 'view_stoppage'),
(61, 'Can add route stoppage', 16, 'add_routestoppage'),
(62, 'Can change route stoppage', 16, 'change_routestoppage'),
(63, 'Can delete route stoppage', 16, 'delete_routestoppage'),
(64, 'Can view route stoppage', 16, 'view_routestoppage');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$150000$rId4ER3M7VIN$AP3MVc5g5Bu8GNTCrXzWi08In6K2tPZIXNTwTjAtZTk=', '2019-10-27 14:46:22.482608', 1, 'mahadi', '', '', 'mahadi.hasan@divine-it.net', 1, 1, '2019-10-25 18:53:47.081605'),
(2, 'pbkdf2_sha256$150000$MV7zizFHhkd8$rJEA3YPjZMBYlbMG9CFmClZToZjTeXo7KrXUWW8+yTQ=', '2019-10-26 14:12:56.538276', 0, '16103046', '', '', '16103046@iubat.edu', 0, 1, '2019-10-25 20:10:17.568170');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `complaint_complaint`
--

CREATE TABLE `complaint_complaint` (
  `id` int(11) NOT NULL,
  `complaint_type` varchar(100) NOT NULL,
  `incident_date` date NOT NULL,
  `complaint_date` datetime(6) NOT NULL,
  `complaint_by` varchar(200) NOT NULL,
  `accepted_by` varchar(100) NOT NULL,
  `status` varchar(200) NOT NULL,
  `bus_number_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `departments_department`
--

CREATE TABLE `departments_department` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments_department`
--

INSERT INTO `departments_department` (`id`, `name`) VALUES
(1, 'CSE'),
(2, 'EEE'),
(3, 'ME'),
(4, 'CE'),
(5, 'Physics'),
(6, 'English'),
(7, 'BBA'),
(8, 'Economics'),
(9, 'Statistics'),
(10, 'Mathematics');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2019-10-25 18:55:50.167316', '1', 'CSE', 1, '[{"added": {}}]', 7, 1),
(2, '2019-10-25 18:55:55.256753', '2', 'EEE', 1, '[{"added": {}}]', 7, 1),
(3, '2019-10-25 18:55:58.912523', '3', 'ME', 1, '[{"added": {}}]', 7, 1),
(4, '2019-10-25 18:56:02.935255', '4', 'CE', 1, '[{"added": {}}]', 7, 1),
(5, '2019-10-25 18:56:13.458512', '5', 'Physics', 1, '[{"added": {}}]', 7, 1),
(6, '2019-10-25 18:56:19.325207', '6', 'English', 1, '[{"added": {}}]', 7, 1),
(7, '2019-10-25 18:56:23.814512', '7', 'BBA', 1, '[{"added": {}}]', 7, 1),
(8, '2019-10-25 18:56:31.849384', '8', 'Economics', 1, '[{"added": {}}]', 7, 1),
(9, '2019-10-25 18:56:37.949304', '9', 'Statistics', 1, '[{"added": {}}]', 7, 1),
(10, '2019-10-25 18:56:56.672322', '10', 'Mathematics', 1, '[{"added": {}}]', 7, 1),
(11, '2019-10-25 18:58:18.645379', 'None', 'Mahadi Hassan', 1, '[{"added": {}}]', 9, 1),
(12, '2019-10-25 19:00:03.895509', 'None', 'Shahporan Himel', 1, '[{"added": {}}]', 9, 1),
(13, '2019-10-25 19:01:05.099812', '1', 'passenger', 1, '[{"added": {}}]', 3, 1),
(14, '2019-10-25 19:16:26.044703', 'None', 'Mahadi Hassan', 1, '[{"added": {}}]', 9, 1),
(15, '2019-10-25 19:17:49.672699', 'None', 'Shahporan Himel', 1, '[{"added": {}}]', 9, 1),
(16, '2019-10-25 19:23:25.824389', '1', 'Mahadi Hassan', 1, '[{"added": {}}]', 9, 1),
(17, '2019-10-27 15:41:04.863226', '1', 'Krishna Das', 1, '[{"added": {}}]', 8, 1),
(18, '2019-10-27 15:43:12.298952', '1', 'Krishna Das', 3, '', 8, 1),
(19, '2019-10-27 16:34:03.343593', '2', 'Krishna Das', 1, '[{"added": {}}]', 8, 1),
(20, '2019-10-27 16:35:15.940039', '3', 'Saheenur Alam', 1, '[{"added": {}}]', 8, 1),
(21, '2019-10-27 16:44:36.672440', '2', 'Krishna Das', 2, '[{"changed": {"fields": ["designation"]}}]', 8, 1),
(22, '2019-10-27 16:46:01.261693', '2', 'Krishna Das', 2, '[{"changed": {"fields": ["designation"]}}]', 8, 1),
(23, '2019-10-27 16:49:20.759260', '4', 'Sajid Shahriar', 1, '[{"added": {}}]', 8, 1),
(24, '2019-10-27 16:50:49.644191', '5', 'Ayesha Siddique', 1, '[{"added": {}}]', 8, 1),
(25, '2019-10-27 16:51:57.804427', '6', 'Fawziya Yakub', 1, '[{"added": {}}]', 8, 1),
(26, '2019-10-27 16:54:36.445818', '6', 'Fawziya Yakub', 2, '[]', 8, 1),
(27, '2019-10-27 16:54:56.927155', '6', 'Fawziya Yakub', 3, '', 8, 1),
(28, '2019-10-27 16:56:08.497905', '7', 'Fawziya Yakub', 1, '[{"added": {}}]', 8, 1),
(29, '2019-10-27 16:57:38.369894', '8', 'Rashida Parvin', 1, '[{"added": {}}]', 8, 1),
(30, '2019-10-27 17:51:35.553920', '1', 'Campus-Ajompur', 1, '[{"added": {}}]', 14, 1),
(31, '2019-10-27 17:52:01.451071', '2', 'Campus-Mohakhali', 1, '[{"added": {}}]', 14, 1),
(32, '2019-10-27 17:52:31.523079', '3', 'Campus-Mirpur', 1, '[{"added": {}}]', 14, 1),
(33, '2019-10-27 17:52:58.504167', '1', 'Abdullapur', 1, '[{"added": {}}]', 15, 1),
(34, '2019-10-27 17:54:19.357024', '3', 'House Building', 1, '[{"added": {}}]', 15, 1),
(35, '2019-10-27 17:57:16.782904', '5', 'BNS', 1, '[{"added": {}}]', 15, 1),
(36, '2019-10-27 17:57:27.041453', '6', 'House Building', 1, '[{"added": {}}]', 15, 1),
(37, '2019-10-27 17:57:43.295823', '7', 'Rajlokhi', 1, '[{"added": {}}]', 15, 1),
(38, '2019-10-27 17:57:56.506453', '8', 'Abdullapur', 1, '[{"added": {}}]', 15, 1),
(39, '2019-10-27 17:58:19.652171', '9', 'House Building', 1, '[{"added": {}}]', 15, 1),
(40, '2019-10-27 17:58:32.141684', '10', 'JashimUddin', 1, '[{"added": {}}]', 15, 1),
(41, '2019-10-27 18:13:46.867344', '11', 'Khilkhet', 1, '[{"added": {}}]', 15, 1),
(42, '2019-10-27 18:19:56.557824', '1', 'Abdullapur', 3, '', 15, 1),
(43, '2019-10-27 18:19:56.904203', '5', 'BNS', 3, '', 15, 1),
(44, '2019-10-27 18:19:56.969874', '6', 'House Building', 3, '', 15, 1),
(45, '2019-10-27 18:19:57.058427', '7', 'Rajlokhi', 3, '', 15, 1),
(46, '2019-10-27 18:19:57.103824', '8', 'Abdullapur', 3, '', 15, 1),
(47, '2019-10-27 18:19:57.169124', '9', 'House Building', 3, '', 15, 1),
(48, '2019-10-27 18:19:57.248060', '10', 'JashimUddin', 3, '', 15, 1),
(49, '2019-10-27 18:19:57.367191', '11', 'Khilkhet', 3, '', 15, 1),
(50, '2019-10-27 18:31:11.598082', '12', 'Abdullapur', 1, '[{"added": {}}]', 15, 1),
(51, '2019-10-27 18:31:21.941752', '13', 'House Building', 1, '[{"added": {}}]', 15, 1),
(52, '2019-10-27 18:31:30.019859', '14', 'Ajompur', 1, '[{"added": {}}]', 15, 1),
(53, '2019-10-27 18:31:35.528524', '15', 'BNS', 1, '[{"added": {}}]', 15, 1),
(54, '2019-10-27 18:31:43.642128', '16', 'Jashim Uddin', 1, '[{"added": {}}]', 15, 1),
(55, '2019-10-27 18:31:50.568289', '17', 'Khilkhet', 1, '[{"added": {}}]', 15, 1),
(56, '2019-10-27 18:31:55.833404', '18', 'Airport', 1, '[{"added": {}}]', 15, 1),
(57, '2019-10-27 18:32:09.214714', '19', 'Kawla', 1, '[{"added": {}}]', 15, 1),
(58, '2019-10-27 18:32:26.351390', '20', 'Bisshwroad', 1, '[{"added": {}}]', 15, 1),
(59, '2019-10-27 18:32:32.530133', '21', 'MES', 1, '[{"added": {}}]', 15, 1),
(60, '2019-10-27 18:32:41.528927', '22', 'Banani', 1, '[{"added": {}}]', 15, 1),
(61, '2019-10-27 18:32:53.668659', '23', 'Khilkhet', 1, '[{"added": {}}]', 15, 1),
(62, '2019-10-27 18:33:31.384649', '24', 'Kakoli', 1, '[{"added": {}}]', 15, 1),
(63, '2019-10-27 18:33:41.060954', '25', 'Chairman Bari', 1, '[{"added": {}}]', 15, 1),
(64, '2019-10-27 18:33:54.490818', '26', 'Mohakhali-Kachabazar', 1, '[{"added": {}}]', 15, 1),
(65, '2019-10-27 18:34:09.412768', '27', 'Saheen College', 1, '[{"added": {}}]', 15, 1),
(66, '2019-10-27 18:34:19.511413', '28', 'Jahangir Gate', 1, '[{"added": {}}]', 15, 1),
(67, '2019-10-27 18:34:34.279029', '29', 'Prime Minister karjaloy', 1, '[{"added": {}}]', 15, 1),
(68, '2019-10-27 18:34:51.903814', '30', 'Khamarbari', 1, '[{"added": {}}]', 15, 1),
(69, '2019-10-27 18:35:29.382392', '31', 'Bijoy Soroni', 1, '[{"added": {}}]', 15, 1),
(70, '2019-10-27 18:35:40.312078', '32', 'Farmgate', 1, '[{"added": {}}]', 15, 1),
(71, '2019-10-27 18:35:45.637765', '33', 'Tejgaon', 1, '[{"added": {}}]', 15, 1),
(72, '2019-10-27 18:35:51.089862', '34', 'Satrasta', 1, '[{"added": {}}]', 15, 1),
(73, '2019-10-27 18:35:56.395926', '35', 'Tibbot', 1, '[{"added": {}}]', 15, 1),
(74, '2019-10-27 18:36:01.260340', '36', 'Nabisco', 1, '[{"added": {}}]', 15, 1),
(75, '2019-10-27 18:36:09.430421', '37', 'Mogbazar', 1, '[{"added": {}}]', 15, 1),
(76, '2019-10-27 18:36:15.586267', '38', 'Hatirjheel', 1, '[{"added": {}}]', 15, 1),
(77, '2019-10-27 18:36:21.185284', '39', 'Malibag', 1, '[{"added": {}}]', 15, 1),
(78, '2019-10-27 18:36:25.897679', '40', 'Mouchak', 1, '[{"added": {}}]', 15, 1),
(79, '2019-10-27 18:36:32.587530', '41', 'Shantinagar', 1, '[{"added": {}}]', 15, 1),
(80, '2019-10-27 18:36:41.646494', '42', 'Kakrail', 1, '[{"added": {}}]', 15, 1),
(81, '2019-10-27 18:36:48.136354', '43', 'Polton', 1, '[{"added": {}}]', 15, 1),
(82, '2019-10-27 18:36:53.636581', '44', 'Zero Point', 1, '[{"added": {}}]', 15, 1),
(83, '2019-10-27 18:36:59.114190', '45', 'Gulistan', 1, '[{"added": {}}]', 15, 1),
(84, '2019-10-27 18:37:03.926603', '46', 'Kuril', 1, '[{"added": {}}]', 15, 1),
(85, '2019-10-27 18:37:18.660890', '47', 'Zamuna Future Park', 1, '[{"added": {}}]', 15, 1),
(86, '2019-10-27 18:37:25.027287', '48', 'Notun Bazar', 1, '[{"added": {}}]', 15, 1),
(87, '2019-10-27 18:37:29.016895', '49', 'Nodda', 1, '[{"added": {}}]', 15, 1),
(88, '2019-10-27 18:37:35.281676', '50', 'Shahjadpur', 1, '[{"added": {}}]', 15, 1),
(89, '2019-10-27 18:37:42.717892', '51', 'Gulshan-1', 1, '[{"added": {}}]', 15, 1),
(90, '2019-10-27 18:37:49.162211', '52', 'Baridhara', 1, '[{"added": {}}]', 15, 1),
(91, '2019-10-27 18:37:55.507521', '53', 'Gulshan-2', 1, '[{"added": {}}]', 15, 1),
(92, '2019-10-27 18:38:04.240989', '54', 'Moddho Badda', 1, '[{"added": {}}]', 15, 1),
(93, '2019-10-27 18:38:11.008239', '55', 'Uttar Badda', 1, '[{"added": {}}]', 15, 1),
(94, '2019-10-27 18:38:17.841173', '56', 'Hossen Market', 1, '[{"added": {}}]', 15, 1),
(95, '2019-10-27 18:38:25.565001', '57', 'Abul Hotel', 1, '[{"added": {}}]', 15, 1),
(96, '2019-10-27 18:38:33.275031', '58', 'Khilgaon', 1, '[{"added": {}}]', 15, 1),
(97, '2019-10-27 18:38:40.998829', '59', 'Basabo', 1, '[{"added": {}}]', 15, 1),
(98, '2019-10-27 18:38:46.699698', '60', 'Komolapur', 1, '[{"added": {}}]', 15, 1),
(99, '2019-10-27 18:38:53.187624', '61', 'Mugda', 1, '[{"added": {}}]', 15, 1),
(100, '2019-10-27 18:39:02.711551', '62', 'Sayedabad', 1, '[{"added": {}}]', 15, 1),
(101, '2019-10-27 18:39:10.041397', '63', 'Jatrabari', 1, '[{"added": {}}]', 15, 1),
(102, '2019-10-27 19:57:20.284842', '1', 'Abdullapur is added as a stoppage of Campus-Ajompur', 1, '[{"added": {}}]', 16, 1),
(103, '2019-10-27 19:57:50.885005', '2', 'House Building is added as a stoppage of Campus-Ajompur', 1, '[{"added": {}}]', 16, 1),
(104, '2019-10-27 19:58:11.019741', '3', 'BNS is added as a stoppage of Campus-Ajompur', 1, '[{"added": {}}]', 16, 1),
(105, '2019-10-27 19:58:29.776104', '4', 'Ajompur is added as a stoppage of Campus-Ajompur', 1, '[{"added": {}}]', 16, 1),
(106, '2019-10-27 19:58:42.643320', '5', 'Abdullapur is added as a stoppage of Campus-Mohakhali', 1, '[{"added": {}}]', 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(9, 'accounts', 'student'),
(8, 'accounts', 'teacher'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(12, 'complaint', 'complaint'),
(5, 'contenttypes', 'contenttype'),
(7, 'departments', 'department'),
(10, 'drivers', 'driver'),
(11, 'drivers', 'staff'),
(14, 'route', 'routeinfo'),
(16, 'route-stoppage', 'routestoppage'),
(6, 'sessions', 'session'),
(15, 'stoppage', 'stoppage'),
(13, 'vehicle', 'vehicleinfo');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'departments', '0001_initial', '2019-10-25 18:52:34.711339'),
(2, 'accounts', '0001_initial', '2019-10-25 18:52:35.541533'),
(3, 'contenttypes', '0001_initial', '2019-10-25 18:52:39.391692'),
(4, 'auth', '0001_initial', '2019-10-25 18:52:41.921667'),
(5, 'admin', '0001_initial', '2019-10-25 18:52:49.411429'),
(6, 'admin', '0002_logentry_remove_auto_add', '2019-10-25 18:52:51.671473'),
(7, 'admin', '0003_logentry_add_action_flag_choices', '2019-10-25 18:52:51.751533'),
(8, 'contenttypes', '0002_remove_content_type_name', '2019-10-25 18:52:53.251838'),
(9, 'auth', '0002_alter_permission_name_max_length', '2019-10-25 18:52:54.231703'),
(10, 'auth', '0003_alter_user_email_max_length', '2019-10-25 18:52:55.001974'),
(11, 'auth', '0004_alter_user_username_opts', '2019-10-25 18:52:55.041286'),
(12, 'auth', '0005_alter_user_last_login_null', '2019-10-25 18:52:55.721514'),
(13, 'auth', '0006_require_contenttypes_0002', '2019-10-25 18:52:55.772120'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2019-10-25 18:52:55.802956'),
(15, 'auth', '0008_alter_user_username_max_length', '2019-10-25 18:52:56.404973'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2019-10-25 18:52:57.491540'),
(17, 'auth', '0010_alter_group_name_max_length', '2019-10-25 18:52:58.741853'),
(18, 'auth', '0011_update_proxy_permissions', '2019-10-25 18:52:58.876221'),
(19, 'drivers', '0001_initial', '2019-10-25 18:52:59.641459'),
(20, 'sessions', '0001_initial', '2019-10-25 18:53:03.511582'),
(21, 'accounts', '0002_auto_20191027_2039', '2019-10-27 14:41:57.657443'),
(22, 'route', '0001_initial', '2019-10-27 14:41:58.197190'),
(23, 'drivers', '0002_auto_20191027_2039', '2019-10-27 14:42:01.530798'),
(24, 'vehicle', '0001_initial', '2019-10-27 14:42:01.919569'),
(25, 'complaint', '0001_initial', '2019-10-27 14:42:03.810855'),
(26, 'complaint', '0002_complaint_bus_number', '2019-10-27 14:42:04.546800'),
(27, 'stoppage', '0001_initial', '2019-10-27 14:42:05.426226'),
(28, 'accounts', '0003_auto_20191027_2139', '2019-10-27 15:40:32.942847'),
(29, 'drivers', '0003_auto_20191027_2139', '2019-10-27 15:40:36.337727'),
(30, 'route', '0002_auto_20191027_2130', '2019-10-27 15:40:40.273536'),
(31, 'route', '0003_auto_20191027_2134', '2019-10-27 15:40:40.426891'),
(32, 'stoppage', '0002_auto_20191027_2130', '2019-10-27 15:40:40.466869'),
(33, 'stoppage', '0003_auto_20191027_2134', '2019-10-27 15:40:40.503443'),
(34, 'accounts', '0004_auto_20191028_0006', '2019-10-27 18:08:05.475107'),
(35, 'stoppage', '0004_auto_20191028_0006', '2019-10-27 18:49:43.109259'),
(36, 'stoppage', '0005_auto_20191028_0011', '2019-10-27 18:49:43.212526'),
(37, 'stoppage', '0006_auto_20191028_0046', '2019-10-27 18:49:43.282413'),
(38, 'route-stoppage', '0001_initial', '2019-10-27 18:49:44.013644');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `drivers_driver`
--

CREATE TABLE `drivers_driver` (
  `id` int(11) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `phone_number` varchar(200) NOT NULL,
  `emergency_number` varchar(200) NOT NULL,
  `birth_date` date NOT NULL,
  `nid_number` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `height` decimal(2,1) NOT NULL,
  `weight` int(11) NOT NULL,
  `religion` varchar(200) NOT NULL,
  `marital_status` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `address_line_1` varchar(200) NOT NULL,
  `address_line_2` varchar(200) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `updated_by` varchar(200) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `employee_id` varchar(50) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `drivers_staff`
--

CREATE TABLE `drivers_staff` (
  `id` int(11) NOT NULL,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `phone_number` varchar(200) NOT NULL,
  `emergency_number` varchar(200) NOT NULL,
  `birth_date` date NOT NULL,
  `nid_number` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `height` decimal(2,1) NOT NULL,
  `weight` int(11) NOT NULL,
  `religion` varchar(200) NOT NULL,
  `marital_status` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `address_line_1` varchar(200) NOT NULL,
  `address_line_2` varchar(200) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `updated_by` varchar(200) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `employee_id` varchar(50) NOT NULL,
  `designation` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `route-stoppage_routestoppage`
--

CREATE TABLE `route-stoppage_routestoppage` (
  `id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `stoppage_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route-stoppage_routestoppage`
--

INSERT INTO `route-stoppage_routestoppage` (`id`, `route_id`, `stoppage_id`) VALUES
(1, 1, 12),
(2, 1, 13),
(3, 1, 15),
(4, 1, 14),
(5, 2, 12);

-- --------------------------------------------------------

--
-- Table structure for table `route_routeinfo`
--

CREATE TABLE `route_routeinfo` (
  `id` int(11) NOT NULL,
  `route_number` varchar(100) NOT NULL,
  `display_text` varchar(200) NOT NULL,
  `start_stoppage` varchar(100) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `updated_by` varchar(200) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route_routeinfo`
--

INSERT INTO `route_routeinfo` (`id`, `route_number`, `display_text`, `start_stoppage`, `destination`, `slug`, `created_by`, `updated_by`, `created_date`, `updated_date`) VALUES
(1, '1', 'Campus-Ajompur', 'Campus', 'Ajompur', '1', 'mahadi', 'mahadi', '2019-10-27 17:51:35.515939', '2019-10-27 17:51:35.515939'),
(2, '2', 'Campus-Mohakhali', 'Campus', 'Mohakhali', '2', 'mahadi', 'mahadi', '2019-10-27 17:52:01.384632', '2019-10-27 17:52:01.384632'),
(3, '3', 'Campus-Mirpur', 'Campus', 'Mirpur', '3', 'mahadi', 'mahadi', '2019-10-27 17:52:31.521084', '2019-10-27 17:52:31.521084');

-- --------------------------------------------------------

--
-- Table structure for table `stoppage_stoppage`
--

CREATE TABLE `stoppage_stoppage` (
  `id` int(11) NOT NULL,
  `location` varchar(100) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `updated_by` varchar(200) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stoppage_stoppage`
--

INSERT INTO `stoppage_stoppage` (`id`, `location`, `created_by`, `updated_by`, `created_date`, `updated_date`) VALUES
(12, 'Abdullapur', 'mahadi', 'mahadi', '2019-10-27 18:31:11.524468', '2019-10-27 18:31:11.524468'),
(13, 'House Building', 'mahadi', 'mahadi', '2019-10-27 18:31:21.925214', '2019-10-27 18:31:21.925214'),
(14, 'Ajompur', 'mahadi', 'mahadi', '2019-10-27 18:31:29.923203', '2019-10-27 18:31:29.923203'),
(15, 'BNS', 'mahadi', 'mahadi', '2019-10-27 18:31:35.468265', '2019-10-27 18:31:35.468543'),
(16, 'Jashim Uddin', 'mahadi', 'mahadi', '2019-10-27 18:31:43.605174', '2019-10-27 18:31:43.606172'),
(17, 'Khilkhet', 'mahadi', 'mahadi', '2019-10-27 18:31:50.567259', '2019-10-27 18:31:50.567259'),
(18, 'Airport', 'mahadi', 'mahadi', '2019-10-27 18:31:55.819261', '2019-10-27 18:31:55.819261'),
(19, 'Kawla', 'mahadi', 'mahadi', '2019-10-27 18:32:09.152308', '2019-10-27 18:32:09.152308'),
(20, 'Bisshwroad', 'mahadi', 'mahadi', '2019-10-27 18:32:26.339399', '2019-10-27 18:32:26.339399'),
(21, 'MES', 'mahadi', 'mahadi', '2019-10-27 18:32:32.520332', '2019-10-27 18:32:32.520332'),
(22, 'Banani', 'mahadi', 'mahadi', '2019-10-27 18:32:41.510854', '2019-10-27 18:32:41.510854'),
(23, 'Khilkhet', 'mahadi', 'mahadi', '2019-10-27 18:32:53.655089', '2019-10-27 18:32:53.655089'),
(24, 'Kakoli', 'mahadi', 'mahadi', '2019-10-27 18:33:31.337306', '2019-10-27 18:33:31.337306'),
(25, 'Chairman Bari', 'mahadi', 'mahadi', '2019-10-27 18:33:41.021043', '2019-10-27 18:33:41.021043'),
(26, 'Mohakhali-Kachabazar', 'mahadi', 'mahadi', '2019-10-27 18:33:54.480094', '2019-10-27 18:33:54.480094'),
(27, 'Saheen College', 'mahadi', 'mahadi', '2019-10-27 18:34:09.374236', '2019-10-27 18:34:09.374236'),
(28, 'Jahangir Gate', 'mahadi', 'mahadi', '2019-10-27 18:34:19.510415', '2019-10-27 18:34:19.510415'),
(29, 'Prime Minister karjaloy', 'mahadi', 'mahadi', '2019-10-27 18:34:34.241570', '2019-10-27 18:34:34.241570'),
(30, 'Khamarbari', 'mahadi', 'mahadi', '2019-10-27 18:34:51.872384', '2019-10-27 18:34:51.872384'),
(31, 'Bijoy Soroni', 'mahadi', 'mahadi', '2019-10-27 18:35:29.351615', '2019-10-27 18:35:29.351615'),
(32, 'Farmgate', 'mahadi', 'mahadi', '2019-10-27 18:35:40.311088', '2019-10-27 18:35:40.311088'),
(33, 'Tejgaon', 'mahadi', 'mahadi', '2019-10-27 18:35:45.626984', '2019-10-27 18:35:45.626984'),
(34, 'Satrasta', 'mahadi', 'mahadi', '2019-10-27 18:35:51.066207', '2019-10-27 18:35:51.066207'),
(35, 'Tibbot', 'mahadi', 'mahadi', '2019-10-27 18:35:56.380254', '2019-10-27 18:35:56.380254'),
(36, 'Nabisco', 'mahadi', 'mahadi', '2019-10-27 18:36:01.222615', '2019-10-27 18:36:01.222615'),
(37, 'Mogbazar', 'mahadi', 'mahadi', '2019-10-27 18:36:09.390231', '2019-10-27 18:36:09.390231'),
(38, 'Hatirjheel', 'mahadi', 'mahadi', '2019-10-27 18:36:15.566070', '2019-10-27 18:36:15.566070'),
(39, 'Malibag', 'mahadi', 'mahadi', '2019-10-27 18:36:21.166835', '2019-10-27 18:36:21.166835'),
(40, 'Mouchak', 'mahadi', 'mahadi', '2019-10-27 18:36:25.847690', '2019-10-27 18:36:25.847690'),
(41, 'Shantinagar', 'mahadi', 'mahadi', '2019-10-27 18:36:32.571813', '2019-10-27 18:36:32.571813'),
(42, 'Kakrail', 'mahadi', 'mahadi', '2019-10-27 18:36:41.621905', '2019-10-27 18:36:41.625370'),
(43, 'Polton', 'mahadi', 'mahadi', '2019-10-27 18:36:48.121990', '2019-10-27 18:36:48.121990'),
(44, 'Zero Point', 'mahadi', 'mahadi', '2019-10-27 18:36:53.617002', '2019-10-27 18:36:53.617002'),
(45, 'Gulistan', 'mahadi', 'mahadi', '2019-10-27 18:36:59.095270', '2019-10-27 18:36:59.095270'),
(46, 'Kuril', 'mahadi', 'mahadi', '2019-10-27 18:37:03.857682', '2019-10-27 18:37:03.858669'),
(47, 'Zamuna Future Park', 'mahadi', 'mahadi', '2019-10-27 18:37:18.632813', '2019-10-27 18:37:18.632813'),
(48, 'Notun Bazar', 'mahadi', 'mahadi', '2019-10-27 18:37:25.011515', '2019-10-27 18:37:25.011515'),
(49, 'Nodda', 'mahadi', 'mahadi', '2019-10-27 18:37:29.002061', '2019-10-27 18:37:29.002061'),
(50, 'Shahjadpur', 'mahadi', 'mahadi', '2019-10-27 18:37:35.242119', '2019-10-27 18:37:35.242119'),
(51, 'Gulshan-1', 'mahadi', 'mahadi', '2019-10-27 18:37:42.697900', '2019-10-27 18:37:42.697900'),
(52, 'Baridhara', 'mahadi', 'mahadi', '2019-10-27 18:37:49.148724', '2019-10-27 18:37:49.148724'),
(53, 'Gulshan-2', 'mahadi', 'mahadi', '2019-10-27 18:37:55.461358', '2019-10-27 18:37:55.461358'),
(54, 'Moddho Badda', 'mahadi', 'mahadi', '2019-10-27 18:38:04.231101', '2019-10-27 18:38:04.231101'),
(55, 'Uttar Badda', 'mahadi', 'mahadi', '2019-10-27 18:38:10.994680', '2019-10-27 18:38:10.994680'),
(56, 'Hossen Market', 'mahadi', 'mahadi', '2019-10-27 18:38:17.702804', '2019-10-27 18:38:17.702804'),
(57, 'Abul Hotel', 'mahadi', 'mahadi', '2019-10-27 18:38:25.525440', '2019-10-27 18:38:25.526148'),
(58, 'Khilgaon', 'mahadi', 'mahadi', '2019-10-27 18:38:33.259713', '2019-10-27 18:38:33.259713'),
(59, 'Basabo', 'mahadi', 'mahadi', '2019-10-27 18:38:40.987503', '2019-10-27 18:38:40.987503'),
(60, 'Komolapur', 'mahadi', 'mahadi', '2019-10-27 18:38:46.665784', '2019-10-27 18:38:46.665784'),
(61, 'Mugda', 'mahadi', 'mahadi', '2019-10-27 18:38:53.168600', '2019-10-27 18:38:53.168600'),
(62, 'Sayedabad', 'mahadi', 'mahadi', '2019-10-27 18:39:02.681516', '2019-10-27 18:39:02.681516'),
(63, 'Jatrabari', 'mahadi', 'mahadi', '2019-10-27 18:39:10.040397', '2019-10-27 18:39:10.040397');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_vehicleinfo`
--

CREATE TABLE `vehicle_vehicleinfo` (
  `id` int(11) NOT NULL,
  `vehicle_number` varchar(50) NOT NULL,
  `color` varchar(20) NOT NULL,
  `vehicle_type` varchar(20) NOT NULL,
  `license_number` varchar(100) NOT NULL,
  `engine` varchar(100) NOT NULL,
  `capacity` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `route_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_student`
--
ALTER TABLE `accounts_student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `student_id` (`student_id`),
  ADD KEY `accounts_student_department_id_69962b56_fk_departmen` (`department_id`);

--
-- Indexes for table `accounts_teacher`
--
ALTER TABLE `accounts_teacher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `employee_id` (`employee_id`),
  ADD KEY `accounts_teacher_department_id_32fc83ab_fk_departmen` (`department_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `complaint_complaint`
--
ALTER TABLE `complaint_complaint`
  ADD PRIMARY KEY (`id`),
  ADD KEY `complaint_complaint_bus_number_id_a4f76264_fk_vehicle_v` (`bus_number_id`);

--
-- Indexes for table `departments_department`
--
ALTER TABLE `departments_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `drivers_driver`
--
ALTER TABLE `drivers_driver`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- Indexes for table `drivers_staff`
--
ALTER TABLE `drivers_staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD UNIQUE KEY `employee_id` (`employee_id`);

--
-- Indexes for table `route-stoppage_routestoppage`
--
ALTER TABLE `route-stoppage_routestoppage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `route-stoppage_route_route_id_04bb2e47_fk_route_rou` (`route_id`),
  ADD KEY `route-stoppage_route_stoppage_id_9a07da61_fk_stoppage_` (`stoppage_id`);

--
-- Indexes for table `route_routeinfo`
--
ALTER TABLE `route_routeinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `route_number` (`route_number`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `stoppage_stoppage`
--
ALTER TABLE `stoppage_stoppage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle_vehicleinfo`
--
ALTER TABLE `vehicle_vehicleinfo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vehicle_number` (`vehicle_number`),
  ADD KEY `vehicle_vehicleinfo_driver_id_c023b87b_fk_drivers_driver_id` (`driver_id`),
  ADD KEY `vehicle_vehicleinfo_route_id_ea99df22_fk_route_routeinfo_id` (`route_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_student`
--
ALTER TABLE `accounts_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `accounts_teacher`
--
ALTER TABLE `accounts_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `complaint_complaint`
--
ALTER TABLE `complaint_complaint`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments_department`
--
ALTER TABLE `departments_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `drivers_driver`
--
ALTER TABLE `drivers_driver`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `drivers_staff`
--
ALTER TABLE `drivers_staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `route-stoppage_routestoppage`
--
ALTER TABLE `route-stoppage_routestoppage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `route_routeinfo`
--
ALTER TABLE `route_routeinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `vehicle_vehicleinfo`
--
ALTER TABLE `vehicle_vehicleinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_student`
--
ALTER TABLE `accounts_student`
  ADD CONSTRAINT `accounts_student_department_id_69962b56_fk_departmen` FOREIGN KEY (`department_id`) REFERENCES `departments_department` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `complaint_complaint`
--
ALTER TABLE `complaint_complaint`
  ADD CONSTRAINT `complaint_complaint_bus_number_id_a4f76264_fk_vehicle_v` FOREIGN KEY (`bus_number_id`) REFERENCES `vehicle_vehicleinfo` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `route-stoppage_routestoppage`
--
ALTER TABLE `route-stoppage_routestoppage`
  ADD CONSTRAINT `route-stoppage_route_route_id_04bb2e47_fk_route_rou` FOREIGN KEY (`route_id`) REFERENCES `route_routeinfo` (`id`),
  ADD CONSTRAINT `route-stoppage_route_stoppage_id_9a07da61_fk_stoppage_` FOREIGN KEY (`stoppage_id`) REFERENCES `stoppage_stoppage` (`id`);

--
-- Constraints for table `vehicle_vehicleinfo`
--
ALTER TABLE `vehicle_vehicleinfo`
  ADD CONSTRAINT `vehicle_vehicleinfo_driver_id_c023b87b_fk_drivers_driver_id` FOREIGN KEY (`driver_id`) REFERENCES `drivers_driver` (`id`),
  ADD CONSTRAINT `vehicle_vehicleinfo_route_id_ea99df22_fk_route_routeinfo_id` FOREIGN KEY (`route_id`) REFERENCES `route_routeinfo` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
--started 28-10-2019
INSERT INTO `accounts_student` (`id`, `first_name`, `last_name`, `phone_number`, `emergency_number`, `birth_date`, `nid_number`, `gender`, `height`, `weight`, `religion`, `marital_status`, `email`, `slug`, `address_line_1`, `address_line_2`, `created_by`, `updated_by`, `created_date`, `updated_date`, `student_id`, `department_id`, `is_active`) VALUES
(1, 'Shahporan', 'Himel', '01838894605', '', '2019-10-28', '', '0', '70.0', 75, '0', '1', '1930101@iubat.edu', '1930101', 'Uttara, Dhaka', '', 'mahadi', 'mahadi', '2019-10-28 17:56:34.493519', '2019-10-28 17:56:34.493519', '1930101', 1, 1),
(8, 'Mahadi', 'Hassan', '01644342973', '', '2019-10-29', '', '0', '66.0', 68, '0', '1', '1930102@iubat.edu', '1930102', 'Uttara, Dhaka', '', 'mahadi', 'mahadi', '2019-10-28 18:37:21.941408', '2019-10-28 18:37:21.941408', '1930102', 1, 1),
(9, 'Ashraf', 'Islam', '0954234567', '', '2019-10-29', '', '0', '71.0', 80, '0', '1', '1930103@iubat.edu', '1930103', 'Uttara, Dhaka', '', 'mahadi', 'mahadi', '2019-10-28 19:57:06.751286', '2019-10-28 19:57:06.752312', '1930103', 1, 1),
(10, 'Sadia', 'Ahmed', '01787382451', '', '2019-10-29', '', '1', '63.0', 55, '0', '1', '1930104@iubat.edu', '1930104', 'Uttara, Dhaka', '', 'mahadi', 'mahadi', '2019-10-28 19:58:09.640230', '2019-10-28 19:58:09.640230', '1930104', 1, 1),
(11, 'Shahjalal', 'Sarkar', '09876543', '', '2019-10-29', '', '0', '66.0', 67, '0', '1', '1930401@iubat.edu', '1930401', 'Uttara, Dhaka', '', 'mahadi', 'mahadi', '2019-10-28 20:20:11.225931', '2019-10-28 20:20:11.225931', '1930401', 4, 1);
--finished  28-10-2019
--started 29-10-2019
INSERT INTO `stoppage_stoppage` (`id`, `location`, `created_by`, `updated_by`, `created_date`, `updated_date`) VALUES
(64, 'ECB', 'mahadi', 'mahadi', '2019-10-29 17:41:03.375258', '2019-10-29 17:41:03.375258'),
(65, 'Kalshi', 'mahadi', 'mahadi', '2019-10-29 17:41:11.972496', '2019-10-29 17:41:11.972496'),
(66, 'Purobi', 'mahadi', 'mahadi', '2019-10-29 17:41:21.772040', '2019-10-29 17:41:21.772040'),
(67, 'Pallabi', 'mahadi', 'mahadi', '2019-10-29 17:41:30.199711', '2019-10-29 17:41:30.199711'),
(68, 'Mirpur-10', 'mahadi', 'mahadi', '2019-10-29 17:41:38.838820', '2019-10-29 17:41:38.838820'),
(69, 'Mirpur-1', 'mahadi', 'mahadi', '2019-10-29 17:41:45.982077', '2019-10-29 17:41:45.982077'),
(70, 'Mirpur-2', 'mahadi', 'mahadi', '2019-10-29 17:41:51.573513', '2019-10-29 17:41:51.573513'),
(71, 'Mirpur-11', 'mahadi', 'mahadi', '2019-10-29 17:41:57.874567', '2019-10-29 17:41:57.874567'),
(72, 'Mirpur-12', 'mahadi', 'mahadi', '2019-10-29 17:42:04.182572', '2019-10-29 17:42:04.182572'),
(73, 'Mirpur-14', 'mahadi', 'mahadi', '2019-10-29 17:42:09.934321', '2019-10-29 17:42:09.934321'),
(74, 'Dhaka Cantonment', 'mahadi', 'mahadi', '2019-10-29 17:42:17.367215', '2019-10-29 17:42:17.367215'),
(75, 'Mirpur Cantonment', 'mahadi', 'mahadi', '2019-10-29 17:42:25.494623', '2019-10-29 17:42:25.494623'),
(76, 'Kachukhet', 'mahadi', 'mahadi', '2019-10-29 17:42:36.502629', '2019-10-29 17:42:36.502629'),
(77, 'Shewrapara', 'mahadi', 'mahadi', '2019-10-29 17:42:46.348036', '2019-10-29 17:42:46.348036'),
(78, 'Kazipara', 'mahadi', 'mahadi', '2019-10-29 17:42:51.235479', '2019-10-29 17:42:51.235479'),
(79, 'Taltola', 'mahadi', 'mahadi', '2019-10-29 17:43:05.453326', '2019-10-29 17:43:05.453326'),
(80, 'Agargaon', 'mahadi', 'mahadi', '2019-10-29 17:43:11.668711', '2019-10-29 17:43:11.668711'),
(81, 'Banglamotor', 'mahadi', 'mahadi', '2019-10-29 17:43:20.051892', '2019-10-29 17:43:20.051892'),
(82, 'Eskaton', 'mahadi', 'mahadi', '2019-10-29 17:43:26.004329', '2019-10-29 17:43:26.004329'),
(83, 'Baily Road', 'mahadi', 'mahadi', '2019-10-29 17:43:31.387981', '2019-10-29 17:43:31.387981'),
(84, 'Shahbag', 'mahadi', 'mahadi', '2019-10-29 17:43:39.413000', '2019-10-29 17:43:39.413000'),
(85, 'Katabon', 'mahadi', 'mahadi', '2019-10-29 17:43:52.333621', '2019-10-29 17:43:52.333621'),
(86, 'Elephant Road', 'mahadi', 'mahadi', '2019-10-29 17:43:58.461282', '2019-10-29 17:43:58.461282'),
(87, 'Shaymoli', 'mahadi', 'mahadi', '2019-10-29 17:44:04.200626', '2019-10-29 17:44:04.200626'),
(88, 'Dhanmondi-27', 'mahadi', 'mahadi', '2019-10-29 17:44:15.103452', '2019-10-29 17:44:15.103452'),
(89, 'Dhanmondi-32', 'mahadi', 'mahadi', '2019-10-29 17:44:21.644089', '2019-10-29 17:44:21.644089'),
(90, 'Sciencelab', 'mahadi', 'mahadi', '2019-10-29 17:44:29.542454', '2019-10-29 17:44:29.542454'),
(91, 'New Market', 'mahadi', 'mahadi', '2019-10-29 17:44:40.954293', '2019-10-29 17:44:40.954293'),
(92, 'Mohammadpur', 'mahadi', 'mahadi', '2019-10-29 17:44:48.569184', '2019-10-29 17:44:48.569184'),
(93, 'Asda Gate', 'mahadi', 'mahadi', '2019-10-29 17:44:54.334642', '2019-10-29 17:44:54.334642'),
(94, 'College Gate', 'mahadi', 'mahadi', '2019-10-29 17:45:02.453599', '2019-10-29 17:45:02.453599'),
(95, 'Shanir Akhra', 'mahadi', 'mahadi', '2019-10-29 17:45:24.242386', '2019-10-29 17:45:24.242386'),
(96, 'Kajla', 'mahadi', 'mahadi', '2019-10-29 17:45:31.294292', '2019-10-29 17:45:31.294292'),
(97, 'Signboard', 'mahadi', 'mahadi', '2019-10-29 17:45:38.696448', '2019-10-29 17:45:38.696448'),
(98, 'Chittgong Road', 'mahadi', 'mahadi', '2019-10-29 17:46:36.199470', '2019-10-29 17:46:36.199470'),
(99, 'Shimultoli', 'mahadi', 'mahadi', '2019-10-29 17:46:42.405600', '2019-10-29 17:46:42.405600'),
(100, 'Tongi College Gate', 'mahadi', 'mahadi', '2019-10-29 17:46:53.460692', '2019-10-29 17:46:53.460692'),
(101, 'Tongi Boro Station', 'mahadi', 'mahadi', '2019-10-29 17:47:01.271396', '2019-10-29 17:47:01.271396'),
(102, 'Tongi Boro bari', 'mahadi', 'mahadi', '2019-10-29 17:47:09.253023', '2019-10-29 17:47:09.253023'),
(103, 'Chourasta, Gazipur', 'mahadi', 'mahadi', '2019-10-29 17:47:20.794800', '2019-10-29 17:47:20.794800'),
(104, 'Station Road, Tongi', 'mahadi', 'mahadi', '2019-10-29 17:47:37.849694', '2019-10-29 17:47:37.849694'),
(105, 'Savar', 'mahadi', 'mahadi', '2019-10-29 17:47:45.967739', '2019-10-29 17:47:45.967739'),
(106, 'Nabinogor', 'mahadi', 'mahadi', '2019-10-29 17:47:53.553874', '2019-10-29 17:47:53.553874'),
(107, 'Jamgora', 'mahadi', 'mahadi', '2019-10-29 17:48:00.793055', '2019-10-29 17:48:00.793055'),
(108, 'Chondra', 'mahadi', 'mahadi', '2019-10-29 17:48:09.491272', '2019-10-29 17:48:09.491272'),
(109, 'Baipail', 'mahadi', 'mahadi', '2019-10-29 17:48:17.317004', '2019-10-29 17:48:17.317004'),
(110, 'Rajlokkhi', 'mahadi', 'mahadi', '2019-10-29 17:53:32.910277', '2019-10-29 17:53:32.910277');


INSERT INTO `stoppage_routestoppage` (`id`, `route_name_id`, `stoppage_name_id`) VALUES
(1, 1, 12),
(2, 1, 13),
(3, 1, 15),
(4, 1, 14),
(5, 2, 12),
(6, 2, 13),
(7, 2, 14),
(8, 1, 15),
(9, 2, 15),
(10, 2, 110),
(11, 2, 16),
(12, 2, 18),
(13, 2, 17),
(14, 2, 19),
(15, 2, 20),
(16, 2, 22),
(17, 2, 21),
(18, 2, 24),
(19, 2, 25),
(20, 2, 26),
(21, 3, 12),
(22, 3, 13),
(23, 3, 15),
(24, 3, 15),
(25, 3, 14),
(26, 3, 110),
(27, 3, 16),
(28, 3, 18),
(29, 3, 19),
(30, 3, 17),
(31, 3, 20),
(32, 3, 65),
(33, 3, 72),
(34, 3, 64),
(35, 3, 67),
(36, 3, 66),
(37, 3, 68);

CREATE TABLE `stoppage_routestoppage` (
  `id` int(11) NOT NULL,
  `route_name_id` int(11) NOT NULL,
  `stoppage_name_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

ALTER TABLE `stoppage_routestoppage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stoppage_routestoppa_route_name_id_65e5a25a_fk_route_rou` (`route_name_id`),
  ADD KEY `stoppage_routestoppa_stoppage_name_id_26ffb2ee_fk_stoppage_` (`stoppage_name_id`);


