-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Des 2020 pada 18.30
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_arsip`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_activation_attempts`
--

CREATE TABLE `auth_activation_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups`
--

CREATE TABLE `auth_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups_permissions`
--

CREATE TABLE `auth_groups_permissions` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_groups_users`
--

CREATE TABLE `auth_groups_users` (
  `group_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL,
  `success` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `auth_logins`
--

INSERT INTO `auth_logins` (`id`, `ip_address`, `email`, `user_id`, `date`, `success`) VALUES
(1, '::1', 'a@gmail.com', 1, '2020-12-10 13:51:30', 1),
(2, '::1', 'habib', NULL, '2020-12-18 07:08:46', 0),
(3, '::1', 'habib', NULL, '2020-12-18 07:09:57', 0),
(4, '::1', 'habib', NULL, '2020-12-18 07:12:31', 0),
(5, '::1', 'admin@admin.com', 2, '2020-12-18 07:14:39', 1),
(6, '::1', 'admin@admin.com', 2, '2020-12-18 08:03:26', 1),
(7, '::1', 'admin', NULL, '2020-12-18 09:19:08', 0),
(8, '::1', 'admin@admin.com', 2, '2020-12-18 09:19:24', 1),
(9, '::1', 'admin@admin.com', 2, '2020-12-18 20:40:35', 1),
(10, '::1', 'admin@admin.com', 2, '2020-12-19 03:01:12', 1),
(11, '::1', 'admin@admin.com', 2, '2020-12-19 08:55:44', 1),
(12, '::1', 'admin@admin.com', 2, '2020-12-21 09:13:22', 1),
(13, '::1', 'admin@admin.com', 2, '2020-12-21 11:00:59', 1),
(14, '::1', 'admin@admin.com', 2, '2020-12-22 09:05:08', 1),
(15, '::1', 'admin@admin.com', 2, '2020-12-24 09:06:02', 1),
(16, '::1', 'admin@admin.com', 2, '2020-12-25 07:36:43', 1),
(17, '::1', 'admin@admin.com', 2, '2020-12-25 23:27:41', 1),
(18, '::1', 'admin@admin.com', 2, '2020-12-26 21:08:06', 1),
(19, '::1', 'admin@admin.com', 2, '2020-12-26 21:24:33', 1),
(20, '::1', 'admin@admin.com', 2, '2020-12-27 00:25:25', 1),
(21, '::1', 'admin@admin.com', 2, '2020-12-27 04:26:27', 1),
(22, '::1', 'admin', NULL, '2020-12-27 07:14:48', 0),
(23, '::1', 'admin@admin.com', 2, '2020-12-27 07:17:22', 1),
(24, '::1', 'admin@admin.com', 2, '2020-12-27 19:49:26', 1),
(25, '::1', 'admin@admin.com', 2, '2020-12-28 06:16:10', 1),
(26, '::1', 'admin@admin.com', 2, '2020-12-29 07:04:35', 1),
(27, '::1', 'admin@admin.com', 2, '2020-12-29 18:57:34', 1),
(28, '::1', 'admin@admin.com', 2, '2020-12-30 05:10:01', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_permissions`
--

CREATE TABLE `auth_permissions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_reset_attempts`
--

CREATE TABLE `auth_reset_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) UNSIGNED NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedValidator` varchar(255) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_users_permissions`
--

CREATE TABLE `auth_users_permissions` (
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `permission_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokumen`
--

CREATE TABLE `dokumen` (
  `id` int(11) NOT NULL,
  `no_surat` varchar(255) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `tgl_pembuatan` date NOT NULL,
  `no_filling_kabinet` varchar(50) NOT NULL,
  `nama_folder` varchar(50) NOT NULL,
  `file_surat` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `dokumen`
--

INSERT INTO `dokumen` (`id`, `no_surat`, `perihal`, `slug`, `jenis`, `tgl_pembuatan`, `no_filling_kabinet`, `nama_folder`, `file_surat`, `created_at`, `updated_at`) VALUES
(26, '003', 'Surat Keputusan Presiden', 'surat-keputusan-presiden', 'Surat Keterangan', '0000-00-00', '', '', '644-Article Text-2278-1-10-20171125.pdf', '2020-12-21 11:21:20', '2020-12-23 01:34:26'),
(27, '003', 'Surat AB', 'surat-ab', 'Daftar Pegawai ', '0000-00-00', '12P', '3F', 'document(1).pdf', '2020-12-21 11:26:57', '2020-12-29 22:14:05'),
(28, '0011', 'Surat Luar', 'surat-luar', 'Surat Izin', '0000-00-00', '', '', 'Eemeren-Houtlosser2006_Article_StrategicManeuveringASynthetic.pdf', '2020-12-21 11:30:20', '2020-12-22 00:32:37'),
(30, '0011', 'Surat Y', 'surat-y', 'Haha', '2020-02-12', '12E', '8A', '09E01004_1.pdf', '2020-12-22 12:22:39', '2020-12-23 01:45:05'),
(32, '900', 'Surat Z', 'surat-z', 'Daftar Pegawai ', '0000-00-00', '199B', '', '09E01004_unlocked.pdf', '2020-12-22 12:25:11', '2020-12-23 01:44:15'),
(33, '0988123', 'Surat Pemberitahuan', 'surat-pemberitahuan', '', '2020-12-17', '34', '9P', 'Workshop Pemrograman_2.pdf', '2020-12-27 21:40:23', '2020-12-28 11:05:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` text NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2017-11-20-223112', 'Myth\\Auth\\Database\\Migrations\\CreateAuthTables', 'default', 'Myth\\Auth', 1607628437, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat`
--

CREATE TABLE `riwayat` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_dokumen` int(11) NOT NULL,
  `no_surat` varchar(255) NOT NULL,
  `perihal` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `riwayat`
--

INSERT INTO `riwayat` (`id`, `id_user`, `id_dokumen`, `no_surat`, `perihal`, `keterangan`, `waktu`) VALUES
(14, 2, 26, '001', 'Surat Keputusan Presiden', 'Ditambahkan', '2020-12-22 00:21:20'),
(15, 2, 27, '003', 'Surat AB', 'Ditambahkan', '2020-12-22 00:26:57'),
(16, 2, 30, '0011', 'Surat Y', 'Ditambahkan', '2020-12-22 00:30:20'),
(17, 2, 30, '0011', 'Surat Y', 'Diubah (Perihal)', '2020-12-22 00:32:37'),
(18, 2, 27, '003', 'Surat AB', 'Berkas Fisik Diambil', '2020-12-22 00:32:46'),
(19, 2, 0, '0023', 'Surat LK', 'Ditambahkan', '2020-12-22 00:33:22'),
(20, 2, 0, '0023', 'Surat LK', 'Dihapus', '2020-12-22 00:33:45'),
(21, 2, 30, '0011', 'Surat Y', 'Ditambahkan', '2020-12-23 01:22:40'),
(22, 2, 32, '900', 'Surat Z', 'Ditambahkan', '2020-12-23 01:23:24'),
(23, 2, 32, '900', 'Surat Z', 'Dihapus', '2020-12-23 01:24:34'),
(24, 2, 32, '900', 'Surat Z', 'Ditambahkan', '2020-12-23 01:25:11'),
(25, 2, 26, '001', 'Surat Keputusan Presiden', 'Diubah (No Surat)', '2020-12-23 01:33:32'),
(26, 2, 26, '003', 'Surat Keputusan Presiden', 'Diubah (File Surat)', '2020-12-23 01:33:57'),
(27, 2, 26, '003', 'Surat Keputusan Presiden', 'Diubah (File Surat)', '2020-12-23 01:34:26'),
(28, 2, 32, '900', 'Surat Z', 'Diubah (Nomor Filling Kabinet)', '2020-12-23 01:44:15'),
(29, 2, 30, '0011', 'Surat Y', 'Diubah (Nomor Filling Kabinet)', '2020-12-23 01:45:05'),
(30, 2, 30, '0011', 'Surat Y', 'File keluar (Download)', '2020-12-23 02:06:26'),
(31, 2, 32, '900', 'Surat Z', 'File keluar (Download)', '2020-12-23 02:07:13'),
(32, 2, 26, '003', 'Surat Keputusan Presiden', 'File keluar (Download)', '2020-12-24 23:07:47'),
(33, 2, 27, '003', 'Surat AB', 'Diubah (Nomor Filling Kabinet, Nama Folder, Tanggal Pembuatan)', '2020-12-28 10:20:55'),
(34, 2, 27, '003', 'Surat AB', 'Diubah (Nomor Filling Kabinet, Nama Folder, Tanggal Pembuatan)', '2020-12-28 10:33:54'),
(35, 2, 33, '0988123', 'Surat Pemberitahuan', 'Ditambahkan', '2020-12-28 10:40:23'),
(36, 2, 33, '0988123', 'Surat Pemberitahuan', 'Diubah (Nomor Filling Kabinet, Nama Folder, Tanggal Pembuatan)', '2020-12-28 10:42:06'),
(37, 2, 33, '0988123', 'Surat Pemberitahuan', 'Diubah (Nomor Filling Kabinet, Nama Folder, Tanggal Pembuatan)', '2020-12-28 10:43:47'),
(38, 2, 33, '0988123', 'Surat Pemberitahuan', 'Diubah (Nomor Filling Kabinet, Nama Folder, Tanggal Pembuatan)', '2020-12-28 10:46:09'),
(39, 2, 33, '0988123', 'Surat Pemberitahuan', 'Diubah (Nomor Filling Kabinet, Nama Folder, Tanggal Pembuatan)', '2020-12-28 10:46:29'),
(40, 2, 33, '0988123', 'Surat Pemberitahuan', 'Diubah (Perihal, Nomor Filling Kabinet, Nama Folder, Tanggal Pembuatan)', '2020-12-28 10:48:21'),
(41, 2, 33, '0988123', 'Surat Pemberitahuan', 'Diubah (Perihal, Nomor Filling Kabinet, Nama Folder, Tanggal Pembuatan)', '2020-12-28 10:49:41'),
(42, 2, 33, '0988123', 'Surat Pemberitahuan', 'Diubah (Nama Folder, Tanggal Pembuatan)', '2020-12-28 10:50:49'),
(43, 2, 30, '0011', 'Surat Y', 'Diubah (Tanggal Pembuatan)', '2020-12-28 10:52:36'),
(44, 2, 33, '0988123', 'Surat Pemberitahuan', 'Diubah (Nama Folder, Tanggal Pembuatan)', '2020-12-28 10:54:12'),
(45, 2, 33, '0988123', 'Surat Pemberitahuan', 'Diubah (Tanggal Pembuatan)', '2020-12-28 10:54:38'),
(46, 2, 33, '0988123', 'Surat Pemberitahuan', 'Diubah (Nama Folder, Tanggal Pembuatan)', '2020-12-28 10:55:05'),
(47, 2, 33, '0988123', 'Surat Pemberitahuan', 'Diubah (Tanggal Pembuatan)', '2020-12-28 10:56:12'),
(48, 2, 33, '0988123', 'Surat Pemberitahuan', 'Diubah (Tanggal Pembuatan)', '2020-12-28 10:57:51'),
(49, 2, 33, '0988123', 'Surat Pemberitahuan', 'Diubah (Tanggal Pembuatan)', '2020-12-28 10:58:51'),
(50, 2, 33, '0988123', 'Surat Pemberitahuan', 'Diubah (Tanggal Pembuatan)', '2020-12-28 11:02:21'),
(51, 2, 33, '0988123', 'Surat Pemberitahuan', 'Diubah (Tanggal Pembuatan)', '2020-12-28 11:05:22'),
(52, 2, 33, '0988123', 'Surat Pemberitahuan', 'Diubah (Nama Folder)', '2020-12-28 11:05:54'),
(53, 2, 27, '003', 'Surat AB', 'Berkas Fisik Diambil (Kantor Sebelah)', '2020-12-28 20:48:22'),
(54, 2, 27, '003', 'Surat AB', 'Berkas Fisik Dikembalikan (Kabinet 122)', '2020-12-29 21:59:14'),
(55, 2, 27, '003', 'Surat AB', 'Berkas Fisik Diambil (Kantor Sebelah)', '2020-12-29 21:59:35'),
(56, 2, 27, '003', 'Surat AB', 'Berkas Fisik Dikembalikan (Kabinet 98)', '2020-12-29 21:59:54'),
(57, 2, 27, '003', 'Surat AB', 'Berkas Fisik Diambil (Kantor A)', '2020-12-29 22:12:56'),
(58, 2, 27, '003', 'Surat AB', 'Berkas Fisik Dikembalikan (Folder 12B)', '2020-12-29 22:13:14'),
(59, 2, 27, '003', 'Surat AB', 'Berkas Fisik Diambil (Kantor P)', '2020-12-29 22:13:31'),
(60, 2, 27, '003', 'Surat AB', 'Berkas Fisik Dikembalikan (Kabinet 12P/Folder 3F)', '2020-12-29 22:14:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `reset_hash` varchar(255) DEFAULT NULL,
  `reset_at` datetime DEFAULT NULL,
  `reset_expires` datetime DEFAULT NULL,
  `activate_hash` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `status_message` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `force_pass_reset` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password_hash`, `reset_hash`, `reset_at`, `reset_expires`, `activate_hash`, `status`, `status_message`, `active`, `force_pass_reset`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'a@gmail.com', 'habib', '$2y$10$Q6ZQ4AAHtK/9JmCjXc1qZ.C/6vBgwkPCJ/oFat.UNfENRVlfyXLvm', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2020-12-10 13:51:19', '2020-12-10 13:51:19', NULL),
(2, 'admin@admin.com', 'admin', '$2y$10$kRhRY5rSVVQs3S1jFnA3x.zB1Gr/VykdnDhlfK472FX6rwwPIq/aO', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, '2020-12-18 07:14:32', '2020-12-18 07:14:32', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_groups`
--
ALTER TABLE `auth_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD KEY `auth_groups_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `group_id_permission_id` (`group_id`,`permission_id`);

--
-- Indeks untuk tabel `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD KEY `auth_groups_users_user_id_foreign` (`user_id`),
  ADD KEY `group_id_user_id` (`group_id`,`user_id`);

--
-- Indeks untuk tabel `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `auth_permissions`
--
ALTER TABLE `auth_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_tokens_user_id_foreign` (`user_id`),
  ADD KEY `selector` (`selector`);

--
-- Indeks untuk tabel `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD KEY `auth_users_permissions_permission_id_foreign` (`permission_id`),
  ADD KEY `user_id_permission_id` (`user_id`,`permission_id`);

--
-- Indeks untuk tabel `dokumen`
--
ALTER TABLE `dokumen`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `auth_activation_attempts`
--
ALTER TABLE `auth_activation_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_groups`
--
ALTER TABLE `auth_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `auth_permissions`
--
ALTER TABLE `auth_permissions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_reset_attempts`
--
ALTER TABLE `auth_reset_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `dokumen`
--
ALTER TABLE `dokumen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `riwayat`
--
ALTER TABLE `riwayat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `auth_groups_permissions`
--
ALTER TABLE `auth_groups_permissions`
  ADD CONSTRAINT `auth_groups_permissions_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_groups_users`
--
ALTER TABLE `auth_groups_users`
  ADD CONSTRAINT `auth_groups_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_groups_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD CONSTRAINT `auth_tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auth_users_permissions`
--
ALTER TABLE `auth_users_permissions`
  ADD CONSTRAINT `auth_users_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `auth_users_permissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
