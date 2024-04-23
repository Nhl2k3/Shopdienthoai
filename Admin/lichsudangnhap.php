<?php
    // Kiểm tra xem session đã được bắt đầu hay chưa
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }
    include_once("index.php"); // Kết nối CSDL và các hàm hỗ trợ

    if (!isset($_SESSION['MaND'])) {
        // Nếu chưa đăng nhập, chuyển hướng về trang đăng nhập
        header("Location: dangnhap.php");
        exit();
    }

    // Lấy mã người dùng hiện tại từ session và thực hiện truy vấn
    $MaNguoiDung = $_SESSION['MaND'];
    $sql_lichsu = "SELECT * FROM tbl_lichsudangnhap WHERE MaNguoiDung = ?";
    $stmt = $connect->prepare($sql_lichsu);
    $stmt->bind_param("s", $MaNguoiDung);
    $stmt->execute();
    $result_lichsu = $stmt->get_result();

    // Tạo một biến để đếm số lần lặp
    $loop_count = 0;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch sử đăng nhập</title>
</head>
<body>
    <h3>Lịch sử đăng nhập</h3>
    <table border="1">
        <tr>
            <th>STT</th>
            <th>Tên người dùng</th>
            <th>Thời gian đăng nhập</th>
            <th>Thời gian đăng nhập cách đây</th>
            <th>Địa chỉ IP</th>
        </tr>
        <?php
            if ($result_lichsu->num_rows > 0) {
                $stt = 1;
                while ($row = $result_lichsu->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td align='center'>" . $stt++ . "</td>";
                    echo "<td align='center'>" . $row['TenNguoiDung'] . "</td>";
                    echo "<td align='center'>" . $row['ThoiGianDangNhap'] . "</td>";
                    
                    // Tính toán thời gian đăng nhập cách đây
                    $thoi_gian_hien_tai = time();
                    $thoi_gian_dang_nhap = strtotime($row['ThoiGianDangNhap']);
                    $thoi_gian_cach_day = $thoi_gian_hien_tai - $thoi_gian_dang_nhap;
                    $gio_cach_day = floor($thoi_gian_cach_day / (60 * 60));
                    echo "<td align='center'>" . $gio_cach_day . " giờ trước</td>";
                    
                    echo "<td align='center'>" . $row['DiaChiIP'] . "</td>";
                    echo "</tr>";
                    
                    // Tăng biến đếm số lần lặp
                    $loop_count++;
                    
                    // Kiểm tra nếu đã đủ số lần lặp, thoát vòng lặp
                    if ($loop_count >= 10) {
                        break;
                    }
                }
            } else {
                echo "<tr><td colspan='5'>Không có lịch sử đăng nhập</td></tr>";
            }
        ?>
    </table>
</body>
</html>

<?php
    $stmt->close();
    $connect->close();
?>
