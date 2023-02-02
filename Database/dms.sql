-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 02, 2023 at 09:28 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dms`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `idBarang` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `gambarBarang` text DEFAULT NULL,
  `namaBarang` varchar(100) NOT NULL,
  `merk` varchar(100) NOT NULL,
  `dateCreated` int(11) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `hargaSatuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`idBarang`, `gambarBarang`, `namaBarang`, `merk`, `dateCreated`, `satuan`, `hargaSatuan`) VALUES
('63a6a1c424cb6', 'Chitato.jpg', 'Chitato Sapi Panggang', 'Chitato', 1672619033, 'Dus', 125000),
('63a6a37aa60e8', 'Cheetos_Puff.jpg', 'Cheetos Puff', 'Cheetos', 1672619508, 'Dus', 125000),
('63a6a3d9e2e59', 'Snack-Enak-Yang-Populer-Dan-Bisa-Di-Beli-Di-Swalayan-Dengan-Harga-Yang-Murah-3.jpg', 'Taro Net', 'Taro', 1672620374, 'Dus', 120000),
('63a6a4053883a', 'Lays.jpg', 'Lays Rumput Laut', 'Lays', 1672620395, 'Dus', 150000),
('63a6a4324c134', 'Pringles.jpg', 'Pringles', 'Pringles', 1672620405, 'Lusin', 249000);

-- --------------------------------------------------------

--
-- Table structure for table `barangmasuk`
--

CREATE TABLE `barangmasuk` (
  `idBarangMasuk` varchar(20) NOT NULL,
  `idBarang` varchar(20) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggalMasuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barangmasuk`
--

INSERT INTO `barangmasuk` (`idBarangMasuk`, `idBarang`, `jumlah`, `tanggalMasuk`) VALUES
('63ae65246eaab', '63a6a4053883a', 100, '2022-12-30'),
('63ae652a7b86c', '63a6a1c424cb6', 100, '2022-12-30'),
('63ae65308dce0', '63a6a37aa60e8', 120, '2022-12-30'),
('63ae653986e3d', '63a6a4324c134', 100, '2022-12-30'),
('63ae65408e18d', '63a6a1c424cb6', 10, '2022-12-30'),
('63ae655454f0d', '63a6a3d9e2e59', 54, '2022-12-30');

--
-- Triggers `barangmasuk`
--
DELIMITER $$
CREATE TRIGGER `BM_D` AFTER DELETE ON `barangmasuk` FOR EACH ROW BEGIN 
UPDATE gudang SET
stok=stok-OLD.jumlah
WHERE
idBarang = OLD.idBarang;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BM_I` AFTER INSERT ON `barangmasuk` FOR EACH ROW BEGIN 
INSERT 
INTO gudang SET 
idBarang = NEW.idBarang,
stok = NEW.jumlah
ON DUPLICATE KEY 
UPDATE stok=stok+NEW.jumlah;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BM_U` AFTER UPDATE ON `barangmasuk` FOR EACH ROW BEGIN 
UPDATE gudang SET 
idBarang = NEW.idBarang,
stok = stok-OLD.jumlah,
stok = stok+NEW.jumlah
WHERE
idBarang = OLD.idBarang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `idCustomer` varchar(20) NOT NULL,
  `namaLengkap` varchar(191) NOT NULL,
  `alamatCustomer` text NOT NULL,
  `noTelpon` varchar(16) NOT NULL,
  `email` varchar(191) NOT NULL,
  `npwp` varchar(20) NOT NULL,
  `fotoCustomer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`idCustomer`, `namaLengkap`, `alamatCustomer`, `noTelpon`, `email`, `npwp`, `fotoCustomer`) VALUES
('63ad898de2a71', 'Toko Gilang', 'Jl. A. Yani km 4', '081321929122', 'gilang@gmail.com', '1238178297182', 'Sales-Mobil-Honda-Andrian1.jpeg'),
('63ad89aa4aa40', 'Toko Udin', 'Jl. A. Yani km 4', '081321929122', 'Udin@gmail.com', '738423874913819', 'Sales-Mobil-Honda-Andrian2.jpeg'),
('63ad89aa4aa43', 'Toko Riswan', 'Jl. A. Yani km 4', '081321929129', 'riswan@gmail.com', '12381782971829121', 'Sales-Mobil-Honda-Andrian.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `gudang`
--

CREATE TABLE `gudang` (
  `idBarang` varchar(20) NOT NULL,
  `stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gudang`
--

INSERT INTO `gudang` (`idBarang`, `stok`) VALUES
('63a6a1c424cb6', 68),
('63a6a37aa60e8', 80),
('63a6a3d9e2e59', 5),
('63a6a4053883a', 89),
('63a6a4324c134', 92);

-- --------------------------------------------------------

--
-- Table structure for table `ordersales`
--

CREATE TABLE `ordersales` (
  `idOrderSales` varchar(20) NOT NULL,
  `idCustomer` varchar(20) NOT NULL,
  `noInvoice` int(11) NOT NULL,
  `tanggalOrder` date NOT NULL,
  `jatuhTempo` date NOT NULL,
  `statusPembayaran` varchar(20) NOT NULL,
  `statusOrder` int(1) NOT NULL,
  `idSales` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ordersales`
--

INSERT INTO `ordersales` (`idOrderSales`, `idCustomer`, `noInvoice`, `tanggalOrder`, `jatuhTempo`, `statusPembayaran`, `statusOrder`, `idSales`) VALUES
('63ad8c856e0bf', '63ad898de2a71', 1673937009, '2022-12-29', '2023-02-10', 'Belum Bayar', 2, '63ad24a5aed85'),
('63b26ae0659df', '63ad89aa4aa40', 1673937007, '2023-01-02', '2023-02-10', 'Belum Bayar', 2, '63ad24a5aed85'),
('63c5cde38a12c', '63ad89aa4aa40', 1673937011, '2023-01-16', '2023-02-10', 'Belum Bayar', 2, '63ad24a5aed85'),
('63c64072c19d4', '63ad898de2a71', 1673937010, '2023-01-17', '2023-02-14', 'Belum Bayar', 2, '63ad24a5aed85'),
('63c64088a934b', '63ad89aa4aa40', 1673937032, '2023-01-17', '0000-00-00', 'Belum Bayar', 1, '63ad24a5aed85'),
('63c64093c670b', '63ad89aa4aa43', 1673937043, '2023-01-17', '0000-00-00', 'Belum Bayar', 1, '63ad24a5aed85');

-- --------------------------------------------------------

--
-- Table structure for table `ordersales_detail`
--

CREATE TABLE `ordersales_detail` (
  `idOrderSalesDetail` varchar(20) NOT NULL,
  `idOrderSales` varchar(20) NOT NULL,
  `idBarang` varchar(20) NOT NULL,
  `jumlahOrder` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ordersales_detail`
--

INSERT INTO `ordersales_detail` (`idOrderSalesDetail`, `idOrderSales`, `idBarang`, `jumlahOrder`) VALUES
('63afd0d67a9d1', '63ad8c856e0bf', '63a6a1c424cb6', 20),
('63afd0dde0858', '63ad8c856e0bf', '63a6a37aa60e8', 20),
('63afd0e5775c9', '63ad8c856e0bf', '63a6a3d9e2e59', 6),
('63afd0ebbab3d', '63ad8c856e0bf', '63a6a4053883a', 8),
('63afd0fc15f74', '63ad8c856e0bf', '63a6a4324c134', 8),
('63b26aeb6902b', '63b26ae0659df', '63a6a1c424cb6', 10),
('63b26af133953', '63b26ae0659df', '63a6a37aa60e8', 20),
('63b26afb7360b', '63b26ae0659df', '63a6a3d9e2e59', 30),
('63c5cdf46e77d', '63c5cde38a12c', '63a6a3d9e2e59', 13),
('63c6585f125cf', '63c64072c19d4', '63a6a1c424cb6', 12),
('63c659c09fa93', '63c64072c19d4', '63a6a4053883a', 3);

--
-- Triggers `ordersales_detail`
--
DELIMITER $$
CREATE TRIGGER `OS_D` AFTER DELETE ON `ordersales_detail` FOR EACH ROW BEGIN 
UPDATE gudang SET 
stok = stok+OLD.jumlahOrder
WHERE
idBarang= OLD.idBarang;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `OS_I` AFTER INSERT ON `ordersales_detail` FOR EACH ROW BEGIN 
UPDATE gudang SET 
stok = stok-NEW.jumlahOrder
WHERE
idBarang= NEW.idBarang;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `OS_U` AFTER UPDATE ON `ordersales_detail` FOR EACH ROW BEGIN 
UPDATE gudang SET
stok = stok+OLD.jumlahOrder,
stok = stok-NEW.jumlahOrder
WHERE
idBarang = NEW.idBarang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `idPayment` varchar(20) NOT NULL,
  `idOrderSales` varchar(20) NOT NULL,
  `bayar` int(11) NOT NULL,
  `tanggalPembayaran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`idPayment`, `idOrderSales`, `bayar`, `tanggalPembayaran`) VALUES
('63c8e6d14704f', '63c64072c19d4', 300000, 1674110673),
('63c8f1690f4a4', '63c5cde38a12c', 1000000, 1674113385),
('63c8f69e9d760', '63c64072c19d4', 1650000, 1674114718);

-- --------------------------------------------------------

--
-- Table structure for table `retur`
--

CREATE TABLE `retur` (
  `idRetur` varchar(20) NOT NULL,
  `tanggalRetur` int(11) NOT NULL,
  `idOrderSales` varchar(20) NOT NULL,
  `idBarang` varchar(20) NOT NULL,
  `jumlahRetur` int(11) NOT NULL,
  `jumlahKembali` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `retur`
--

INSERT INTO `retur` (`idRetur`, `tanggalRetur`, `idOrderSales`, `idBarang`, `jumlahRetur`, `jumlahKembali`) VALUES
('63cf7e4f59e26', 1674542671, '63c64072c19d4', '63a6a1c424cb6', 0, 10),
('63cf921af4162', 1674547738, '63c5cde38a12c', '63a6a3d9e2e59', 0, 1),
('63d36e9fbc3a7', 1674800799, '63b26ae0659df', '63a6a3d9e2e59', 0, 30),
('63d383bf3e0b6', 1674806207, '63ad8c856e0bf', '63a6a4324c134', 0, 8);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `idSales` varchar(20) NOT NULL,
  `namaSales` varchar(50) NOT NULL,
  `tempatLahir` varchar(50) NOT NULL,
  `tanggalLahir` date NOT NULL,
  `jk` int(11) NOT NULL,
  `noWa` varchar(16) NOT NULL,
  `isActive` int(1) NOT NULL,
  `roleId` int(1) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `dateCreated` int(11) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`idSales`, `namaSales`, `tempatLahir`, `tanggalLahir`, `jk`, `noWa`, `isActive`, `roleId`, `username`, `password`, `dateCreated`, `foto`) VALUES
('63ad24a5aed85', 'Hendi Agus Saputra', 'Banjarmasin', '1995-12-29', 1, '099879879793', 1, 3, 'hendi', '$2y$10$0DP6DbObKzYQN2ldcW/ePOmEshffVXE/lnv09Ekyry3zP5okAukcu', 1672291494, 'Sales-Mobil-Honda-Andrian1.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `idUsers` varchar(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `roleId` int(11) NOT NULL,
  `namaLengkap` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `noWa` varchar(20) NOT NULL,
  `isActive` int(11) NOT NULL,
  `foto` text NOT NULL,
  `dateCreated` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`idUsers`, `username`, `password`, `roleId`, `namaLengkap`, `email`, `noWa`, `isActive`, `foto`, `dateCreated`) VALUES
('5f269419c1055', 'admin', '$2y$10$8K/PZ9ZYgM2pdO7WlUHl..OdjW9hHDWiPiNwRrC/xby7EaKmQM41G', 1, 'Rizal Khalqi', 'rizal@gmail.com', '081223231212', 1, '55885cd86e82e0b433da1a27c104e6401.png', 1624885524),
('63a328a582412', 'gilang', '$2y$10$jLRWFb.bRYZ9fPvAZ/n6Gu83PpfiJpw1amv.24jyKOWTTUa5rj1e.', 1, 'Gilang', 'gilang@gmail.com', '0998-7987-979', 1, '', 1671637432);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`idBarang`);

--
-- Indexes for table `barangmasuk`
--
ALTER TABLE `barangmasuk`
  ADD PRIMARY KEY (`idBarangMasuk`),
  ADD KEY `idBarang` (`idBarang`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`idCustomer`);

--
-- Indexes for table `gudang`
--
ALTER TABLE `gudang`
  ADD PRIMARY KEY (`idBarang`);

--
-- Indexes for table `ordersales`
--
ALTER TABLE `ordersales`
  ADD PRIMARY KEY (`idOrderSales`),
  ADD KEY `idCustomer` (`idCustomer`),
  ADD KEY `idSales` (`idSales`);

--
-- Indexes for table `ordersales_detail`
--
ALTER TABLE `ordersales_detail`
  ADD PRIMARY KEY (`idOrderSalesDetail`),
  ADD KEY `idBarang` (`idBarang`),
  ADD KEY `idOrderSales` (`idOrderSales`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`idPayment`),
  ADD KEY `idOrderSales` (`idOrderSales`);

--
-- Indexes for table `retur`
--
ALTER TABLE `retur`
  ADD PRIMARY KEY (`idRetur`),
  ADD KEY `idBarang` (`idBarang`),
  ADD KEY `idOrderSales` (`idOrderSales`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`idSales`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUsers`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barangmasuk`
--
ALTER TABLE `barangmasuk`
  ADD CONSTRAINT `barangmasuk_ibfk_1` FOREIGN KEY (`idBarang`) REFERENCES `barang` (`idBarang`) ON UPDATE CASCADE;

--
-- Constraints for table `ordersales`
--
ALTER TABLE `ordersales`
  ADD CONSTRAINT `ordersales_ibfk_1` FOREIGN KEY (`idCustomer`) REFERENCES `customer` (`idCustomer`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ordersales_ibfk_2` FOREIGN KEY (`idSales`) REFERENCES `sales` (`idSales`) ON UPDATE CASCADE;

--
-- Constraints for table `ordersales_detail`
--
ALTER TABLE `ordersales_detail`
  ADD CONSTRAINT `ordersales_detail_ibfk_1` FOREIGN KEY (`idBarang`) REFERENCES `barang` (`idBarang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ordersales_detail_ibfk_2` FOREIGN KEY (`idOrderSales`) REFERENCES `ordersales` (`idOrderSales`) ON UPDATE CASCADE;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`idOrderSales`) REFERENCES `ordersales` (`idOrderSales`) ON UPDATE CASCADE;

--
-- Constraints for table `retur`
--
ALTER TABLE `retur`
  ADD CONSTRAINT `retur_ibfk_1` FOREIGN KEY (`idBarang`) REFERENCES `barang` (`idBarang`) ON UPDATE CASCADE,
  ADD CONSTRAINT `retur_ibfk_2` FOREIGN KEY (`idOrderSales`) REFERENCES `ordersales` (`idOrderSales`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
