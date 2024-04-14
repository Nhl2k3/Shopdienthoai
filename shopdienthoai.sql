-- phpMyAdmin SQL Dump
-- version 3.4.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 09-Apr-2024 at 03:04 PM
-- Server version: 5.5.20
-- PHP Version: 5.3.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

-- --------------------------------------------------------

--
-- Database: `shopdienthoai`
--
CREATE DATABASE `shopdienthoai` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `shopdienthoai`;


-- --------------------------------------------------------

--
-- Table structure for table `tbl_nguoidung`
--

DROP TABLE IF EXISTS `tbl_nguoidung`;
CREATE TABLE `tbl_nguoidung` (
  `MaNguoiDung` int(10) NOT NULL,
  `TenNguoiDung` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TenDangNhap` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MatKhau` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `QuyenHan` tinyint(1) NOT NULL,
  `Khoa` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbl_nguoidung`
--

INSERT INTO `tbl_nguoidung` (`MaNguoiDung`, `TenNguoiDung`, `TenDangNhap`, `MatKhau`, `QuyenHan`, `Khoa`) VALUES
(1, 'Nguyễn Văn A', 'nva', 'e10adc3949ba59abbe56e057f20f883e', 1, 0),
(2, 'Trần Thị B', 'ttb', 'e10adc3949ba59abbe56e057f20f883e', 2, 0),
(3, 'Lê Văn C', 'lvc', 'e10adc3949ba59abbe56e057f20f883e', 2, 0),
(4, 'Phạm Thị D', 'ptd', 'e10adc3949ba59abbe56e057f20f883e', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nhasanxuat`
--

DROP TABLE IF EXISTS `tbl_nhasanxuat`;
CREATE TABLE `tbl_nhasanxuat` (
  `IdNhaSanXuat` int(20) NOT NULL AUTO_INCREMENT,
  `TenNhaSanXuat` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IdNhaSanXuat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tbl_nhasanxuat`
--

INSERT INTO `tbl_nhasanxuat` (`IdNhaSanXuat`, `TenNhaSanXuat`) VALUES
(1, 'Samsung'),
(2, 'Apple'),
(3, 'Xiaomi'),
(4, 'Realme'),
(5, 'Oppo');


-- --------------------------------------------------------

--
-- Table structure for table `tbl_sanpham_dienthoai`
--

DROP TABLE IF EXISTS `tbl_sanpham`;
CREATE TABLE `tbl_sanpham` (
  `IdSanPham` int(10) NOT NULL AUTO_INCREMENT,
  `MaSanPham` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `TenSanPham` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `IdNhaSanXuat` int(20) NOT NULL,
  `HinhAnh` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `DonGia` int(10) NOT NULL,
  `MoTa` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `SoLuong` int(10) NOT NULL,
  `TiLeGiamGia` int(4) NOT NULL,
  `CauHinh` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `LuotXem` int(11) NOT NULL,
  PRIMARY KEY (`IdSanPham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tbl_sanpham_dienthoai`
--
INSERT INTO `tbl_sanpham`(`IdSanPham`, `MaSanPham`, `TenSanPham`, `IdNhaSanXuat`, `HinhAnh`, `DonGia`, `MoTa`, `SoLuong`, `TiLeGiamGia`, `CauHinh`, `LuotXem`) VALUES
(1, 'galaxys21den', 'Galaxy S21', 1, 'images/galaxys21den.jpg', 20990000, 'Samsung Galaxy S21: Smartphone 5G mạnh mẽ với màn hình 120Hz mượt mà, camera ấn tượng và thiết kế sang trọng.', 500, 10,'<h1>Điện thoại Samsung Galaxy S21 5G Snapdragon 888/8GB/128GB/6.2&quot;AMOLED/Android 11</h1>\r\n' ,252),
(2, 'iphone12proxam', 'iPhone 12 Pro', 2, 'images/iphone12proxam.jpg', 31990000, 'iPhone 12 Pro: Chiếc điện thoại cao cấp với thiết kế sang trọng, hiệu năng mạnh mẽ, camera ấn tượng và kết nối 5G.', 200, 15,'<h1>iPhone 12 Pro Apple A14 Bionic/6GB/128GB/6.1" Super Retina XDR OLED/iOS 15</h1>\r\n',262),
(3, 'redminote10proxanh', 'Redmi Note 10 Pro', 3, 'images/redminote10proxanh.jpg', 7990000, 'Redmi Note 10 Pro: Màn đẹp, chip mạnh, camera ấn tượng, pin trâu, giá tốt!', 365, 20,'<h1>Điện thoại Redmi Note 10 Pro Snapdragon 732G/6GB/128GB/6.67"AMOLED/Android 11</h1>\r\n',111),
(4, 'opporeno6den', 'Oppo Reno6', 4, 'images/opporeno6den.jpg', 11990000, 'OPPO Reno6: Điện thoại thời trang, camera selfie đỉnh cao, hiệu năng mạnh mẽ, giá tầm trung.', 156, 15,'<h1>Điện thoại Oppo Reno 6 5G Dimensity 1200/8GB/128GB/6.4"AMOLED/Android 11</h1>\r\n', 305),
(5, 'realme8provang', 'Realme 8 Pro',5, 'images/realme8provang.jpg', 8990000, 'Realme 8 Pro: Một chiếc smartphone với camera chất lượng cao và hiệu suất ổn định.', 449, 10,'<h1>Điện thoại Realme 8 Pro Snapdragon 720G/8GB/128GB/6.4"Super AMOLED/Android 11</h1>\r\n' ,222);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
