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
        <h4 class="mb-1 mt-0">Edit Data <?= $title ?></h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <form class="needs-validation" novalidate="" action="<?= base_url($linkin . '/editAction/' . $this->uri->segment(4)) . '/' . $this->uri->segment(5) ?>" method="post">
                    <div class="form-group mb-3">
                        <label for="validationCustom01">Nama Barang</label>
                        <select name="idBarang" required class="form-control">
                            <?php foreach ($stok as $stok) : ?>
                                <option <?= $stok->stok == '0' ? 'disabled' : '' ?> <?= $row->idBarang == $stok->idBarang ? 'selected' : '' ?> value="<?= $stok->idBarang ?>"><?= $stok->merk . ' ' . $stok->namaBarang . ' | Stok =' . $stok->stok . ' ' . $stok->satuan . ' | Harga = ' . rupiah($stok->hargaSatuan) ?></option>
                            <?php endforeach ?>
                        </select>
                        <div class="invalid-feedback">
                            Harus diisi!
                        </div>
                    </div>
                    <div class="form-group mb-3">
                        <label for="validationCustom01">Jumlah</label>
                        <input type="number" value="<?= $row->jumlahOrder ?>" name="jumlahOrder" class="form-control" required>
                        <div class="invalid-feedback">
                            Harus diisi!
                        </div>
                    </div>
                    <button class="btn-sm btn btn-primary" type="submit">Simpan</button>
                    <a href="<?= base_url($linkin . '/list/' . $this->uri->segment(4)) ?>" class="btn-sm btn btn-danger">Kembali</a>
                </form>
            </div> <!-- end card-body-->
        </div>
    </div>
</div>