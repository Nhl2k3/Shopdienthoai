<?php
require_once("index.php"); // Kết nối CSDL

if(isset($_GET['id'])) {
    $id = $_GET['id'];
    
    // Kiểm tra xem người dùng có tồn tại không trước khi xóa
    $sql_check = "SELECT * FROM `tbl_nguoidung` WHERE `MaNguoiDung` = ?";
    $stmt_check = $connect->prepare($sql_check);
    $stmt_check->bind_param("i", $id);
    $stmt_check->execute();
    $result_check = $stmt_check->get_result();
    
    if($result_check->num_rows > 0) {
        // Người dùng tồn tại, tiến hành xóa
        $sql_delete = "DELETE FROM `tbl_nguoidung` WHERE `MaNguoiDung` = ?";
        $stmt_delete = $connect->prepare($sql_delete);
        $stmt_delete->bind_param("i", $id);
        $stmt_delete->execute();
        
        if($stmt_delete->affected_rows > 0) {
            echo "Xóa người dùng thành công.";
        } else {
            echo "Không thể xóa người dùng.";
        }
    } else {
        echo "Người dùng không tồn tại.";
    }
} else {
    echo "Không có ID người dùng được cung cấp.";
}

$connect->close();
?>
