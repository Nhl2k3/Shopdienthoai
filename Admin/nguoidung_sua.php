<?php
require_once("index.php"); // Kết nối CSDL

if(isset($_POST['submit'])) {
    // Lấy dữ liệu từ FORM
    $id = $_POST['id'];
    $tenNguoiDung = $_POST['tenNguoiDung'];
    $tenDangNhap = $_POST['tenDangNhap'];

    // Kiểm tra các trường không được bỏ trống
    if(empty($tenNguoiDung) || empty($tenDangNhap)) {
        echo "Họ và tên, tên đăng nhập không được để trống.";
    } else {
        // Cập nhật thông tin người dùng vào CSDL
        $sql = "UPDATE `tbl_nguoidung` SET `TenNguoiDung` = ?, `TenDangNhap` = ? WHERE `MaNguoiDung` = ?";
        $stmt = $connect->prepare($sql);
        $stmt->bind_param("ssi", $tenNguoiDung, $tenDangNhap, $id);
        $stmt->execute();

        if($stmt->affected_rows > 0) {
            echo "Cập nhật thông tin người dùng thành công.";
        } else {
            echo "Không thể cập nhật thông tin người dùng.";
        }
    }
}

// Lấy thông tin người dùng từ CSDL để hiển thị trong form
if(isset($_GET['id'])) {
    $id = $_GET['id'];
    $sql = "SELECT * FROM `tbl_nguoidung` WHERE `MaNguoiDung` = ?";
    $stmt = $connect->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $nguoiDung = $result->fetch_assoc();
?>

<h3>Sửa thông tin người dùng</h3>
<form action="" method="post">
    <input type="hidden" name="id" value="<?php echo $nguoiDung['MaNguoiDung']; ?>">
    <label for="tenNguoiDung">Họ và tên:</label>
    <input type="text" name="tenNguoiDung" value="<?php echo $nguoiDung['TenNguoiDung']; ?>"><br>
    <label for="tenDangNhap">Tên đăng nhập:</label>
    <input type="text" name="tenDangNhap" value="<?php echo $nguoiDung['TenDangNhap']; ?>"><br>
    <input type="submit" name="submit" value="Cập nhật">
</form>

<?php
}
?>
