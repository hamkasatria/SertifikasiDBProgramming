<?php

 include "koneksi.php";
 $id_buku = $_POST['id_buku'];
 $id_kategori = $_POST['id_kategori'];
 $judul = $_POST['judul'];
 $isbn = $_POST['isbn'];
 $penerbit = $_POST['penerbit'];
 $penulis = $_POST['penulis'];

$query = mysqli_query($conn, "UPDATE buku SET id_kategori='$id_kategori', judul = '$judul', isbn = '$isbn', penerbit= '$penerbit', penulis = '$penulis' WHERE id_buku ='$id_buku' ")

?>