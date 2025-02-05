-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 05 Feb 2025 pada 04.14
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sistempenjualanonline`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `pembayaran_id` int(11) NOT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `jumlah` int(11) NOT NULL,
  `total_harga` decimal(10,2) NOT NULL,
  `metode_pembayaran` enum('Transfer Bank','Kartu Kredit','E-Wallet','COD') NOT NULL,
  `tanggal_pembayaran` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`pembayaran_id`, `produk_id`, `jumlah`, `total_harga`, `metode_pembayaran`, `tanggal_pembayaran`) VALUES
(1, 1, 1, '8500000.00', 'Transfer Bank', '2024-12-30 10:15:00'),
(2, 2, 2, '398000.00', 'E-Wallet', '2024-12-30 11:30:00'),
(3, 3, 3, '294000.00', 'COD', '2024-12-30 13:45:00'),
(4, 4, 1, '450000.00', 'Kartu Kredit', '2024-12-30 15:00:00'),
(5, 5, 2, '550000.00', 'Transfer Bank', '2024-12-30 16:15:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `produk_id` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `deskripsi` text,
  `harga` decimal(10,2) NOT NULL,
  `seller_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`produk_id`, `nama_produk`, `deskripsi`, `harga`, `seller_id`) VALUES
(1, 'Laptop Asus X441', 'Laptop Intel Core i5, RAM 8GB, SSD 512GB', '8500000.00', 1),
(2, 'Kemeja Pria', 'Kemeja lengan panjang casual', '199000.00', 2),
(3, 'Novel Laskar Pelangi', 'Novel karya Andrea Hirata', '98000.00', 3),
(4, 'Bola Basket Spalding', 'Bola basket ukuran standar', '450000.00', 4),
(5, 'Lampu Hias LED', 'Lampu hias dekorasi rumah', '275000.00', 5),
(6, 'Smartphone Samsung', 'Samsung Galaxy A52 8GB/128GB', '4500000.00', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `seller`
--

CREATE TABLE `seller` (
  `seller_id` int(11) NOT NULL,
  `nama_seller` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telepon` varchar(15) DEFAULT NULL,
  `alamat` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `seller`
--

INSERT INTO `seller` (`seller_id`, `nama_seller`, `email`, `no_telepon`, `alamat`) VALUES
(1, 'Toko Elektronik Jaya', 'elektronikjaya@gmail.com', '081234567890', 'Jl. Merdeka No. 123, Jakarta'),
(2, 'Fashion Store', 'fashionstore@gmail.com', '082345678901', 'Jl. Sudirman No. 45, Bandung'),
(3, 'Buku Sejahtera', 'bukusejahtera@gmail.com', '083456789012', 'Jl. Pahlawan No. 67, Surabaya'),
(4, 'Sport Center', 'sportcenter@gmail.com', '084567890123', 'Jl. Ahmad Yani No. 89, Semarang'),
(5, 'Home Decor', 'homedecor@gmail.com', '085678901234', 'Jl. Gatot Subroto No. 12, Yogyakarta'),
(6, 'jelbab', 'rahmatzkk10@gmail.com', '082239434989', 'sksksk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok`
--

CREATE TABLE `stok` (
  `stok_id` int(11) NOT NULL,
  `produk_id` int(11) DEFAULT NULL,
  `jumlah_stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `stok`
--

INSERT INTO `stok` (`stok_id`, `produk_id`, `jumlah_stok`) VALUES
(1, 1, 26),
(2, 2, 100),
(3, 3, 50),
(4, 4, 30),
(5, 5, 45),
(6, 6, 15),
(7, 1, 0),
(8, 1, 1),
(9, 1, 3),
(10, 5, 9);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'laila', '827ccb0eea8a706c4c34a16891f84e7b'),
(2, 'mona', '827ccb0eea8a706c4c34a16891f84e7b'),
(3, 'laila', '827ccb0eea8a706c4c34a16891f84e7b');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`pembayaran_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`produk_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indeks untuk tabel `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`seller_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`stok_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `pembayaran_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `produk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `seller`
--
ALTER TABLE `seller`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `stok`
--
ALTER TABLE `stok`
  MODIFY `stok_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `seller` (`seller_id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `stok`
--
ALTER TABLE `stok`
  ADD CONSTRAINT `stok_ibfk_1` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
