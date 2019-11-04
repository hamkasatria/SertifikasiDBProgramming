<?php
 include "koneksi.php";

 $id_kategori = $_POST['id_kategori'];
 $kategori = $_POST['nama_kategori'];

$query = mysqli_query($conn, "UPDATE kategori SET nama_kategori='$kategori' WHERE id_kategori ='$id_kategori' ")

?>