<?php
	// Lấy thông tin từ FORM
	$IdSanPham = $_POST['IdSanPham']; 
	$MaSanPham = $_POST['MaSanPham'];
	$IdNhaSanXuat = $_POST['IdNhaSanXuat'];
	$TenSanPham = $_POST['TenSanPham'];
	$MoTa = $_POST['MoTa'];
	$DonGia = $_POST['DonGia'];
	$SoLuong = $_POST['SoLuong'];
	$TiLeGiamGia = $_POST['TiLeGiamGia'];
	$CauHinh = $_POST['CauHinh'];	
	// Kiểm tra
	if(trim($MaSanPham) == "")
		ThongBaoLoi("Mã sản phẩm không được bỏ trống!");
	elseif(trim($IdNhaSanXuat) == "")
		ThongBaoLoi("Chưa chọn nhà sản xuất!");
	elseif(trim($TenSanPham) == "")
		ThongBaoLoi("Tên sản phẩm không được bỏ trống!");
	elseif(trim($MoTa) == "")
		ThongBaoLoi("Mô tả không được bỏ trống!");
	elseif(trim($DonGia) == "")
		ThongBaoLoi("Đơn giá không được bỏ trống!");
	elseif(trim($SoLuong) == "")
		ThongBaoLoi("Số lượng không được bỏ trống!");
	elseif(trim($TiLeGiamGia) == "")
		ThongBaoLoi("Tỉ lệ giảm giá không được bỏ trống!");
	elseif(trim($CauHinh) == "")
		ThongBaoLoi("Cấu hình không được bỏ trống!");
	else
	{	
		$sql = "update	tbl_sanpham
				SET		MaSanPham = '$MaSanPham',
						TenSanPham = '$TenSanPham',
						IdNhaSanXuat = '$IdNhaSanXuat',
						DonGia = $DonGia,
						MoTa = '$MoTa',
						SoLuong = $SoLuong,
						TiLeGiamGia = $TiLeGiamGia,
						CauHinh = '$CauHinh'
				WHERE	IdSanPham = $IdSanPham";
		
		$danhsach = $connect->query($sql);
		//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
		if (!$danhsach) {
			die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
			exit();
		}
		else
		{
			ThongBao("Chỉnh sửa bài viết thành công!");
		}		
		
	}
?>