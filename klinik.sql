-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 21, 2023 at 10:21 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `klinik`
--

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` bigint(15) NOT NULL,
  `status_pasien` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `alamat`, `no_hp`, `status_pasien`) VALUES
(1, 'Ali Rais', 'Bengkalis', '2002-09-16', 'Laki-laki', 'Bengkalis, Riau', 85161390161, 'Reguler'),
(2, 'Putri', 'Bengkalis', '2002-12-12', 'Perempuan', 'Bengkalis, Riau', 81222331212, 'Reguler'),
(3, 'Ulva', 'Bengkalis', '2001-10-10', 'Perempuan', 'Duri, Bengkalis', 82355601267, 'BPJS Kesehatan');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` int(11) NOT NULL,
  `nama_pegawai` varchar(100) NOT NULL,
  `nip` bigint(20) DEFAULT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `status_pegawai` varchar(100) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_hp` bigint(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`id_pegawai`, `nama_pegawai`, `nip`, `jenis_kelamin`, `jabatan`, `status_pegawai`, `alamat`, `no_hp`) VALUES
(1, 'Rais', 243312223445, 'Laki-laki', 'Admin', 'Pegawai Tetap', 'Bengkalis, Riau', 85161390161);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pasien` int(11) NOT NULL,
  `diagnosis` varchar(255) NOT NULL,
  `resep` varchar(255) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `total_bayar` bigint(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `id_pegawai` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pasien`, `diagnosis`, `resep`, `tgl_pembelian`, `total_bayar`, `status`, `id_pegawai`) VALUES
(1, 1, 'Mengalami Demam', 'Paracetamol', '2023-09-20', 10000, 'Belum Bayar', 1),
(2, 2, 'Sakit Gigi', 'Obat Pereda Nyeri', '2023-09-20', 5000, 'Sudah Bayar', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(100) NOT NULL,
  `authKey` varchar(100) NOT NULL,
  `accessToken` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `role` varchar(50) NOT NULL,
  `time_create` timestamp NULL DEFAULT NULL,
  `time_update` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `authKey`, `accessToken`, `status`, `role`, `time_create`, `time_update`) VALUES
(2, 'admin', 'admin12345', 'admin01', 'admin01', 10, 'admin', NULL, NULL),
(4, 'admklinik', '$2y$13$NgmwI4.SDqoM/T.822Zz8uWVLbq4SoLkDH5lxka48/qCTc0UxMvvq', 'Vz09PMG0-LGNN6PP7wu4yA7AVaujDfTA', '3BxD004rguDPLRsD1Ra_YzjyYYzGKo_D', 10, '20', '0000-00-00 00:00:00', NULL),
(5, 'alirais', '$2y$13$kZSYn6Pk75sqWgnuLSL0deCSPwlG2Mbuv1ULosNG2cx8FVRqotTO6', 'Ccih9WDEPjd71-yGm-8hHV5pV0gmrYfV', 'W70i-9YBilLVsIt1hsgdiDtrF5B3ub1C', 10, '10', '0000-00-00 00:00:00', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `tindakan_id_pasien` (`id_pasien`),
  ADD KEY `tindakan_id_pegawai` (`id_pegawai`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id_pegawai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `tindakan_id_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`),
  ADD CONSTRAINT `tindakan_id_pegawai` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
