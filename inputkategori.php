	<?php
		include "koneksi.php";		
		$id_kategori = $_POST['id_kategori'];
		$kategori = $_POST['kategori'];

		$query = mysqli_query($conn,"INSERT INTO kategori VALUES ('$id_kategori','$kategori')")
		or die(mysqli_error($conn));
	?>