<?php
	// Lấy thông tin từ FORM
	$TenDangNhap = $_POST['TenDangNhap'];
	$MatKhau = $_POST['MatKhau'];
	
	// Kiểm tra
	if(trim($TenDangNhap) == "")
		ThongBaoLoi("Tên đăng nhập không được bỏ trống!");
	elseif(trim($MatKhau) == "")
		ThongBaoLoi("Mật khẩu không được bỏ trống!");
	else
	{
		// Mã hóa mật khẩu
		$MatKhau = md5($MatKhau);
		
		// Kiểm tra người dùng có tồn tại không
		$sql_kiemtra = "SELECT * FROM tbl_nguoidung WHERE TenDangNhap = '$TenDangNhap' AND MatKhau = '$MatKhau'";
		$danhsach = $connect->query($sql_kiemtra);
		
		// Kiểm tra kết quả
		if ($danhsach->num_rows > 0) {
			$dong = $danhsach->fetch_assoc();
			
			if($dong['Khoa'] == 0)
			{
				// Đăng ký SESSION
				$_SESSION['MaND'] = $dong['MaNguoiDung'];
				$_SESSION['HoTen'] = $dong['TenNguoiDung'];
				$_SESSION['QuyenHan'] = $dong['QuyenHan'];
				
				// Thêm lịch sử đăng nhập
				$thoi_gian_dang_nhap = date("Y-m-d H:i:s"); // Lấy thời gian hiện tại
				$dia_chi_ip = $_SERVER['REMOTE_ADDR'];
				$sql_them_lich_su = "INSERT INTO tbl_lichsudangnhap (MaNguoiDung, TenNguoiDung, ThoiGianDangNhap, DiaChiIP) VALUES (?, ?, ?, ?)";
				$stmt = $connect->prepare($sql_them_lich_su);
				$stmt->bind_param("ssss", $_SESSION['MaND'], $_SESSION['HoTen'], $thoi_gian_dang_nhap, $dia_chi_ip);
				$stmt->execute();
				
				// Chuyển hướng về trang index.php
				header("Location: index.php");
			}
			else
			{
				ThongBaoLoi("Người dùng đã bị khóa tài khoản!");
			}
		}
		else
		{
			ThongBaoLoi("Tên đăng nhập hoặc mật khẩu không chính xác!");
		}
	}
?>
