-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2019 at 02:20 PM
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
  `birth_date` datetime(6) NOT NULL,
  `nid_number` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `religion` varchar(200) NOT NULL,
  `marital_status` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `address_line_1` varchar(200) NOT NULL,
  `address_line_2` varchar(200) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_by` varchar(200) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `student_id` varchar(200) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_student`
--

INSERT INTO `accounts_student` (`id`, `first_name`, `last_name`, `phone_number`, `emergency_number`, `birth_date`, `nid_number`, `gender`, `religion`, `marital_status`, `email`, `address_line_1`, `address_line_2`, `created_by`, `created_date`, `updated_by`, `updated_date`, `student_id`, `department_id`) VALUES
(2, 'Shahporan', 'Himel', '01838894605', '01953406939', '2019-10-18 14:56:11.000000', '', '0', '0', '', '16103045@iubat.edu', 'Uttara-1230', '', 'mahadi', '2019-10-18 15:08:57.545951', 'mahadi', '2019-10-18 15:08:57.545951', '16103045', 1),
(3, 'Mahadi', 'Hassan', '01644342973', '01953406939', '2019-10-18 15:20:39.000000', '', '0', '0', '', '16103046@iubat.edu', 'Uttara, Dhaka-1230', '', 'mahadi', '2019-10-18 15:19:48.407909', 'mahadi', '2019-10-18 15:19:48.407909', '16103046', 1);

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
  `birth_date` datetime(6) NOT NULL,
  `nid_number` varchar(200) NOT NULL,
  `gender` varchar(200) NOT NULL,
  `religion` varchar(200) NOT NULL,
  `marital_status` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `address_line_1` varchar(200) NOT NULL,
  `address_line_2` varchar(200) NOT NULL,
  `created_by` varchar(200) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_by` varchar(200) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'Passenger');

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
(36, 'Can view student', 9, 'view_student');

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
(1, 'pbkdf2_sha256$150000$FaNdAUOEX04N$4aQODnRzNYaHKoptxvLYDEJmr0eAwxdZaaDO4b6YnQg=', '2019-10-20 21:29:03.180433', 1, 'mahadi', '', '', 'mahadirony.rony@gmail.com', 1, 1, '2019-10-17 06:31:19.940951'),
(2, 'pbkdf2_sha256$150000$PHW2k6nbR4Kz$9J7g4AIsU9MTofQZ/R9CHN7yCVAdu6uDdND6Sjmo5K0=', NULL, 0, '16103045', '', '', '16103045@iubat.edu', 0, 1, '2019-10-20 21:25:05.505543'),
(3, 'pbkdf2_sha256$150000$1Oq6gXCyIrj5$asw6njnv66u95dMZktXj495/HBILc8uOO18Z64Tj5sQ=', NULL, 0, '16103046', '', '', '16103046@iubat.edu', 0, 1, '2019-10-20 21:27:55.786903');

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
(1, 2, 1),
(2, 3, 1);

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
(3, 'CE'),
(4, 'ME'),
(5, 'Textile');

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
(1, '2019-10-18 06:38:25.109218', '1', 'CSE', 1, '[{"added": {}}]', 7, 1),
(2, '2019-10-18 06:39:55.715438', '1', 'Student object (1)', 1, '[{"added": {}}]', 9, 1),
(3, '2019-10-18 15:09:17.444629', '2', 'Shahporan Himel', 1, '[{"added": {}}]', 9, 1),
(4, '2019-10-18 15:21:13.775443', '3', 'Mahadi Hassan', 1, '[{"added": {}}]', 9, 1),
(5, '2019-10-18 15:30:59.000629', '2', 'EEE', 1, '[{"added": {}}]', 7, 1),
(6, '2019-10-18 15:31:07.579139', '3', 'CE', 1, '[{"added": {}}]', 7, 1),
(7, '2019-10-18 15:31:12.713084', '4', 'ME', 1, '[{"added": {}}]', 7, 1),
(8, '2019-10-18 15:31:39.736968', '5', 'Textile', 1, '[{"added": {}}]', 7, 1),
(9, '2019-10-18 18:15:37.058201', '2', 'admin', 1, '[{"added": {}}]', 4, 1),
(10, '2019-10-18 18:16:18.110571', '2', 'admin', 3, '', 4, 1),
(11, '2019-10-20 21:24:34.444708', '1', 'Passenger', 1, '[{"added": {}}]', 3, 1);

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
(5, 'contenttypes', 'contenttype'),
(7, 'departments', 'department'),
(6, 'sessions', 'session');

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
(1, 'contenttypes', '0001_initial', '2019-10-17 06:28:46.810388'),
(2, 'auth', '0001_initial', '2019-10-17 06:28:49.643066'),
(3, 'admin', '0001_initial', '2019-10-17 06:29:08.910821'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-10-17 06:29:17.212129'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-10-17 06:29:17.310326'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-10-17 06:29:20.327059'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-10-17 06:29:21.064254'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-10-17 06:29:21.358763'),
(9, 'auth', '0004_alter_user_username_opts', '2019-10-17 06:29:21.452390'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-10-17 06:29:23.374044'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-10-17 06:29:23.492929'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-10-17 06:29:23.582363'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-10-17 06:29:23.944297'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-10-17 06:29:24.156205'),
(15, 'auth', '0010_alter_group_name_max_length', '2019-10-17 06:29:24.380230'),
(16, 'auth', '0011_update_proxy_permissions', '2019-10-17 06:29:24.488103'),
(17, 'sessions', '0001_initial', '2019-10-17 06:29:25.524796'),
(18, 'departments', '0001_initial', '2019-10-17 10:29:18.077671'),
(19, 'accounts', '0001_initial', '2019-10-17 10:29:18.901956'),
(20, 'accounts', '0002_auto_20191018_1211', '2019-10-18 06:11:57.755253'),
(21, 'accounts', '0003_auto_20191018_1442', '2019-10-18 08:42:22.161515');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('52lmywz5n7qr5jg3nbox6pbi5nait2uh', 'ZGJmODI0NGM4YWIxMDcyMzI5ZGU2OTNkZWQ3MTkyNDgyOTBlMzE4MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNThkNDY3MGYwOTI3ODk3YmQwNzUwOGM1YjI1M2M2ZjNkMDA0MmNiIn0=', '2019-10-31 10:29:32.278319'),
('843ilkh1l29jzbpap1nt3unep9hq32bm', 'ZGJmODI0NGM4YWIxMDcyMzI5ZGU2OTNkZWQ3MTkyNDgyOTBlMzE4MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNThkNDY3MGYwOTI3ODk3YmQwNzUwOGM1YjI1M2M2ZjNkMDA0MmNiIn0=', '2019-11-03 21:29:03.263747'),
('zu2l64eaux86apb6f1jzqjagbz5sr4qx', 'ZGJmODI0NGM4YWIxMDcyMzI5ZGU2OTNkZWQ3MTkyNDgyOTBlMzE4MTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNThkNDY3MGYwOTI3ODk3YmQwNzUwOGM1YjI1M2M2ZjNkMDA0MmNiIn0=', '2019-10-31 06:53:45.457144');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_student`
--
ALTER TABLE `accounts_student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `student_id` (`student_id`),
  ADD KEY `accounts_student_department_id_69962b56_fk_departmen` (`department_id`);

--
-- Indexes for table `accounts_teacher`
--
ALTER TABLE `accounts_teacher`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_student`
--
ALTER TABLE `accounts_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `accounts_teacher`
--
ALTER TABLE `accounts_teacher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `departments_department`
--
ALTER TABLE `departments_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_student`
--
ALTER TABLE `accounts_student`
  ADD CONSTRAINT `accounts_student_department_id_69962b56_fk_departmen` FOREIGN KEY (`department_id`) REFERENCES `departments_department` (`id`);

--
-- Constraints for table `accounts_teacher`
--
ALTER TABLE `accounts_teacher`
  ADD CONSTRAINT `accounts_teacher_department_id_32fc83ab_fk_departmen` FOREIGN KEY (`department_id`) REFERENCES `departments_department` (`id`);

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
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
