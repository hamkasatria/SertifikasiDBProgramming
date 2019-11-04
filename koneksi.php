
<?php
$database = "buku_hamka";
$hostname = "localhost";
$username = "root";
$password = "";
//koneksi dengan database
$conn = mysqli_connect($hostname,$username,$password,$database);
//untuk cek koneksi
if ($conn->connect_error )
{
	die('koneksi gaagal');
}

?>