-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 06, 2026 at 01:13 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ptmajujaya`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `kartu_persediaan_barang`
-- (See below for the actual view)
--
CREATE TABLE `kartu_persediaan_barang` (
`berkurang` varchar(83)
,`bertambah` varchar(83)
,`harga` varchar(57)
,`id_produk` int
,`keluar` bigint
,`ket` varchar(255)
,`masuk` bigint
,`no` bigint unsigned
,`no_dokumen` varchar(50)
,`sisa_produk` decimal(42,0)
,`sisa_rupiah` varchar(113)
,`tanggal_transaksi` date
,`uraian` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `laporanstokgudang`
-- (See below for the actual view)
--
CREATE TABLE `laporanstokgudang` (
`Harga Satuan (Rp)` varchar(57)
,`Jumlah Akhir Bulan (Unit)` decimal(43,0)
,`Jumlah Awal Bulan (Unit)` int
,`Kode Produk` varchar(20)
,`Nama Produk` varchar(100)
,`Nilai Stok Akhir (Rp)` varchar(115)
,`No` int
,`Pemasukan (Unit)` decimal(41,0)
,`Pengeluaran (Unit)` decimal(41,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `pemasok`
--

CREATE TABLE `pemasok` (
  `id` int NOT NULL,
  `Nama_pemasok` varchar(50) NOT NULL,
  `kontak_info` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pemasok`
--

INSERT INTO `pemasok` (`id`, `Nama_pemasok`, `kontak_info`) VALUES
(1, 'PT.Kwagya', '0811111111'),
(2, 'PT.ECII', '0898765432');

-- --------------------------------------------------------

--
-- Table structure for table `persediaan`
--

CREATE TABLE `persediaan` (
  `Id` int NOT NULL,
  `Id_produk` int NOT NULL,
  `lokasi_gudang` varchar(50) NOT NULL,
  `jumlah` int NOT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `tanggal_keluar` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `persediaan`
--

INSERT INTO `persediaan` (`Id`, `Id_produk`, `lokasi_gudang`, `jumlah`, `tanggal_masuk`, `tanggal_keluar`) VALUES
(1, 1, 'Gudang Jakarta', 150, '2026-01-04', NULL),
(2, 2, 'Gudang Jakarta', 200, '2026-01-04', NULL),
(3, 3, 'Gudang Jakarta', 100, '2026-01-04', NULL),
(4, 4, 'Gudang Jakarta', 80, '2026-01-04', NULL),
(5, 5, 'Gudang Jakarta', 70, '2026-01-04', NULL),
(6, 6, 'Gudang Jakarta', 22, '2026-01-01', NULL),
(7, 6, 'Gudang Jakarta', 22, NULL, '2026-01-31'),
(8, 6, 'Gudang Jakarta', 16, '2026-02-15', NULL),
(9, 6, 'Gudang Jakarta', 26, NULL, '2026-02-20'),
(10, 6, 'Gudang Jakarta', 10, NULL, '2026-02-20'),
(11, 6, 'Gudang Jakarta', 6, NULL, '2026-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `Id` int NOT NULL,
  `Nama_produk` varchar(100) NOT NULL,
  `Kode_produk` varchar(20) NOT NULL,
  `Kategori` varchar(20) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `harga_satuan` decimal(15,2) NOT NULL,
  `stok_minimum` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`Id`, `Nama_produk`, `Kode_produk`, `Kategori`, `satuan`, `harga_satuan`, `stok_minimum`) VALUES
(1, 'TV LED 42', 'TV-001', 'Elektronik', 'Unit', 2500000.00, 5),
(2, 'Laptop Acer', 'LAP-002', 'Elektronik', 'Unit', 5000000.00, 5),
(3, 'Smartphone Samsung', 'PHO-003', 'Elektronik', 'Unit', 2000000.00, 5),
(4, 'Kulkas LG', 'REF-004', 'Elektronik', 'Unit', 3000000.00, 5),
(5, 'Mesin Cuci Panasonic', 'MES-005', 'Elektronik', 'Unit', 2200000.00, 5),
(6, 'Kertas HVS A4', 'KRT-006', 'ATK', 'Rim', 45000.00, 5);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `ID` int NOT NULL,
  `ID_produk` int NOT NULL,
  `Id_pemasok` int DEFAULT NULL,
  `Tanggal_transaksi` date NOT NULL,
  `Jenis_transaksi` enum('masuk','keluar') DEFAULT NULL,
  `Jumlah` int DEFAULT NULL,
  `Harga` decimal(15,2) DEFAULT NULL,
  `No_dokumen` varchar(50) DEFAULT NULL,
  `Uraian` varchar(100) DEFAULT NULL,
  `Keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`ID`, `ID_produk`, `Id_pemasok`, `Tanggal_transaksi`, `Jenis_transaksi`, `Jumlah`, `Harga`, `No_dokumen`, `Uraian`, `Keterangan`) VALUES
(1, 1, 2, '2026-01-04', 'masuk', 50, 2500000.00, NULL, NULL, NULL),
(2, 2, 2, '2026-01-04', 'masuk', 60, 5000000.00, NULL, NULL, NULL),
(3, 3, 1, '2026-01-04', 'masuk', 60, 2000000.00, NULL, NULL, NULL),
(4, 4, 1, '2026-01-04', 'masuk', 50, 3000000.00, NULL, NULL, NULL),
(5, 5, 1, '2026-01-04', 'masuk', 40, 2200000.00, NULL, NULL, NULL),
(6, 1, NULL, '2026-01-25', 'keluar', 30, 2500000.00, NULL, NULL, NULL),
(7, 2, NULL, '2026-01-26', 'keluar', 40, 5000000.00, NULL, NULL, NULL),
(8, 3, NULL, '2026-01-27', 'keluar', 50, 2000000.00, NULL, NULL, NULL),
(9, 4, NULL, '2026-01-28', 'keluar', 20, 3000000.00, NULL, NULL, NULL),
(10, 5, NULL, '2026-01-31', 'keluar', 30, 2200000.00, NULL, NULL, NULL),
(11, 6, NULL, '2026-01-01', NULL, NULL, 47520.00, NULL, 'saldo awal', NULL),
(12, 6, NULL, '2026-01-01', 'keluar', 6, 47520.00, 'Opname bulanan', 'Pemakaian bulan januari', NULL),
(13, 6, 1, '2026-02-15', 'masuk', 10, 45000.00, 'SPB Nomor 01/SPB-ATK/II/2026', 'Pengadaan', NULL),
(14, 6, NULL, '2026-02-20', 'keluar', 16, 47520.00, '01/SerahTerimaBarang/II', 'Pengambilan Bidang CDE', NULL),
(15, 6, NULL, '2026-02-20', 'keluar', 4, 45000.00, '01/SerahTerimaBarang/II', 'Pengambilan Bidang CDE', NULL),
(16, 6, NULL, '2026-12-31', 'keluar', 5, 45000.00, 'Opname Bulanan Desember (Akhir Tahun)', 'Pemakaian Bulan Desember', NULL);

-- --------------------------------------------------------

--
-- Structure for view `kartu_persediaan_barang`
--
DROP TABLE IF EXISTS `kartu_persediaan_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `kartu_persediaan_barang`  AS SELECT row_number() OVER (PARTITION BY `t`.`ID_produk` ORDER BY `t`.`Tanggal_transaksi`,`t`.`ID` ) AS `no`, `t`.`ID_produk` AS `id_produk`, `t`.`Tanggal_transaksi` AS `tanggal_transaksi`, `t`.`No_dokumen` AS `no_dokumen`, `t`.`Uraian` AS `uraian`, ifnull((case when (`t`.`Jenis_transaksi` = 'masuk') then `t`.`Jumlah` else 0 end),0) AS `masuk`, ifnull((case when (`t`.`Jenis_transaksi` = 'keluar') then `t`.`Jumlah` else 0 end),0) AS `keluar`, ifnull((ifnull((select ifnull(`p`.`jumlah`,0) from `persediaan` `p` where (`p`.`Id_produk` = `t`.`ID_produk`) limit 1),0) + sum((case when (`t`.`Jenis_transaksi` = 'masuk') then `t`.`Jumlah` when (`t`.`Jenis_transaksi` = 'keluar') then -(`t`.`Jumlah`) else 0 end)) OVER (PARTITION BY `t`.`ID_produk` ORDER BY `t`.`Tanggal_transaksi`,`t`.`ID` ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) ),0) AS `sisa_produk`, concat('Rp ',format(ifnull(`t`.`Harga`,0),0)) AS `harga`, concat('Rp ',format(ifnull((case when (`t`.`Jenis_transaksi` = 'masuk') then (`t`.`Jumlah` * `t`.`Harga`) else 0 end),0),0)) AS `bertambah`, concat('Rp ',format(ifnull((case when (`t`.`Jenis_transaksi` = 'keluar') then (`t`.`Jumlah` * `t`.`Harga`) else 0 end),0),0)) AS `berkurang`, concat('Rp ',format(ifnull(((ifnull((select ifnull(`p`.`jumlah`,0) from `persediaan` `p` where (`p`.`Id_produk` = `t`.`ID_produk`) limit 1),0) + sum((case when (`t`.`Jenis_transaksi` = 'masuk') then `t`.`Jumlah` when (`t`.`Jenis_transaksi` = 'keluar') then -(`t`.`Jumlah`) else 0 end)) OVER (PARTITION BY `t`.`ID_produk` ORDER BY `t`.`Tanggal_transaksi`,`t`.`ID` ) ) * ifnull(`t`.`Harga`,0)),0),0)) AS `sisa_rupiah`, `t`.`Keterangan` AS `ket` FROM `transaksi` AS `t` ;

-- --------------------------------------------------------

--
-- Structure for view `laporanstokgudang`
--
DROP TABLE IF EXISTS `laporanstokgudang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `laporanstokgudang`  AS SELECT `p`.`Id` AS `No`, `p`.`Nama_produk` AS `Nama Produk`, `p`.`Kode_produk` AS `Kode Produk`, max(`ps`.`jumlah`) AS `Jumlah Awal Bulan (Unit)`, ifnull(sum((case when ((`t`.`Jenis_transaksi` = 'masuk') and (month(`t`.`Tanggal_transaksi`) = 1)) then `t`.`Jumlah` else 0 end)),0) AS `Pemasukan (Unit)`, ifnull(sum((case when ((`t`.`Jenis_transaksi` = 'keluar') and (month(`t`.`Tanggal_transaksi`) = 1)) then `t`.`Jumlah` else 0 end)),0) AS `Pengeluaran (Unit)`, ((max(`ps`.`jumlah`) + ifnull(sum((case when ((`t`.`Jenis_transaksi` = 'masuk') and (month(`t`.`Tanggal_transaksi`) = 1)) then `t`.`Jumlah` else 0 end)),0)) - ifnull(sum((case when ((`t`.`Jenis_transaksi` = 'keluar') and (month(`t`.`Tanggal_transaksi`) = 1)) then `t`.`Jumlah` else 0 end)),0)) AS `Jumlah Akhir Bulan (Unit)`, concat('Rp ',format(`p`.`harga_satuan`,0)) AS `Harga Satuan (Rp)`, concat('Rp ',format((((max(`ps`.`jumlah`) + ifnull(sum((case when ((`t`.`Jenis_transaksi` = 'masuk') and (month(`t`.`Tanggal_transaksi`) = 1)) then `t`.`Jumlah` else 0 end)),0)) - ifnull(sum((case when ((`t`.`Jenis_transaksi` = 'keluar') and (month(`t`.`Tanggal_transaksi`) = 1)) then `t`.`Jumlah` else 0 end)),0)) * `p`.`harga_satuan`),0)) AS `Nilai Stok Akhir (Rp)` FROM ((`produk` `p` join `persediaan` `ps` on((`p`.`Id` = `ps`.`Id_produk`))) left join `transaksi` `t` on((`p`.`Id` = `t`.`ID_produk`))) WHERE (`p`.`satuan` = 'unit') GROUP BY `p`.`Id`, `p`.`Nama_produk`, `p`.`Kode_produk`, `p`.`harga_satuan` ORDER BY `p`.`Id` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pemasok`
--
ALTER TABLE `pemasok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `persediaan`
--
ALTER TABLE `persediaan`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Id_produk` (`Id_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_produk` (`ID_produk`),
  ADD KEY `Id_pemasok` (`Id_pemasok`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pemasok`
--
ALTER TABLE `pemasok`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `persediaan`
--
ALTER TABLE `persediaan`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `persediaan`
--
ALTER TABLE `persediaan`
  ADD CONSTRAINT `persediaan_ibfk_1` FOREIGN KEY (`Id_produk`) REFERENCES `produk` (`Id`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`ID_produk`) REFERENCES `produk` (`Id`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`Id_pemasok`) REFERENCES `pemasok` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
