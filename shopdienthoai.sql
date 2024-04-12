-- Database: `shopdienthoai`
CREATE DATABASE `shopdienthoai` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `shopdienthoai`;
<<<<<<< HEAD
-- 
-- Tạo bảng nhà sản xuất
--
=======

-- 
-- Tạo bảng nhà sản xuất
--

>>>>>>> 3f27d6b3acebf0274ab8ef4b9f99ce7faab70c00
DROP TABLE IF EXISTS NhaSanXuat;
CREATE TABLE IF NOT EXISTS NhaSanXuat (
  MaNSX int(20) NOT NULL AUTO_INCREMENT,
  TenNSX varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (MaNSX)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;
<<<<<<< HEAD
--
-- Thêm dữ liệu cho nhà sản xuất
--
=======

--
-- Thêm dữ liệu cho nhà sản xuất
--

>>>>>>> 3f27d6b3acebf0274ab8ef4b9f99ce7faab70c00
INSERT INTO NhaSanXuat (MaNSX, TenNSX) VALUES
(1, 'Samsung'),
(2, 'Apple'),
(3, 'Xiaomi'),
(4, 'OPPO'),
(5, 'Realme'),
(6, 'Lenovo'),
(7, 'Sony');
<<<<<<< HEAD
=======

>>>>>>> 3f27d6b3acebf0274ab8ef4b9f99ce7faab70c00
-- Tạo bảng cho các sản phẩm điện thoại
CREATE TABLE DienThoai (
    ma_dien_thoai INT PRIMARY KEY,
    MaNSX int(20) NOT NULL,
    model NVARCHAR(50),
    dung_luong_luu_tru INT,
    mau_sac NVARCHAR(20),
    hinh varchar(200) COLLATE utf8_unicode_ci NOT NULL,
    gia DECIMAL(10, 2),
    ti_le_gg INT(4) NOT NULL,
<<<<<<< HEAD
	LuotXem int(11) NOT NULL,
	SoLuong int(10) NOT NULL,
    CONSTRAINT fk_MaNSX FOREIGN KEY (MaNSX) REFERENCES NhaSanXuat(MaNSX)
);
-- Chèn dữ liệu cho 5 điện thoại vào bảng DienThoai
INSERT INTO DienThoai (ma_dien_thoai, MaNSX, model, dung_luong_luu_tru, mau_sac, hinh, gia, ti_le_gg, LuotXem, SoLuong) 
VALUES 
(1, 1, 'Galaxy S21', 256, 'Đen', 'images/galaxys21den.jpg', 20990000, 10,252,111),
(2, 2, 'iPhone 12 Pro', 256, 'Xám', 'images/iphone12proxam.jpg', 31990000, 15,262,200),
(3, 3, 'Redmi Note 10 Pro', 128, 'Xanh', 'images/redminote10proxanh.jpg', 7990000, 20,111,365),
(4, 4, 'Oppo Reno6', 128, 'Đen', 'images/opporeno6den.jpg', 11990000, 15,305,156),
(5, 5, 'Realme 8 Pro', 128, 'Vàng', 'images/realme8provang.jpg', 8990000, 10,222,449);
=======
    CONSTRAINT fk_MaNSX FOREIGN KEY (MaNSX) REFERENCES NhaSanXuat(MaNSX)
);
-- Chèn dữ liệu cho 5 điện thoại vào bảng DienThoai
INSERT INTO DienThoai (ma_dien_thoai, MaNSX, model, dung_luong_luu_tru, mau_sac, hinh, gia, ti_le_gg) 
VALUES 
(1, 1, 'Galaxy S21', 256, 'Đen', 'images/galaxys21den.jpg', 20990000, 10),
(2, 2, 'iPhone 12 Pro', 256, 'Xám', 'images/iphone12proxam.jpg', 31990000, 15),
(3, 3, 'Redmi Note 10 Pro', 128, 'Xanh', 'images/redminote10proxanh.jpg', 7990000, 20),
(4, 4, 'Oppo Reno6', 128, 'Đen', 'images/opporeno6den.jpg', 11990000, 15),
(5, 5, 'Realme 8 Pro', 128, 'Vàng', 'images/realme8provang.jpg', 8990000, 10);
>>>>>>> 3f27d6b3acebf0274ab8ef4b9f99ce7faab70c00


-- Tạo bảng cho các thông số kỹ thuật của điện thoại
   
CREATE TABLE ThongSoKyThuatDienThoai (
    ma_thong_so_ky_thuat INT PRIMARY KEY,
    ma_dien_thoai INT,
    CPU NVARCHAR(100),
    RAM INT,
    kich_thuoc_man_hinh DECIMAL(4, 2),
    do_phan_giai_camera INT,
    CONSTRAINT fk_ma_dien_thoai FOREIGN KEY (ma_dien_thoai) REFERENCES DienThoai(ma_dien_thoai)
);
-- Chèn thông số kỹ thuật cho điện thoại Samsung Galaxy S21
INSERT INTO ThongSoKyThuatDienThoai (ma_thong_so_ky_thuat, ma_dien_thoai, CPU, RAM, kich_thuoc_man_hinh, do_phan_giai_camera) 
VALUES (1, 1, 'Exynos 2100', 8, 6.2, 108);
-- Chèn thông số kỹ thuật cho điện thoại iPhone 12 Pro
INSERT INTO ThongSoKyThuatDienThoai (ma_thong_so_ky_thuat, ma_dien_thoai, CPU, RAM, kich_thuoc_man_hinh, do_phan_giai_camera) 
VALUES (2, 2, 'Apple A14 Bionic', 6, 6.1, 12);
-- Chèn thông số kỹ thuật cho điện thoại Xiaomi Redmi Note 10 Pro
INSERT INTO ThongSoKyThuatDienThoai (ma_thong_so_ky_thuat, ma_dien_thoai, CPU, RAM, kich_thuoc_man_hinh, do_phan_giai_camera) 
VALUES (3, 3, 'Qualcomm Snapdragon 732G', 6, 6.67, 108);
-- Chèn thông số kỹ thuật cho điện thoại OPPO Reno6
INSERT INTO ThongSoKyThuatDienThoai (ma_thong_so_ky_thuat, ma_dien_thoai, CPU, RAM, kich_thuoc_man_hinh, do_phan_giai_camera) 
VALUES (4, 4, 'MediaTek Dimensity 900', 8, 6.43, 64);
-- Chèn thông số kỹ thuật cho điện thoại Realme 8 Pro
INSERT INTO ThongSoKyThuatDienThoai (ma_thong_so_ky_thuat, ma_dien_thoai, CPU, RAM, kich_thuoc_man_hinh, do_phan_giai_camera) 
VALUES (5, 5, 'Qualcomm Snapdragon 720G', 8, 6.4, 108);
-- Tạo bảng cho thông tin của các khách hàng
CREATE TABLE KhachHang (
    ma_khach_hang INT PRIMARY KEY,
    ten NVARCHAR(100),
    email NVARCHAR(100),
    so_dien_thoai NVARCHAR(20),
    dia_chi NVARCHAR(255)
);
-- Chèn thông tin cho 5 khách hàng
INSERT INTO KhachHang (ma_khach_hang, ten, email, so_dien_thoai, dia_chi)
VALUES 
(1, 'Nguyễn Văn A', 'nguyenvana@example.com', '0987654321', '123 Đường ABC, Quận XYZ'),
(2, 'Trần Thị B', 'tranthib@example.com', '0123456789', '456 Đường DEF, Quận UVW'),
(3, 'Lê Văn C', 'levanc@example.com', '0909090909', '789 Đường GHI, Quận RST'),
(4, 'Phạm Thị D', 'phamthid@example.com', '0363636363', '101 Đường JKL, Quận MNO'),
(5, 'Hoàng Văn E', 'hoangvane@example.com', '0777777777', '202 Đường PQR, Quận STU');
-- Tạo bảng cho các đơn hàng
CREATE TABLE DonHang (
    ma_don_hang INT PRIMARY KEY,
    ma_khach_hang INT,
    ngay_dat_hang DATE,
    tong_gia DECIMAL(10, 2),
    CONSTRAINT fk_ma_khach_hang FOREIGN KEY (ma_khach_hang) REFERENCES KhachHang(ma_khach_hang)
);
-- Chèn thông tin cho 5 đơn hàng
INSERT INTO DonHang (ma_don_hang, ma_khach_hang, ngay_dat_hang, tong_gia)
VALUES 
(1, 1, '2024-04-10', 20990000),
(2, 2, '2024-04-09', 31990000),
(3, 3, '2024-04-08', 7990000),
(4, 4, '2024-04-07', 11990000),
(5, 5, '2024-04-06', 8990000);
-- Tạo bảng cho chi tiết đơn hàng
CREATE TABLE ChiTietDonHang (
    ma_chi_tiet_don_hang INT PRIMARY KEY,
    ma_don_hang INT,
    ma_dien_thoai INT,
    so_luong INT,
    gia DECIMAL(10, 2),
    CONSTRAINT fk_ma_don_hang FOREIGN KEY (ma_don_hang) REFERENCES DonHang(ma_don_hang),
    CONSTRAINT fk_ma_dien_thoai_chitietdonhang FOREIGN KEY (ma_dien_thoai) REFERENCES DienThoai(ma_dien_thoai)
);
-- Chèn thông tin cho 5 chi tiết đơn hàng
INSERT INTO ChiTietDonHang (ma_chi_tiet_don_hang, ma_don_hang, ma_dien_thoai, so_luong, gia)
VALUES 
(1, 1, 1, 1, 20990000),
(2, 2, 2, 1, 31990000),
(3, 3, 3, 1, 7990000),
(4, 4, 4, 1, 11990000),
(5, 5, 5, 1, 8990000);
<<<<<<< HEAD
-- --------------------------------------------------------
--
-- Table structure for table NguoiDung
--
=======

-- --------------------------------------------------------

--
-- Table structure for table NguoiDung
--

>>>>>>> 3f27d6b3acebf0274ab8ef4b9f99ce7faab70c00
DROP TABLE IF EXISTS NguoiDung;
CREATE TABLE IF NOT EXISTS NguoiDung (
  MaNguoiDung int(10) NOT NULL,
  TenNguoiDung varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  TenDangNhap varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  MatKhau varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  QuyenHan tinyint(1) NOT NULL,
  Khoa tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
<<<<<<< HEAD
--
-- Dumping data for table NguoiDung
--
=======

--
-- Dumping data for table NguoiDung
--

>>>>>>> 3f27d6b3acebf0274ab8ef4b9f99ce7faab70c00
INSERT INTO NguoiDung (MaNguoiDung, TenNguoiDung, TenDangNhap, MatKhau, QuyenHan, Khoa) VALUES
(1, 'Trần Văn A', 'tva', 'e10adc3949ba59abbe56e057f20f883e', 1, 0),
(2, 'Nguyễn Văn Hùng', 'nvhung', 'e10adc3949ba59abbe56e057f20f883e', 1, 0),
(3, 'Nguễn Thị D', 'ntd', 'e10adc3949ba59abbe56e057f20f883e', 2, 0),
(4, 'Trần Văn C', 'tvc123456', 'e10adc3949ba59abbe56e057f20f883e', 2, 0);
<<<<<<< HEAD
=======

>>>>>>> 3f27d6b3acebf0274ab8ef4b9f99ce7faab70c00
-- --------------------------------------------------------