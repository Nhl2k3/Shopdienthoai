<?php
   if (session_status() == PHP_SESSION_NONE) {
    session_start(); // Bắt đầu session nếu chưa được bắt đầu trước đó
	}
    require_once("index.php"); // Kết nối CSDL
	function ThongBaoThanhCong($message) {
		echo "<div style='color: green;'>$message</div>";
	}
    // Lấy thông tin từ FORM
    $MaNguoiDung = $_POST['MaNguoiDung'];
    $HoVaTen = $_POST['HoVaTen'];

    // Kiểm tra xem các trường có rỗng không
    if(trim($HoVaTen) == "") {
        ThongBaoLoi("Họ và tên không được bỏ trống!");
    } else {
        // Cập nhật hồ sơ cá nhân vào CSDL
        $sql_capnhat = "UPDATE tbl_nguoidung SET TenNguoiDung = '$HoVaTen' WHERE MaNguoiDung = '$MaNguoiDung'";
        if ($connect->query($sql_capnhat) === TRUE) {
            ThongBaoThanhCong("Cập nhật hồ sơ thành công!");
        } else {
            ThongBaoLoi("Lỗi: " . $sql_capnhat . "<br>" . $connect->error);
        }
    }
    // Đóng kết nối CSDL
    $connect->close();
?>
