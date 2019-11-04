<?php
 include "koneksi.php";
 $id = $_GET['id'];
	$query = mysqli_query($conn, "DELETE FROM kategori WHERE id_kategori = '$id'")
?>