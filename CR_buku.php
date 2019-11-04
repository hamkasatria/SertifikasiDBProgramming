<!DOCTYPE html>
<html>
<head>
	<title>input dan baca buku</title>
</head>
<body>


	<!--membuat data-->
	<form method="POST" action="inputbuku.php">

		ID Buku = <input type="text" name="id_buku"><br>
		ID Kategori = <input type="text" name="id_kategori"><br>
		Judul = <input type="text" name="judul"><br>
		ISBN = <input type="text" name="isbn"><br>
		Penerbit = <input type="text" name="penerbit"><br>
		Penulis = <input type="text" name="penulis"><br>

		<input type="submit" name="submit">
		<input type="reset" name="reset">
		

	</form>
<br><br>
	<!--menampilkan data buku-->
	<table border="1">
		<thead>
			<td>ID buku</td>
			<td>ID kategori </td>
			<td>Judul</td>
			<td>ISBD</td>
			<td>Penerbit</td>
			<td>Penulis</td>
			<td>Opsi</td>
		</thead>

		<?php
			include "koneksi.php";
			$query = mysqli_query($conn, "SELECT * FROM buku");
			while ($data = mysqli_fetch_array($query)) {
		?>
				<tr>
					<td><?php echo $data['id_buku'];?></td>
					<td><?php echo $data['id_kategori'];?></td>
					<td><?php echo $data['judul'];?></td>
					<td><?php echo $data['isbn'];?></td>
					<td><?php echo $data['penerbit'];?></td>
					<td><?php echo $data['penulis'];?></td>
					<td><a href=E_buku.php?id=<? echo $data['id_buku'];?>> Edit </a>
						<a href=D_buku.php?id=<? echo $data['id_buku'];?>> Delete </a></td>

				</tr>

		<?
			}

		?>
	</table>

</body>
</html>