-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Bulan Mei 2024 pada 13.45
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `alternatif`
--

CREATE TABLE `alternatif` (
  `id_alternatif` int(11) NOT NULL,
  `kode_alternatif` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `alternatif`
--

INSERT INTO `alternatif` (`id_alternatif`, `kode_alternatif`, `nama`) VALUES
(20, 'A1', 'PERFFETO'),
(21, 'A2', 'OLDEN BURGER'),
(22, 'A3', 'ANCHOR'),
(23, 'A4', 'ARLA'),
(24, 'A5', 'DEL\'s'),
(25, 'A6', 'EMINA MOZZA'),
(26, 'A7', 'KRAFT QUICK MELT'),
(27, 'A8', 'PROCHIZ'),
(28, 'A9', 'GREENFIELDS'),
(29, 'A10', 'GANESHA SORA'),
(30, 'A11', 'GREEN VALLEY'),
(31, 'A12', 'ZAYCO 313'),
(32, 'A13', 'BAROS CHEESE');

-- --------------------------------------------------------

--
-- Struktur dari tabel `hasil`
--

CREATE TABLE `hasil` (
  `id_hasil` int(11) NOT NULL,
  `id_alternatif` int(11) NOT NULL,
  `nilai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `hasil`
--

INSERT INTO `hasil` (`id_hasil`, `id_alternatif`, `nilai`) VALUES
(1, 20, -0.145833),
(2, 21, -0.145833),
(3, 22, 0.125),
(4, 23, 0.260417),
(5, 24, 0.260417),
(6, 25, -0.0104167),
(7, 26, -0.28125),
(8, 27, 0.260417),
(9, 28, 0.125),
(10, 29, -0.28125),
(11, 30, -0.0104167),
(12, 31, -0.0104167),
(13, 32, -0.145833);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `kode_kriteria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `keterangan`, `kode_kriteria`) VALUES
(33, 'HARGA', 'K1'),
(34, 'RASA', 'K2'),
(35, 'TEKSTUR', 'K3'),
(36, 'KEMASAN', 'K4'),
(37, 'INFORMASI KANDUNGAN NUTRISI', 'K5'),
(38, 'KETERSEDIAAN', 'K6'),
(39, 'WARNA', 'K7'),
(40, 'KADALUARSA', 'K8');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penilaian`
--

CREATE TABLE `penilaian` (
  `id_penilaian` int(11) NOT NULL,
  `id_alternatif` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nilai` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `penilaian`
--

INSERT INTO `penilaian` (`id_penilaian`, `id_alternatif`, `id_kriteria`, `nilai`) VALUES
(213, 20, 33, 42),
(214, 20, 34, 44),
(215, 20, 35, 48),
(216, 20, 36, 51),
(217, 20, 37, 54),
(218, 20, 38, 56),
(219, 20, 39, 60),
(220, 20, 40, 63),
(221, 21, 33, 41),
(222, 21, 34, 44),
(223, 21, 35, 48),
(224, 21, 36, 51),
(225, 21, 37, 54),
(226, 21, 38, 57),
(227, 21, 39, 60),
(228, 21, 40, 63),
(229, 22, 33, 41),
(230, 22, 34, 44),
(231, 22, 35, 48),
(232, 22, 36, 51),
(233, 22, 37, 53),
(234, 22, 38, 56),
(235, 22, 39, 60),
(236, 22, 40, 63),
(237, 23, 33, 41),
(238, 23, 34, 44),
(239, 23, 35, 47),
(240, 23, 36, 51),
(241, 23, 37, 53),
(242, 23, 38, 56),
(243, 23, 39, 60),
(244, 23, 40, 63),
(245, 24, 33, 41),
(246, 24, 34, 44),
(247, 24, 35, 48),
(248, 24, 36, 50),
(249, 24, 37, 53),
(250, 24, 38, 56),
(251, 24, 39, 60),
(252, 24, 40, 63),
(253, 25, 33, 41),
(254, 25, 34, 44),
(255, 25, 35, 48),
(256, 25, 36, 51),
(257, 25, 37, 53),
(258, 25, 38, 57),
(259, 25, 39, 60),
(260, 25, 40, 63),
(261, 26, 33, 41),
(262, 26, 34, 44),
(263, 26, 35, 48),
(264, 26, 36, 51),
(265, 26, 37, 54),
(266, 26, 38, 57),
(267, 26, 39, 61),
(268, 26, 40, 63),
(269, 27, 33, 41),
(270, 27, 34, 44),
(271, 27, 35, 48),
(272, 27, 36, 51),
(273, 27, 37, 53),
(274, 27, 38, 56),
(275, 27, 39, 60),
(276, 27, 40, 62),
(277, 28, 33, 42),
(278, 28, 34, 44),
(279, 28, 35, 48),
(280, 28, 36, 51),
(281, 28, 37, 53),
(282, 28, 38, 56),
(283, 28, 39, 60),
(284, 28, 40, 62),
(285, 29, 33, 42),
(286, 29, 34, 45),
(287, 29, 35, 48),
(288, 29, 36, 51),
(289, 29, 37, 54),
(290, 29, 38, 56),
(291, 29, 39, 60),
(292, 29, 40, 63),
(293, 30, 33, 42),
(294, 30, 34, 44),
(295, 30, 35, 48),
(296, 30, 36, 51),
(297, 30, 37, 54),
(298, 30, 38, 56),
(299, 30, 39, 60),
(300, 30, 40, 62),
(301, 31, 33, 41),
(302, 31, 34, 45),
(303, 31, 35, 48),
(304, 31, 36, 50),
(305, 31, 37, 53),
(306, 31, 38, 56),
(307, 31, 39, 61),
(308, 31, 40, 63),
(309, 32, 33, 42),
(310, 32, 34, 45),
(311, 32, 35, 48),
(312, 32, 36, 51),
(313, 32, 37, 54),
(314, 32, 38, 56),
(315, 32, 39, 60),
(316, 32, 40, 62);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_prdk` int(11) NOT NULL,
  `nama_prdk` varchar(120) NOT NULL,
  `harga` int(11) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_prdk`, `nama_prdk`, `harga`, `keterangan`, `gambar`) VALUES
(1, 'PERFFETO', 48000, 'A1', 'Perfetto.jpeg'),
(2, 'OLDEN BURGER', 32000, 'A2', 'Olden.jpeg'),
(3, 'ANCHOR', 30000, 'A3', 'Anchor.jpeg'),
(4, 'ARLA', 29000, 'A4', 'Arla.jpeg\r\n'),
(5, 'DEL\'s', 43000, 'A5', 'Dels.jpeg'),
(6, 'EMINA MOZZA', 25000, 'A6', 'Emina Mozarella.jpeg'),
(7, 'KRAFT QUICK MELT', 20000, 'A7', 'Kraft.jpeg'),
(8, 'PROCHIZ ', 28000, 'A8', 'Prochiz.jpeg'),
(9, 'GREENFIELDS', 52000, 'A9', 'greenfields.jpeg'),
(10, 'GANESHA SORA', 58000, 'A10', 'Ganesha.jpeg'),
(11, 'GREEN VALLEY', 50000, 'A11', 'Green.jpeg'),
(12, 'ZAYCO313', 45500, 'A12', 'zoyco.jpeg'),
(13, 'BAROS CHEESE', 46000, 'A13', 'Baros.jpeg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `sub_kriteria`
--

CREATE TABLE `sub_kriteria` (
  `id_sub_kriteria` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `nilai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `sub_kriteria`
--

INSERT INTO `sub_kriteria` (`id_sub_kriteria`, `id_kriteria`, `deskripsi`, `nilai`) VALUES
(41, 33, '<30000(Murah) ', 3),
(42, 33, '40000-50000(Mahal)', 2),
(43, 33, '>50000(Sangat Mahal)', 1),
(44, 34, 'Asin', 3),
(45, 34, 'Asam', 2),
(46, 34, 'Manis/Legit', 1),
(47, 35, ' Lembut & Basah (Soft & Moist)', 3),
(48, 35, 'Kenyal & Krem (Springy & Creamy)', 2),
(49, 35, 'Padat & Kering (Firm & Dry) ', 1),
(50, 36, 'vakum (Vacuum-Sealed Packaging)', 3),
(51, 36, 'Kemasan Plastik ', 2),
(52, 36, 'Kemasan Balok (Block Packaging)', 1),
(53, 37, 'Sangat Lengkap', 3),
(54, 37, 'Lengkap', 2),
(55, 37, 'Kurang Lengkap', 1),
(56, 38, 'Super Market', 3),
(57, 38, 'Mini Market', 2),
(58, 38, 'Toko Klontong', 1),
(59, 39, 'Putih', 3),
(60, 39, 'Kuning Pucat', 2),
(61, 39, 'Cream', 1),
(62, 40, '1 Tahun', 3),
(63, 40, '6 Bulan', 2),
(64, 40, '3-4 Bulan', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `id_user_level` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `id_user_level`, `nama`, `email`, `username`, `password`) VALUES
(1, 1, 'Admin', 'admin@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(7, 2, 'User', 'user@gmail.com', 'user', 'ee11cbb19052e40b07aac0ca060c23ee');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_level`
--

CREATE TABLE `user_level` (
  `id_user_level` int(11) NOT NULL,
  `user_level` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `user_level`
--

INSERT INTO `user_level` (`id_user_level`, `user_level`) VALUES
(1, 'Administrator'),
(2, 'User');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `alternatif`
--
ALTER TABLE `alternatif`
  ADD PRIMARY KEY (`id_alternatif`);

--
-- Indeks untuk tabel `hasil`
--
ALTER TABLE `hasil`
  ADD PRIMARY KEY (`id_hasil`),
  ADD KEY `id_alternatif` (`id_alternatif`);

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indeks untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  ADD PRIMARY KEY (`id_penilaian`),
  ADD KEY `id_alternatif` (`id_alternatif`),
  ADD KEY `id_kriteria` (`id_kriteria`),
  ADD KEY `nilai` (`nilai`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_prdk`);

--
-- Indeks untuk tabel `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
  ADD PRIMARY KEY (`id_sub_kriteria`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_user_level` (`id_user_level`);

--
-- Indeks untuk tabel `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id_user_level`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `alternatif`
--
ALTER TABLE `alternatif`
  MODIFY `id_alternatif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `hasil`
--
ALTER TABLE `hasil`
  MODIFY `id_hasil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  MODIFY `id_penilaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- AUTO_INCREMENT untuk tabel `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
  MODIFY `id_sub_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id_user_level` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `hasil`
--
ALTER TABLE `hasil`
  ADD CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `penilaian`
--
ALTER TABLE `penilaian`
  ADD CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penilaian_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `penilaian_ibfk_3` FOREIGN KEY (`nilai`) REFERENCES `sub_kriteria` (`id_sub_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sub_kriteria`
--
ALTER TABLE `sub_kriteria`
  ADD CONSTRAINT `sub_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_user_level`) REFERENCES `user_level` (`id_user_level`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
