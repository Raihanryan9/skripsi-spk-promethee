<?php $this->load->view('layouts/header_admin'); ?>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><i class="fas fa-fw fa-info"></i>Informasi Produk</h1>
</div>
<div class="container-fluid">
<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-dark"></i>Gambar Produk Keju Mozarella</h6>
    </div>

    <div class="card-body">
        <div class="row">
            <!-- Loop Produk -->
            <?php foreach ($produk as $prdk) : ?>
            <div class="card ml-4" style="width: 12rem;">
                <div class="card-header py-4">
                    <img class="card-img-top" src="<?php echo base_url("assets/img/") . $prdk->gambar ?>" alt="Card image cap">
                    <div class="card-body">
                        <h6 class="card-title mb-1"><?php echo $prdk->nama_prdk ?></h6>
                        <span class="badge bg-warning text-dark mb-2">Rp.<?php echo $prdk->harga ?></span><br>
                        <small><?php echo $prdk->keterangan ?></small>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
    </div>
<?php $this->load->view('layouts/footer_admin'); ?>