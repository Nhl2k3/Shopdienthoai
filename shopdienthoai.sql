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
  `MaNguoiDung` int(10) NOT NULL AUTO_INCREMENT,
  `TenNguoiDung` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TenDangNhap` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MatKhau` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `QuyenHan` tinyint(1) NOT NULL,
  `Khoa` tinyint(1) NOT NULL,
   PRIMARY KEY (`MaNguoiDung`)
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
(1, 'galaxys21den', 'Sam Sung Galaxy S21', 1, 'images/galaxys21den.jpg', 20990000, 'Samsung Galaxy S21: Smartphone 5G mạnh mẽ với màn hình 120Hz mượt mà, camera ấn tượng và thiết kế sang trọng.', 500, 10,'<h1>Điện thoại Samsung Galaxy S21 5G Snapdragon 888/8GB/128GB/6.2&quot;AMOLED/Android 11</h1>\r\n' ,252),
(2, 'galaxys245g', 'Sam Sung Galaxy S24 5G', 1, 'images/galaxys245g.jpg', 22090000, 'Samsung Galaxy S24 5G: Một thiết bị đỉnh cao với hiệu suất mạnh mẽ và thiết kế đẹp mắt', 599, 25,'<h1>Điện thoại Samsung Galaxy S24 5G Exynos 2200/12GB/256GB/6.5" Dynamic AMOLED/Android 13</h1>\r\n' ,200),
(3, 'galaxys24ultra', 'Sam Sung Galaxy S24 Ultra 5G', 1, 'images/galaxys24ultra.jpg', 33990000, 'Samsung Galaxy S24 Ultra: Siêu phẩm đỉnh cao với công nghệ hàng đầu và tính năng vượt trội.', 300, 19,'<h1>Điện thoại Samsung Galaxy S24 Ultra Exynos 2200/16GB/512GB/6.8" Dynamic AMOLED/Android 13</h1>\r\n',333),
(4, 'galaxyZfold5', 'Sam Sung Galaxy Z Fold5 5G', 1, 'images/galaxyZfold5.jpg', 40990000, 'Samsung Galaxy Z Fold5 5G: Sự hòa quyện hoàn hảo giữa công nghệ mạnh mẽ và thiết kế gập độc đáo.', 301, 26,'<h1>Điện thoại Samsung Galaxy Z Fold5 5G Snapdragon 888/12GB/256GB/7.6" Dynamic AMOLED/Android 12</h1>\r\n',334),
(5, 'galaxym34', 'Sam Sung Galaxy M34 5G', 1, 'images/galaxym34.jpg', 7990000, 'Samsung Galaxy M34 5G: Sức mạnh 5G đỉnh cao và hiệu suất đáng kinh ngạc trong một thiết kế hiện đại.', 302, 23,'<h1>Điện thoại Samsung Galaxy M34 5G Exynos 1200/6GB/128GB/6.5" Super AMOLED/Android 13</h1>\r\n',335),
(6, 'galaxya35', 'Sam Sung Galaxy A35 5G', 1, 'images/galaxya35.jpg', 9290000, 'Samsung Galaxy A35 5G: Sức mạnh kết nối 5G đỉnh cao và trải nghiệm tuyệt vời trong một thiết kế thời trang và hiện đại.', 303, 8,'<h1>Điện thoại Samsung Galaxy A35 5G Exynos 720/6GB/128GB/6.4" Super AMOLED/Android 12</h1>\r\n',336),
(7, 'galaxya05', 'Sam Sung Galaxy A05', 1, 'images/galaxya05.jpg', 3490000, 'Samsung Galaxy A05: Thiết bị tiện ích với hiệu suất đáng kinh ngạc và giá trị vượt trội.', 304, 11,'<h1>Điện thoại Samsung Galaxy A05 MediaTek MT6739/2GB/32GB/6.5" IPS LCD/Android 10</h1>\r\n',337),
(8, 'galaxya14', 'Sam Sung Galaxy A14', 1, 'images/galaxya14.jpg', 4490000, 'Samsung Galaxy A14: Một sự lựa chọn đáng giá với hiệu suất ổn định và thiết kế đẹp mắt.', 305, 20,'<h1>Điện thoại Samsung Galaxy A14 MediaTek Helio P35/4GB/64GB/6.4" IPS LCD/Android 11</h1>\r\n',338),

(9, 'iphone12proxam', 'iPhone 12 Pro', 2, 'images/iphone12proxam.jpg', 21490000, 'iPhone 12 Pro: Chiếc điện thoại cao cấp với thiết kế sang trọng, hiệu năng mạnh mẽ, camera ấn tượng và kết nối 5G.', 200, 15,'<h1>iPhone 12 Pro Apple A14 Bionic/6GB/128GB/6.1" Super Retina XDR OLED/iOS 15</h1>\r\n',262),
(10, 'iphone13', 'iPhone 13', 2, 'images/iphone13.jpg', 17790000, 'iPhone 13: Sức mạnh đỉnh cao và thiết kế đẳng cấp, mang đến trải nghiệm người dùng tuyệt vời.', 300, 21,'<h1>iPhone 13: Apple A15 Bionic/6GB/128GB/6.1" Super Retina XDR OLED/iOS 15</h1>\r\n',500),
(12, 'iphone14promax', 'iPhone 14 Pro Max', 2, 'images/iphone14promax.jpg', 24940000, 'iPhone 14 Pro Max: Sự kết hợp hoàn hảo giữa công nghệ tiên tiến và thiết kế sang trọng, đem lại trải nghiệm đỉnh cao cho người dùng.', 350, 18,'<h1>iPhone 14 Pro Max: Apple A16 Bionic/8GB/256GB/6.7" Super Retina XDR Pro OLED/iOS 16</h1>\r\n',500),
(13, 'iphonexs256gb', 'iPhone Xs 256GB', 2, 'images/iphonexs256gb.jpg', 13050000, 'iPhone Xs 256GB: Thiết kế đẹp mắt kết hợp cùng hiệu suất mạnh mẽ, mang đến trải nghiệm đỉnh cao cho người dùng.', 399, 10,'<h1>iPhone Xs 256GB: Apple A12 Bionic/4GB/256GB/5.8" Super Retina OLED/iOS 12</h1>\r\n',598),
(14, 'iphone15plus', 'iPhone 15 Plus', 2, 'images/iphone15plus.jpg', 25990000, 'iPhone 15 Plus: Sự tiến bộ vượt bậc trong công nghệ và thiết kế, đem lại trải nghiệm tuyệt vời cho người dùng.', 699, 12,'<h1>iPhone 15 Plus: Apple A17 Bionic/8GB/256GB/6.5" Super Retina XDR OLED/iOS 17</h1>\r\n',698),
(15, 'iphone14plus', 'iPhone 14 Plus', 2, 'images/iphone14plus.jpg', 22990000, 'iPhone 14 Plus: Sự kết hợp hoàn hảo giữa công nghệ đỉnh cao và thiết kế tinh tế, mang đến trải nghiệm người dùng xuất sắc.', 696, 13,'<h1>iPhone 15 Plus: Apple A17 Bionic/8GB/256GB/6.5" Super Retina XDR OLED/iOS 17</h1>\r\n',698),
(16, 'iphone14', 'iPhone 14', 2, 'images/iphone14.jpg', 20490000, 'iPhone 14: Sự tiến bộ vượt trội trong công nghệ và thiết kế, đem lại trải nghiệm người dùng đỉnh cao.', 670, 15,'<h1>iPhone 14: Apple A16 Bionic/6GB/128GB/6.1" Super Retina XDR OLED/iOS 16</h1>\r\n',700),
(17, 'iphone11', 'iPhone 14', 2, 'images/iphone11.jpg', 11790000, 'iPhone 11: Sức mạnh và hiệu suất với thiết kế hiện đại, mang đến trải nghiệm đáng giá cho người dùng.', 111, 23,'<h1>iPhone 11: Apple A13 Bionic/4GB/64GB hoặc 128GB/6.1" Liquid Retina LCD/iOS 13</h1>\r\n',703),

(18, 'redminote10proxanh', 'Xiaomi Redmi Note 10 Pro', 3, 'images/redminote10proxanh.jpg', 7990000, 'Redmi Note 10 Pro: Màn đẹp, chip mạnh, camera ấn tượng, pin trâu, giá tốt!', 365, 20,'<h1>Điện thoại Redmi Note 10 Pro Snapdragon 732G/6GB/128GB/6.67"AMOLED/Android 11</h1>\r\n',111),
(19, 'xiaomi14', 'Xiaomi 14 5G 512GB', 3, 'images/xiaomi14.jpg', 24490000, 'Xiaomi 14 5G 512GB: Sự kết hợp độc đáo giữa công nghệ 5G và dung lượng lưu trữ lớn, mang đến trải nghiệm mạnh mẽ và tiện lợi.', 500, 8,'<h1>Điện thoại Xiaomi 14 5G 512GB: Qualcomm Snapdragon 8 Gen 1/12GB/512GB/6.8" AMOLED/MIUI 13</h1>\r\n',990),
(20, 'redminote13pro', 'Xiaomi Redmi Note 13 Pro', 3, 'images/redminote13pro.jpg', 7490000, 'Xiaomi Redmi Note 13 Pro: Sức mạnh đỉnh cao và hiệu suất ấn tượng, đem lại trải nghiệm xuất sắc cho người dùng.', 100, 6,'<h1>Điện thoại Xiaomi Redmi Note 13 Pro: Helio G99-Ultra/8GB/128GB/6.7"  Hyper Os</h1>\r\n',150),
(21, 'xiaomi13t', 'Xiaomi 13T 5G', 3, 'images/xiaomi13t.jpg', 10990000, 'Xiaomi 13T 5G: Một sự kết hợp hoàn hảo giữa hiệu suất 5G vượt trội và thiết kế đẳng cấp, đem lại trải nghiệm tuyệt vời cho người dùng.', 596, 0,'<h1>Điện thoại Xiaomi 13T 5G: Qualcomm Snapdragon 888/8GB/128GB/6.67" AMOLED Android 13</h1>\r\n',888),
(23, 'redmik60', 'Xiaomi Redmi K60', 3, 'images/redmik60.jpg', 9990000, 'Xiaomi Redmi K60: Sức mạnh đỉnh cao và thiết kế đẹp mắt, đem lại trải nghiệm tốt nhất cho người dùng.', 666, 13,'<h1>Điện thoại Xiaomi Redmi K60: Qualcomm Snapdragon 8+ Gen 1/8GB/128GB/6.67" AMOLED/Hyper OS</h1>\r\n',555),
(24, 'redmi13c', 'Xiaomi Redmi 13C', 3, 'images/redmi13c.jpg', 289000, 'Xiaomi Redmi 13C: Sự kết hợp độc đáo giữa hiệu suất đáng kinh ngạc và giá trị vượt trội, đáp ứng mọi nhu cầu của người dùng.', 89, 6,'<h1>Điện thoại Xiaomi Redmi 13C: MediaTek Helio G88/6GB/128GB/6.5" LCD/MIUI (phiên bản cập nhật mới nhất)</h1>\r\n',555),
(25, 'blackshark4s', 'Xiaomi Black Shark 4S', 3, 'images/blackshark4s.jpg', 11390000, 'Xiaomi Black Shark 4s: Sức mạnh gaming đỉnh cao và hiệu suất vượt trội, hoàn hảo cho người chơi game đích thực.', 600, 10,'<h1>Điện thoại Xiaomi Black Shark 4s: Qualcomm Snapdragon 8 Gen 1/12GB/256GB/6.67" AMOLED/JoyUI (phiên bản cập nhật mới nhất)</h1>\r\n',1300),
(27, 'blackshark5', 'Xiaomi Black Shark 5', 3, 'images/blackshark5.jpg', 11000000, 'Xiaomi Black Shark 5: Sự kết hợp hoàn hảo giữa công nghệ gaming tiên tiến và hiệu suất mạnh mẽ, tạo nên trải nghiệm gaming tuyệt vời.', 232, 5,'<h1>Điện thoại Xiaomi Black Shark 5: Qualcomm Snapdragon 8 Gen 1/12GB/256GB/6.8" AMOLED/JoyUI (phiên bản cập nhật mới nhất)</h1>\r\n',333),

(35, 'realme8provang', 'Realme 8 Pro',4, 'images/realme8provang.jpg', 8990000, 'Realme 8 Pro: Một chiếc smartphone với camera chất lượng cao và hiệu suất ổn định.', 449, 10,'<h1>Điện thoại Realme 8 Pro Snapdragon 720G/8GB/128GB/6.4"Super AMOLED/Android 11</h1>\r\n' ,222),
(36, 'gtneo6se', 'Realme GT Neo6 SE 5G',4, 'images/gtneo6se.jpg', 6290000, 'Điện thoại Realme GT Neo6 SE: Sức mạnh hiệu suất cao và thiết kế đẳng cấp, đem lại trải nghiệm tuyệt vời cho người dùng đam mê công nghệ.', 500, 0,'<h1>Điện thoại Realme GT Neo6 SE: Qualcomm Snapdragon 7+ Gen 3/8GB hoặc 12GB/256GB/6.7" AMOLED/Realme UI (phiên bản cập nhật mới nhất)</h1>\r\n' ,224),
(37, 'gtneo5se', 'Realme GT Neo5 SE 5G',4, 'images/gtneo5se.jpg', 5990000, 'Điện thoại Realme GT Neo5 SE: Sức mạnh hiệu suất cao và thiết kế đẳng cấp, đem lại trải nghiệm tuyệt vời cho người dùng đam mê công nghệ.', 430, 3,'<h1>Điện thoại Realme GT Neo6 SE: Qualcomm Snapdragon 7+ Gen 2/8GB hoặc 12GB/256GB/6.7" AMOLED/Realme UI (phiên bản cập nhật mới nhất)</h1>\r\n' ,444),
(38, 'gtneo3', 'Realme GT Neo 3 5G',4, 'images/gtneo35g.jpg', 7490000, 'Điện thoại Realme GT Neo3 5G: Sức mạnh hiệu suất cao và thiết kế đẳng cấp, đem lại trải nghiệm tuyệt vời cho người dùng đam mê công nghệ.', 444, 10,'<h1>Điện thoại Realme GT Neo 3 5G: MediaTek Dimensity 8100/8GB hoặc 12GB/256GB/6.7" AMOLED/Realme UI (phiên bản cập nhật mới nhất)</h1>\r\n' ,555),
(39, 'realmegt5', 'Realme GT 5 5G',4, 'images/realmegt5.jpg', 12990000, 'Điện thoại Realme GT 5 5G: Sức mạnh hiệu suất cao và thiết kế đẳng cấp, đem lại trải nghiệm tuyệt vời cho người dùng đam mê công nghệ.', 555, 13,'<h1>Điện thoại Realme GT 5 5G: Qualcomm SM8550-AB Snapdragon 8 Gen 2 /8GB hoặc 12GB/256GB/6.7" AMOLED/Realme UI (phiên bản cập nhật mới nhất)</h1>\r\n' ,666),
(40, 'realme12pro', 'Realme 12 Pro 5G',4, 'images/realme12pro.jpg', 6590000, 'Điện thoại Realme 12 Pro 5 5G: Sức mạnh hiệu suất cao và thiết kế đẳng cấp, đem lại trải nghiệm tuyệt vời cho người dùng đam mê công nghệ.', 666, 10,'<h1>Điện thoại Realme 12 Pro 5G: Qualcomm Snapdragon 6 Gen 1 /8GB hoặc 12GB/256GB/6.7" AMOLED/Realme UI (phiên bản cập nhật mới nhất)</h1>\r\n' ,777),

(28, 'opporeno6den', 'Oppo Reno 6', 5, 'images/opporeno6den.jpg', 12990000, 'OPPO Reno6: Điện thoại thời trang, camera selfie đỉnh cao, hiệu năng mạnh mẽ, giá tầm trung.', 156, 15,'<h1>Điện thoại Oppo Reno 6 5G Dimensity 1200/8GB/128GB/6.4"AMOLED/Android 11</h1>\r\n', 305),
(29, 'reno11', 'Oppo Reno11 5G', 5, 'images/reno11.jpg', 10990000, 'Oppo Reno 11: Thiết kế tinh tế và hiệu suất mạnh mẽ, mang đến trải nghiệm đỉnh cao cho người dùng.', 200, 0,'<h1>Điện thoại Oppo Reno 11:MediaTek Dimensity 7050 5G 8 nhân/8GB/128GB/6.5" AMOLED/Android 14)</h1>\r\n', 345),
(30, 'reno10', 'Oppo Reno10 5G', 5, 'images/reno10.jpg', 10990000, 'Oppo Reno 10: Sự kết hợp tuyệt vời giữa thiết kế đẹp mắt và hiệu suất ấn tượng, mang lại trải nghiệm đỉnh cao cho người dùng.', 266, 18,'<h1>Điện thoại Oppo Reno 10: MediaTek Dimensity 7050 5G 8 nhân/8GB/128GB/6.7" AMOLED/Android 13</h1>\r\n', 379),
(31, 'reno8t', 'Oppo Reno8 T', 5, 'images/reno8t.jpg', 8490000, 'Oppo Reno 8T: Sức mạnh và phong cách kết hợp, mang lại trải nghiệm đa chiều cho người dùng.', 100, 11,'<h1>Điện thoại Oppo Reno 8T: MediaTek Helio G99/8GB/128GB/6.4" AMOLED/Android 13</h1>\r\n', 150),
(32, 'oppofindn3', 'OPPO Find N3 5G', 5, 'images/oppofindn3.jpg', 44990000, 'OPPO Find N3 5G: Sự kết hợp hoàn hảo giữa công nghệ 5G tiên tiến và thiết kế đẳng cấp, đem lại trải nghiệm xuất sắc cho người dùng.', 300, 6,'<h1>Điện thoại OPPO Find N3 5G: Qualcomm Snapdragon 8 Gen 2/8GB/256GB/7.82" AMOLED/	Android 13.0</h1>\r\n', 250),
(33, 'oppoa74', 'OPPO A74', 5, 'images/oppoa74.jpg', 6990000, 'Điện thoại OPPO A74: Sự kết hợp tinh tế giữa hiệu suất ổn định và thiết kế thanh lịch, đáp ứng mọi nhu cầu của người dùng.', 280, 6,'<h1>Điện thoại OPPO A74: Qualcomm Snapdragon 662/8GB/128GB/6.43" AMOLED/Android 11</h1>\r\n', 222),
(34, 'oppoa78', 'OPPO A78 4G', 5, 'images/oppoa78.jpg', 6990000, 'Điện thoại OPPO A78: Sự kết hợp tuyệt vời giữa hiệu suất ổn định và thiết kế đẹp mắt, đáp ứng mọi nhu cầu hàng ngày của người dùng.', 280, 0,'<h1>Điện thoại OPPO A78: Qualcomm Snapdragon 680/6GB hoặc 8GB/128GB hoặc 256GB/6.5" AMOLED/Android 13</h1>\r\n', 234);
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
