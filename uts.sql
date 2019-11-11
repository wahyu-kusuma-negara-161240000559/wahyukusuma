-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2019 at 01:20 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 5.6.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uts`
--

-- --------------------------------------------------------

--
-- Table structure for table `data_mhs`
--

CREATE TABLE `data_mhs` (
  `id` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `nama_mahasiswa` varchar(100) NOT NULL,
  `prodi` varchar(50) NOT NULL,
  `jk` varchar(10) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `hp` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `data_mhs`
--

INSERT INTO `data_mhs` (`id`, `nim`, `nama_mahasiswa`, `prodi`, `jk`, `alamat`, `hp`) VALUES
(1, '161240000546', 'dicky daryono', 'tif', 'laki-laki', 'pekalongan rt 03 rw 04 batealit jepara', '2222222222'),
(2, '161240000566', 'bagas kaffa', 'Desain Produk', 'Laki-Laki', 'jambu lor, jepara', '5530992211');

--
-- Triggers `data_mhs`
--
DELIMITER $$
CREATE TRIGGER `ubah_hp` BEFORE UPDATE ON `data_mhs` FOR EACH ROW BEGIN INSERT INTO tbl_ubah_hp
SET nim = old.nim,
hp_baru = new.hp,
hp_lama = old.hp,
tgl_ubah = now();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `lihat_db`
-- (See below for the actual view)
--
CREATE TABLE `lihat_db` (
`id` int(11)
,`nim` varchar(20)
,`nama_mahasiswa` varchar(100)
,`prodi` varchar(50)
,`jk` varchar(10)
,`alamat` varchar(150)
,`hp` varchar(20)
);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ubah_hp`
--

CREATE TABLE `tbl_ubah_hp` (
  `id` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `hp_lama` varchar(30) NOT NULL,
  `hp_baru` varchar(30) NOT NULL,
  `tgl_ubah` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_ubah_hp`
--

INSERT INTO `tbl_ubah_hp` (`id`, `nim`, `hp_lama`, `hp_baru`, `tgl_ubah`) VALUES
(1, '161240000546', '0896543838', '2222222222', '2019-11-11 18:29:43');

-- --------------------------------------------------------

--
-- Structure for view `lihat_db`
--
DROP TABLE IF EXISTS `lihat_db`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lihat_db`  AS  (select `data_mhs`.`id` AS `id`,`data_mhs`.`nim` AS `nim`,`data_mhs`.`nama_mahasiswa` AS `nama_mahasiswa`,`data_mhs`.`prodi` AS `prodi`,`data_mhs`.`jk` AS `jk`,`data_mhs`.`alamat` AS `alamat`,`data_mhs`.`hp` AS `hp` from `data_mhs`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `data_mhs`
--
ALTER TABLE `data_mhs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_ubah_hp`
--
ALTER TABLE `tbl_ubah_hp`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `data_mhs`
--
ALTER TABLE `data_mhs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_ubah_hp`
--
ALTER TABLE `tbl_ubah_hp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
