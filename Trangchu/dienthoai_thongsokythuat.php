<?php
	$ma_dien_thoai = $_GET['id_ma_dien_thoai'];
	
	$sql = "SELECT *
			FROM DienThoai_A, NhaSanXuat_B
			WHERE A.MaNSX = B.MaNSX AND A.ma_dien_thoai = $ma_dien_thoai";
	
	$danhsach = $connect->query($sql);
	//Nếu kết quả kết nối không được thì xuất báo lỗi và thoát
	if (!$danhsach) {
		die("Không thể thực hiện câu lệnh SQL: " . $connect->connect_error);
		exit();
	}
	
	$dong = $danhsach->fetch_array(MYSQLI_ASSOC);
	
	// Tăng lượt xem
	$sql = "UPDATE DienThoai SET LuotXem = LuotXem + 1 WHERE  ma_dien_thoai = $ ma_dien_thoai";
	$truyvan_luotxem = $connect->query($sql);
	
	
	$giaban = $dong[' gia'] - (($dong['ti_le_gg'] /100) * $dong['gia']);
	
?>
<table>
	<tr> 
		<td>
			<h3><?php echo $dong[' model']; ?></h3>
			<p class="TomTat">Nhà sản xuất: <?php echo $dong[' TenNSX']; ?></p>
			<p class="TomTat">Giá gốc:<span class="dongia"><?php echo number_format($dong['gia']); ?> đ</span></p>
			<p class="TomTat">Giá bán: <span class="giaban"><?php echo number_format($giaban); ?> đ</p>
			<p class="TomTat">Số lượng: <?php echo $dong['SoLuong']; ?></p>
			<p class="TomTat">Tỉ lệ giảm giá: <?php echo $dong['ti_le_gg']; ?></p>
			<p><?php echo    "<img width=\"400\" src=" . $dong["hinh"] . ">"; ?></p>			
		</td>
		<td>
			<img src="images/muangay.jpg" />
		</td>
		<tr>
			<td colspan="2">
				<h4 >Cấu hình:</h4>
				<p class="NoiDung"><?php echo $dong[' CPU']; ?></p>
			</td>
		</tr>
	</tr>
</table>

<p>..................................................................................................</p>
<h3>Sản phẩm cùng nhà sản xuất </h3>
<?php  
	
	include "dienthoai_nhasanxuat.php";
?>