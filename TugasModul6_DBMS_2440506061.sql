-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307:3307
-- Generation Time: Mar 26, 2025 at 05:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `praktikum_sql6`
--

-- --------------------------------------------------------

--
-- Table structure for table `ambil_mk`
--

CREATE TABLE `ambil_mk` (
  `nim` char(3) NOT NULL,
  `kd_mk` char(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ambil_mk`
--

INSERT INTO `ambil_mk` (`nim`, `kd_mk`) VALUES
('101', 'PTI447'),
('103', 'TIK333'),
('104', 'PTI333'),
('104', 'TIK342'),
('105', 'PTI123'),
('107', 'TIK342');

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `kd_dos` char(2) NOT NULL,
  `nama_dos` varchar(100) NOT NULL,
  `alamat_dos` varchar(50) NOT NULL,
  `kd_jur` char(2) DEFAULT NULL,
  `ketua_jur` enum('Y','N') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`kd_dos`, `nama_dos`, `alamat_dos`, `kd_jur`, `ketua_jur`) VALUES
('10', 'Suharto', 'Jl. Jombang', 'TE', 'Y'),
('11', 'Martono', 'Jl. Kalpataru', 'TE', 'N'),
('12', 'Rahmawati', 'Jl. Jakarta', 'TM', 'N'),
('13', 'Bambang', 'Jl. Bandung', 'TM', 'Y'),
('14', 'Nurul', 'Jl. Raya Tidar', 'TS', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE `jurusan` (
  `kd_jur` char(2) NOT NULL,
  `nama_jur` varchar(50) NOT NULL,
  `kd_dos` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`kd_jur`, `nama_jur`, `kd_dos`) VALUES
('TE', 'Teknik Elektro', '10'),
('TM', 'Teknik Mesin', '13'),
('TS', 'Teknik Sipil', '14');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `NIM` char(3) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jk` enum('L','P') NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`NIM`, `nama`, `jk`, `alamat`) VALUES
('101', 'Arif', 'L', 'Jl. Kenangan'),
('102', 'Budi', 'L', 'Jl. Jombang'),
('103', 'Wati', 'P', 'Jl. Surabaya'),
('104', 'Ika', 'P', 'Jl. Jombang'),
('105', 'Tono', 'L', 'Jl. Jakarta'),
('106', 'Iwan', 'L', 'Jl. Bandung'),
('107', 'Sari', 'P', 'Jl. Malang');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE `mata_kuliah` (
  `kd_mk` char(6) NOT NULL,
  `nama_mk` varchar(50) NOT NULL,
  `sks` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  `kd_dos` char(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`kd_mk`, `nama_mk`, `sks`, `semester`, `kd_dos`) VALUES
('PTI123', 'Grafika Multimedia', 3, 5, '12'),
('PTI333', 'Basis data terdistribusi', 3, 5, '10'),
('PTI447', 'Praktikum Basis data', 1, 3, '11'),
('TIK333', 'Sistem Operasi', 3, 5, '10'),
('TIK342', 'Praktikum Basis data', 1, 3, '11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ambil_mk`
--
ALTER TABLE `ambil_mk`
  ADD PRIMARY KEY (`nim`,`kd_mk`),
  ADD KEY `kd_mk` (`kd_mk`);

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`kd_dos`),
  ADD KEY `kd_jur` (`kd_jur`);

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kd_jur`),
  ADD KEY `kd_dos` (`kd_dos`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`NIM`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD PRIMARY KEY (`kd_mk`),
  ADD KEY `kd_dos` (`kd_dos`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ambil_mk`
--
ALTER TABLE `ambil_mk`
  ADD CONSTRAINT `ambil_mk_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`NIM`),
  ADD CONSTRAINT `ambil_mk_ibfk_2` FOREIGN KEY (`kd_mk`) REFERENCES `mata_kuliah` (`kd_mk`);

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`kd_jur`) REFERENCES `jurusan` (`kd_jur`);

--
-- Constraints for table `jurusan`
--
ALTER TABLE `jurusan`
  ADD CONSTRAINT `jurusan_ibfk_1` FOREIGN KEY (`kd_dos`) REFERENCES `dosen` (`kd_dos`);

--
-- Constraints for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
  ADD CONSTRAINT `mata_kuliah_ibfk_1` FOREIGN KEY (`kd_dos`) REFERENCES `dosen` (`kd_dos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
