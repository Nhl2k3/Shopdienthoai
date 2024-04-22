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

    // Lấy mã người dùng hiện tại từ session
    $MaNguoiDung = $_SESSION['MaND'];

    // Lấy thông tin người dùng từ bảng tbl_nguoidung
    $sql_select_nguoidung = "SELECT TenNguoiDung FROM tbl_nguoidung WHERE MaNguoiDung = ?";
    $stmt = $connect->prepare($sql_select_nguoidung);
    $stmt->bind_param("s", $MaNguoiDung);
    $stmt->execute();
    $result_select_nguoidung = $stmt->get_result();

    // Kiểm tra xem có kết quả trả về từ truy vấn không
    if ($result_select_nguoidung->num_rows > 0) {
        // Lấy thông tin người dùng từ kết quả trả về
        $row_nguoidung = $result_select_nguoidung->fetch_assoc();
        $TenNguoiDung = $row_nguoidung['TenNguoiDung'];

        // Lấy địa chỉ IP của người dùng
        $dia_chi_ip = $_SERVER['REMOTE_ADDR'];

        // Thêm thông tin lịch sử đăng nhập vào CSDL
        $thoi_gian_dang_nhap = date("Y-m-d H:i:s"); // Lấy thời gian hiện tại
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
    } else {
        echo "Không tìm thấy thông tin người dùng.";
    }

    $stmt->close();
    $connect->close();
?>
