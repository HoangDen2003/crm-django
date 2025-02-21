-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 21, 2025 lúc 09:16 PM
-- Phiên bản máy phục vụ: 11.7.2-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `crm_django`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
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
(25, 'Can add product', 7, 'add_product'),
(26, 'Can change product', 7, 'change_product'),
(27, 'Can delete product', 7, 'delete_product'),
(28, 'Can view product', 7, 'view_product'),
(29, 'Can add customer', 8, 'add_customer'),
(30, 'Can change customer', 8, 'change_customer'),
(31, 'Can delete customer', 8, 'delete_customer'),
(32, 'Can view customer', 8, 'view_customer'),
(33, 'Can add employee', 9, 'add_employee'),
(34, 'Can change employee', 9, 'change_employee'),
(35, 'Can delete employee', 9, 'delete_employee'),
(36, 'Can view employee', 9, 'view_employee'),
(37, 'Can add task board', 10, 'add_taskboard'),
(38, 'Can change task board', 10, 'change_taskboard'),
(39, 'Can delete task board', 10, 'delete_taskboard'),
(40, 'Can view task board', 10, 'view_taskboard'),
(41, 'Can add customer', 11, 'add_customer'),
(42, 'Can change customer', 11, 'change_customer'),
(43, 'Can delete customer', 11, 'delete_customer'),
(44, 'Can view customer', 11, 'view_customer'),
(45, 'Can add task board', 12, 'add_taskboard'),
(46, 'Can change task board', 12, 'change_taskboard'),
(47, 'Can delete task board', 12, 'delete_taskboard'),
(48, 'Can view task board', 12, 'view_taskboard'),
(49, 'Can add product', 13, 'add_product'),
(50, 'Can change product', 13, 'change_product'),
(51, 'Can delete product', 13, 'delete_product'),
(52, 'Can view product', 13, 'view_product'),
(53, 'Can add employee', 14, 'add_employee'),
(54, 'Can change employee', 14, 'change_employee'),
(55, 'Can delete employee', 14, 'delete_employee'),
(56, 'Can view employee', 14, 'view_employee'),
(57, 'Can add Token', 15, 'add_token'),
(58, 'Can change Token', 15, 'change_token'),
(59, 'Can delete Token', 15, 'delete_token'),
(60, 'Can view Token', 15, 'view_token'),
(61, 'Can add Token', 16, 'add_tokenproxy'),
(62, 'Can change Token', 16, 'change_tokenproxy'),
(63, 'Can delete Token', 16, 'delete_tokenproxy'),
(64, 'Can view Token', 16, 'view_tokenproxy');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$1000000$V4ffPrX5OAyyMfoCttFaNP$ysLR2bmm28yc9WrI/3JxrW45UVSm6C+dt6sSfAsCNr0=', '2025-02-20 20:15:32.055958', 1, 'hadinhhoang', '', '', 'hadinhhoang031104@gmail.com', 1, 1, '2025-02-20 06:37:06.429927');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `crmdjango_customer`
--

CREATE TABLE `crmdjango_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `crmdjango_customer`
--

INSERT INTO `crmdjango_customer` (`id`, `name`, `email`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'khách 1', 'cus1@gmail.com', '012345678', 'Hà Nội', '2025-02-20 07:10:55.962985', '2025-02-20 07:11:47.599081');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `crmdjango_employee`
--

CREATE TABLE `crmdjango_employee` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `crmdjango_employee`
--

INSERT INTO `crmdjango_employee` (`id`, `name`, `email`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Hà Đình Hoàng', 'aaa@gmail.com', '0365203656', 'Thanh Hóa', '2025-02-20 07:05:41.141387', '2025-02-20 07:05:41.141387'),
(2, 'Nhân Viên 1', 'nv1@gmail.com', '0365203111', 'Hà Nội', '2025-02-20 07:12:11.519066', '2025-02-20 07:12:11.519066');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `crmdjango_product`
--

CREATE TABLE `crmdjango_product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `crmdjango_taskboard`
--

CREATE TABLE `crmdjango_taskboard` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(3) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `assigned_to_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `crmdjango_taskboard`
--

INSERT INTO `crmdjango_taskboard` (`id`, `title`, `description`, `status`, `created_at`, `updated_at`, `assigned_to_id`) VALUES
(1, 'đọc docs', 'Django', 'TD', '2025-02-20 07:12:57.150844', '2025-02-20 07:12:57.150844', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers_customer`
--

CREATE TABLE `customers_customer` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `customers_customer`
--

INSERT INTO `customers_customer` (`id`, `name`, `email`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Khách hàng 2', 'kh1@gmail.com', '02523454', 'Thanh Hóa', '2025-02-20 17:35:12.948563', '2025-02-20 17:47:52.270131'),
(2, 'Khách hàng 1', 'kh1@gmail.com', '02523454', 'Hà Nội', '2025-02-20 17:35:37.977629', '2025-02-20 17:35:37.977629'),
(4, 'Khách hàng 5', 'kh5@gmail.com', '02523454', 'Hà Nội', '2025-02-20 21:12:31.532535', '2025-02-20 21:12:31.532535'),
(5, 'Khách hàng 6', 'kh6@gmail.com', '02523454', 'Hà Nội', '2025-02-21 05:20:59.880977', '2025-02-21 05:20:59.880977'),
(6, 'Khách hàng 6', 'kh6@gmail.com', '02523454', 'Hà Nội', '2025-02-21 05:25:52.242275', '2025-02-21 05:25:52.242275'),
(7, 'Khách hàng 6', 'kh6@gmail.com', '02523454', 'Hà Nội', '2025-02-21 05:26:03.651094', '2025-02-21 05:26:03.651094');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-02-20 07:05:41.141922', '1', 'Employee object (1)', 1, '[{\"added\": {}}]', 9, 1),
(2, '2025-02-20 07:10:55.964055', '1', 'Customer object (1)', 1, '[{\"added\": {}}]', 8, 1),
(3, '2025-02-20 07:11:47.601064', '1', 'Customer object (1)', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Email\"]}}]', 8, 1),
(4, '2025-02-20 07:12:11.520014', '2', 'Nhân Viên 1', 1, '[{\"added\": {}}]', 9, 1),
(5, '2025-02-20 07:12:57.151935', '1', 'TaskBoard object (1)', 1, '[{\"added\": {}}]', 10, 1),
(6, '2025-02-20 10:34:40.374176', '1', 'Nhân Viên 2', 1, '[{\"added\": {}}]', 14, 1),
(7, '2025-02-21 06:33:07.160954', '14', 'Customer object (14)', 3, '', 11, 1),
(8, '2025-02-21 06:33:07.160954', '13', 'Customer object (13)', 3, '', 11, 1),
(9, '2025-02-21 06:33:07.160954', '12', 'Customer object (12)', 3, '', 11, 1),
(10, '2025-02-21 06:33:07.160954', '11', 'Customer object (11)', 3, '', 11, 1),
(11, '2025-02-21 06:33:07.160954', '10', 'Customer object (10)', 3, '', 11, 1),
(12, '2025-02-21 06:33:07.160954', '9', 'Customer object (9)', 3, '', 11, 1),
(13, '2025-02-21 06:33:07.160954', '8', 'Customer object (8)', 3, '', 11, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(15, 'authtoken', 'token'),
(16, 'authtoken', 'tokenproxy'),
(5, 'contenttypes', 'contenttype'),
(8, 'crmdjango', 'customer'),
(9, 'crmdjango', 'employee'),
(7, 'crmdjango', 'product'),
(10, 'crmdjango', 'taskboard'),
(11, 'customers', 'customer'),
(14, 'employees', 'employee'),
(13, 'products', 'product'),
(6, 'sessions', 'session'),
(12, 'taskboards', 'taskboard');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-02-20 06:19:06.758005'),
(2, 'auth', '0001_initial', '2025-02-20 06:19:06.912372'),
(3, 'admin', '0001_initial', '2025-02-20 06:19:06.942529'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-02-20 06:19:06.946535'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-02-20 06:19:06.961615'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-02-20 06:19:06.990574'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-02-20 06:19:07.009809'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-02-20 06:19:07.019928'),
(9, 'auth', '0004_alter_user_username_opts', '2025-02-20 06:19:07.023927'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-02-20 06:19:07.042752'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-02-20 06:19:07.044745'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-02-20 06:19:07.048752'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-02-20 06:19:07.058921'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-02-20 06:19:07.070274'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-02-20 06:19:07.079399'),
(16, 'auth', '0011_update_proxy_permissions', '2025-02-20 06:19:07.084433'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-02-20 06:19:07.093320'),
(18, 'sessions', '0001_initial', '2025-02-20 06:19:07.104497'),
(19, 'crmdjango', '0001_initial', '2025-02-20 07:04:31.265005'),
(20, 'crmdjango', '0002_alter_taskboard_status', '2025-02-20 07:10:23.949306'),
(21, 'customers', '0001_initial', '2025-02-20 07:30:09.067230'),
(22, 'employees', '0001_initial', '2025-02-20 07:30:09.072502'),
(23, 'products', '0001_initial', '2025-02-20 07:30:09.077138'),
(24, 'taskboards', '0001_initial', '2025-02-20 07:30:09.093522'),
(25, 'employees', '0002_employee_password', '2025-02-20 10:33:43.593384'),
(26, 'authtoken', '0001_initial', '2025-02-20 20:52:45.426322'),
(27, 'authtoken', '0002_auto_20160226_1747', '2025-02-20 20:52:45.441896'),
(28, 'authtoken', '0003_tokenproxy', '2025-02-20 20:52:45.443889'),
(29, 'authtoken', '0004_alter_tokenproxy_options', '2025-02-20 20:52:45.445809'),
(30, 'taskboards', '0002_alter_taskboard_status', '2025-02-20 21:21:37.498403'),
(31, 'employees', '0002_employee_is_active', '2025-02-21 04:41:56.129262'),
(32, 'employees', '0003_remove_employee_is_active', '2025-02-21 04:44:23.604007');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('nkmdd7c07o0mqcrzkux4guuowsh194e2', '.eJxVjDsOwjAQBe_iGll2_Kek5wzWeneDA8iR4qRC3B0ipYD2zcx7iQzbWvPWeckTibPQ4vS7FcAHtx3QHdptlji3dZmK3BV50C6vM_Hzcrh_BxV6_dboSgoWDPqUQPvkko0Y0NiBtaeYSojBGvBEVgGh1mr0JY7KOEaOA4v3B9BYN7g:1tlCxI:c5Ge4O_Q-fl5uSIphx4cZ1b0cr996shYZvmAfWSV9Hc', '2025-03-06 20:15:32.057950');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employees_employee`
--

CREATE TABLE `employees_employee` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `address` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `password` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `employees_employee`
--

INSERT INTO `employees_employee` (`id`, `name`, `email`, `phone`, `address`, `created_at`, `updated_at`, `password`) VALUES
(3, 'Nhân Viên 3', 'nv3@gmail.com', '0365203656', 'Hà Nội', '2025-02-20 17:10:44.271544', '2025-02-20 17:10:44.271544', '12345678'),
(4, 'Nhân Viên 4', 'nv4@gmail.com', '02345256', 'Hà Nội', '2025-02-20 19:33:07.468313', '2025-02-20 19:37:17.154576', '12345');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products_product`
--

CREATE TABLE `products_product` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products_product`
--

INSERT INTO `products_product` (`id`, `name`, `price`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Giày', 34500.00, 'Giày đẹp', '2025-02-20 19:43:24.620653', '2025-02-20 19:45:24.268060');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taskboards_taskboard`
--

CREATE TABLE `taskboards_taskboard` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(10) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `assigned_to_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `taskboards_taskboard`
--

INSERT INTO `taskboards_taskboard` (`id`, `title`, `description`, `status`, `created_at`, `updated_at`, `assigned_to_id`) VALUES
(1, 'task 1', 'dsc 1', 'TD', '2025-02-20 19:59:56.772979', '2025-02-20 19:59:56.772979', 3),
(2, 'task 2', 'dsc 2', 'TD', '2025-02-20 20:08:42.452103', '2025-02-20 20:11:36.718676', 4);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `crmdjango_customer`
--
ALTER TABLE `crmdjango_customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `crmdjango_employee`
--
ALTER TABLE `crmdjango_employee`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `crmdjango_product`
--
ALTER TABLE `crmdjango_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `crmdjango_taskboard`
--
ALTER TABLE `crmdjango_taskboard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `crmdjango_taskboard_assigned_to_id_41ad15e3_fk_crmdjango` (`assigned_to_id`);

--
-- Chỉ mục cho bảng `customers_customer`
--
ALTER TABLE `customers_customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `employees_employee`
--
ALTER TABLE `employees_employee`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products_product`
--
ALTER TABLE `products_product`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `taskboards_taskboard`
--
ALTER TABLE `taskboards_taskboard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taskboards_taskboard_assigned_to_id_c734d183_fk_employees` (`assigned_to_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT cho bảng `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `crmdjango_customer`
--
ALTER TABLE `crmdjango_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `crmdjango_employee`
--
ALTER TABLE `crmdjango_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `crmdjango_product`
--
ALTER TABLE `crmdjango_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `crmdjango_taskboard`
--
ALTER TABLE `crmdjango_taskboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `customers_customer`
--
ALTER TABLE `customers_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `employees_employee`
--
ALTER TABLE `employees_employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products_product`
--
ALTER TABLE `products_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `taskboards_taskboard`
--
ALTER TABLE `taskboards_taskboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `crmdjango_taskboard`
--
ALTER TABLE `crmdjango_taskboard`
  ADD CONSTRAINT `crmdjango_taskboard_assigned_to_id_41ad15e3_fk_crmdjango` FOREIGN KEY (`assigned_to_id`) REFERENCES `crmdjango_employee` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Các ràng buộc cho bảng `taskboards_taskboard`
--
ALTER TABLE `taskboards_taskboard`
  ADD CONSTRAINT `taskboards_taskboard_assigned_to_id_c734d183_fk_employees` FOREIGN KEY (`assigned_to_id`) REFERENCES `employees_employee` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
