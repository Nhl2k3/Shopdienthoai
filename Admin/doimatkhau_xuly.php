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
    $MatKhauCu = $_POST['MatKhauCu'];
    $MatKhauMoi = $_POST['MatKhauMoi'];
    $XacNhanMatKhauMoi = $_POST['XacNhanMatKhauMoi'];

    // Kiểm tra xem các trường có rỗng không
    if(trim($MatKhauCu) == "" || trim($MatKhauMoi) == "" || trim($XacNhanMatKhauMoi) == "") {
        ThongBaoLoi("Vui lòng nhập đầy đủ thông tin!");
    } else {
        // Mã hóa mật khẩu cũ
        $MatKhauCu = md5($MatKhauCu);

        // Kiểm tra mật khẩu cũ có đúng không
        $sql_kiemtra = "SELECT * FROM tbl_nguoidung WHERE MaNguoiDung = '$MaNguoiDung' AND MatKhau = '$MatKhauCu'";
        $result = $connect->query($sql_kiemtra);

        //Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
        if (!$result) {
            die("Không thể thực hiện câu lệnh SQL: " . $connect->error);
            exit();
        }

        $row = $result->fetch_assoc();
        if($row) {
            // Kiểm tra mật khẩu mới và mật khẩu xác nhận có trùng khớp không
            if($MatKhauMoi != $XacNhanMatKhauMoi) {
                ThongBaoLoi("Mật khẩu mới và xác nhận mật khẩu không khớp!");
            } else {
                // Mã hóa mật khẩu mới
                $MatKhauMoi = md5($MatKhauMoi);

                // Cập nhật mật khẩu mới vào CSDL
                $sql_capnhat = "UPDATE tbl_nguoidung SET MatKhau = '$MatKhauMoi' WHERE MaNguoiDung = '$MaNguoiDung'";
                if ($connect->query($sql_capnhat) === TRUE) {
                    ThongBaoThanhCong("Đổi mật khẩu thành công!");
                } else {
                    ThongBaoLoi("Lỗi: " . $sql_capnhat . "<br>" . $connect->error);
                }
            }
        } else {
            ThongBaoLoi("Mật khẩu cũ không chính xác!");
        }
    }

    // Đóng kết nối CSDL
    $connect->close();
?>
