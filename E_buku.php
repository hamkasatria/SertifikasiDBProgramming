<!DOCTYPE html>
<html>
<head>
	<title>edit kategori</title>
</head>
<body>
	<?php
 		include "koneksi.php";
 		$id = $_GET['id'];
 		//ambil 1 row untuk di edit
 		$query = mysqli_query($conn, "SELECT * FROM buku WHERE id_buku = '$id'");
 		$data = mysqli_fetch_array($query);

 		?>

 		<form method="POST" action="updatebuku.php">
 			ID Kategori = <input readonly="" type="text" name="id_buku" value="<?php echo $data['id_buku'];?>"><br>
 			ID Kategori = <input readonly="" type="text" name="id_kategori" value="<?php echo $data['id_kategori'];?>"><br>
 			Judul = <input type="text" name="judul" value="<?php echo $data['judul'];?>"><br>
 			ISBN = <input type="text" name="isbn" value="<?php echo $data['isbn'];?>"><br>
 			Penerbit = <input type="text" name="penerbit" value="<?php echo $data['penerbit'];?>"><br>
 			Penulis = <input type="text" name="penulis" value="<?php echo $data['penulis'];?>"><br>

 			<input type="submit" name="submit">

 		</form>
 		<?php
	?>

</body>
</html>