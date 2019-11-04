<!DOCTYPE html>
<html>
<head>
	<title>input dan baca kategori</title>
</head>
<body>


	<!--membuat data-->
	<form method="POST" action="inputkategori.php">

		ID Kategori = <input type="text" name="id_kategori"><br>
		Kategori = <input type="text" name="kategori"><br>

		<input type="submit" name="submit">
		<input type="reset" name="reset">
		

	</form>
<br><br>
	<!--menampilkan data buku-->
	<table border="1">
		<thead>
			<td>ID kategori </td>
			<td>Kategori</td>
			<td>Opsi</td>
		</thead>

		<?php
			include "koneksi.php";
			$query = mysqli_query($conn, "SELECT * FROM kategori");
			while ($data = mysqli_fetch_array($query)) {
		?>
				<tr>
				
					<td><?php echo $data['id_kategori'];?></td>
					<td><?php echo $data['nama_kategori'];?></td>
					<td>
						<a href=E_kategori.php?id=<? echo $data['id_kategori'];?>> Edit </a>
						<a href=D_kategori.php?id=<? echo $data['id_kategori'];?>> Delete </a>
					</td>

				</tr>

		<?
			}

		?>
	</table>

</body>
</html>