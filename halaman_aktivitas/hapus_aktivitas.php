<?php
	include("koneksi.php");
	if(isset($_GET['id']) ){
		$kode = $_GET['id'];
		$sql = "DELETE FROM aktivitas WHERE id='$kode'";
		$query = mysqli_query($koneksi, $sql);
		if($query) {
			echo "<script>swal('Data Aktivitas Berhasil Dihapus', '', 'success');</script>";
			echo "<meta http-equiv='refresh' content='1;url=index.php?page=aktivitas'>";
		} else {
			echo "<script>swal({
				type: 'error',
				title: 'Hapus Gagal',
				text: 'Data aktivitas gagal dihapus',
				footer: '<a href>Perlu Bantuan?</a>'
			})</script>";
			echo "<meta http-equiv='refresh' content='1;url=index.php?page=aktivitas'>";
        }
        mysqli_close($koneksi);
    }
?>