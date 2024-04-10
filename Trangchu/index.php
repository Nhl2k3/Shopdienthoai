<?php
	if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
	
	include_once "cauhinh.php";
	
	include_once "thuvien.php";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop Điện Thoại</title>
</head>
<body onload = "hienthiTime"()>
    <div id ="TrangWeb">
        <div id = "PhanDau">

        </div>

        <div id = "PhanMenu1">
            <a class = "menu" href = "index.php?do=home">Trang chủ</a>
        </div >

        <div id="PhanMenu2">
				
		
        </div>
        
        <div id="PhanMenu3">
				<form action="index.php?do=search_xuly" method="post">
					Tìm kiếm: <input type="text" name="search" />
					<input type="submit" name="ok" value="search" />
				</form>
		</div>

    </div>
    
</body>
</html>