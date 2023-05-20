<div class="row">
<section class="content-header">
<h1>
    Dashboard
    <small>Control Panel</small>
</h1>
<ol class="breadcrumb">
    <li><a href="index.php"><i class="fa fa-dashboard"></i> Home</a></li>
    <li class="active">Aktivitas</li>
</ol>
</section>
</div>
    <br>

<div class="col-md-12">
    <div class="box box-primary">
    <div class="box-header">
        <h3 class="box-title">Aktivitas</h3>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <table id="example1" class="table table-bordered table-striped">
        <thead>
            <tr>
            <th>Tanggal</th>
            <th>User</th>
            <th>Aktivitas</th>
            <!-- <th><center>Action</center></th> -->
            
            </tr>
        </thead>
        <tbody>
            <?php 

        include 'data/function_dateindo.php';
            $query = mysqli_query($koneksi, "SELECT aktivitas.id, aktivitas.tanggal, user.nama, aktivitas.aktivitas
            FROM aktivitas, user
            WHERE  aktivitas.id_user = user.id;");
            $jumlah = mysqli_num_rows($query);
            while ($data = mysqli_fetch_array($query)){
            ?>
            <tr>
            <td>
                <?php echo $data['tanggal']; ?>
                
            </td>
            <td><?php echo $data['nama'] ?></td>
            <td><?php echo $data['aktivitas'] ?></td>
            <!-- <td><center>
                <a href="index.php?page=hapus_aktivitas&id=<?php echo $data['id'];?>" class="btn btn-danger delete-aktivitas"><i
                    class="fa fa-trash"></i> Hapus</a>
            </center>
            </td> -->
            </tr>

            <?php }?>
        </tbody>
        </table>
    </div>
    <!-- /.box-body -->
    </div>
</div>



<?php include 'data/validasi_form.php' ?>