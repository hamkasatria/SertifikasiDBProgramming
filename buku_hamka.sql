-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 31, 2019 at 05:50 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buku_hamka`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_buku` (IN `id_buk` VARCHAR(5), IN `id_kat` VARCHAR(5), IN `jud` VARCHAR(30), IN `isb` VARCHAR(10), IN `pener` VARCHAR(30), IN `penul` VARCHAR(30))  BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING, NOT FOUND ROLLBACK;
START TRANSACTION;
    	INSERT INTO buku (id_buku, id_kategori, judul, isbn, penerbit, penulis)
        VALUES (id_buk,id_kat,jud,isb,pener,penul);
        COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `p_kategori` (IN `id_kat` VARCHAR(5), IN `kat` VARCHAR(30))  BEGIN
DECLARE EXIT HANDLER FOR SQLEXCEPTION, SQLWARNING, NOT FOUND ROLLBACK;
START TRANSACTION;
    	INSERT INTO kategori VALUES (id_kat,kat);
        COMMIT;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `jml` (`id_kat` VARCHAR(5)) RETURNS INT(11) BEGIN
	DECLARE total int(11);
    SELECT COUNT(buku.id_kategori) INTO total FROM buku
    WHERE buku.id_kategori = id_kat;
    RETURN total;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` varchar(5) NOT NULL,
  `id_kategori` varchar(5) NOT NULL,
  `judul` varchar(30) NOT NULL,
  `isbn` varchar(10) NOT NULL,
  `penerbit` varchar(30) NOT NULL,
  `penulis` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `id_kategori`, `judul`, `isbn`, `penerbit`, `penulis`) VALUES
('B1', 'K1', 'Fashion', 'isbn1', 'PT. Mandala', 'Rayi'),
('B2', 'K1', 'Shoes', 'isbn2', 'PT. Mandala', 'Raya'),
('B4', 'K3', 'rancangan', 'isbn5', 'PT. Sukamunduraja', 'Sukma'),
('B5', 'K3', 'Puisi baru', 'isbn5', 'PT. Sukamundurjaya', 'Sukma');

--
-- Triggers `buku`
--
DELIMITER $$
CREATE TRIGGER `tg_delete` AFTER DELETE ON `buku` FOR EACH ROW BEGIN
	INSERT INTO log_buku(id_buku, aksi, tgl) VALUES (OLD.id_buku, 'DELETE', CURRENT_DATE);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tg_insert` AFTER INSERT ON `buku` FOR EACH ROW BEGIN
	INSERT INTO log_buku(id_buku, aksi, tgl) VALUES (NEW.id_buku, 'INSERT', CURRENT_DATE);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tg_update` AFTER UPDATE ON `buku` FOR EACH ROW BEGIN
	INSERT INTO log_buku(id_buku, aksi, tgl) VALUES (OLD.id_buku, 'UPDATE', CURRENT_DATE);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` varchar(5) NOT NULL,
  `nama_kategori` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
('K1', 'majalah'),
('K3', 'Puisi'),
('K4', 'Sastra'),
('K5', 'Logika'),
('K7', 'lain-lainnya');

-- --------------------------------------------------------

--
-- Table structure for table `log_buku`
--

CREATE TABLE `log_buku` (
  `id` varchar(5) DEFAULT NULL,
  `id_buku` varchar(5) DEFAULT NULL,
  `aksi` varchar(10) DEFAULT NULL,
  `tgl` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_buku`
--

INSERT INTO `log_buku` (`id`, `id_buku`, `aksi`, `tgl`) VALUES
(NULL, 'B1', 'INSERT', '2019-10-31'),
(NULL, 'B2', 'INSERT', '2019-10-31'),
(NULL, 'B3', 'INSERT', '2019-10-31'),
(NULL, 'B4', 'INSERT', '2019-10-31'),
(NULL, 'K7', 'INSERT', '2019-10-31'),
(NULL, 'B5', 'INSERT', '2019-10-31'),
(NULL, 'K7', 'DELETE', '2019-10-31'),
(NULL, 'B4', 'UPDATE', '2019-10-31'),
(NULL, 'B5', 'UPDATE', '2019-10-31'),
(NULL, 'B5', 'UPDATE', '2019-10-31'),
(NULL, 'B4', 'UPDATE', '2019-10-31'),
(NULL, 'B1', 'UPDATE', '2019-10-31'),
(NULL, 'B4', 'UPDATE', '2019-10-31');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vkedua`
-- (See below for the actual view)
--
CREATE TABLE `vkedua` (
`id_buku` varchar(5)
,`judul` varchar(30)
,`nama_kategori` varchar(15)
,`isbn` varchar(10)
,`penerbit` varchar(30)
,`penulis` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vpertama`
-- (See below for the actual view)
--
CREATE TABLE `vpertama` (
`id_kategori` varchar(5)
,`nama_kategori` varchar(15)
,`TOTAL_BUKU` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `vkedua`
--
DROP TABLE IF EXISTS `vkedua`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vkedua`  AS  select `buku`.`id_buku` AS `id_buku`,`buku`.`judul` AS `judul`,`kategori`.`nama_kategori` AS `nama_kategori`,`buku`.`isbn` AS `isbn`,`buku`.`penerbit` AS `penerbit`,`buku`.`penulis` AS `penulis` from (`buku` join `kategori` on((`buku`.`id_kategori` = `kategori`.`id_kategori`))) ;

-- --------------------------------------------------------

--
-- Structure for view `vpertama`
--
DROP TABLE IF EXISTS `vpertama`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vpertama`  AS  select `kategori`.`id_kategori` AS `id_kategori`,`kategori`.`nama_kategori` AS `nama_kategori`,`jml`(`kategori`.`id_kategori`) AS `TOTAL_BUKU` from `kategori` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `fk_id_kategori` (`id_kategori`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `fk_id_kategori3` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
