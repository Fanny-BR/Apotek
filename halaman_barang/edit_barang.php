<?php
  $ambil=$koneksi->query("SELECT barang.id, barang.nama, kategori.nama_kategori
  FROM barang 
  JOIN kategori ON barang.id_kategori = kategori.id 
  WHERE barang.id='$_GET[id]'");
  $data=$ambil->fetch_array(MYSQLI_ASSOC);
  ?>
 <div class="row">
  <section class="content-header">
      <h1>
        Dashboard
        <small>Control Panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="index.php?page=editbarang" >Barang</a></li>
        <li class="active">Edit Barang</li>
      </ol>
    </section>
    </div>
    <br>
<div class="row">
<div class="col-md-12">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Edit Barang</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" method="post">
              <div class="box-body">
                <!-- <div class="form-group">
                  <label for="exampleInputEmail1">Kode</label>
                  <input readonly type="email" class="form-control" id="exampleInputEmail1" name="kode" value="<?php echo $data['id'] ?>" readonly>
                </div> -->
                <div class="form-group">
                  <label for="exampleInputPassword1">Nama</label>
                  <input type="hidden" name="kode" value="<?php echo $data['id'] ?>">
        
                  <input type="text" class="form-control" id="exampleInputPassword1" name="nama" value="<?php echo $data['nama'] ?>">
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Kategori</label>
                  <select name="kategori" id="kategori" class="form-control">
                      <?php $ambil = $koneksi->query("SELECT * FROM kategori");?>
                      <?php while($data = $ambil->fetch_assoc()){?>
                      <option value="<?php echo $data['id']; ?>"><?php echo $data['nama_kategori']; ?></option>
                      <?php } ?>
                  </select>
                  <!-- <input type="text" class="form-control" id="exampleInputPassword1" value="<?php echo $data['nama_kategori'] ?>"> -->
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" name="edit" class="btn btn-primary">Edit Barang</button>
                <button type="submit" name="cancel" class="btn btn-warning">Cancel</button>
              </div>
            </form>
          </div>
          <!-- /.box -->
</div>
</div>
<!-- Memanggil function javascript rupiah -->
<?php include 'data/function_rupiah.php' ?>
<?php
  if (isset($_POST['cancel'])){
    echo "<meta http-equiv='refresh' content='1;url=index.php?page=barang'>";
  }
	if (isset($_POST['edit'])){
        $kode     = mysqli_real_escape_string($koneksi,$_POST ['kode']);
        $nama     = mysqli_real_escape_string($koneksi,$_POST ['nama']);
        $id_kategori     = mysqli_real_escape_string($koneksi,$_POST ['kategori']);
        /////////////////////////////
        $id_kasir = $_SESSION['id'];
        mysqli_query($koneksi, "INSERT INTO aktivitas (tanggal, id_user, aktivitas) values (now(), '$id_kasir' , 'Mengedit Barang Dengan ID $kode')");
        ////////////////////////////
        $sql = "UPDATE barang SET nama='$nama',id_kategori='$id_kategori' WHERE id='$kode'";
        $query    = mysqli_query($koneksi, $sql);
        if($query){
          echo "<script>swal('Produk $nama Berhasil Diedit', '', 'success');</script>";
          echo "<meta http-equiv='refresh' content='1;url=index.php?page=barang'>";
        } else {
          echo "<script>swal({
            type: 'error',
            title: 'Edit Gagal',
            text: 'Produk $nama Gagal Diedit',
            footer: '<a href>Perlu Bantuan?</a>'
            })</script>";
            echo "<meta http-equiv='' content='1;url=index.php?page=barang'>";
        }
    mysqli_close($koneksi);
	}
?>
<?php include 'data/validasi_form.php' ?>