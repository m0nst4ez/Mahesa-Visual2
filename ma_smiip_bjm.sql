-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2023 at 05:48 AM
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
-- Database: `ma_smiip_bjm`
--

-- --------------------------------------------------------

--
-- Table structure for table `catatan`
--

CREATE TABLE `catatan` (
  `id` int(11) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `semester` int(5) DEFAULT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `wali_id` int(11) DEFAULT NULL,
  `ortu_id` int(11) DEFAULT NULL,
  `poin_id` int(11) DEFAULT NULL,
  `status` enum('Aktif','Nonaktif') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `catatan`
--

INSERT INTO `catatan` (`id`, `tanggal`, `semester`, `siswa_id`, `wali_id`, `ortu_id`, `poin_id`, `status`) VALUES
(1, '2023-07-02', 2, 1, 1, 1, 2, 'Aktif'),
(2, '2023-07-04', 1, 2, 4, 1, 3, 'Nonaktif');

-- --------------------------------------------------------

--
-- Table structure for table `hub`
--

CREATE TABLE `hub` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) DEFAULT NULL,
  `ortu_id` int(11) DEFAULT NULL,
  `status_hub_anak` enum('Kandung','Tiri') DEFAULT NULL,
  `ket` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hub`
--

INSERT INTO `hub` (`id`, `siswa_id`, `ortu_id`, `status_hub_anak`, `ket`) VALUES
(1, 1, 1, 'Kandung', 'Ya'),
(2, 2, 2, 'Kandung', 'Ya');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` int(11) NOT NULL,
  `nama_kelas` varchar(30) DEFAULT NULL,
  `jurusan` enum('IPA','IPS') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `nama_kelas`, `jurusan`) VALUES
(1, 'X A', 'IPA'),
(3, 'X C', 'IPS');

-- --------------------------------------------------------

--
-- Table structure for table `ortu`
--

CREATE TABLE `ortu` (
  `id` int(11) NOT NULL,
  `nik` int(15) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `pendidikan` varchar(10) DEFAULT NULL,
  `pekerjaan` varchar(25) DEFAULT NULL,
  `telp` int(15) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `jk` enum('P','L') DEFAULT NULL,
  `agama` varchar(20) DEFAULT NULL,
  `status` enum('Aktif','Nonaktif') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ortu`
--

INSERT INTO `ortu` (`id`, `nik`, `nama`, `pendidikan`, `pekerjaan`, `telp`, `alamat`, `jk`, `agama`, `status`) VALUES
(1, 3729192, 'Halimah', 'S1', 'Guru', 827182718, 'jln griya', 'P', 'Islam', 'Aktif'),
(2, 31187281, 'Rey', 'S1', 'Guru', 821782712, 'jln pramuka', 'L', 'Islam', 'Aktif'),
(4, 31319212, 'Ahmad', 'S3', 'Prof', 83100212, 'BJM', 'L', 'Islam', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `poin`
--

CREATE TABLE `poin` (
  `id` int(11) NOT NULL,
  `nama_poin` varchar(50) DEFAULT NULL,
  `bobot` varchar(20) DEFAULT NULL,
  `tipe_poin` enum('Pelanggaran','Prestasi') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `poin`
--

INSERT INTO `poin` (`id`, `nama_poin`, `bobot`, `tipe_poin`) VALUES
(1, 'Terlambat', '10', 'Pelanggaran'),
(2, 'Juara Paskibra', '20', 'Prestasi'),
(3, 'Juara Pramuka', '15', 'Prestasi');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id` int(11) NOT NULL,
  `nis` int(15) DEFAULT NULL,
  `nisn` int(15) DEFAULT NULL,
  `nama_siswa` varchar(30) DEFAULT NULL,
  `nik` int(15) DEFAULT NULL,
  `tempat_lahir` varchar(30) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `jk` enum('P','L') DEFAULT NULL,
  `alamat` varchar(30) DEFAULT NULL,
  `telp` int(15) DEFAULT NULL,
  `hp` int(15) DEFAULT NULL,
  `status` enum('aktif','nonaktif') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id`, `nis`, `nisn`, `nama_siswa`, `nik`, `tempat_lahir`, `tgl_lahir`, `jk`, `alamat`, `telp`, `hp`, `status`) VALUES
(1, 12345, 23456, 'Mahesa', 21103921, 'BJM', '2013-07-02', 'L', 'jln gatsu', 823289103, 823289103, 'aktif'),
(2, 12346, 1234567, 'Ridho Muhammad', 312121, 'BJB', '2015-07-12', 'L', 'jln haway', 821781212, 821781212, 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nik` int(15) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `level` enum('User','Admin') DEFAULT NULL,
  `status` enum('Aktif','Nonaktif') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nik`, `nama`, `level`, `status`) VALUES
(1, 20329011, 'Mahesa', 'Admin', 'Aktif'),
(2, 2190122, 'Rey', 'User', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `wali_kelas`
--

CREATE TABLE `wali_kelas` (
  `id` int(11) NOT NULL,
  `nik` int(20) DEFAULT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `jk` enum('P','L') DEFAULT NULL,
  `pendidikan` varchar(5) DEFAULT NULL,
  `mapel` varchar(50) DEFAULT NULL,
  `telp` int(16) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wali_kelas`
--

INSERT INTO `wali_kelas` (`id`, `nik`, `nama`, `jk`, `pendidikan`, `mapel`, `telp`, `alamat`) VALUES
(1, 3131214, 'Riski', 'L', 'S2', 'TIK', 827182718, 'jln griya'),
(2, 2129801, 'Winda', 'P', 'S1', 'Matematika', 821782712, 'BJM'),
(4, 32381212, 'GaniAbdul', 'L', 'S2', 'Seni Budaya', 872817812, 'BJB');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `catatan`
--
ALTER TABLE `catatan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siswa_id` (`siswa_id`),
  ADD KEY `wali_id` (`wali_id`),
  ADD KEY `ortu_id` (`ortu_id`),
  ADD KEY `poin_id` (`poin_id`);

--
-- Indexes for table `hub`
--
ALTER TABLE `hub`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siswa_id` (`siswa_id`),
  ADD KEY `ortu_id` (`ortu_id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ortu`
--
ALTER TABLE `ortu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poin`
--
ALTER TABLE `poin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wali_kelas`
--
ALTER TABLE `wali_kelas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `catatan`
--
ALTER TABLE `catatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hub`
--
ALTER TABLE `hub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ortu`
--
ALTER TABLE `ortu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `poin`
--
ALTER TABLE `poin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `wali_kelas`
--
ALTER TABLE `wali_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `catatan`
--
ALTER TABLE `catatan`
  ADD CONSTRAINT `catatan_ibfk_1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`),
  ADD CONSTRAINT `catatan_ibfk_2` FOREIGN KEY (`wali_id`) REFERENCES `wali_kelas` (`id`),
  ADD CONSTRAINT `catatan_ibfk_3` FOREIGN KEY (`ortu_id`) REFERENCES `ortu` (`id`),
  ADD CONSTRAINT `catatan_ibfk_4` FOREIGN KEY (`poin_id`) REFERENCES `poin` (`id`);

--
-- Constraints for table `hub`
--
ALTER TABLE `hub`
  ADD CONSTRAINT `hub_ibfk_1` FOREIGN KEY (`siswa_id`) REFERENCES `siswa` (`id`),
  ADD CONSTRAINT `hub_ibfk_2` FOREIGN KEY (`ortu_id`) REFERENCES `ortu` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
