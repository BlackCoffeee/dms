<?php
$linkin = $this->uri->segment(1) . '/' . $this->uri->segment(2);

?>

<div class="row page-title">
    <div class="col-md-12">
        <nav aria-label="breadcrumb" class="float-right mt-1">
            <!-- <ol class="breadcrumb">
                <li><a href="<?= base_url($ctrl . '/add') ?>" class="btn btn-success">Tambah Data</a></li>
            </ol> -->
        </nav>
        <h4 class="mb-1 mt-0">Barang Retur Selesai</h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <form class="needs-validation" novalidate="" action="<?= base_url($linkin . '/returKembaliAction/' . $this->uri->segment(4) . '/' . $this->uri->segment(5)) ?>" method="post">
                    <div class="form-group mb-3">
                        <label for="validationCustom01">Nama Barang</label>
                        <input type="text" name="namaBarang" value="<?= $row->merk . ' - ' . $row->namaBarang ?>" readonly class="form-control">
                        <div class="invalid-feedback">
                            Harus diisi!
                        </div>
                    </div>
                    <div class="form-group mb-3">
                        <label for="validationCustom01">Jumlah</label>
                        <input type="number" name="jumlahKembali" value="<?= $row->jumlahRetur ?>" max="<?= $row->jumlahRetur ?>" class="form-control" required>
                        <div class="invalid-feedback">
                            Harus diisi!
                        </div>
                    </div>
                    <input type="text" name="jumlahRetur" value="<?= $row->jumlahRetur ?>" hidden>
                    <input type="text" name="idBarang" value="<?= $row->idBarang ?>" hidden>
                    <input type="text" name="oldjumlahKembali" value="<?= $row->jumlahKembali ?>" hidden>
                    <button class="btn-sm btn btn-primary" type="submit">Simpan</button>
                    <a href="<?= base_url($linkin . '/lihat/' . $this->uri->segment(4)) ?>" class="btn-sm btn btn-danger">Kembali</a>
                </form>
            </div> <!-- end card-body-->
        </div>
    </div>
</div>