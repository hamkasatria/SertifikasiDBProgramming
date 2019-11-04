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
 		$query = mysqli_query($conn, "SELECT * FROM kategori WHERE id_kategori = '$id'");
 		$data = mysqli_fetch_array($query);

 		?>

 		<form method="POST" action="updatekategori.php">
 			ID Kategori = <input readonly="" type="text" name="id_kategori" value="<?php echo $data['id_kategori'];?>">
 			Kategori = <input type="text" name="nama_kategori" value="<?php echo $data['nama_kategori'];?>">

 			<input type="submit" name="submit">

 		</form>
 		<?php
	?>

</body>
</html>