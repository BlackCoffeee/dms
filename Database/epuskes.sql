-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Agu 2021 pada 08.45
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `epuskes`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `covid`
--

CREATE TABLE `covid` (
  `idCovid` varchar(20) NOT NULL,
  `idPasien` varchar(20) NOT NULL,
  `tanggalLapor` date NOT NULL,
  `keluhan` text NOT NULL,
  `statusPemeriksaan` int(11) NOT NULL,
  `pcr` int(11) NOT NULL,
  `pesan` text NOT NULL,
  `tanggalPcr` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `covid`
--

INSERT INTO `covid` (`idCovid`, `idPasien`, `tanggalLapor`, `keluhan`, `statusPemeriksaan`, `pcr`, `pesan`, `tanggalPcr`) VALUES
('6114ea1e545ce', '60f96c18e805e', '2021-08-12', 'Demam', 5, 3, 'Silahkan TEST di Puskesmas', '2021-08-13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `covid_negative`
--

CREATE TABLE `covid_negative` (
  `idNegative` int(11) NOT NULL,
  `idCovid` varchar(20) NOT NULL,
  `ns` varchar(3) NOT NULL,
  `br` varchar(8) NOT NULL,
  `ts` int(4) NOT NULL,
  `tanggalNegative` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `covid_negative`
--

INSERT INTO `covid_negative` (`idNegative`, `idCovid`, `ns`, `br`, `ts`, `tanggalNegative`) VALUES
(2, '6114ea1e545ce', '001', 'VIII', 2021, '2021-08-13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `covid_positive`
--

CREATE TABLE `covid_positive` (
  `idPositive` int(11) NOT NULL,
  `idCovid` varchar(20) NOT NULL,
  `ns` varchar(3) NOT NULL,
  `br` varchar(8) NOT NULL,
  `ts` int(4) NOT NULL,
  `sampaiTanggal` date NOT NULL,
  `statusPositive` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `covid_positive`
--

INSERT INTO `covid_positive` (`idPositive`, `idCovid`, `ns`, `br`, `ts`, `sampaiTanggal`, `statusPositive`) VALUES
(1, '6114ea1e545ce', '001', 'VIII', 2021, '2021-08-27', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `covid_screening`
--

CREATE TABLE `covid_screening` (
  `idScreening` varchar(20) NOT NULL,
  `idCovid` varchar(20) NOT NULL,
  `tanggalScreening` date NOT NULL,
  `kontak` int(11) NOT NULL,
  `berkunjung` int(11) NOT NULL,
  `demam` int(11) NOT NULL,
  `batuk` int(11) NOT NULL,
  `pilek` int(11) NOT NULL,
  `sesak` int(11) NOT NULL,
  `diare` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `covid_screening`
--

INSERT INTO `covid_screening` (`idScreening`, `idCovid`, `tanggalScreening`, `kontak`, `berkunjung`, `demam`, `batuk`, `pilek`, `sesak`, `diare`) VALUES
('6114eb0202b2c', '6114ea1e545ce', '2021-08-12', 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `gigi`
--

CREATE TABLE `gigi` (
  `idGigi` varchar(20) NOT NULL,
  `noSurat` varchar(3) NOT NULL,
  `idPasien` varchar(20) NOT NULL,
  `idNakes` varchar(20) NOT NULL,
  `keluhan` varchar(50) NOT NULL,
  `nomerAntrian` int(11) NOT NULL,
  `diagnosis` text NOT NULL,
  `pesanDokter` text NOT NULL,
  `tanggalPeriksa` date NOT NULL,
  `tahun` int(11) NOT NULL,
  `biaya` int(11) NOT NULL,
  `statusBiaya` int(11) NOT NULL,
  `bulan` varchar(8) NOT NULL,
  `statusPemeriksaan` int(11) NOT NULL,
  `statusObat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `gigi`
--

INSERT INTO `gigi` (`idGigi`, `noSurat`, `idPasien`, `idNakes`, `keluhan`, `nomerAntrian`, `diagnosis`, `pesanDokter`, `tanggalPeriksa`, `tahun`, `biaya`, `statusBiaya`, `bulan`, `statusPemeriksaan`, `statusObat`) VALUES
('61161037615a3', '001', '60f96c18e805e', '60f8270b38855', 'Sakit gigi', 1, 'lorem', 'lorem', '2021-08-13', 2021, 100000, 0, 'VIII', 2, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `nakes`
--

CREATE TABLE `nakes` (
  `idNakes` varchar(20) NOT NULL,
  `namaNakes` varchar(50) NOT NULL,
  `id` varchar(20) NOT NULL,
  `tempatLahir` varchar(50) NOT NULL,
  `tanggalLahir` date NOT NULL,
  `jk` int(11) NOT NULL,
  `job` int(1) NOT NULL,
  `noWa` varchar(16) NOT NULL,
  `isActive` int(1) NOT NULL,
  `roleId` int(1) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `dateCreated` int(11) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `nakes`
--

INSERT INTO `nakes` (`idNakes`, `namaNakes`, `id`, `tempatLahir`, `tanggalLahir`, `jk`, `job`, `noWa`, `isActive`, `roleId`, `username`, `password`, `dateCreated`, `foto`) VALUES
('60f8270b38855', 'Dini Rahmayani', '0923492', 'Bandung', '2021-07-21', 2, 5, '081354060005', 1, 5, 'ambhue', '$2y$10$8K/PZ9ZYgM2pdO7WlUHl..OdjW9hHDWiPiNwRrC/xby7EaKmQM41G', 1626875659, ''),
('6116145714ee7', 'Sri Rahmawati', '', 'Bandung', '2021-04-08', 2, 8, '081354060005', 1, 8, 'sri', '$2y$10$O1DnbrERJyhiMtiPlMzqpOiP7wVOkrJJFEtkrtgzlsR1IR9oLnihu', 1628836951, '55885cd86e82e0b433da1a27c104e6404.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `obat`
--

CREATE TABLE `obat` (
  `idObat` int(11) NOT NULL,
  `namaObat` varchar(70) NOT NULL,
  `namaGenerik` varchar(254) NOT NULL,
  `kekuatan` varchar(20) NOT NULL,
  `bentuk` varchar(20) NOT NULL,
  `jenis` varchar(20) NOT NULL,
  `generik` varchar(20) NOT NULL,
  `fornas` varchar(20) NOT NULL,
  `hargaSatuan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `obat`
--

INSERT INTO `obat` (`idObat`, `namaObat`, `namaGenerik`, `kekuatan`, `bentuk`, `jenis`, `generik`, `fornas`, `hargaSatuan`) VALUES
(1, 'Abacavir 300 mg tab', 'Abacavir', '300 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '8250'),
(2, 'ABILIFY DISCMELT 10 MG TAB', 'Aripiperazol ', '10 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '51594'),
(3, 'ACARBOSE TABLET 100 MG TAB', 'Akarbose ', '100 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '2102.98'),
(4, 'ACARBOSE TABLET 50 MG', 'Akarbose ', '50 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1304.38'),
(5, 'ACETYLCYSTEINE CAP', 'N-asetil sistein', '200 mg', 'Kapsul', 'Oral', 'Generik', 'Fornas', '1100'),
(6, 'ACETYLCYSTEINE INJ', 'N-asetil sistein', '200 mg/ml', 'Injeksi', 'Parentheral', 'Generik', 'Non Fornas', '199000'),
(7, 'Actemra 400 mg /20 ml Inj', 'Tocilizumab', '400 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '9885321.6'),
(8, 'Actilyse 50 mg inj', 'Actilyse', '50 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '4249999'),
(9, 'ACYCLOVIR 200 MG TAB', 'Asiklovir ', '200 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '485.23'),
(10, 'ACYCLOVIR 400 MG TAB', 'Asiklovir ', '400 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '832'),
(11, 'ACYCLOVIR CR', 'Asiklovir ', '3%', 'Salep Kulit', 'Others', 'Generik', 'Fornas', '4000'),
(12, 'ADALAT OROS 30 TAB', 'Nifedipin', '30 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '3948'),
(13, 'Adona AC  5 cc injeksi', 'Carbazochrome Na sulfonate', '10 mg/2 ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '16016'),
(14, 'Adona AC 10 cc injeksi', 'Carbazochrome Na sulfonate', '25 mg/5 ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '22880'),
(15, 'Adona AC 17 tablet ', 'Carbazochrome Na sulfonate', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '2217.6'),
(16, 'AHFC Sachet', 'Ekstrak Radix Astragalus membranaceus (Huangqi) 300 mg', '-', 'Serbuk', 'Oral', 'Non Generik', 'Non Fornas', '14666.63'),
(17, 'ALGANAX 0,5 MG TAB', 'Alprazolam', '0.5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '6154'),
(18, 'Alimta 500 mg Inj', 'Premetrexed', '500 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '2823500'),
(19, 'ALINAMIN TAB 5 mg', 'Fursultiamin, vit B2', '5 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '1320'),
(20, 'Alkeran 2 mg tab', 'Leukeran', '2 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '12130.01'),
(21, 'Alletrol Comp TTM', 'Dexamethasone 1 mg, Neomycin Sulphate 3.5 mg, Polymixin B Sulphate 6000 UI', '-', 'Tetes Mata', 'Others', 'Non Generik', 'Non Fornas', '15796'),
(22, 'ALLORIS SYR', 'Loratadin', '10 mg', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '57860'),
(23, 'ALLUPURINOL 100 MG TAB', 'Alopurinol', '100 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '199'),
(24, 'ALLUPURINOL 300 MG TAB', 'Alopurinol', '300 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '462'),
(25, 'Aloclair Gel', 'Aloe Vera, Sodium Hyaluronate, Glycyrhettinic Acid, Polyvinylpyrrolidone (PVP)', '-', 'Gel', 'Others', 'Non Generik', 'Non Fornas', '105999.3'),
(26, 'ALPENTIN 100 MG TAB', 'Gabapentin', '100 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1495'),
(27, 'Alpentin 300 mg kapsul', 'Gabapentin', '300 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '1639'),
(28, 'Alprazolam 0.5 mg tab', 'Alprazolam', '0.5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '731.25'),
(29, 'ALPRAZOLAM 1 MG TAB', 'Alprazolam', '1 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '128'),
(30, 'ALPRAZOLAM TAB. 0,5 MG', 'Alprazolam', '5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '731'),
(31, 'Aluvia tab', 'Lopinavir, ritonavir', '200 mg/50 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '0'),
(32, 'AMBROXOL TAB', 'Ambroxol', '30 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '330'),
(33, 'AMBROXOL 15 MG / 5 ML SYR', 'Ambroxol', '15 mg/5 ml', 'Syrup', 'Oral', 'Generik', 'Fornas', '5011.6'),
(34, 'Amikacin 250 mg inj', 'Amikasin', '250 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '95832'),
(35, 'AMIKACIN 500 MG INJ', 'Amikasin', '500 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '35349.6'),
(36, 'Aminefron kaplet', 'Alpha-keto Isoleucine Ca salt 67 mg, Alpha-keto Leucine Ca salt 101 mg, Alpha-keto Phenylalanine Ca salt 68 mg, dll', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '7150'),
(37, 'AMINOFLUID INF', 'Larutan mengandung Asam Amino (Asam Amino 30 g, Glukosa 7,3 % dan elektrolit) 1000 ml', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '70189'),
(38, 'AMINOFUSIN HEPAR INF', 'Larutan mengandung Asam Amino (Asam Amino 72.05 g, Total N 11.53 g, AAE/AANE ratio 2.6, Na+ 2 mEq, Asetat 46 mEq)', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '88499.4'),
(39, 'Aminofusin Paed 250 ml Infus', 'Asam Amino 50 g, vitamin dan elektrolit.', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '56999.8'),
(40, 'AMINOLEBAN INFUS', 'Larutan mengandung Asam Amino (Asam amino 8%) : Aminosteril N-Hepa', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '187000'),
(41, 'AMINOPHYLLIN INJ', 'Aminofilin', '240 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '3959.93'),
(42, 'Aminosteril Infant 6 % 100 ml INF', '10% Asam Amino dan TaurineÂ ', '6%', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '51216'),
(43, 'AMIODARONE INJ', 'Amiodaron ', '50 mg/ml', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '8700.08'),
(44, 'AMITRIPTILIN 25 MG TAB', 'Amitriptilin', '25 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '187'),
(45, 'AMLODIPINE 10 MG TAB', 'Amlodipin', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '250'),
(46, 'AMLODIPINE 5 MG TAB', 'Amlodipin', '5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '150'),
(47, 'AMOXAN 500 CAP', 'Amoksisilin', '500 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '3410'),
(48, 'AMOXAN DROP', 'Amoksisilin', '100 mg/ml', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '24640'),
(49, 'AMOXAN SYR', 'Amoksisilin', '125 mg/5 ml', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '24750'),
(50, 'AMOXYCILLIN 125 MG / 5 ML SYR', 'Amoksisilin', '125 mg/5 ml', 'Syrup', 'Oral', 'Generik', 'Fornas', '7399.7'),
(51, 'AMOXYCILLIN 500 MG TAB', 'Amoksisilin', '500 mg', 'Kapsul', 'Oral', 'Generik', 'Fornas', '406.67'),
(52, 'AMPICCILLIN 1000 INJ', 'Ampisilin ', '1000 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '9500'),
(53, 'ANALSIK TAB', 'Metampiron, diazepam', '500 mg-2 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '1677.5'),
(54, 'ANALTRAM KAPS', 'paracetamol, tramadol', '-', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '11999.97'),
(55, 'ANEMOLAT TAB', 'Asam folat', '1 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '204.17'),
(56, 'ANTASIDA TAB', 'Antasida, kombinasi : aluminium hidroksida  + magnesium hidroksida ', '-', 'Tablet', 'Oral', 'Generik', 'Fornas', '211'),
(57, 'ANTRAIN INJ', 'Metamizol', '500 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '9900'),
(58, 'APIALYST DROP', 'Vit A,B1,B2,B6, B12, C, D, NICOTINAMID, LYSINE, PANTHENOL, L-ASAM GLUTAMAT', '-', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '55000'),
(59, 'APIDRA SOLOSTAR.', 'Analog insulin : fast acting', '-', 'Flexpen', 'Parentheral', 'Non Generik', 'Fornas', '87080'),
(60, 'APTOR TAB', 'Asam Asetilsalisilat ', '80 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '330'),
(61, 'Aquadest 1 liter Wida', 'Aquabidest', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '19.8'),
(62, 'Aquadest 25 cc Inj', 'Aquabidest', '-', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '2860'),
(63, 'Arava 20 mg tab', 'Leflunomide', '20 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '23321.98'),
(64, 'ARCOXIA 90 MG TAB', 'Etoricoxib', '90 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '17105'),
(65, 'ARDIUM TABLET', 'Diosmin, Hesperidin', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '8470'),
(66, 'ARICEPT 5 MG TAB', 'Donepezil', '5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '25345'),
(67, 'Aricept Evess 10 mg tab', 'Donepezil', '10 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '12485'),
(68, 'ARIMIDEX 1 MG TAB', 'Anastrozol', '1 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '7300'),
(69, 'ARIXTRA 2,5MG INJ', 'Fondaparinuks ', '5 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '273799.9'),
(70, 'AROMASIN 25 MG TAB', 'Eksemestan', '25 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '42999.99'),
(71, 'As.Tranex 500 tab (Nutranex)', 'Asam traneksamat ', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1800'),
(72, 'Asam Mefenamat 500 mg tab', 'Asam mefenamat', '500 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '250'),
(73, 'ASAM TRANEXSAMAT 500 MGTAB', 'Asam traneksamat ', '500 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1800'),
(74, 'ASAM TRANEXSAMAT INJ 250 MG', 'Asam traneksamat ', '250 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '6600'),
(75, 'ASAM TRANEXSAMAT INJ 500 MG', 'Asam traneksamat ', '500 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '6352.5'),
(76, 'ASAM VALPROAT 250 MG/5 ML SYR', 'Valproat Na', '250 mg/5 ml ', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '50820'),
(77, 'ASERING INFUS', 'Larutan mengandung Elektrolit (Na 130 mEq, Cl 109 mEq, Ca 3 mEq, Asetat 28 mEq)', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '9645.9'),
(78, 'ASPAR K TAB', 'Kalium aspartat', '300 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '2721.29'),
(79, 'ASPILET 80 MG TAB', 'Asam Asetilsalisilat ', '80 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '533.83'),
(80, 'Asta plus kap', 'Astaxanthin 4 mg, selenium 15 mcg', '-', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '11700'),
(81, 'Ataroc 25 mg tab', 'Prokaterol', '25 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '2365'),
(82, 'Ataroc syr', 'Prokaterol', '25 mg/5 ml', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '51150'),
(83, 'Atevir 0.5 mg tab.', 'Entekavir', '0.5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '40700'),
(84, 'Atorvastatin 20 mg tab', 'Atorvastatin', '20 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '3520'),
(85, 'ATORVASTATIN TAB', 'Atorvastatin', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1155'),
(86, 'Atracurium Besilat 25 mg/2 ml inj', 'Atracurium Besilat', '25 mg/2 ml', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '19800'),
(87, 'Atripla tab', 'Efavirenz, emtricitabine, dan tenofovir disoproxil fumarate.', '-', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '0'),
(88, 'AVAMYS NASAL SPRAY', 'Flutikason furoat', '27.5 mcg', 'Nasal Spray', 'Others', 'Non Generik', 'Fornas', '112476.1'),
(89, 'AVODART 0,5 MG CAP', 'Dutasterid', '5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '4935'),
(90, 'Azithromycin 200Mg/5ml Syr', 'Azithromycin', '200 mg/5 ml', 'Syrup', 'Oral', 'Generik', 'Fornas', '26535'),
(91, 'Azithromycin 500 mg inj', 'Azithromycin', '500 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '143000'),
(92, 'AZITHROMYCIN SIRUP KERING 200MG/5ML', 'Azitromisin', '200 mg/5ml', 'Syrup', 'Oral', 'Generik', 'Fornas', '26352.7'),
(93, 'AZYTRHOMYCIN 500MG TAB', 'Azitromisin', '500 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '4613.02'),
(94, 'Bactesyn 0.75 gr Inj', 'Ampisilin  + Sulbaktam', '750 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '51702.2'),
(95, 'BAMGETOL 200 MG TAB', 'Karbamazepin', '200 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '2112'),
(96, 'BAQUINOR F 500 MG TAB', 'Siprofloksasin', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '14927'),
(97, 'Becom C tab ', 'Vitamin B1 50 mg, B2 25 mg, 10 mg, B12 5 mcg, C 500 mg, nicotinamide 100 mg, Ca pantothenate 18.4 mg', '-', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1732.5'),
(98, 'Becom-Zet  kaplet', 'Vit E 30 iu, C 750 mg, B1 15 mg, B2 15 mg, B6 20 mg, B12 12 mcg, folic acid 400 mcg, pantothenic acid 20 mg, Zn 22.5 mg, niacin 100 mg', '-', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '2310'),
(99, 'BEDAK SALICYL 100 GR', 'Asam salisilat', '2%', 'Bedak', 'Others', 'Generik', 'Fornas', '6426.2'),
(100, 'BEDAK SALICYL 2% 60 GR', 'Asam salisilat', '2%', 'Bedak', 'Others', 'Generik', 'Fornas', '6426'),
(101, 'Benzatin Benzil P 1.2 juta IU inj', 'Benzatin Benzil P 1.2 juta IU inj', '1.2 juta', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '14712.5'),
(102, 'BEROTEC SPRAY 100 MG', 'Fenoterol', '100 mg', 'Spray', 'Others', 'Non Generik', 'Fornas', '83189.7'),
(103, 'BETABLOK 50 MG TAB', 'Atenolol', '50 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1467'),
(104, 'BETADINE OBAT KUMUR 100 ML', 'Povidon iodin', '2%', 'Obat kumur', 'Others', 'Non Generik', 'Fornas', '15785'),
(105, 'BETADINE OBAT KUMUR 190 ML', 'Povidon iodin', '2%', 'Obat kumur', 'Others', 'Non Generik', 'Fornas', '25800'),
(106, 'Betadine Sol. 30 ml', 'Povidon iodin', '10%', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '19085'),
(107, 'Betadine Sol. 60 ml', 'Povidon iodin', '10%', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '30850'),
(108, 'BETAHISTIN 6 MG TAB', 'Betahistin', '6 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '380'),
(109, 'BETAMETASON 0,1% CR', 'Betametason', '1%', 'Salep Kulit', 'Others', 'Generik', 'Fornas', '2438.7'),
(110, 'BFLUID 500 ML INFUS', 'Asam amino, glukosa, elektrolit, vit B1', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '76300.4'),
(111, 'Binecap tab', 'Kapesitabin', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '18032.96'),
(112, 'BIO PLACENTON JELL 15 GR', 'Placenta extrac, Neomycin sulat', '-', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '22000'),
(113, 'BioCurkem tab', 'Curcuma longa rhizoma dll', '-', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '11733.33'),
(114, 'BISOLVON INJ', 'Bromheksin', '4 mg/2 ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '61145.7'),
(115, 'BISOPROLOL 5 Mg tab', 'Bisoprolol ', '5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '398.99'),
(116, 'BLEDSTOP TAB', 'Metilergometrin', '0.125 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '594'),
(117, 'Bleocin 15 mg inj', 'Bleomicin', '15 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '382874.8'),
(118, 'Bonevell inj', 'Asam Ibandronat', '500 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '580250'),
(119, 'Brainact 250 mg / 2 ml  Inj', 'Citikolin', '250 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '47300'),
(120, 'BRAINACT 500 INJ', 'Citikolin', '500 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '77000'),
(121, 'BRAINACT 500 TABLET', 'Citikolin', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '13750'),
(122, 'BRAINACT INJ 250 MG', 'Citikolin', '250 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '47300'),
(123, 'BRAXIDIN TAB', 'Klordiazepoksid, clidinium', '5 mg-2.5 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '1221'),
(124, 'BREATHY NASAL SPRAY (BNS)', 'NaCl ', '-', 'Spray', 'Others', 'Non Generik', 'Fornas', '69999.6'),
(125, 'Brexel 20 mg inj', 'Docetexel', '20 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '191400'),
(126, 'Brexel 80 mg inj', 'Docetexel', '80 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '986700'),
(127, 'BRICASMA 5 ML INJ', 'Terbutalin ', '0.5 mg/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '16545.32'),
(128, 'BRICASMA RESP 2,5 mg', 'Bromheksin', '2.5 mg', 'Nebules', 'Others', 'Non Generik', 'Fornas', '7700'),
(129, 'BRILINTA 90 MG TAB', 'Tikagrelor', '90 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '8350'),
(130, 'BURNAZIN CREAM 35 GR', 'Perak sulfadiazin', '10 mg/g', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '61792.5'),
(131, 'BUSCOPAN 10 MG TAB', 'Hiosin N butilbromida', '10 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '3435.62'),
(132, 'BUSCOPAN INJ', 'Hiosin N butilbromida', '10 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '35909.5'),
(133, 'BUSCOPAN PLUS TAB.', 'Hiosin N butilbromida + parasetamol', '10 mg-500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '4443.45'),
(134, 'CA.GLUCONAS INJ', 'Kalsium glukonat', '100 mg/ml', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '10351'),
(135, 'CAL - 95 TAB', 'Coral Ca, Natural soy isoflavon,  Vit D3, Vit K1, Zn, boron', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '5720'),
(136, 'Caladin Lotion 95 ml', 'Calamine 5 %, Zinc Oxide 10 %, Diphenhydramine HCl 2 %', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '22000'),
(137, 'CALCI LACTAS', 'Kalsium laktat ', '500 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '187'),
(138, 'Calcium Folinate inj', 'Calcium Folinate', '50 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '47088'),
(139, 'Calnic plus syr', 'Kalsium, Vitamin D', '-', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '91000'),
(140, 'Calnic Plus tab', 'Kalsium, Vitamin D', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '3025'),
(141, 'CALOS TAB', 'Kalsium karbonat ', '500 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '880'),
(142, 'Campto 100 mg 5ml inj', 'Irinotekan', '100 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '715500.5'),
(143, 'Campto 40 mg 2 ml inj', 'Irinotekan', '40 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '396077'),
(144, 'Canderin 8 mg tab', 'Kandesartan', '8 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '9000'),
(145, 'Candesartan 16 mg tab', 'Candesartan', '16 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1200'),
(146, 'Candesartan 8 mg tab', 'Kandesartan', '8 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '700'),
(147, 'CAPTOPRIL 12,5 MG TAB', 'Kaptopril', '12.5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '145.99'),
(148, 'CAPTOPRIL 25 MG TAB', 'Kaptopril', '25 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '225.94'),
(149, 'CARBAMAZEPIN 200 MG TAB', 'Karbamazepin', '200 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '250'),
(150, 'Carboplatin 150 mg / 15 ml inj', 'Carboplatin', '150 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '131000'),
(151, 'Carboplatin 450 mg inj / 45 ml inj', 'Carboplatin', '450 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '304200'),
(152, 'Cardio Aspirin tab', 'Asam asetilsalisilat (asetosal) ', '80 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1274.17'),
(153, 'Car-Q 100 mg tab', 'Co-enzyme Q10 dan L-carnitine fumarat', '100 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '12000'),
(154, 'Cartylo 80 mg tab', 'Asam salisilat', '80 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '380'),
(155, 'Casodex 150 mg tab', 'Bikalutamid', '150 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '45800'),
(156, 'CATAFLAM TAB 50 MG TAB', 'Natrium Diklofenak', '50 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '6242.9'),
(157, 'Cathejell 12,5 G Syringe', 'Lidokain', '-', 'Salep Kulit', 'Others', 'Non Generik', 'Non Fornas', '43679.9'),
(158, 'Cedantron 8 mg / 4 ml injeksi', 'Ondansetron', '8 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '66000'),
(159, 'CEFADROXIL 125 MG SYR', 'Sefadroksil ', '125 mg/5 ml', 'Kapsul', 'Oral', 'Generik', 'Fornas', '9839.5'),
(160, 'CEFADROXIL 500 MG TAB', 'Sefadroksil ', '500 mg', 'Kapsul', 'Oral', 'Generik', 'Fornas', '1210'),
(161, 'Cefazolin 1 g inj', 'Cefazolin', '1 g', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '21580'),
(162, 'Cefepime 1 g inj', 'Cefepime', '1 g', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '25025'),
(163, 'CEFIXIM 100 CAP', 'Sefiksim', '100 mg', 'Kapsul', 'Oral', 'Generik', 'Fornas', '1430'),
(164, 'Cefixim 200 mg caps', 'Cefixim', '200 mg', 'Kapsul', 'Oral', 'Generik', 'Fornas', '4033.33'),
(165, 'CEFIXIM DRY SYR 100 MG/30 ML', 'Sefiksim', '100 mg/5 ml', 'Syrup', 'Oral', 'Generik', 'Fornas', '18000'),
(166, 'CEFOBACTAM INJ', 'Cefoperazon/Sulbactam', '500 mg-500 mg', 'Injeksi', 'Parentheral', 'Generik', 'Non Fornas', '221265'),
(167, 'CEFOPERAZONE INJ', 'Sefoperazon', '1 g', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '60500'),
(168, 'Cefoperazone Sulbactam 1 g inj', 'Cefoperazone Sulbactam', '1 g', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '121000'),
(169, 'CEFOTAXIM I G INJ', 'Sefotaksim', '1 g', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '9636'),
(170, 'CEFPIROM INJ', 'Cefpirom', '1 g', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '92000'),
(171, 'Cefspan 200 mg tab', 'Sefiksim', '200 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '38500'),
(172, 'CEFSPAN SYRUP', 'Sefiksim', '100 mg/5 ml', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '136199.8'),
(173, 'CEFSPAN TAB 100 MG', 'Sefiksim', '100 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '24200'),
(174, 'CEFTAZIDIME 1 G INJ', 'Seftazidim', '1 g', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '37620'),
(175, 'CEFTRIAXON I G INJ', 'Seftriakson', '1 g', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '11000'),
(176, 'CEFTRIMAX INJ', 'Seftriakson', '1 g', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '231000'),
(177, 'CEFUROXIME INJ', 'Cefuroxime', '750 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '29975'),
(178, 'CELEBREX 100 MG TAB', 'Celecoxib', '100 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '11330'),
(179, 'Cellcept 500 mg tab', 'Mycophenolate mofetil', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '17750'),
(180, 'CENDO CARPINE 1 % FL 5CC', 'Pilokarpin ', '1%', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '17050'),
(181, 'CENDO CARPINE 2% 5 CC', 'Pilokarpin ', '2%', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '20900'),
(182, 'CENDO CATARLENT 5 CC FL', 'CaCl, KI, Na tiosulfat, feilmerkuri nitrat', '-', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '24887.5'),
(183, 'CENDO EFRISEL 10 % ED MD', 'Fenilefrin', '10%', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '16775'),
(184, 'CENDO FLOXA ED MD', 'Ofloksasin', '3 mg/0.6 ml', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '33577.5'),
(185, 'CENDO GENTA FL 0,3 % 5 CC', 'Gentamisin', '0.3%', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '31212.5'),
(186, 'CENDO GENTAMYCIN ED MD 0,3 %', 'Gentamisin', '0.03%', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '31212.5'),
(187, 'CENDO GENTAMYCIN EO 3,5 GR', 'Gentamisin', '0.3%', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '40012.5'),
(188, 'CENDO HERVIS EO', 'Asiklovir ', '500 mg/5 ml', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '40425'),
(189, 'CENDO HOMATRO 2% ED FL 5 CC', 'Homatropin', '2%', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '39050'),
(190, 'CENDO LFX ED MD', 'Levofloksasin', '5 mg/ml', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '15180'),
(191, 'CENDO LYTEERS FL 15 CC', 'NaCl, KCl, benzalkonium klorid', '-', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '25850'),
(192, 'CENDO MYDRIATYL 0,5 % FL 5 CC', 'Tropikamid', '0.5%', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '31763'),
(193, 'CENDO NATACEN FL 5CC', 'Natamisin', '5%', 'SM', 'Others', 'Non Generik', 'Non Fornas', '9158'),
(194, 'CENDO TIMOL 0,5 % ED MD', 'Timolol ', '5%', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '52526'),
(195, 'CENDO TROPIN 0,5 % FL 5 CC', 'Atropin', '0.5%', 'Tetes Mata', 'Others', 'Generik', 'Fornas', '12375'),
(196, 'CENDO TROPIN 0,5% ED MD', 'Atropin', '5%', 'Infus', 'Parentheral', 'Generik', 'Fornas', '12375'),
(197, 'CENDO VASACON A FL 15 CC', 'Antazolina PO4, nafazolina HCl, fenilraksa II asetat, asam borat', '-', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '24612.5'),
(198, 'CENDO VASACON A MD', 'Antazolina PO4, nafazolina HCl, fenilraksa II asetat, asam borat', '0.05%', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '17875'),
(199, 'CENDO XITROL ED FL 5 CC', 'Neomisin, polimiksin, deksametason', '-', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '29975'),
(200, 'Cepezet 100 mg tab', 'Klorpromazin', '100 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '495'),
(201, 'CEPEZET INJ (MERSI)', 'Klorpromazin', '5 mg/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '12100'),
(202, 'CERNEVIT INJ.', 'Vit A,D3, E, C, B3, B5, B6, B12, asam folat, asam pantotenat, nikotinamid, glisin, glycocol acid, lesitin', '-', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '236500'),
(203, 'CETADOP 200 MG INJEKSI', 'Dopamin', '200 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '40260'),
(204, 'CETIRIZINE DROP', 'Setirizin', '5 mg/ml', 'Syrup', 'Oral', 'Generik', 'Fornas', '27500'),
(205, 'CETIRIZINE SYR 5MG/5ML', 'Setirizin', '5 mg/ml', 'Syrup', 'Oral', 'Generik', 'Fornas', '3061.3'),
(206, 'CETIRIZINE TAB', 'Setirizin', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '104.01'),
(207, 'Chana kapsul', 'Ekstrak Channa striata 500 mg', '-', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '6655'),
(208, 'CHLORAMPHENICOL SM', 'Kloramfenikol ', '1%', 'Salep Mata', 'Others', 'Generik', 'Fornas', '1925'),
(209, 'Cilostazol 100 mg tab', 'Cilostazol', '100 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '7350'),
(210, 'CIPROFLOXACIN INFUS', 'Siprofloksasin', '200 mg/100 ml', 'Infus', 'Parentheral', 'Generik', 'Fornas', '25000'),
(211, 'CIPROFLOXASIN 500 MG TAB', 'Siprofloksasin', '500 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1723'),
(212, 'Cisplatin 10 mg inj', 'Cisplatin', '10 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '23650'),
(213, 'Cisplatin 50 mg Inj', 'Cisplatin', '50 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '103000'),
(214, 'Citicoline 500 mg inj', 'Citikolin', '500 mg', 'Injeksi', 'Parentheral', 'Generik', 'Non Fornas', '27500'),
(215, 'CITICOLINE INJ 250MG/2ML', 'Citikolin', '500 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '27500'),
(216, 'CITICOLINE TABLET 500MG', 'Citikolin', '500 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '8999.98'),
(217, 'Citra Lock 4% 5ml', 'Trisodium Sitrat', '4%', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '31999.99'),
(218, 'CLANEKSI 500 MG TAB', 'Amoksisilin-clavulanat', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '17000'),
(219, 'CLANEKSI SYR', 'Amoksisilin-clavulanat', '125 mg/5 ml', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '58300'),
(220, 'CLINDAMICIN 150 MG TAB', 'Klindamisin', '150 mg', 'Kapsul', 'Oral', 'Generik', 'Fornas', '982.3'),
(221, 'CLINDAMYCIN 300 MG TAB', 'Klindamisin', '300 mg', 'Kapsul', 'Oral', 'Generik', 'Fornas', '1375.44'),
(222, 'CLINIMIX INFUS 1 L', 'Larutan mengandung Karbohidrat + Elektrolit (Asam amino 28 gr/L, Glukosa 100 gr/L, elektrolit)', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '259999.3'),
(223, 'CLINOLEIC 20% INFUS 250 ML', 'Larutan mengandung Lipid (Infus Lipid Emulsi MCT/LCT 20%) ', '250 ml', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '169125'),
(224, 'CLOBAZAM TAB 10 MG TAB', 'Klobazam', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1175.63'),
(225, 'Clonazepam 2 mg tab ', 'Clonazepam', '2 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '5271'),
(226, 'CLONIDINE TAB', 'Klonidin', '0.15 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '223.99'),
(227, 'CLOPIDOGREL TAB 75 MG TAB', 'Klopidogrel', '75 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '4000'),
(228, 'CLOZAPINE 100 MG TAB', 'Klozapin', '100 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '3622'),
(229, 'CLOZAPINE 25 MG TAB', 'Klozapin', '25 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '3399.99'),
(230, 'CODEIN 10 MG TAB', 'Kodein', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '684.97'),
(231, 'CODEIN 15 MG TAB', 'Kodein', '15 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1234'),
(232, 'CODEIN 20 MG TAB', 'Kodein', '20 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1623.6'),
(233, 'CODIPRONT CAP', 'Kodein, feniltoloxamin', '-', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '12000'),
(234, 'Codipront Cum Exp Syrup', 'CodeineÂ 11.11 mg, phenyltoloxamine 3.67 mg, guaiphenesin 55.55 mg, thyme liquid extr 55.55 mg', '-', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '61105'),
(235, 'CODIPRONT SYR 60 ML', 'Kodein, feniltoloxamin', '-', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '56265'),
(236, 'Colergis Tablet', 'BetamethasoneÂ 0,25 mg, Dexclorpheniramine maleatÂ 2,0 mg', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '3630'),
(237, 'COMAFUSIN HEPAR INF', 'Larutan mengandung Asam Amino (Asam Amino 72.05 g, Total N 11.53 g, AAE/AANE ratio 2.6, Na+ 2 mEq, Asetat 46 mEq)', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '90302'),
(238, 'COMBIVENT UDV INJ.', 'Kombinasi: ipratropium Br 0,5 mg+ salbutamol 2,5 mg nebules', '0.5-2.5 mg', 'Nebules', 'Others', 'Non Generik', 'Fornas', '22699.99'),
(239, 'Concor 1.25 mg tab', 'Bisoprolol ', '1.25 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1904.98'),
(240, 'Concor 10 mg tab', 'Bisoprolol ', '10 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '3097'),
(241, 'CONCOR 2,5 MG TABLET', 'Bisoprolol ', '2.5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '745.83'),
(242, 'Coralan 5 mg tab', 'Ivabradine', '5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '8745'),
(243, 'CORTIDEX INJ', 'Deksametason', '4 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '6215'),
(244, 'COTRIMOXAZOL 480 MG TAB', 'Kombinasi : sulfametoksazol + trimetoprim ', '400 mg-80 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '300'),
(245, 'COTRIMOXAZOL SYR', 'Kombinasi : sulfametoksazol + trimetoprim ', '200 mg-40 mg', 'Syrup', 'Oral', 'Generik', 'Fornas', '6600'),
(246, 'Cotrimoxazole Forte 960 mg cap', 'Kombinasi : sulfametoksazol + trimetoprim ', '800 mg-160 mg', 'Kapsul', 'Oral', 'Generik', 'Fornas', '450'),
(247, 'Counterpain Cream 30 g', '102 mg Methyl Salicylate, 13,6 mg Eugenol, dan 54,4 mg Menthol', '-', 'Salep Kulit', 'Others', 'Non Generik', 'Non Fornas', '36190'),
(248, 'Covifor 100 mg Inj', 'Remdesevir', '100 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '1650000'),
(249, 'CRAVIT INJ 750 MG', 'Levofloksasin', '750 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '385000'),
(250, 'Crestor 20 mg tab', 'Rosuvastatin Calcium', '20 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '17675.82'),
(251, 'Cripsa tab', 'Bromocriptine mesilate 2.5 mg', '2.5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '18700'),
(252, 'CTM TAB', 'Klorfeniramin', '4 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '200'),
(253, 'Curacil 500 mg/10 ml Injeksi', 'Fluorouracil', '500 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '40008.1'),
(254, 'CURCUMA TAB', 'Ekstrak curcuma xantoriza', '-', 'Tablet', 'Oral', 'Generik', 'Fornas', '973.5'),
(255, 'Curliv Plus Syrup 120 ml', 'Choline bitartrate, Curcuma xanthorrhiza, Glycyrrhiza, Pyridoxine, Schisandra chinensis Fructus dan silymarin', '-', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '55000'),
(256, 'Curvit 60 ml syrup', 'Vit B1 3 mg, vit B2 2 mg, vit B6 5 mg, vit B12 5 mcg, beta-carotene 4 mg, dll', '-', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '24200'),
(257, 'Cyclophosphamide 1 gram inj', 'Cyclophosphamide', '1 g', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '200970'),
(258, 'Cyclophosphamide 200 mg inj', 'Cyclophosphamide', '200 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '64350'),
(259, 'Cygest 400 supp', 'Progesteron termikronisasi', '400 mg', 'Supp', 'Others', 'Non Generik', 'Fornas', '26620'),
(260, 'Cymevene 500 mg inj', 'Gansiklovir', '500 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '448916'),
(261, 'Cystistat 40 mg Inj', 'Natrium hialuronat', '40 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '1787500'),
(262, 'CYSTONE TAB', 'Didymocarpus', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '3575'),
(263, 'D5% + 1/2 NS Infus Wida', 'D5% + 1/2 NS', '-', 'Infus', 'Parentheral', 'Generik', 'Fornas', '10680'),
(264, 'D5% + 1/4 NS Infus Wida', 'D5% + 1/4 NS', '-', 'Infus', 'Parentheral', 'Generik', 'Fornas', '10625'),
(265, 'Dactinomycin  0.5 mg injeksi', 'Dactinomycin', '0.5 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '410536.5'),
(266, 'Daunocin 20 mg inj', 'Dactinomycin', '20 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '258250'),
(267, 'Decubal 20 gr', 'Anhydrous lanolin 60 mg, isopropyl myristate 170 mg, dll', '-', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '55000'),
(268, 'DEPAKOTE 250 MG TAB.', 'Valproat Na', '250 mg', 'Tablet ER', 'Oral', 'Non Generik', 'Fornas', '2990'),
(269, 'Depakote ER 250 mg tab', 'Valproat Na', '250 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '2990'),
(270, 'Depakote ER 500 mg tab', 'Valproat Na', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '5999.99'),
(271, 'DESOLEX OINT', 'Desonid', '0.05%', 'Salep Kulit', 'Others', 'Non Generik', 'Non Fornas', '31350'),
(272, 'DESOXIMETASONE 0.25 CR 15 GR', 'Desoksimetason', '0.25%', 'Salep Kulit', 'Others', 'Generik', 'Fornas', '17952'),
(273, 'Dexaflox 400 mg tab', 'Ofloksasin ', '400 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '30208'),
(274, 'DEXAMETHASON 0,5 MG TAB', 'Deksametason', '0.5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '149.17'),
(275, 'DEXAMETHASON INJ', 'Deksametason', '4 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '3300'),
(276, 'Dextrose 10 % Infus OGB Wida', 'Dextrose', '10%', 'Infus', 'Parentheral', 'Generik', 'Fornas', '8002.5'),
(277, 'Dextrose 40% Inj', 'Dextrose', '40%', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '10010'),
(278, 'Dextrose 5 % Infus  OBG Wida', 'Dextrose', '5%', 'Infus', 'Parentheral', 'Generik', 'Fornas', '7364.5'),
(279, 'Dextrose 5% 100 ml Infus B.Braun', 'Dextrose', '-', 'Infus', 'Parentheral', 'Generik', 'Fornas', '9075'),
(280, 'Diamicron MR tab', 'Glikazid', '80 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '6237'),
(281, 'Diazepam 2 mg tab', 'Diazepam', '2 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '137.26'),
(282, 'DIAZEPAM 5 MG TAB', 'Diazepam', '5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '114'),
(283, 'Dibekacin 100 mg Inj', 'Dibekacin', '100 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '89045'),
(284, 'Difenhidramin 10 mg inj', 'Difenhidramin', '10 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '1864.61'),
(285, 'DIGOXIN 0,25 MCG TAB', 'Digoksin', '0.25 mcg', 'Tablet', 'Oral', 'Generik', 'Fornas', '200.2'),
(286, 'DILTIAZEM TAB 30 MG tab', 'Diltiazem', '30 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '154'),
(287, 'DISFLATYL TAB', 'Dimetilpolisiloksan', '40 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '555.5'),
(288, 'Disolf  EC 490 mg tab', 'Lumbricus rubellus extract 490 mg', '490 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '7700'),
(289, 'DOBUTAMIN 250 MG / 5 ML INJ', 'Dobutamin', '250 mg/5 ml ', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '37733.74'),
(290, 'Docetexel 20mg/2ml inj', 'Docetexel', '20 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '187196.9'),
(291, 'Docetexel 80 mg/8 ml inj', 'Docetexel', '80 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '981473'),
(292, 'Dogmatil 50 mg cap', 'Sulpiride', '50 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '4268'),
(293, 'DOMPERIDONE SYRUP 60 ML', 'Domperidon', '5 mg/5 ml', 'Infus', 'Parentheral', 'Generik', 'Fornas', '12650'),
(294, 'DOMPERIDONE TABLET 10 MG', 'Domperidon', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '416.1'),
(295, 'DOPAMET TAB 250 MG', 'Metildopa', '250 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '2057'),
(296, 'Dormicum 15 mg/3 ml inj', 'Midazolam', '15 mg/3 ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '49309'),
(297, 'Dorner tab', 'Natrium Beraprost', '20 mcg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '4873'),
(298, 'Doxorubicin 10 mg / 5 ml Inj', 'Doxorubicin', '10 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '44499.4'),
(299, 'Doxorubicin 50 mg / 25 ml inj', 'Doxorubicin', '50 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '227700'),
(300, 'DOXYCICLIN 100 MG TAB', 'Doksisiklin ', '100 mg', 'Kapsul', 'Oral', 'Generik', 'Fornas', '392.15'),
(301, 'DULCOLAX SUPP 10 MG', 'Bisakodil ', '10 mg', 'Supp', 'Others', 'Non Generik', 'Fornas', '16055.6'),
(302, 'DULCOLAX SUPP 5 MG', 'Bisakodil ', '5 mg', 'Supp', 'Others', 'Non Generik', 'Fornas', '1888'),
(303, 'DULCOLAX TAB', 'Bisakodil ', '5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1400.58'),
(304, 'Durogesic 25 MU', 'Fentanil ', '25 mcg', 'Lmb', 'Others', 'Non Generik', 'Fornas', '208638.98'),
(305, 'Durogesic Matrix 12.5 ', 'Fentanil ', '12.5 mcg', 'Lmb', 'Others', 'Non Generik', 'Fornas', '110732'),
(306, 'DUROGESIC PAD', 'Fentanil ', '12.5 mg', 'Lmb', 'Others', 'Non Generik', 'Fornas', '110732.16'),
(307, 'Duviral tab (Lami+Zido)', 'Lamivudin + Zidovudin', '150 mg-300 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '0'),
(308, 'DVit Syr', 'Cholecalciferol 5000 IU', '400 iu', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '27500'),
(309, 'Efavirenz 600 mg tab', 'Efavirenz', '600 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '0'),
(310, 'Eflagen 50 mg tab', 'Kalium diklofenak', '50 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '2310'),
(311, 'Eligard 22.5 mg Inj', 'Leuprorelin', '22.5 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '2727000'),
(312, 'Elkana Syr.', 'Ca fosfat, Ca lktat, Vit B6, C, D4, mineral', '-', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '25410'),
(313, 'Elocon Cream', 'Mometason ', '0.1%', 'Salep Kulit', 'Others', 'Non Generik', 'Non Fornas', '63360'),
(314, 'Emla 5 % cream 5 gr', 'LidocaineÂ andÂ Prilocaine Hydrochloride', '5%', 'Salep Kulit', 'Others', 'Non Generik', 'Non Fornas', '57999'),
(315, 'Endoxan 1000 mg Inj', 'Cyclophosphamide', '1 g', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '200970'),
(316, 'Endoxan 200 mg Injeksi', 'Cyclophosphamide', '200 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '64350'),
(317, 'Endoxan 500 mg Injeksi', 'Cyclophosphamide', '500 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '173000'),
(318, 'Enystin 12 ml', 'Nistatin', '100,000/ml', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '39600'),
(319, 'EPHEDRIN INJ', 'Efedrin', '50 mg/ml', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '10989'),
(320, 'Epifri syrp', 'Valproat Na', '250 mg/5 ml ', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '109090'),
(321, 'EPINEPHRINE INJ. 0,1 % ETC', 'Epinefrin', '1%', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '2530'),
(322, 'Epirubicin 10 mg /5 ml Inj', 'Epirubicin', '10 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '86001.3'),
(323, 'Epirubicin 50 mg/25 ml Injeksi', 'Epirubicin', '50 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '424999.3'),
(324, 'Epodion 3000IU/0.3ml inj', 'Epoetin Beta', '3000 iu', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '93500'),
(325, 'Eporon 3.000 IU/0.3 ml inj', 'Epoetin Beta', '3000 iu', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '99770'),
(326, 'Erbitux 100 mg/20 ml inj', 'Rituximab', '100 mg/20 ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '2450000'),
(327, 'Ericaf tab', 'Ergotamin-Caffein', '1 mg-50 mcg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '5626'),
(328, 'ERYTHROMYCIN 250 TAB', 'Eritromisin', '250 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '700'),
(329, 'ERYTHROMYCYN 500 TAB', 'Eritromisin', '500 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '900'),
(330, 'ERYTROMICYN SYR', 'Eritromisin', '200 mg/5 ml', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '9801'),
(331, 'Esilgan 1 mg tab', 'Estazolam', '1 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '4576'),
(332, 'ESILGAN 2 MG TAB', 'Estazolam', '2 mg ', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '6913.5'),
(333, 'Esomax Inj', 'Esomeprazole', '40 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '165000'),
(334, 'Esomeprazole 40 mg inj', 'Esomeprazole', '40 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '31499.6'),
(335, 'ETHAMBUTOL 500 MG TAB', 'Etambutol', '500 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '827.53'),
(336, 'Etopul Inj', 'Etopusid', '100 mg/5 ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '89210'),
(337, 'EUTHYROX 100 MG TAB', 'Levotiroksin', '100 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1694.17'),
(338, 'Euvax B inj', 'Vaksin Hepatitis B', '-', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '87846'),
(339, 'Exjade 250 mg tab', 'Deferasiroks', '250 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '108000'),
(340, 'EXJADE 500 MG TAB', 'Deferasiroks', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '155000'),
(341, 'Extrace 200 mg/ 2 ml Inj', 'Asam askorbat (vitamin C)', '200 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '12100'),
(342, 'Extrace 500 mg / 5 ml inj', 'Asam askorbat (vitamin C)', '500 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '22000'),
(343, 'Eye vit tab', 'Ekstr kering bilberry 80 mg, retinol 1,600 IU, å°¾-carotene 5 mg, Vitamin E 40 mg, dll', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '4950'),
(344, 'Ezelin Insulin Glargine 100 IU/ML', 'Analog insulin : fast acting', '-', 'Flexpen', 'Parentheral', 'Non Generik', 'Fornas', '84999.2'),
(345, 'Faktu Supp', 'Policresulen', '-', 'supp', 'Others', 'Non Generik', 'Non Fornas', '6836'),
(346, 'FARGOXIN 2 ML INJ', 'Digoksin', '0.5 mg/2 ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '38500'),
(347, 'FARMABES INJ', 'Diltiazem', '50 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '56628'),
(348, 'Farneltik tab', '-', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '16500'),
(349, 'FARSORBID 5 MG TAB', 'Isosorbid dinitrat', '5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '223'),
(350, 'FARSORBID INJ', 'Isosorbid dinitrat', '1 mg/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '38500'),
(351, 'FARTISON 100 MG INJ', 'Hidrokortison', '100 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '104500'),
(352, 'Favipiravir 200 mg tab (Bantuan)', 'Favipiravir', '200 mg', 'Tablet', 'Oral', 'Generik', 'Non Fornas', '18260'),
(353, 'Feburic 80 mg tab', 'Febuxostat', '80 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '27500'),
(354, 'Fendex 25 mg tab', 'Dexketoprofen', '25 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '6050'),
(355, 'Fenofibrate 100 mg caps', 'Fenofibrate', '100 mg', 'Kapsul', 'Oral', 'Generik', 'Fornas', '2420'),
(356, 'Fenofibrate 300 mg tab', 'Fenofibrate', '300 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1445.99'),
(357, 'FENTANYL INJ 2ML/AMPUL', 'Fentanil ', '0.05 mg/ml', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '44390.94'),
(358, 'FERRIPROX 100 MG/ML 250 ML SYR', 'Deferipron', '250 ml', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '1680000'),
(359, 'FERRIPROX FCT 500 MG', 'Deferipron', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '33000'),
(360, 'Ferriz Drop', 'Na Fe EDTA', '-', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '39999.3'),
(361, 'Ferriz syrup', 'Na Fe EDTA', '-', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '33000'),
(362, 'FETIK SUPPOSITORIA 100 MG', 'Ketoprofen', '100 mg', 'Supp', 'Others', 'Non Generik', 'Fornas', '10500'),
(363, 'FG Throces tab', 'Fradiomisin Sulfat 2,5 mg, Gramisidin-S HCl 1 mg', '2.5 mg-1.5 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '1045'),
(364, 'FIBRION 1,5 IU INJ', 'Streptokinase', '5 iu ', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '4180000'),
(365, 'Fibumin 500 mg tab', 'Albumin 153,56mg; Protein 285,19mg; Lemak total 18,55mg; Mineral 23,7mg', '500 mg', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '5500'),
(366, 'FITBON KAP', 'Glukosamin-mangan', '-', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '2300'),
(367, 'FLAGYL SUPP 500 Mg', 'Metronidazol', '500 mg', 'Supp', 'Others', 'Non Generik', 'Fornas', '19379'),
(368, 'FLAMICORT 10 MG/ML INJ', 'Triamcinolone', '10 mg/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '95700'),
(369, 'Flamicort 40 mg/ml inj IM', 'Triamcinolone', '40 mg/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '95700'),
(370, 'Flamicort IA/ID 10mg/5ml', 'Triamcinolon acetonid', '10 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '137500'),
(371, 'FLEET ENEMA', 'Natrium fosfat', '-', 'Supp', 'Others', 'Non Generik', 'Fornas', '46881'),
(372, 'FLEET PHOSPHOSODA', 'Natrium fosfat', '-', 'Supp', 'Others', 'Non Generik', 'Fornas', '38500'),
(373, 'FLIXOTIDE NEB. INJ', 'Flutikason propionat ', '0.5 mg/2 ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '19140'),
(374, 'FLUCONAZOLE 150 MG TAB', 'Flukonazol ', '150 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '21527.99'),
(375, 'FLUCONAZOLE INF', 'Flukonazol ', '200 mg', 'Infus', 'Parentheral', 'Generik', 'Fornas', '20500'),
(376, 'Fludara 10 mg tab', 'Fludarabin', '10 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '332999.7'),
(377, 'FLUIMUCIL 200MG CAP', 'N-asetil sistein', '200 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '6032'),
(378, 'Folavit 400 mcg tab', 'Vitamin E', '400 mcg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1199.99'),
(379, 'FOLAVIT TAB 400 mcg', 'Asam folat', '400 mcg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1199.99'),
(380, 'FOLIC ACID 1 MG TAB', 'Asam folat', '1 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '173'),
(381, 'Foncogem 1000 mg inj', 'Gemcitabin', '1000 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '699999'),
(382, 'Fonkopac 100 mg inj', 'Paclitaxel', '100 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '260000.4'),
(383, 'Fonkopac 30 mg inj', 'Paclitaxel', '30 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '130499.6'),
(384, 'Fontrexed 500 mg LYO Inj', 'Premetrexed', '500 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '2615000'),
(385, 'Formyco 200 mg tab', 'Ketokonazol', '200 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '5610'),
(386, 'Formyco krim', 'Ketokonazol', '2%', 'Salep Kulit', 'Others', 'Non Generik', 'Non Fornas', '19800'),
(387, 'FORNEURO TAB', 'Tiamin (vitamin B1), Piridoksin (vitamin B6), Sianokobalamin (vitamin B12), Vitamin E, asam folat', '-', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '5867'),
(388, 'FORTANEST 15 MG/3 ML INJ', 'Midazolam', '15 mg/3 ml', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '9801'),
(389, 'FORUMEN TT', 'Natrium dokusat 5 mg', '5 mg', 'Tetes Telinga', 'Others', 'Non Generik', 'Non Fornas', '28105'),
(390, 'Fraizeron LYVI 150 mg inj', 'Secukinumab', '150 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '2973749.9'),
(391, 'Frego 10 mg tab', 'Flunarizin', '10 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '8140'),
(392, 'FREGO 5 MG TAB', 'Flunarizin', '5 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '6600'),
(393, 'FRESOFOL 1% MCT/LCT INJ', 'Propofol', '1%', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '11308'),
(394, 'Furamin 2.5 mg  inj', 'Fursultiamin HCl', '2.5 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '16999.84'),
(395, 'FUROSEMID 10 MG INJ', 'Furosemid', '10 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '2058.33'),
(396, 'FUROSEMID 40 MG TAB', 'Furosemid', '40 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '130'),
(397, 'FUSON CREAM', 'Natrium fusidat', '2%', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '48510'),
(398, 'FUSYCOM CREAM 5 GR', 'Natrium fusidat', '2%', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '10000'),
(399, 'FUTROLIT INF', 'Larutan mengandung Karbohidrat + Elektrolit (Larutan nutrisi kombinasi infus per L: Na. 100mEQ, K 18mEQ, Ca. 4mEQ, Mg 6mEQ, Cl 90mEQ, Asetat 38mEQ, Sorbitol 50g)', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '45289.2'),
(400, 'GABAPENTIN 300 TAB', 'Gabapentin', '300 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '4851'),
(401, 'Gabaxa inf', 'N (2)-L-alanyl-L-glutamine', '-', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '220000'),
(402, 'Galvus 50 mg tab', 'Vildagliptin', '50 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1647'),
(403, 'GAMARAAS INJ', 'Imunoglobulin ', '2.5 g', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '3407800'),
(404, 'Garam Inggris', 'Garam Inggris', '-', 'Serbuk', 'Oral', 'Generik', 'Fornas', '4400'),
(405, 'GELAFUSAL 500 ML INF', 'Gelatin, NaCl, NaOH, HCl', '500 ml', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '176000'),
(406, 'GELOFUSIN INF', 'Gelatin, NaCl, NaOH, HCl', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '195499.7'),
(407, 'Gemcikal 1000 mg inj', 'Gemcitabin', '1000 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '899999'),
(408, 'Gemcikal 200 mg inj', 'Gemcitabin', '200 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '145000'),
(409, 'GEMFIBROZIL 300 MG TAB', 'Gemfibrosil', '300 mg', 'Kapsul', 'Oral', 'Generik', 'Fornas', '429'),
(410, 'Gemfibrozil 600 mg tab', 'Gemfibrosil', '600 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '913'),
(411, 'Genisone 20 mg tab', 'Hidrokortison', '20 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '6150'),
(412, 'Genoint 0.3 % salep mata', 'Gentamisin', '0.3%', 'Salep Mata', 'Others', 'Non Generik', 'Fornas', '8580'),
(413, 'GENOINT 0.3% TM', 'Gentamisin', '0.3%', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '10065'),
(414, 'GENOINT SALEP KULIT', 'Gentamisin', '0.1%', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '3659'),
(415, 'GENOINT SM', 'Gentamisin', '0.3%', 'Salep Mata', 'Others', 'Non Generik', 'Fornas', '8580'),
(416, 'GENTAMICIN INJ 80', 'Gentamisin', '80 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '6497.04'),
(417, 'GENTAMYCIN 0,1 % 5 GR OINT', 'Gentamisin', '0.1%', 'Salep Kulit', 'Others', 'Generik', 'Fornas', '2385.72'),
(418, 'Giotrif 20 mg tab', 'Afatinib', '20 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '280000'),
(419, 'Giotrif 30 mg tab', 'Afatinib', '30 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '280000'),
(420, 'Giotrif 40 mg tab', 'Afatinib', '40 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '280000'),
(421, 'Gitas inj', 'Hiosin N butilbromida', '10 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '28297.5'),
(422, 'GLAUSETA TAB', 'Asetazolamid', '250 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '4625.5'),
(423, 'GLIBENKLAMIDE 5 MG TAB', 'Glibenklamid', '5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '152.74'),
(424, 'GLICAB 80 MG TAB', 'Glikazid', '80 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '2999.99'),
(425, 'Gliclazide 80 mg tab', 'Gliclazide', '80 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '3000'),
(426, 'GLIMEPIRIDE TAB 1 MG', 'Glimepirid', '1 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '180'),
(427, 'GLIMEPIRIDE TAB 2 MG', 'Glimepirid', '2 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '207'),
(428, 'GLIMEPIRIDE TAB 3 MG', 'Glimepirid', '3 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '250'),
(429, 'GLIQUIDONE 30 MG TAB', 'Glikuidon ', '30 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1209'),
(430, 'GLIVEC FCT 100 MG TAB', 'Imatinib Mesilat ', '100 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '35166.67'),
(431, 'Glucophage 500 mg tab', 'Metformin', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1873.94'),
(432, 'Glucophage XR 500 mg tab', 'Metformin', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '2999.99'),
(433, 'GLUCOSAMINE 500 MG TAB', 'Glukosamin', '500 mg', 'Tablet', 'Oral', 'Generik', 'Non Fornas', '1595'),
(434, 'Glycophos 20 ml inj', 'Fosfat dan sodium', '-', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '132000'),
(435, 'Goldtrion tab', 'Astaxanthin 4 mg, Echinaceae purpurea extr 250 mg, Zn picolinate 10 mg', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '8800'),
(436, 'Granitron 3mg/3ml Inj', 'Granisetron', '3 mg/3 ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '110000'),
(437, 'Granon 1 mg/ml inj', 'Granisetron', '1 mg/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '60500');
INSERT INTO `obat` (`idObat`, `namaObat`, `namaGenerik`, `kekuatan`, `bentuk`, `jenis`, `generik`, `fornas`, `hargaSatuan`) VALUES
(438, 'HAEMOCTIN 1.000 IU INJ', 'Faktor VIII (konsentrat) ', '1000 iu', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '3948269.6'),
(439, 'Haemoctin 250 iu inj', 'Faktor VIII (konsentrat) ', '250 iu', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '1013744.6'),
(440, 'HAEMOCTIN 500 IU INJ', 'Faktor VIII (konsentrat) ', '500 iu', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '2027490'),
(441, 'HALOPERIDOL 0,5 MG TAB', 'Haloperidol', '0.5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '77'),
(442, 'HALOPERIDOL 1,5 MG TAB', 'Haloperidol', '5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '103.11'),
(443, 'HALOPERIDOL 5 MG TAB', 'Haloperidol', '5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '103.11'),
(444, 'HARNAL 0,2 MG KAP', 'Tamsulosin', '2 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '7788'),
(445, 'Harnal D 0,2 mg tab', 'Tamsulosin HCl 0.2 mg', '0.2 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '6281'),
(446, 'HARNAL OCAS 0,4MG TAB', 'Tamsulosin', '0.4 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '6281'),
(447, 'HB-VIT CAP', 'Beta carotene 2,700 IU, vitamin B1 mononitrate 3 mg, Na phosphate 3,4 mg, dll', '-', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '2145'),
(448, 'HCT 25 MG TAB', 'Hidroklorotiazid', '25 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '178'),
(449, 'HEMAPO INJ 3000 IU/ML', 'Eritropoetin-alfa', '3000 iu/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '139950'),
(450, 'HEPA - MERZ INJ', 'l-ornithine-L-aspartate', '-', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '121000'),
(451, 'Hepabal tab', 'Lecithin 300 mg, Ekstrak Schisandra chinensis fructus 135 mg, Ekstrak Silybum marianum semen 70 mg, Curcuminoid 20 mg, dll', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '9090'),
(452, 'HEPA-BALANCE TAB', 'Fructus schisandra chinensis, silybum marianum semen extraxt, curcuminoid', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '13750'),
(453, 'Hepamax kapsul', 'Sylimarin, Lecithin, Schisandra, Vitamin E', '-', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '10083.33'),
(454, 'HEPA-Q TAB', 'Fructus schisandra chinensis, silybum marianum semen extraxt, curcuminoid', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '4950'),
(455, 'HERBESER CD 100MG TAB', 'Diltiazem', '100 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '4460.01'),
(456, 'HERBESER CD 200MG TAB', 'Diltiazem', '200 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '4835'),
(457, 'HERBESSER INJ 50 MG', 'Diltiazem', '50 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '154399.96'),
(458, 'Herzemab 440 mg Inj', 'Tastuzumab', '440 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '8929800'),
(459, 'Hexilon 125 mg Inj', 'Methyl Prednisolon', '125 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '96800'),
(460, 'HEXYMER 2 MG TAB', 'Triheksifenidil', '2 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1500'),
(461, 'HI - BONE TAB', 'Kalsium, genistein, vit K1, Vit D3', '1000 iu', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '2860'),
(462, 'Hi-D 1000 tab', 'Cholecalciferol 1000 IU', '1000 iu', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '2860'),
(463, 'Hi-D 5000 tab', 'Cholecalciferol 5000 IU', '5000 iu', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '3630'),
(464, 'Hiviral tab (Lamivudine)', 'Lanivudin', '100 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '0'),
(465, 'Holoxan 1 gram inj', 'Ifosfamid', '1 g', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '1470040'),
(466, 'Holoxan 2 gram inj', 'Ifosfamid', '2 g', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '2091480'),
(467, 'Holoxan 500 mg inj', 'Ifosfamid', '500 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '851250'),
(468, 'HP PRO TAB', 'Fructus schisandra chinensis', '-', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '6083.33'),
(469, 'Human Albumin 20 % 100 ml Biotest', 'Albumin serum normal (human albumin)', '20%', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '858000'),
(470, 'HYDROCORTISON CR 1 % 5 GR', 'Hidrokortison', '1%', 'Salep Kulit', 'Others', 'Generik', 'Fornas', '4400'),
(471, 'HYDROCORTISON CR 2,5% 5 GR', 'Hidrokortison', '2.5%', 'Salep Kulit', 'Others', 'Generik', 'Fornas', '5500'),
(472, 'Hydromal Inf', 'NaCl 3 g, KCl 0.15 g, CaCl2 dihidrat 0.1 g, Na laktat 1.55 g, Maltose 25 g', '-', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '55602.8'),
(473, 'Hydroxychloroquine 200 mg tab', 'Hydroxychloroquine', '200 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '2186.8'),
(474, 'HYDROXYUREA KAPS', 'Hidroksi urea', '500 mg', 'Kapsul', 'Oral', 'Generik', 'Fornas', '3950'),
(475, 'Hyloquin 200 mg tab', 'Hidroksikloroquin', '200 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '18150'),
(476, 'HYPOBHAC 200 MG INJ', 'Netilmicin', '200 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '256996'),
(477, 'HYTROZ 2 MG TAB', 'Terazosin', '2 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1425'),
(478, 'IBUPROFEN 100 MG SYR', 'Ibuprofen', '100 mg', 'Syrup', 'Oral', 'Generik', 'Fornas', '4195'),
(479, 'IBUPROFEN 400 MG TAB', 'Ibuprofen', '400 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '385'),
(480, 'Icunes 2 ml inj', 'Dexmedetomidine', '118.3/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '374000'),
(481, 'ILLIADIN SPRAY DEWASA 0.05%', 'Oksimetazolin', '0.05%', 'Nasal Spray', 'Others', 'Non Generik', 'Fornas', '39468'),
(482, 'ILLIADIN TETES ANAK 0.025%', 'Oksimetazolin', '0.25', 'Nasal Spray', 'Others', 'Non Generik', 'Fornas', '35999.7'),
(483, 'IM Boost Force kaplet', 'Echinacea purpurae,Â Black elderberry, danÂ Zinc Piccolinate', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '6453.26'),
(484, 'Imodium tab', 'Loperamid ', '2 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '7295.66'),
(485, 'IMUNOS SYR', 'Ekstrak echinacea', '-', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '86000.2'),
(486, 'Imuran 50 mg tab', 'Azathioprine', '50 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '7489.9'),
(487, 'INTERHISTIN 50 MG TAB', 'Mebhidrolin', '50 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '913'),
(488, 'Interlac Drop', 'Lactobacillus sporogenes', '-', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '280500'),
(489, 'Intratect 5% 50 ml Inf', 'Imunoglobulin ', '2.5 g', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '2143963.8'),
(490, 'INVICLOT INJ', 'Heparin Na', '5000 iu', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '43994.5'),
(491, 'INVITEC TAB', 'Misoprostol', '4 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '12466.63'),
(492, 'Invomit 8 mg inj', 'Ondansetron', '8 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '84700'),
(493, 'Iopamiro  370/100ml', 'Iopamidol', '370 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '669075'),
(494, 'Iopamiro 300 /30 ml', 'Iopamidol', '300 mg', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '204600'),
(495, 'Iopamiro 300 /50 ml', 'Iopamidol', '300 mg', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '299200'),
(496, 'Iopamiro 370 /30 ml', 'Iopamidol', '370 mg', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '251570'),
(497, 'Iopamiro 370 /50 ml', 'Iopamidol', '370 mg', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '358600'),
(498, 'IOPAMIRO 370/CC', 'Iopamidol', '370 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '669075'),
(499, 'IRBESARTAN 150 MG TAB', 'Irbesartan', '150 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1963.5'),
(500, 'IRBESARTAN 300 MG TAB', 'Irbesartan', '300 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '760'),
(501, 'Iressa 250 mg tab', 'Gefitinib', '250 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '294954'),
(502, 'Isoniazide 100 mg tab', 'Isoniazid', '100 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '179.74'),
(503, 'Isoniazide 300 mg tab', 'Isoniazid', '300 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '262.31'),
(504, 'Isosorbide Dinitrade 1 mg Inj', 'Isosorbide Dinitrade', '1 mg/ml', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '35000'),
(505, 'Isosorbide Dinitrat 5 mg tab', 'Isosorbide Dinitrat', '5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '123.02'),
(506, 'ISOTIC ADRETOR 0,25% TM', 'Timolol ', '0.25', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '12405'),
(507, 'ISOTIC ADRETOR 0,50% TM', 'Timolol ', '0.5%', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '12405'),
(508, 'Isprinol 500 mg tab', 'Methisoprinol', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '10312.5'),
(509, 'Kabipem 500 mg inj', 'Premetrexed', '500 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '2299000'),
(510, 'Kabitarin 1 g inj', 'Citarabin', '1 g', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '570350'),
(511, 'Kabiven infus', 'Alanine, Aspartic Acid, Calcium Chloride Dihydrate,Â Glucose Monohydrate,Â Glutamic Acid, Glycine, dll.', '-', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '363330'),
(512, 'KAEN 3 B infus', 'Larutan mengandung Karbohidrat + Elektrolit (Nacl 1.75 gr, KCl 1.5 gr, Na Lactat 2.24 gr, Dekstrosa 27 gr) (KA EN 3B)', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '15660.7'),
(513, 'KAEN MG.3 INFUS', 'Larutan mengandung Karbohidrat + Elektrolit (NaCl 1.75 g, KCL 1.5g, Glukosa 100 gr)', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '85450.2'),
(514, 'Kalbamin Inf', 'Asam amino esensial dan non-esensial', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '85450'),
(515, 'KALITAKE 5 Gr', 'Kalsium polistirena sulfonat', '5 gr', 'Serbuk', 'Oral', 'Non Generik', 'Fornas', '17325'),
(516, 'KALIUM DIKLOFENAK 50 MG TAB', 'Kalium diklofenak', '50 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '778.82'),
(517, 'KALNEX TAB. 500 MG', 'Asam traneksamat ', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '3520'),
(518, 'KALTROFEN SUPP', 'Ketoprofen', '100 mg', 'Supp', 'Others', 'Non Generik', 'Fornas', '12650'),
(519, 'KALXETIN 10 MG TAB', 'Fluoksetin', '10 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '4400'),
(520, 'KALXETIN 20 MG TAB', 'Fluoksetin', '20 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '7333.33'),
(521, 'KCL INJ', 'Larutan mengandung Elektrolit (Kalium Klorida)', '-', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '32235.83'),
(522, 'KDN 1 Wida inf', 'KCl 1.5 g, NaCl 4.5 g, dextrose monohydrate 27.5 g', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '14850'),
(523, 'KDN 2 Wida inf', 'KCl 3 g, NaCl 4.5 g, dextrose monohydrate 27.5 g', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '14850'),
(524, 'KENDARON TAB.', 'Amiodaron ', '4 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1026.67'),
(525, 'Keppra 500 mg tab', 'Levetiracetam', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '4935'),
(526, 'KETAMIN HAMELN INJ / MG', 'Ketamin', '100 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '112735.7'),
(527, 'Ketokonazol 10 gr Cream/tube', 'Ketokonazol', '2%', 'Salep Kulit', 'Others', 'Generik', 'Fornas', '4675'),
(528, 'Ketokonazol 2% Crem 20 g', 'Ketokonazol', '2%', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '4675'),
(529, 'KETOKONAZOL 200 MG', 'Ketokonazol', '200 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '450.98'),
(530, 'KETOKONAZOL CR', 'Ketokonazol', '2%', 'Salep Kulit', 'Others', 'Generik', 'Fornas', '4675'),
(531, 'Ketomed cream 15 gr', 'Ketokonazol', '2%', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '55500'),
(532, 'Ketopain 30 mg injeksi', 'Ketorolac', '30 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '38500'),
(533, 'KETOPROFEN 100 MG TAB', 'Ketoprofen', '100 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '1620'),
(534, 'Ketorolac 10 mg Inj ', 'Ketorolac', '10 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '5000'),
(535, 'KETOROLAC 10MG TAB', 'Ketorolak', '10 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '5000'),
(536, 'KETOROLAC INJ 30 MG', 'Ketorolak', '30 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '1100'),
(537, 'Ketosteril tab', 'Asam 3-metil-2-oxovalerat 67 mg, asam-4-metil-2-oksovalerat 101 mg, asam 2-okso-3-fenilpropionat 68 mg, dll', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '7900'),
(538, 'Ketricin Orabase 0,1% 5 gr', 'Triamcinolone', '0.1%', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '49500'),
(539, 'Kifovir 300 mg tab', 'Tenofovir', '300 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '12833.33'),
(540, 'Kloderma 10 gr cream', 'Mometason ', '0.05%', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '34787.5'),
(541, 'KN 1 Wida inf', 'KCl 1.5 g, NaCl 9 g.Sumber:Â https://www.farmasi-id.com/wida-kn-1/', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '14300'),
(542, 'KN 2 Wida inf', 'KCl 3 g, NaCl 4.5 g, dextrose monohydrate 27.5 g', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '15730'),
(543, 'KOATE 600 UI INJ', 'Faktor VIII (konsentrat) ', '600 ui', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '1900000'),
(544, 'KOATE INJ 1000 IU', 'Faktor VIII (konsentrat) ', '1000 iu', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '3700000'),
(545, 'KOATE INJ 260 UI', 'Faktor VIII (konsentrat) ', '260 ui', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '1289999'),
(546, 'KSR TAB', 'Kalium klorida ', '600 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1841.99'),
(547, 'KUTOIN CAP', 'Fenitoin Na', '50 mg/ml', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '1265'),
(548, 'L - BIO SAC', 'Rice starch, maltodextrin, L. acidophilus, L.casei, Lsalivarius, Bifidobacterium infantis, B. lactis, B. longum, lactococcus lactis ', '-', 'Serbuk', 'Oral', 'Non Generik', 'Non Fornas', '4636'),
(549, 'LACBON SAC', 'Lactobacillus sporogenes', '-', 'Serbuk', 'Oral', 'Non Generik', 'Non Fornas', '3630'),
(550, 'Lactamam kapsul', 'Trigonella Foenum-graecum seed extr. 600 mg, Sauropus Androgynus extr. 100 mg', '-', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '3300'),
(551, 'LACTO - B SAC', 'Lactobacillus acidophillus, bifidobacterium longun, streptococcus thermophillus, vit C, B1, B2, B6, niacin, protein', '-', 'Serbuk', 'Oral', 'Non Generik', 'Non Fornas', '6490'),
(552, 'LAKTULOSA 60 ML SYR', 'Laktulosa', '3.335 mg/5 ml', 'Syrup', 'Oral', 'Generik', 'Fornas', '15060.1'),
(553, 'LAMESON 4 MG TAB', 'Metilprednisolon', '4 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '3740'),
(554, 'Lameson 8 tab', 'Methyl Prednisolon', '8 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '6050'),
(555, 'LANCID TAB', 'Lansoprazol', '30 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '16225'),
(556, 'Lansoprazole 30 mg caps', 'Lansoprazole', '30 mg', 'Kapsul', 'Oral', 'Generik', 'Fornas', '1100'),
(557, 'Lansoprazole Inj', 'Lansoprazol', '30 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '99000'),
(558, 'Lantus Flexpen inj', 'Analog insulin : mix insulin', '-', 'Flexpen', 'Parentheral', 'Non Generik', 'Fornas', '83950.02'),
(559, 'LAPIBAL INJ', 'Mecobalamin', '500 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '27500'),
(560, 'LAPIBAL KAPSUL 250 MG', 'Mecobalamin', '250 mg', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '2475'),
(561, 'LAPIBAL KAPSUL 500 MG', 'Mecobalamin', '500 mg', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '2475'),
(562, 'LAPRAZ 30 MG KAPS', 'Lansoprazol', '30 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '19000'),
(563, 'Latanoprost 2.5 ml E.D', 'Latanoprost', '0.005%', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '110000'),
(564, 'Latropil 500 mg/5 ml syr', 'Piracetam', '500 mg/5 ml', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '35200'),
(565, 'LAXADIN SYR 60 ML', 'Bisakodil ', '5 mg/5 ml', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '12449.8'),
(566, 'LAXADINE SYR 110 ML', 'Gliserin', '-', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '44000'),
(567, 'L-CISIN TAB 0,5 MG', 'Kolkisin', '0.5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '4400'),
(568, 'LEPARSON TABLET', 'Anti Parkinson kombinasi : benzerasid 25 mg + levodopa 100 mg', '25 mg-100 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '4383.23'),
(569, 'Lesichol 100 capsul', 'Lecithin, Vitamin B', '100 mg', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '6930'),
(570, 'Lesichol 300 mg capsul', 'Lecithin, Vitamin B', '300 mg', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '11550'),
(571, 'Lesichol 600 mg tab', 'Lecithin, Vitamin B', '600 mg', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '24999.99'),
(572, 'Leucogen Inj', 'Filgrastim', '300 mcg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '324995'),
(573, 'Leunase Inj', 'L-Asparginase', '10,000 iu', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '1221999.9'),
(574, 'LEVEMIR FLEXPEN', 'Analog Insulin long acting', '-', 'Flexpen', 'Parentheral', 'Non Generik', 'Fornas', '87020'),
(575, 'LEVOCIN ED', 'Levofloksasin', '0.10%', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '19819.8'),
(576, 'LEVOFLOXACIN 500 INF', 'Levofloksasin', '500 mg', 'Infus', 'Parentheral', 'Generik', 'Fornas', '57000'),
(577, 'LEVOFLOXACIN TAB', 'Levofloksasin', '500 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1327'),
(578, 'Levopront Syr 120/ml', 'Levodropropizine', '-', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '85499.7'),
(579, 'Lezra 2.5 mg tab', 'Letrozol', '2.5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '3899.13'),
(580, 'LIDOCAIN 2% INJ', 'Lidokain', '2%', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '1500'),
(581, 'Lipantyl 200 cap', 'Fenofibrate', '200 mg', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '16487.69'),
(582, 'LISINOPRIL 10 MG TAB', 'Lisinopril', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '660'),
(583, 'LISINOPRIL 5 MG TAB', 'Lisinopril', '5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '409.99'),
(584, 'Livamin 500 ml Infus', 'L-isoleucine 952 mg, L-leucine 1.904 g, L-valine 1.144 g', '-', 'Infus', 'Parentheral', 'Non Generik', 'Non Fornas', '227865'),
(585, 'Liver Prime caps', 'Silyphos, nicotinamide, vitamin B1, B2, B6, B12, E, Calcium, Zinc', '-', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '7663'),
(586, 'Livron B Plex tab', 'Vitamin B1 HCl 1,5 mg, B2 0.25mg, B6 HCl 0,25mg, B12 0,5mcg, C 12,5mg, Kalsium pantotenat 1,5 mg, dll', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '280.5'),
(587, 'Lodia tab', 'Loperamid ', '2 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1100'),
(588, 'Longatin 50 mg kapsul', 'Noscapin', '50 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '5750'),
(589, 'Lonide tab', 'Otilonium Bromide', '40 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '8636'),
(590, 'Lopivia 200/50 mg tab', 'Lopinavir, ritonavir', '200 mg/50 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '8250'),
(591, 'LORATADIN 10 MG', 'Loratadin', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '333.08'),
(592, 'Lorazepam 2 mg tab', 'Lorazepam', '2 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '995.01'),
(593, 'LOVENOX INJ 40 MG', 'Enoksaparin sodium', '40 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '90703.8'),
(594, 'LOVENOX INJ 60 MG', 'Enoksaparin sodium', '60 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '125384.05'),
(595, 'Mabthera 100 mg inj', 'Rituximab', '100 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '1529000'),
(596, 'Mabthera 500 mg inj', 'Rituximab', '500 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '7645000'),
(597, 'Maltofer Chewable tab', 'Besi (III)-hidroksi polimaltosa, Asam Folat', '-', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '3700'),
(598, 'MANITOL 20% 500 ML', 'Manitol', '500 ml', 'Infus', 'Parentheral', 'Generik', 'Fornas', '43499.5'),
(599, 'Marimer nasal spray', 'Larutan steril dan hipertonis', '-', 'Nasal Spray', 'Others', 'Non Generik', 'Fornas', '122727'),
(600, 'MARTOS INFUS', 'Larutan mengandung Karbohidrat (Maltose 100 gr)', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '145000'),
(601, 'Mebo Oint', 'Copitidis rhizoma 5,5 %, Pkellodendri chinensis corlex 5,5 %, Scutellariae radix 5,5 %', '-', 'Salep Kulit', 'Others', 'Non Generik', 'Non Fornas', '87450'),
(602, 'MECOBALAMIN CAPS 500', 'Mecobalamin', '500 mg', 'Tablet', 'Oral', 'Generik', 'Non Fornas', '880'),
(603, 'MECOBALAMIN INJ', 'Mecobalamin', '500 mg', 'Injeksi', 'Parentheral', 'Generik', 'Non Fornas', '9680'),
(604, 'Medixon 8 mg tab', 'Methyl Prednisolon', '8 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '4500'),
(605, 'MEFINAL 500 MG TAB', 'Asam mefenamat', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1468.5'),
(606, 'Meiact 200 mg tab', 'Cefditoren Pivoksil', '200 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '33000'),
(607, 'MELOXICAM 15 MG TAB', 'Meloksikam', '15 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1410'),
(608, 'MELOXICAM 7,5 MG TAB', 'Meloksikam', '5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '450'),
(609, 'Mercaptopurine 50 mg tab', 'Mercaptopurine', '50 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '10500'),
(610, 'MERLOPAM 2 MG TAB', 'Lorazepam', '2 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '3300'),
(611, 'Merofen inj 1 g inj', 'Meropenem', '1 g', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '539000'),
(612, 'MEROPENEM 0,5 G INJ', 'Meropenem', '0.5 g', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '90000'),
(613, 'MEROPENEM 1 G INJ', 'Meropenem', '3 g', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '110000'),
(614, 'Meropenem 500 mg inj', 'Meropenem', '500 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '30000'),
(615, 'MERTIGO TAB', 'Betahistin', '6 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '3740'),
(616, 'Mertigo SR tab', 'Betahistin', '12 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '6050'),
(617, 'MESTINON TAB', 'Piridostigmin', '60 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '7513'),
(618, 'METACOSFAR 100 ML INJ', 'Iodiksanol ', '320 mgl/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '880000'),
(619, 'METACOSFAR 50 ML INJ', 'Iodiksanol ', '320 mgl/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '440000'),
(620, 'METFORMIN 500 MG TAB', 'Metformin', '500 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '217.8'),
(621, 'METFORMIN 850 MG TAB', 'Metformin', '850 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '363'),
(622, 'Methotrexate 50 mg inj', 'Methotrexate', '50 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '41079.5'),
(623, 'Methycobalt 500 kapsul', 'Mecobalamin', '500 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '4055.84'),
(624, 'METHYL COBAL 500 MG INJ', 'Mecobalamin', '500 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '33830.94'),
(625, 'METHYL PREDNISOLON 4 MG TAB.', 'Metilprednisolon', '4 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '525'),
(626, 'METHYL PREDNISOLON INJ 125 MG', 'Metilprednisolon', '125 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '26000'),
(627, 'METHYL PREDNISOLONE 16 MG TAB.', 'Metilprednisolon', '16 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1138.5'),
(628, 'METHYLERGOMETRIN INJ', 'Metilergometrin', '2 mg/ml', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '3500'),
(629, 'METOCLOPRAMIDE 10 MG TAB', 'Metoklopramid', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '143'),
(630, 'METRONIDAZOL 500 MG TAB', 'Metronidazol ', '500 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '300'),
(631, 'METRONIDAZOL INFUS', 'Metronidazol ', '500 mg', 'Infus', 'Parentheral', 'Generik', 'Fornas', '9000'),
(632, 'MEYLON INJ', 'Natrium bikarbonat', '84 mg/ml', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '9100.3'),
(633, 'MgSo4 20%  inj', 'Magnesium sulfat', '20%', 'Infus', 'Parentheral', 'Generik', 'Fornas', '3327.5'),
(634, 'MgSo4 40 % inj', 'Magnesium sulfat', '40%', 'Infus', 'Parentheral', 'Generik', 'Fornas', '3796.1'),
(635, 'Micardis 40 mg tab', 'Telmisartan', '40 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '3045.02'),
(636, 'MICARDIS 80 mg tab', 'Telmisartan', '80 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '6500.01'),
(637, 'MICONAZOLE CR', 'Mikonazol', '2%', 'Salep Kulit', 'Others', 'Generik', 'Fornas', '4999.5'),
(638, 'Microlax 5 gr Enema', 'Na-Laurilsulfoasetat 0.045 g, Asam Sorbat 0.005 g, PEG 400 0.625 g, Natrium Sitrat 0.450 g, Sorbitol 4.465 g', '-', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '21000'),
(639, 'MILOS 5 ML INJ', 'Midazolam', '5 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '5671.6'),
(640, 'Miloz 5 mg inj', 'Midazolam', '5 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '5672'),
(641, 'MINIASPI 80 MG TAB', 'Asam asetilsalisilat (asetosal) ', '80 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '163'),
(642, 'Minirin  0.1 mg tab', 'Desmopresin', '0.1 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '14886'),
(643, 'Minirin 0.2 mg tab', 'Desmopresin', '0.2 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '25100'),
(644, 'MOFACORT CREAM 10 GR', 'Mometason ', '1%', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '38390'),
(645, 'MOLOCO B12 TAB', 'Cyanocobalamin, placenta extrac', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '3520'),
(646, 'MOMETASONE FUROATE KRIM 5 GR', 'Mometason ', '0.10%', 'Salep Kulit', 'Others', 'Generik', 'Fornas', '13715'),
(647, 'Morfikaf 10 mg tab', 'Morfin Hcl', '10 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '4033.33'),
(648, 'MORPHIN HCL INJ', 'Morfin Hcl', '10 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '34049.95'),
(649, 'Moxifloxacin Infus 400 mg/250ml', 'Moksifloksasin', '400 mg', 'Infus', 'Parentheral', 'Generik', 'Fornas', '220000'),
(650, 'MOXIFLOXACIN TAB', 'Moksifloksasin', '400 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '41999.98'),
(651, 'Mozuku capsul', 'Fukoidan', '-', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '12999.8'),
(652, 'MST CONTINUS 10 MG TAB', 'Morfin Hcl tab SR', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '15620'),
(653, 'MST Continus 15 mg tab', 'Morfin Hcl tab SR', '15 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '22990'),
(654, 'MST Continus 30 mg tab', 'Morfin Hcl tab SR', '30 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '41470'),
(655, 'Mucos drop', 'Ambroxol', '15 mg/ml', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '47499'),
(656, 'MUCOSTA 100MG TAB', 'Rebamipide', '100 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '6500'),
(657, 'Multivitamin Sivit Zinc  tab', 'Zinc, vitamin', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '0'),
(658, 'MYCAMINE inj', 'Mikafungin', '50 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '720374'),
(659, 'Myfortic 180 mg caps', 'Mycophenolate Na', '180 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '8000'),
(660, 'Myfortic 360 caps', 'Mycophenolate Na', '360 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '16000.01'),
(661, 'Myonal tablet', 'Eperison', '50 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '7856.59'),
(662, 'Myores tab', 'Eperison', '50 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '4950'),
(663, 'NA DIKLOFENAC 50 MG TAB', 'Natrium Diklofenak', '50 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '300'),
(664, 'NaCl 0,9 % Infus Wida', 'Natrium Klorida', '0.9%', 'Infus', 'Parentheral', 'Generik', 'Fornas', '9515'),
(665, 'Nacl 100 ml B.Braun inf', 'Natrium Klorida', '-', 'Infus', 'Parentheral', 'Generik', 'Fornas', '9900'),
(666, 'NaCl 1000 ml B.Braun', 'NaCl 1000 ml B.Braun', '-', 'Infus', 'Parentheral', 'Generik', 'Fornas', '19800'),
(667, 'NaCl 3% / SALIN 3 [Otsu] inf', 'Natrium Klorida', '3%', 'Infus', 'Parentheral', 'Generik', 'Fornas', '30334.7'),
(668, 'NAIRET INJ', 'Terbutalin ', '0.5 mg/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '26400'),
(669, 'Nasacort AQ Spray', 'Triamcinolone', '-', 'Nasal Spray', 'Others', 'Non Generik', 'Non Fornas', '112000'),
(670, 'Nasalyn spray', 'Diluted sea water dan isoton', '-', 'Nasal Spray', 'Others', 'Non Generik', 'Fornas', '117999.2'),
(671, 'Nasea 0.3 mg injeksi', 'Ramosetron', '0.3 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '331999.8'),
(672, 'Nateran 25 mg tab ', 'Eksemestan', '25 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '44000'),
(673, 'Natrium Bicarbonat tab', 'Natrium bikarbonat', '500 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '162.25'),
(674, 'Navelbine 10 mg inj', 'Vinorelbin', '10 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '641862.1'),
(675, 'Nefrofer inj', 'Besi Sukrosa', '20 mg/5 ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '48400'),
(676, 'Neuciti 250 mg Inj', 'Citikolin', '250 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '41250'),
(677, 'Neurobion 5000 Dual inj', 'Tiamin (vitamin B1), Piridoksin (vitamin B6), Sianokobalamin (vitamin B12)', '-', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '10300'),
(678, 'NEUROBION TAB.', 'Tiamin (vitamin B1), Piridoksin (vitamin B6), Sianokobalamin (vitamin B12)', '-', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1768'),
(679, 'Neurocet 800 tablet', 'Piracetam', '800 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '2035'),
(680, 'NEURODEX TAB', 'Tiamin (vitamin B1), Piridoksin (vitamin B6), Sianokobalamin (vitamin B12)', '-', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '605'),
(681, 'NEUROSANBE 5000 TAB', 'Tiamin (vitamin B1), Piridoksin (vitamin B6), Sianokobalamin (vitamin B12)', '-', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '2810.5'),
(682, 'NEUROSANBE TAB', 'Tiamin (vitamin B1), Piridoksin (vitamin B6), Sianokobalamin (vitamin B12)', '-', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1314.5'),
(683, 'NEUROTAM SYRUP 100 ML', 'Piracetam', '500 mg/5 ml', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '82500'),
(684, 'Neviral tab (Nevirapine)', 'Nevirapine', '200 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '0'),
(685, 'NEW DIATAB TAB', 'Atapulgit', '-', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '605'),
(686, 'NICARDIPINE INJ', 'Nikardipin', '1 mg/ml', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '24000.02'),
(687, 'NIFEDIPIN 10 MG TAB', 'Nifedipin', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '163.19'),
(688, 'NIFLEC SERBUK', 'Polietilen glikol', '-', 'Serbuk', 'Oral', 'Non Generik', 'Fornas', '176000'),
(689, 'NIMOTOP INFUS 50 ML', 'Nimodipin', '2%', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '341199.1'),
(690, 'NIMOTOP TABLET', 'Nimodipin', '30 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '3841.99'),
(691, 'NITROKAF FORTE KAPS', 'Gliseril trinitrat', '5 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '2761.99'),
(692, 'NITROKAF RETARD TAB', 'Gliseril trinitrat', '2.5 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '1800.84'),
(693, 'Norages Syrup', 'Metamizol', '250 mg/5 ml ', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '34100'),
(694, 'NORELUT TAB', 'Noretisteron', '5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '4730'),
(695, 'NOREPINEPHRINE BITARTRATE 4 MG INJ', 'Norepinefrin', '4mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '66000'),
(696, 'Noros caplet', 'Ekstrak grapeseed 50 mg, Lycopene 5 mg, vit.E 30 IU, vit.C 100 mg, vit.B', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '2915'),
(697, 'NOVO RAPID FLEXPEN', 'Analog insulin : fast acting', '-', 'Flexpen', 'Parentheral', 'Non Generik', 'Fornas', '87000'),
(698, 'NOVOMIX-30 FLEXPEN', 'Analog insulin : mix insulin', '-', 'Flexpen', 'Parentheral', 'Non Generik', 'Fornas', '110968'),
(699, 'Nutribreast kapsul', 'EkstrÂ Sauropus androgynusÂ 300 mg, DHA 105 mg, EPA 26 mg', '-', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '11999.97'),
(700, 'Nutriflam Neo tab', 'Boswellia serrata extr 100 mg, Curcuma 250 mg, Bioperine 2.5 mg, vitamin', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '14999.97'),
(701, 'Nutriflam tablet', 'Boswellia serrata extr 100 mg, Curcuma 250 mg, Bioperine 2.5 mg, vitamin', '-', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '10581.45'),
(702, 'OBH SYR ( GENERIK)', 'Succus liquiritae, ammunium klorida, ammonium anisi spir', '-', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '6600'),
(703, 'Octaflex 500 IU inf', 'Faktor II, VII, IX , X (konsentrat) ', '500 iu', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '5445000'),
(704, 'Octagam 5% inf', 'Imunoglobulin ', '2.5 g', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '2150000'),
(705, 'OCTALBIN 20 % 100 CC inf', 'Albumin serum normal (human albumin)', '20%', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '860000'),
(706, 'Octalbin 25% 100 ml inf', 'Albumin serum normal (human albumin)', '25%', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '1674999.7'),
(707, 'Octanine F 500 IU/ml inf', 'Faktor IX (konsentrat) ', '500 iu', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '4929980'),
(708, 'ODR 4 mg/5 ml Syrup', 'Ondansetron', '4 mg/5 ml', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '150000'),
(709, 'Ofloxacin 200 mg tab', 'Ofloxacin', '200 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '697.99'),
(710, 'OFLOXACIN 400 MG TAB', 'Ofloksasin ', '400 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '900'),
(711, 'Olanzapine 10 mg tab', 'Olanzapine', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '4725'),
(712, 'OMEPRAZOLE 20 MG KAP', 'Omeprazol', '20 mg', 'Kapsul', 'Oral', 'Generik', 'Fornas', '528'),
(713, 'OMEPRAZOLE INJ', 'Omeprazol', '20 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '42000'),
(714, 'OMNISCAN 287 MG/ML INJ', 'Gadodiamid', '287 mg/ml', 'Infus', 'Parentheral', 'Non Generik', 'Non Fornas', '368500'),
(715, 'ONDANSETRON 4 MG TAB', 'Ondansetron', '4 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1700'),
(716, 'ONDANSETRON 4MG/2ML INJ', 'Ondansetron', '4 mg/2 ml', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '5445'),
(717, 'ONDANSETRON 8 MG/4 ML INJ', 'Ondansetron', '4 ml', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '8712'),
(718, 'ONDANSETRON 8 MG TAB', 'Ondansetron', '8 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1700'),
(719, 'ORALIT SAC', 'Garam oralit kombinasi : natrium klorida 0,52 g + kalium klorida 0,30 g + trinatrium sitrat 0,58 g + glukosa anhidrat 2,7 g', '-', 'Serbuk', 'Oral', 'Generik', 'Fornas', '608'),
(720, 'Orinox 90 mg tab', 'Etoricoxib', '90 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '11000'),
(721, 'Oscal 0.5 mg kapsul', 'Calcitriol', '0.5 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '9817.5'),
(722, 'Oseltamivir 75 mg tab', 'Oseltamivir', '75 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '16500'),
(723, 'Osteonate OAW tab', 'Asam Hyalorunat', '5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '52500'),
(724, 'Ostriol 0.25 mg caps', 'Ostriol', '0.25 mg', 'Kapsul', 'Oral', 'Generik', 'Fornas', '1705'),
(725, 'OTOPAIN TETES TELINGA', 'Neomisin, polimiksin, fludrokortison asetat, lidokain', '-', 'Tetes Telinga', 'Others', 'Non Generik', 'Fornas', '67100'),
(726, 'Oxaliplatin 100 mg inj', 'Oxaliplatin', '100 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '533550'),
(727, 'Oxaliplatin 50 mg inj', 'Oxaliplatin', '50 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '266775.3'),
(728, 'Oxoferin Sol.', 'Tetrachlorodecaoxide dan glycerine', '-', 'Larutan', 'Others', 'Non Generik', 'Non Fornas', '77000'),
(729, 'OXYTOCIN INJ', 'Oksitosin', '10 iu', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '2750'),
(730, 'Paclitaxel 100 mg inj', 'Paclitaxel', '100 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '260001.5'),
(731, 'Paclitaxel 30 mg inj', 'Paclitaxel', '30 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '130500'),
(732, 'Palofer Inj', 'Palonosetron HCl', '0.05/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '165000'),
(733, 'Pantomex inj', 'Pantoprazol', '40 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '159500'),
(734, 'PANTOPRAZOLE INJEKSI', 'Pantoprazol', '40 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '40700'),
(735, 'PARACETAMOL DROP', 'Parasetamol', '120 mg/5 ml', 'Syrup', 'Oral', 'Generik', 'Fornas', '7700'),
(736, 'PARACETAMOL INFUS', 'Parasetamol', '1 g', 'Infus', 'Parentheral', 'Generik', 'Fornas', '25000'),
(737, 'PARACETAMOL SYR', 'Parasetamol', '120 mg/ 5 ml', 'Syrup', 'Oral', 'Generik', 'Fornas', '3493.33'),
(738, 'PARACETAMOL TAB', 'Parasetamol', '500 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '170.5'),
(739, 'PARATUSIN TAB', 'Noscapin, CTM, GG, parasetamol, phenylpropanolamin', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '576.92'),
(740, 'Pariet  20  mg tab', 'Rabeprazole Na', '20 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '26199.96'),
(741, 'Pariet 10 mg tab', 'Rabeprazole Na', '10 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '18561.48'),
(742, 'PEHACAIN INJ', 'Anestetik lokal gigi kombinasi : lidokain hcl 2% + epinefrin 1 : 80.000 ', '2 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '3113.06'),
(743, 'Peinlos 400 Inj', 'Ibuprofen', '400 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '55000'),
(744, 'Pepsol 20 mg tab', 'Pantoprazol', '20 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '17999.3'),
(745, 'Pepzol 40 mg tab', 'Pantoperazol', '40 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '23499.96'),
(746, 'Pepzol Inj', 'Pantoperazol', '40 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '154000'),
(747, 'Pervita Tablet', 'Vit A 10000 IU, vit B1 20mg, vit B2 5mg, nicotinamide 50mg, vit B6 10mg, ca pantothenate 11,6mg, dll.', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '1447'),
(748, 'Pharolit Sitras', 'Garam oralit kombinasi : natrium klorida 0,52 g + kalium klorida 0,30 g + trinatrium sitrat 0,58 g + glukosa anhidrat 2,7 g', '-', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '1357'),
(749, 'PHENOBARBITAL 30 MG TAB', 'Fenobarbital ', '30 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '240'),
(750, 'PHENYTOIN CAP', 'Fenitoin Na', '50 mg/ml', 'Kapsul', 'Oral', 'Generik', 'Fornas', '634'),
(751, 'PHENYTOIN INJ', 'Fenitoin Na', '50 mg/ml', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '4121.04'),
(752, 'PICYN INJ 750 MG', 'Ampisilin  + Sulbaktam', '750 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '63250'),
(753, 'PIOGLITAZONE 30MG TAB', 'Pioglitazon', '30 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '4675'),
(754, 'Piracetam 800 mg tab', 'Piracetam', '800 mg', 'Tablet', 'Oral', 'Generik', 'Non Fornas', '836'),
(755, 'PIRACETAM INJ 3 GR', 'Piracetam', '3 g', 'Injeksi', 'Parentheral', 'Generik', 'Non Fornas', '11000'),
(756, 'PIROTOP CREAM 2% 5 GR', 'Mupirocin', '2%', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '65650'),
(757, 'PLASBUMIN 20% 100 ml', 'Albumin serum normal (human albumin)', '20%', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '858000'),
(758, 'PLASBUMIN 25 % 100 ML', 'Albumin serum normal (human albumin)', '25%', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '1509999'),
(759, 'PLASMINEX 500 INJ', 'Asam traneksamat ', '500 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '13668'),
(760, 'PLASMINEX 500 TAB', 'Asam traneksamat ', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '2904'),
(761, 'PLAVIX TAB', 'Klopidogrel', '75 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '33999.98'),
(762, 'PLETAAL 100 MG TAB', 'Silostazol', '100 mg', 'Tablet ', 'Oral', 'Non Generik', 'Fornas', '5800.3'),
(763, 'PLETAAL 50 MG TAB', 'Silostazol', '50 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '9335'),
(764, 'Pletaal SR 100 mg tab', 'Silostazol', '100 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '5800.3'),
(765, 'Polyren  Sachet  5 g', 'Ca Polistirene Sulfonate', '-', 'Serbuk', 'Oral', 'Non Generik', 'Non Fornas', '14300'),
(766, 'PONDEX SYRUP 60 ML', 'Asam mefenamat', '250 mg/5 ml ', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '11275'),
(767, 'PRADAXA 110 MG TAB', 'Fondaparinuks ', '110 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '35950.02'),
(768, 'PRADAXA 75 MG CAP', 'Fondaparinuks ', '75 mg ', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '14799.95'),
(769, 'PREDNISON 5 MG TAB', 'Prednison', '5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '181.5'),
(770, 'Pregabalin 75 mg kapsul', 'Pregabalin', '75 mg', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '7865'),
(771, 'Primet 25 mg tab', 'Primetamin', '25 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '2200'),
(772, 'PRIMOLUT N 5 MG TAB', 'Noretisteron', '5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '5320'),
(773, 'PRO TB 2 KID tab', 'Rifampicin 150 mg, INH 150 mg', '150 mg-150 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '3300'),
(774, 'PRO TB 2 TSS  tab', 'Rifampicin 150 mg, INH 150 mg', '150 mg-150 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '7246.25'),
(775, 'Pro TB 3 Kid tab', 'Rifampicin 75 mg, INH 50 mg, pyrazinamide 150 mgSumber:Â https://www.farmasi-id.com/pro-tb-3/', '-', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '4675'),
(776, 'PRO TB 4 TSS tab', 'Rifampicin 150mg, Isoniazid 75 mg, Pirazinamid 400mg, Ethambutol 275 mg', '-', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '5426.65'),
(777, 'Probiostim tab', 'Probiotics 3 x 109 CFU, Lactobacillus helveticus R0052 (60%), Bifidobacterium infantis R0033 (20%), Bifidobacterium bifidum R0071 (20%), 80 mg', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '14000'),
(778, 'Prograf 1 mg caps', 'Takrolimus', '1 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '28380'),
(779, 'Prohiper 10 mg tab', 'Metilfenidat HCl', '10 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '5500'),
(780, 'Prolepsi tab', 'Okskarbasepin', '300 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '7524'),
(781, 'Promuba syr', 'Metronidazol', '125 mg/5 ml', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '42900'),
(782, 'PROPANOLOL 10 MG TAB', 'Propranolol ', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '97.41'),
(783, 'PROPANOLOL 40 MG TAB', 'Propranolol ', '40 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '299.92'),
(784, 'PRORENAL TAB.', 'Dl-3- metil-okso asam valerianat (analog)', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '6600'),
(785, 'PROSOGAN 30 MG INJ', 'Lansoprazol', '30 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '92500'),
(786, 'Protofen Supp 100 mg', 'Ketoprofen', '100 mg', 'Supp', 'Others', 'Non Generik', 'Fornas', '9137'),
(787, 'Prove D3 1000 IU tab', 'Vitamin D3 Cholecalciferol', '1000 iu', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '2420'),
(788, 'PTU TAB', 'Propiltiourasil', '100 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '546.02'),
(789, 'PULMICORT RESPULES 0.5 MG', 'Budesonid ', '5 mg', 'Respules', 'Others', 'Non Generik', 'Fornas', '17847.06'),
(790, 'PUMPISEL INJ', 'Pantoprazol', '40 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '162855'),
(791, 'PUMPITOR INJ', 'Omeprazol', '40 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '165000'),
(792, 'PYRAZINAMID 500 MG TAB', 'Pirazinamid', '500 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '500'),
(793, 'Quatro tab', 'Asam folat', '400 mcg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '3850'),
(794, 'Ramipril 2,5 mg tab', 'Ramipril', '2.5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '352'),
(795, 'RAMIPRIL 5 MG TAB', 'Ramipril', '5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '635.8'),
(796, 'RANITIDIN 150 MG TAB', 'Ranitidin', '150 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '302.5'),
(797, 'RANITIDIN INJ', 'Ranitidin', '25 mg/ml', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '3201.67'),
(798, 'Rebozet FCT 25 mg tab', 'Eltrombopag olamine', '25 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '113234.88'),
(799, 'Rebozet FCT 50 mg tab', 'Eltrombopag olamine', '50 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '226471'),
(800, 'Recormon PFS 2000 IU inj', 'Epoetin Beta', '2000 iu', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '128500'),
(801, 'Redoxon tab', 'Vitamin C dan Zink', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '44495'),
(802, 'REGIVELL 4 ML INJ', 'Bupivakain', '4 ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '60500'),
(803, 'Remdesevir Inj', 'Remdesevir', '100 mg', 'Injeksi', 'Parentheral', 'Generik', 'Non Fornas', '0'),
(804, 'Remikaf 2 mg inj', 'Remifentanil', '2 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '127600'),
(805, 'Renogen 3000 IU inj', 'Epoetin Beta', '3000 iu', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '99000'),
(806, 'Renvela tab', 'Sevelamer Karbonat', '800 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '29090'),
(807, 'Renxamin 200 ml inf', 'Amino acid 9%, chloride, acetate', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '106150'),
(808, 'Resfar 25 ml injeksi', 'N-asetil sistein', '200 mg/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '218900'),
(809, 'RETAPYL SR TAB.', 'Teofilin', '300 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1475'),
(810, 'Reviral tab (Zidovudin)', 'Zidovudin', '300 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '0'),
(811, 'Rexta 50 mg inj', 'Oxaliplatin', '50 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '250000'),
(812, 'Rheu-Trex tab', 'Methotrexate', '2.5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '3100'),
(813, 'RHINOFED TAB', 'Pseudoefedrin, terfenadin', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '2300'),
(814, 'Rhinofed syr', 'Pseudoefedrin', '15 mg/5 ml', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '27500'),
(815, 'Rhinos SR tab', 'Pseudoefedrin', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '6050'),
(816, 'Rhodium tab', 'Diosmin 450 mg, hesperidin 50 mg.', '450 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '6050'),
(817, 'RIBACTER 500 mg INJ', 'Doripenem Monohidrat', '500 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '529666'),
(818, 'RIFAMPICIN 300 MG TAB', 'Rifampisin', '300 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1402.5'),
(819, 'RIFAMPICIN 450 MG TAB', 'Rifampisin', '450 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1815'),
(820, 'RIFAMPICIN 600 MG TAB', 'Rifampisin', '600 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '2585'),
(821, 'RIFAMTIBI 450 MG TAB', 'Rifampisin', '450 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1815'),
(822, 'Rimactazid 450/300 mg tab', 'Rifampisin 450 mg, INH 300 mg', '450 mg-300 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '8514'),
(823, 'RINDONEM 1 G INJ', 'Meropenem ', '1 g', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '7630.1'),
(824, 'Ringer Dekstrose Inf', 'Ringer Dekstrose', '-', 'Infus', 'Parentheral', 'Generik', 'Fornas', '12012'),
(825, 'Ringer Laktat inf B.Barun', 'Ringer Laktat', '-', 'Infus', 'Parentheral', 'Generik', 'Fornas', '8800'),
(826, 'RINOFER INJ', 'Ferri hidroksi sucrose komplek', '20 mg/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '88000'),
(827, 'Risperidone 2 mg tab', 'Risperidon', '2 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '347'),
(828, 'Rituxikal 500 mg inj', 'Rituximab', '500 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '7128000'),
(829, 'RL INF', 'Ringer Laktat Larutan', '-', 'Infus', 'Parentheral', 'Generik', 'Fornas', '7630'),
(830, 'Roculax inj', 'Rokuronium', '10 mg/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '65000'),
(831, 'Rosuvastatin Calcium 10 mg tab', 'Rosuvastatin Calcium', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1650'),
(832, 'Ryzodeg Flex Touch ', 'Analog insulin : mix insulin', '-', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '312004'),
(833, 'SA INJ', 'Atropin Sulfas', '0.25 mg/ml', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '2541'),
(834, 'SABU INJ 5 ML', 'Serum anti bisa ular : A.B.U. I ', '-', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '0'),
(835, 'Sagestam 80 mg/2 ml Inj', 'Gentamisin', '80 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '14999.82'),
(836, 'Sagestam cream', 'Gentamisin', '0.1%', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '13530'),
(837, 'SALBUTAMOL 2 MG TAB', 'Salbutamol', '2 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '113.28'),
(838, 'SALBUTAMOL 4 MG TAB', 'Salbutamol', '4 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '120.18'),
(839, 'SALOFALK 250MG KAPSUL', 'Mesalazin', '250mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '13679.82'),
(840, 'Salofalk 500 mg kapsul', 'Mesalazin', '500 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '13680'),
(841, 'Salticin 80 mg inj', 'Gentamisin', '80 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '14600'),
(842, 'Sancoidan kap', 'Fukoidan', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '16500'),
(843, 'SANDEPRIL TAB', 'Maprotilin hcl', '50 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '3476'),
(844, 'Sandimun 100 mg tab', 'Siklosporin', '100 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '42999.99'),
(845, 'Sandimun 25 mg tab', 'Siklosporin', '25 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '12000.01'),
(846, 'Sanfuliq tablet', 'Curcuma 150 mg, silybin phospholipids 140 mg, Schizandrae fructus extr 135 mg, choline L-bitartrate 150 mg, vit B', '-', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '5747.5'),
(847, 'Sangobion Drop', 'Iron Polymaltose Complex 23.53mg, asam folat 80 mcg dll', '-', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '17000'),
(848, 'SANMAG TAB', 'Mg trisilikat, AlOH, dimetikon', '-', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '929.5'),
(849, 'SANMOL DROP', 'Parasetamol', '100 mg/ml', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '22000'),
(850, 'SANMOL INFUS', 'Parasetamol', '1 g', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '67210'),
(851, 'SANMOL SYR', 'Parasetamol', '120 mg/5 ml', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '12870'),
(852, 'SANMOL TAB', 'Parasetamol', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '319'),
(853, 'Sanotake tab', 'Serbuk maitake, Ester C 20 mg', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '20167'),
(854, 'SANPRIMA FORTE', 'Kombinasi : sulfametoksazol + trimetoprim ', '800 mg-160 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '2140'),
(855, 'SANPRIMA TAB', 'Kombinasi : sulfametoksazol + trimetoprim ', '480 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '858'),
(856, 'SANSULIN N INJ', 'Basal human insulin, isophane human insulin', '-', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '92000'),
(857, 'SANTA E TAB', 'Vitamin E', '400 iu', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '1500'),
(858, 'SANTAGESIK INJ', 'Metamizol', '500 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '16667'),
(859, 'SANTOCYN INJ', 'Oksitosin', '10 iu/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '14545'),
(860, 'Scabimite 30 gr', 'Permethrin', '5%', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '80300'),
(861, 'SCABIMITE CREAM 10 GR', 'Gameksan, asam usnat', '5%', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '12155'),
(862, 'SEQUEST SACH', 'Kolestiramin', '4 g', 'Serbuk', 'Oral', 'Non Generik', 'Fornas', '26900'),
(863, 'SERETIDE DISKUS 250', 'Kombinasi: salmeterol 50 mcg+ flutikason propionat 250 mcg', '500 mcg', 'Spray', 'Others', 'Non Generik', 'Fornas', '124733.4'),
(864, 'SERETIDE MDI 125 ', 'Kombinasi: salmeterol 50 mcg+ flutikason propionat 250 mcg', '250 mcg', 'Spray', 'Others', 'Non Generik', 'Fornas', '132000'),
(865, 'SERTRALINE HCL 50 MG TAB', 'Sertralin', '50 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '9000'),
(866, 'SIBITAL INJ', 'Fenobarbital ', '200 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '10890'),
(867, 'SIFROL 0,375 MG TAB', 'Pramipeksol ', '0.375 mg ', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '8300.01');
INSERT INTO `obat` (`idObat`, `namaObat`, `namaGenerik`, `kekuatan`, `bentuk`, `jenis`, `generik`, `fornas`, `hargaSatuan`) VALUES
(868, 'SILDENAFIL CITRATE 100 MG TAB', 'Sildenafil', '100 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '47300'),
(869, 'SIMARC-2', 'Warfarin', '2 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1501.5'),
(870, 'Simdes Syrup', 'Desloratadine', '2.5 mg/5 ml', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '103199.8'),
(871, 'Simprazol Inj', 'Omeprazol', '40 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '181500'),
(872, 'SIMVASTATIN 10 MG TAB', 'Simvastatin', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '540'),
(873, 'SIMVASTATIN 20 MG TAB', 'Simvastatin', '20 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '237'),
(874, 'Sistenol tablet', 'Parasetamol, N-Asetilsitein', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '2200'),
(875, 'SMECTA / SACH', 'Dioctahedral smectit', '-', 'Serbuk', 'Oral', 'Non Generik', 'Non Fornas', '3667'),
(876, 'Smoflipid 20% 100 ml inf', 'Refined soybean oil 6 g, medium chain triglycerides 6 g, refined olive oil 5 g, purified fish oil 3 g.', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '84315'),
(877, 'SNMC/Stronger Neo MC inj', 'Monoammonium glycyrrhizinate (sebagai glycyrrhizin) 40 mg, asam amino asetat (JP) 400 mg, L-cysteine HCL 20 mg', '-', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '115500'),
(878, 'Solac syrup', 'Laktulosa', '3.335 g', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '79200'),
(879, 'Somatostatin Lyomark inj', 'Somatostatin', '3 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '774400'),
(880, 'Sotatic Inj', 'Metoklopramid', '5 mg/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '4400'),
(881, 'SPIRAMYCIN 500 TAB', 'Spiramisin', '50 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '2492.6'),
(882, 'SPIRIVA REFILL', 'Tiotropium', '2.5 mcg', 'Spray', 'Others', 'Non Generik', 'Fornas', '452999.8'),
(883, 'SPIRONOLACTONE 25 MG TAB', 'Spironolakton', '25mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '381'),
(884, 'SPIRONOLAKTON 100 MG TAB', 'Spironolakton', '100 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1160'),
(885, 'Sporetik 200 mg kaps', 'Sefiksim', '200 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '31405'),
(886, 'SPORETIK CAPS 100 MG', 'Sefiksim', '100 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '21208'),
(887, 'Sporetik Syrup', 'Cefixim', '100 mg/5 ml', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '91795'),
(888, 'Stablon tab', 'Tianeptine', '12.5 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '9159'),
(889, 'Stalevo 100 mg tab', 'Levodopa 100 mg, carbidopa 25 mg, entacapone 200 mg', '100 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '8899.99'),
(890, 'STELAZIN 5 MG TAB', 'Trifluoperazin ', '5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1087'),
(891, 'STESOLID INJ 2 ML', 'Diazepam', '5 mg/2 ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '5400'),
(892, 'STESOLID SUPP 10/rectal tube', 'Diazepam', '10 mg/tube', 'Supp', 'Others', 'Non Generik', 'Fornas', '21021'),
(893, 'STESOLID SUPP 5/rectal tube', 'Diazepam', '5 mg/tube', 'Supp', 'Others', 'Non Generik', 'Fornas', '14458.4'),
(894, 'Stobled Caps', 'Radix et rhizoma notogingseng, borneolum syntheticum, rhizoma dioscoreae nipponiceae, dll', '-', 'Kapsull', 'Oral', 'Non Generik', 'Non Fornas', '7425'),
(895, 'STREPTOMYCIN INJ 1000 MG', 'Streptomisin', '1 g', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '7700'),
(896, 'SULFADIAZINE SILVER CREAM 35 GR', 'Perak sulfadiazin', '1%', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '22999.9'),
(897, 'SULFAZALANINE 500 KAP', 'Sulfasalazin', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '2200'),
(898, 'Supportan Syr', 'Fat (medium- & long-chain triglyceride, fish oil) 7 g, protein 10 g, carbohydrate 12 g, Na 45 mg, K 130 mg, Vitamin ', '-', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '32450'),
(899, 'SUPRAFENID SUPP', 'Ketoprofen', '100 mg', 'Supp', 'Others', 'Non Generik', 'Fornas', '2379.96'),
(900, 'Supralysin drop', 'Vitamin B1, B2, B6, B12, A, D, C ,nicotinamide, lysine HCl.', '-', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '30250'),
(901, 'Supralysin syr 60 ml', 'Vitamin B1, B2, B6, B13, A, D, C ,nicotinamide, lysine HCl.', '-', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '24200'),
(902, 'Survanta 25 mg/ml', 'Beractant', '25 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '3499999.8'),
(903, 'Sustanon Inj 250 mg/ml', 'Testosteron', '250 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '209878.9'),
(904, 'SYMBICORT 160/4,5 UG 60ML', 'Budesonid-formoterol', '160/4.5 mcg', 'Spray', 'Others', 'Non Generik', 'Fornas', '135000'),
(905, 'SYMBICORT 80/4.5 UG', 'Budesonid-formoterol', '80/4.5 mcg', 'Spray', 'Others', 'Non Generik', 'Fornas', '126000'),
(906, 'TABLET TAMBAH DARAH', 'Ferro fumarat 60 mg + asam folat 0,4 mg ', '60 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '409'),
(907, 'Tamicil 4.5 mg inj', 'Piperacilin-Tasobactam', '4.5 g', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '286000'),
(908, 'TAMOFEN 10 MG TAB', 'Tamoksifen', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1987'),
(909, 'TAMOFEN 20 MG TAB', 'Tamoksifen', '20 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1986.97'),
(910, 'TAMOLIV 100 ml', 'Parasetamol', '1 g', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '49500'),
(911, 'TANAPRESS 10 MG TAB', 'Imidapril', '10 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '4735.01'),
(912, 'TANAPRESS 5 MG TAB', 'Imidapril', '5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '2530'),
(913, 'Tapros 3M depot inj', 'Leuprorelin', '3 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '3100000'),
(914, 'Tapros Inj 1,88 mg inj', 'Leuprorelin', '1.88 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '780000'),
(915, 'TARIVID OTIC SOLOTION', 'Ofloksasin', '0.3%', 'Tetes Telinga', 'Others', 'Non Generik', 'Fornas', '84700'),
(916, 'Tasigna 200 mg caps', 'Nilotinib', '200 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '95219'),
(917, 'Tasigna HGC 150 mg caps', 'Nilotinib', '150 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '35200'),
(918, 'TAXEGRAM INJ 1 GR', 'Sefotaksim', '2 g', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '156970'),
(919, 'Tazam 4.5 g Inj', 'Piperacilin-Tasobactam', '4.5 g', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '302500'),
(920, 'Tebokan Forte 120 mg tab', 'Ginkgo biloba extr (EGb761) 40 mg, standardized at 9.6 mg Ginkgoflavone glycosides', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '17123'),
(921, 'TEBOKAN SP TAB', 'Gingko biloba', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '11715'),
(922, 'TEBOKAN TAB', 'Gingko biloba', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '5841'),
(923, 'Telmisartan 80 mg tab', 'Telmisartan', '80 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '6200'),
(924, 'Temodal 100 mg caps', 'Temozolomide', '100 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '1170000'),
(925, 'Temodal 20 mg caps', 'Temozolomide', '20 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '230000'),
(926, 'Tenofovir tab', 'Tenofovir', '300 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '0'),
(927, 'TETAGAM INJ', 'Human tetanus imunoglobulin', '250 iu', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '206800'),
(928, 'THEOBRON KAP', 'Teofilin', '300 mg', 'Kapsul', 'Oral', 'Non Generik', 'Fornas', '990'),
(929, 'THROMBOPHOB GEL', 'Heaprin Na', '5000 iu', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '54450'),
(930, 'THYROZOL 10 MG TAB', 'Tiamazol', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '1621.4'),
(931, 'THYROZOL 5 MG TAB', 'Tiamazol', '5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '689'),
(932, 'Tiriz Drop', 'Cetrizin', '5 mg/ml', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '85000'),
(933, 'TKV Tab @ 30', 'Entekavir', '0.5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '29333'),
(934, 'Tofedex tab', 'Dexketoprofen', '25 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '9200'),
(935, 'TOMIT INJ 2 ML', 'Metoklopramid', '2 ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '11165'),
(936, 'Tomit tab', 'Metoklopramid', '10 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '440'),
(937, 'Topamax 100 mg tab', 'Topiramat', '100 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '11220'),
(938, 'Topamax 25 mg tab', 'Topiramat', '25 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '2950'),
(939, 'TOPAZOL INJ', 'Pantoprazol', '40 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '161700'),
(940, 'Tracetat Syr', 'Megestrol Asetat', '40 mg/ml', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '401500'),
(941, 'Tracetat tablet', 'Megestrol Asetat', '160 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '23100'),
(942, 'TRAMADOL INJ', 'Tramadol', '25 mg/ml', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '6402'),
(943, 'TRAMADOL KAPSUL', 'Tramadol', '50 mg', 'Kapsul', 'Oral', 'Generik', 'Fornas', '825'),
(944, 'TREMENZA TAB', 'Pseudoefedrin, triprolidin', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '1600.5'),
(945, 'Triamcinolone tab', 'Triamcinolone', '4 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '876.65'),
(946, 'Trifacort 5 mg (prednison) tab', 'Prednison', '5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '238.24'),
(947, 'Trifluoperazin 5 mg tab', 'Trifluoperazin', '5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '682'),
(948, 'TRIFLUOPERAZINE 5 MG TAB', 'Trifluoperazin ', '5 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '682'),
(949, 'TRIHEXYPHENIDIL 2 MG', 'Triheksifenidil', '2 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '116'),
(950, 'TRILAC INJ', 'Triamcinolone', '10 mg/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '4583'),
(951, 'TRIOFUCIN 500 INF', 'Fruktosa, glucosa, xylitol', '-', 'Infus', 'Parentheral', 'Non Generik', 'Non Fornas', '77000'),
(952, 'Trisetron 8 mg tab (Ondan)', 'Ondansetron', '8 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '2200'),
(953, 'TRIZEDON MR TAB', 'Trimetazidin', '35 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '3593'),
(954, 'Trolip 160 tablet', 'Fenofibrate', '160 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '13000'),
(955, 'Trovensis 8 mg inj 4 ml', 'Ondansetron', '8 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '75614'),
(956, 'TUTOFUCIN OPS INF', 'Larutan mengandung Karbohidrat + Elektrolit (Larutan nutrisi kombinasi infus per L: Na. 100mEQ, K 18mEQ, Ca. 4mEQ, Mg 6mEQ, Cl 90mEQ, Asetat 38mEQ, Sorbitol 50g)', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '41500'),
(957, 'Tygacil 50 mg inj', 'Tigesiklin', '50 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '809482.3'),
(958, 'Tykerb 250 mg tab', 'Lapatinib', '250 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '72600'),
(959, 'Ubi Q 100 mg kapsul', 'Coenzym  Q10', '100 mg', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '14687'),
(960, 'ULSAFATE SUSP 100 ML', 'Sukralfat', '500 mg/5 ml', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '10200'),
(961, 'ULSAFATE SUSP 200 ML', 'Sukralfat', '500 mg/5 ml', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '28000'),
(962, 'ULSIDEX 500 MG TAB', 'Sukralfat', '500 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '1234.2'),
(963, 'ULTRACET 37.5 MG TAB', 'Paracetamol, tramadol', '375 mg-37.5 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '5803'),
(964, 'UMARONE 2 ML INJ', 'Natrium hialuronat ', '10 mg/ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '192500'),
(965, 'Urinter tab', 'Asam Pipemidat', '400 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '5857.5'),
(966, 'Urogetix 100 mg Caplet', 'Phenazopyridine HCl 100 mg', '100 mg', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '5107.3'),
(967, 'Urografin inj', 'Sodium amidotrizoate dan meglumine amidotrizoate', '76%', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '85800'),
(968, 'Uromitexan 400 mg inj', 'Uromitexan', '400 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '99095.7'),
(969, 'Urotractin 400 mg tab', 'Asam Pipemidat', '400 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '3410'),
(970, 'URSODEOXYCHOLIC ACID 250 MG KAPS', 'Asam ursodeoksikolat ', '250 mg', 'Kapsul', 'Oral', 'Generik', 'Fornas', '3138.3'),
(971, 'UTROGESTAN 100 MG TAB', 'Progesteron termikronisasi', '100 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '10050'),
(972, 'VAGISTIN OVULA', 'Metronidazol, Nystatin', '500 mg-100,000 iu', 'Tab Ovula', 'Others', 'Non Generik', 'Fornas', '15125'),
(973, 'Valcyte FC Tab 450 mg tab', 'Valgansiklovir', '450 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '176250'),
(974, 'Valisanbe 5 mg tab', 'Diazepam', '5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '429'),
(975, 'VALISANBE INJ', 'Diazepam', '5 mg/2 ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '19789'),
(976, 'VALSARTAN 160 MG TAB', 'Valsartan', '160 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '2700'),
(977, 'VALSARTAN 80 MG TAB', 'Valsartan', '80 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '4400'),
(978, 'Vancep 0,5 gr inj', 'Vancomisin', '0.5 g', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '121995'),
(979, 'VBlock 6.25 mg tab', 'Karvendilol', '6.25 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '2750'),
(980, 'Vectrine 300 mg kapsul', 'Erdostein', '300 mg', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '5500'),
(981, 'VENTOLIN NEBULIZER INJ', 'Salbutamol', '2.5 mg/2.5 ml', 'Nebules', 'Others', 'Non Generik', 'Fornas', '4000'),
(982, 'VENTOLIN SPRAY', 'Salbutamol', '100 mcg', 'Spray', 'Others', 'Non Generik', 'Fornas', '98868'),
(983, 'Verona tablet', 'Curcuma 20 mg, Silybum marianum fructus extr 70 mg, lecithin 100 mg dll', '-', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '5999.4'),
(984, 'Verorab inj', 'Vaksin Rabies', '-', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '0'),
(985, 'VICCILLIN SX 1500 MG INJ', 'Ampisilin  + Sulbaktam', '1 g-500 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '90200'),
(986, 'Vincristine 1 mg injeksi', 'Vincristine', '1 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '45397'),
(987, 'Vincristine 2 mg Injeksi', 'Vincristine', '2 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '80999.6'),
(988, 'VIPALBUMIN KAPSUL', 'ekstrak ikan gabus', '-', 'Kapsul', 'Oral', 'Non Generik', 'Non Fornas', '7333.33'),
(989, 'Visanne 2 mg tab', 'Dienogest 2 mg', '2 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '13871.98'),
(990, 'VIT B 12 TAB', 'Sianokobalamin (vitamin B12)', '500 mcg', 'Tablet', 'Oral', 'Generik', 'Fornas', '87'),
(991, 'VIT B COMPL. TAB', 'Vitamin B kompleks', '-', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '144'),
(992, 'VIT B1 100 MG TAB', 'Tiamin (vitamin B1)', '100 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '461'),
(993, 'VIT B1 50 mg TAB', 'Tiamin (vitamin B1)', '50 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '135.83'),
(994, 'VIT B6 TAB 10 MG', 'Piridoksin (vitamin B6)', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '150'),
(995, 'VIT C 50 MG TAB', 'Asam askorbat (vitamin C)', '50 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '190.4'),
(996, 'VIT C 500 mg Inj', 'Asam askorbat (vitamin C)', '500 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '44000'),
(997, 'Vit K 10 mg inj', 'Fitomenadion', '10 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '5243'),
(998, 'Vit K 2 mg inj', 'Fitomenadion', '2 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '4236'),
(999, 'VIT. C 1000 mg inj', 'Asam askorbat (vitamin C)', '1000 mg', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '22000'),
(1000, 'VIT. C INJ', 'Asam askorbat (vitamin C)', '250 mg/ml', 'Injeksi', 'Parentheral', 'Generik', 'Fornas', '7054'),
(1001, 'Vit. K tab', 'Fitomenadion', '10 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '818'),
(1002, 'Viusid 100 ml Syr', 'Asam Glycyrrhizinic, asam malic, glucosamine, arginine, glycine,Â VitaminÂ C,Â dll.', '-', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '275000'),
(1003, 'Vivena inj', 'Sodium Ascorbate 113mg, Thiamine 3.1mg , Riboflavine Sodium Phospate 4.9mg', '-', 'Injeksi', 'Parentheral', 'Non Generik', 'Non Fornas', '77272'),
(1004, 'VOLTAREN GEL 10GR', 'Natrium Diklofenak', '1%', 'Salep Kulit', 'Others', 'Non Generik', 'Fornas', '204000'),
(1005, 'Volulyte  6  infus  500 ml', 'Polistarch, Natrium asetat trihidrat, NaCl, KCl, MgCl heksahidrat', '-', 'Infus', 'Parentheral', 'Non Generik', 'Non Fornas', '18000'),
(1006, 'VOLUVEN 6% 500 ML INF', 'HES, CaCl, asam amlat, KCl, NaCl, MgCl, Na asetat', '500 ml', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '90000'),
(1007, 'VOMETA DROP', 'Domperidon', '5 mg/ml', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '49500'),
(1008, 'VOMETA FT TAB.', 'Domperidon', '10 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '4400'),
(1009, 'VOMETA SYRUP', 'Domperidon', '5 mg/5 ml', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '50000'),
(1010, 'Vosedon tab', 'Domperidon', '10 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '2492'),
(1011, 'Votrient 400 mg tab', 'Pazopanib', '400 mg', 'Tablet', 'Oral', 'Non Generik', 'Non Fornas', '288235'),
(1012, 'Wida HSD wida inf', 'Kalium Klorida kombinasi', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '9499.6'),
(1013, 'WIDAHES INF', 'HES, Na, Cl', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '10293'),
(1014, 'XALATAN ED 0.005%', 'Latanoprost', '0.05%', 'Tetes Mata', 'Others', 'Non Generik', 'Fornas', '121499.4'),
(1015, 'Xanax 0.5 mg tab', 'Alprazolam', '0.5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '2531'),
(1016, 'Xarelto 10 mg tab', 'Rivaroksaban', '10 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '27500'),
(1017, 'XARELTO 15 MG TAB', 'Rivaroksaban', '15 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '25717.02'),
(1018, 'Xarelto 20 mg tab', 'Rivaroksaban', '20 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '27500'),
(1019, 'Xolmetras 100 ml inj', 'Iohexol', '-', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '561000'),
(1020, 'Xolmetras 50 ml inj', 'Ioheksol ', '-', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '302500'),
(1021, 'Xyzal 5 mg tab', 'Levocetirizine dihydrochloride', '5 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '8439'),
(1022, 'ZAMEL SYR', 'Vit A, B1, B2, B6, B12, E, C, D3, asam pantotenat, nicotinamid, asam folat, kolin, inositol, biotin, Fe, Zn, Mg, Cu, Se, Cr, lisin, gllutamin', '-', 'Syrup', 'Oral', 'Non Generik', 'Non Fornas', '4500'),
(1023, 'Zinc 20 mg tab', 'Zinc', '20 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '592'),
(1024, 'Zinc Sulfate Syr', 'Zinc', '20 mg', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '3284.6'),
(1025, 'ZINCPRO DROP 15 ML', 'Zinc', '10 mg', 'Syrup', 'Oral', 'Non Generik', 'Fornas', '6281'),
(1026, 'Zink Dispersible tab', 'Zinc', '20 mg', 'Tablet', 'Oral', 'Generik', 'Fornas', '604'),
(1027, 'Zoladex 10.8 mg Inj', 'Goserelin asetat', '10.8 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '2740000'),
(1028, 'ZOLADEX INJ', 'Goserelin asetat', '3.6 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '979000'),
(1029, 'ZOMETA 4 mg inj', 'Asam Zolendronat', '4 mg', 'Injeksi', 'Parentheral', 'Non Generik', 'Fornas', '1528800'),
(1030, 'ZOVIRAC inf', 'Asiklovir ', '250 mg', 'Infus', 'Parentheral', 'Non Generik', 'Fornas', '220000'),
(1031, 'Zyloric 300 mg tab', 'Alopurinol', '300 mg', 'Tablet', 'Oral', 'Non Generik', 'Fornas', '5080.46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `idPasien` varchar(20) NOT NULL,
  `namaPasien` varchar(50) NOT NULL,
  `tempatLahir` varchar(50) NOT NULL,
  `tanggalLahir` date NOT NULL,
  `jenisKelamin` int(1) NOT NULL,
  `tinggiBadan` int(11) NOT NULL,
  `bb` int(11) NOT NULL,
  `goldar` varchar(2) NOT NULL,
  `statusPendidikan` int(1) NOT NULL,
  `statusPerkawinan` int(1) NOT NULL,
  `agama` int(1) NOT NULL,
  `alamat` text NOT NULL,
  `noWa` varchar(16) NOT NULL,
  `nik` varchar(16) NOT NULL,
  `namaAyah` varchar(50) NOT NULL,
  `pekerjaan` int(1) NOT NULL,
  `noBpjs` varchar(16) NOT NULL,
  `datecreated` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` text NOT NULL,
  `roleId` int(1) NOT NULL,
  `isActive` int(1) NOT NULL,
  `validate` int(1) NOT NULL,
  `jr` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pasien`
--

INSERT INTO `pasien` (`idPasien`, `namaPasien`, `tempatLahir`, `tanggalLahir`, `jenisKelamin`, `tinggiBadan`, `bb`, `goldar`, `statusPendidikan`, `statusPerkawinan`, `agama`, `alamat`, `noWa`, `nik`, `namaAyah`, `pekerjaan`, `noBpjs`, `datecreated`, `username`, `password`, `roleId`, `isActive`, `validate`, `jr`) VALUES
('60f3134529bda', 'Muhammad Arif Budiman', 'Bandung', '1995-07-20', 1, 167, 50, 'B', 1, 1, 1, 'Lorem Ipsum Dolor', '6281354060005', '1166122004006', 'Lorem', 3, '28173912123', 1626542917, 'arif', '$2y$10$8xrlyupzs9SIM1Db1x45HO/GsgKzGOaIrBTrGBzCgfeIFZw8VTFqO', 3, 1, 1, 2),
('60f96c18e805e', 'Rahman', 'Banjamasin', '1995-03-28', 1, 170, 60, 'A', 1, 1, 1, 'Banjarmasin', '6281223231212', '1166122004006', 'Irwan', 3, '28173912123', 1626958873, 'rahman', '$2y$10$GtIv7G2r9m0sR8RZj4mZaubrnlfPI3R2VNPV5kUGOt4u8LI1fUJeK', 3, 1, 1, 2),
('60fec2af3fe33', 'Rizal Khalqi', 'Tanjung', '1995-02-28', 1, 170, 70, 'A', 1, 1, 1, 'Banjarmasin', '6281223231212', '1166122004006', 'Lorem', 3, '28173912123', 1627308719, 'izal', '$2y$10$eQUz1gZMvagUOGjiDgcAYeo5lawJnbgnx.jo9/0E7qHZdnmxltLrC', 3, 1, 1, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien_riwayatalergi`
--

CREATE TABLE `pasien_riwayatalergi` (
  `idRiwayatAlergi` int(11) NOT NULL,
  `idPasien` varchar(20) NOT NULL,
  `namaAlergi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien_riwayatpenyakit`
--

CREATE TABLE `pasien_riwayatpenyakit` (
  `idRiwayatPenyakit` int(11) NOT NULL,
  `idPasien` varchar(20) NOT NULL,
  `idPenyakit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyakit`
--

CREATE TABLE `penyakit` (
  `idPenyakit` int(11) NOT NULL,
  `namaPenyakit` varchar(100) NOT NULL,
  `keteranganPenyakit` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `penyakit`
--

INSERT INTO `penyakit` (`idPenyakit`, `namaPenyakit`, `keteranganPenyakit`) VALUES
(2, 'Asam Urat', ''),
(3, 'Rabies', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `resepobat`
--

CREATE TABLE `resepobat` (
  `idResep` varchar(20) NOT NULL,
  `idObat` int(11) NOT NULL,
  `idForeignKey` varchar(20) NOT NULL,
  `dosis` varchar(50) NOT NULL,
  `idPasien` varchar(20) NOT NULL,
  `aturanPakai` varchar(10) NOT NULL,
  `tanggalResep` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `resepobat`
--

INSERT INTO `resepobat` (`idResep`, `idObat`, `idForeignKey`, `dosis`, `idPasien`, `aturanPakai`, `tanggalResep`) VALUES
('6116127e01f89', 3, '61161037615a3', '5mg', '60f96c18e805e', '', '2021-08-13'),
('61161283af072', 5, '61161037615a3', '3mg', '60f96c18e805e', '', '2021-08-13'),
('611612a2d2ccc', 4, '6116104e4f2e3', '3mg', '60f96c18e805e', '', '2021-08-13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rujukan`
--

CREATE TABLE `rujukan` (
  `idRujukan` varchar(20) NOT NULL,
  `idUmum` varchar(20) NOT NULL,
  `kepada` varchar(50) NOT NULL,
  `rsud` varchar(50) NOT NULL,
  `telahDiberikan` varchar(192) NOT NULL,
  `ns` varchar(3) NOT NULL,
  `br` varchar(3) NOT NULL,
  `ts` int(4) NOT NULL,
  `tanggalRujukan` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `rujukan`
--

INSERT INTO `rujukan` (`idRujukan`, `idUmum`, `kepada`, `rsud`, `telahDiberikan`, `ns`, `br`, `ts`, `tanggalRujukan`) VALUES
('6116129aecfd7', '6116104e4f2e3', 'Poli Penyakit dalam', 'RSUD ULIN', 'Pemberian obat pereda nyeri', '001', 'VII', 2021, '2021-08-13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sks`
--

CREATE TABLE `sks` (
  `idSks` varchar(20) NOT NULL,
  `noSurat` varchar(11) NOT NULL,
  `tekananDarah` varchar(10) NOT NULL,
  `tanggalSurat` date NOT NULL,
  `idPasien` varchar(20) NOT NULL,
  `idNakes` varchar(20) NOT NULL,
  `statusSks` int(11) NOT NULL,
  `untukKeperluan` text NOT NULL,
  `bulan` varchar(8) NOT NULL,
  `nomerAntrian` varchar(3) NOT NULL,
  `suhu` varchar(7) NOT NULL,
  `buktiTransfer` text NOT NULL,
  `tahun` int(11) NOT NULL,
  `hasil` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `sks`
--

INSERT INTO `sks` (`idSks`, `noSurat`, `tekananDarah`, `tanggalSurat`, `idPasien`, `idNakes`, `statusSks`, `untukKeperluan`, `bulan`, `nomerAntrian`, `suhu`, `buktiTransfer`, `tahun`, `hasil`) VALUES
('60f7fa0ee4708', '001', '120/090', '2021-07-21', '60f3134529bda', '60f8270b38855', 2, 'Melamar Pekerjaan', 'VII', '', '46,9', 'qrcode_lppmunism_ac_id_(1).png', 2021, 'SEHAT'),
('60f96ccb1e8e6', '002', '120/090', '2021-07-22', '60f96c18e805e', '60f8270b38855', 2, 'Melamar Pekerjaan', 'VII', '', '46,9', 'qrcode_lppmunism_ac_id_(1)1.png', 2021, 'SEHAT'),
('60fec9aee1b59', '003', '', '2021-07-26', '60fec2af3fe33', '60f8270b38855', 1, 'Melamar Pekerjaan', 'VII', '001', '', '', 2021, '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `umum`
--

CREATE TABLE `umum` (
  `idUmum` varchar(20) NOT NULL,
  `noSurat` varchar(3) NOT NULL,
  `idPasien` varchar(20) NOT NULL,
  `idNakes` varchar(20) NOT NULL,
  `keluhan` varchar(50) NOT NULL,
  `nomerAntrian` int(11) NOT NULL,
  `diagnosis` text NOT NULL,
  `pesanDokter` text NOT NULL,
  `tanggalPeriksa` date NOT NULL,
  `tahun` int(4) NOT NULL,
  `biaya` int(11) NOT NULL,
  `statusBiaya` int(11) NOT NULL,
  `bulan` varchar(8) NOT NULL,
  `statusPemeriksaan` int(11) NOT NULL,
  `statusObat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `umum`
--

INSERT INTO `umum` (`idUmum`, `noSurat`, `idPasien`, `idNakes`, `keluhan`, `nomerAntrian`, `diagnosis`, `pesanDokter`, `tanggalPeriksa`, `tahun`, `biaya`, `statusBiaya`, `bulan`, `statusPemeriksaan`, `statusObat`) VALUES
('6116104e4f2e3', '001', '60f96c18e805e', '60f8270b38855', 'Demam', 1, 'orem', 'lorem', '2021-08-13', 2021, 20000, 0, 'VIII', 2, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
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
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`idUsers`, `username`, `password`, `roleId`, `namaLengkap`, `email`, `noWa`, `isActive`, `foto`, `dateCreated`) VALUES
('5f269419c1055', 'admin', '$2y$10$8K/PZ9ZYgM2pdO7WlUHl..OdjW9hHDWiPiNwRrC/xby7EaKmQM41G', 1, 'Rizal Khalqi', 'rizal@gmail.com', '081223231212', 1, '55885cd86e82e0b433da1a27c104e6401.png', 1624885524);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `covid`
--
ALTER TABLE `covid`
  ADD PRIMARY KEY (`idCovid`);

--
-- Indeks untuk tabel `covid_negative`
--
ALTER TABLE `covid_negative`
  ADD PRIMARY KEY (`idNegative`);

--
-- Indeks untuk tabel `covid_positive`
--
ALTER TABLE `covid_positive`
  ADD PRIMARY KEY (`idPositive`);

--
-- Indeks untuk tabel `covid_screening`
--
ALTER TABLE `covid_screening`
  ADD PRIMARY KEY (`idScreening`);

--
-- Indeks untuk tabel `gigi`
--
ALTER TABLE `gigi`
  ADD PRIMARY KEY (`idGigi`);

--
-- Indeks untuk tabel `nakes`
--
ALTER TABLE `nakes`
  ADD PRIMARY KEY (`idNakes`);

--
-- Indeks untuk tabel `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`idObat`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`idPasien`);

--
-- Indeks untuk tabel `pasien_riwayatalergi`
--
ALTER TABLE `pasien_riwayatalergi`
  ADD PRIMARY KEY (`idRiwayatAlergi`);

--
-- Indeks untuk tabel `pasien_riwayatpenyakit`
--
ALTER TABLE `pasien_riwayatpenyakit`
  ADD PRIMARY KEY (`idRiwayatPenyakit`);

--
-- Indeks untuk tabel `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`idPenyakit`);

--
-- Indeks untuk tabel `resepobat`
--
ALTER TABLE `resepobat`
  ADD PRIMARY KEY (`idResep`);

--
-- Indeks untuk tabel `rujukan`
--
ALTER TABLE `rujukan`
  ADD PRIMARY KEY (`idRujukan`);

--
-- Indeks untuk tabel `sks`
--
ALTER TABLE `sks`
  ADD PRIMARY KEY (`idSks`);

--
-- Indeks untuk tabel `umum`
--
ALTER TABLE `umum`
  ADD PRIMARY KEY (`idUmum`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUsers`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `covid_negative`
--
ALTER TABLE `covid_negative`
  MODIFY `idNegative` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `covid_positive`
--
ALTER TABLE `covid_positive`
  MODIFY `idPositive` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `obat`
--
ALTER TABLE `obat`
  MODIFY `idObat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1033;

--
-- AUTO_INCREMENT untuk tabel `pasien_riwayatalergi`
--
ALTER TABLE `pasien_riwayatalergi`
  MODIFY `idRiwayatAlergi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pasien_riwayatpenyakit`
--
ALTER TABLE `pasien_riwayatpenyakit`
  MODIFY `idRiwayatPenyakit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `penyakit`
--
ALTER TABLE `penyakit`
  MODIFY `idPenyakit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
