<?php
    // Kiểm tra xem session đã được bắt đầu hay chưa
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }
    include_once("index.php"); // Kết nối CSDL và các hàm hỗ trợ

    // Kiểm tra xem người dùng đã đăng nhập chưa
    if (!isset($_SESSION['MaND'])) {
        // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
        header("Location: dangnhap.php");
        exit();
    }

    // Lấy thông tin từ session
    $MaNguoiDung = $_SESSION['MaND'];
    $TenNguoiDung = $_SESSION['HoTen'];

    // Lấy địa chỉ IP của người dùng
    $dia_chi_ip = $_SERVER['REMOTE_ADDR'];

    // Lấy thời gian hiện tại
    $thoi_gian_dang_nhap = date("Y-m-d H:i:s");

    // Thêm thông tin lịch sử đăng nhập vào CSDL
    $sql_them_lich_su = "INSERT INTO tbl_lichsudangnhap (MaNguoiDung, TenNguoiDung, ThoiGianDangNhap, DiaChiIP) VALUES (?, ?, ?, ?)";
    $stmt = $connect->prepare($sql_them_lich_su);
    $stmt->bind_param("ssss", $MaNguoiDung, $TenNguoiDung, $thoi_gian_dang_nhap, $dia_chi_ip);
    if ($stmt->execute()) {
        // Nếu thêm thành công, điều hướng người dùng về trang lịch sử đăng nhập
        header("Location: lichsudangnhap.php");
        exit();
    } else {
        echo "Lỗi: " . $stmt->error;
    }

    $stmt->close();
    $connect->close();
?>
