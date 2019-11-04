	<?php
		include "koneksi.php";
		
		$id_buku = $_POST['id_buku'];
		$id_kategori = $_POST['id_kategori'];
		$judul = $_POST['judul'];
		$isbn = $_POST['isbn'];
		$penerbit = $_POST['penerbit'];
		$penulis = $_POST['penulis'];

		$query = mysqli_query($conn,"INSERT INTO buku VALUES ('$id_buku','$id_kategori','$judul','$isbn','$penerbit','$penulis')")
		or die(mysqli_error($conn));


	?>