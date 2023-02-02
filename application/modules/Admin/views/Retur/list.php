<?php
$linkin = $this->uri->segment(1) . '/' . $this->uri->segment(2);
$no = '1';
?>
<div class="row page-title">
    <div class="col-md-12">
        <nav aria-label="breadcrumb" class="float-right mt-1">
            <ol class="breadcrumb">
            </ol>
        </nav>
        <h4 class="mb-1 mt-0">Data <?= $title ?></h4>
    </div>
</div>
<div class="row">
    <div class="col-12">
        <div class="card">
            <div class="card-body">
                <table id="basic-datatable" class="table">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>No Invoice</th>
                            <th>Tanggal Retur</th>
                            <th>Nama Customer</th>
                            <th>Status</th>
                            <th>Nama Barang</th>
                            <th>Harga</th>
                            <th>Jumlah</th>
                            <th>Jumlah Harga</th>
                            <th>Jumlah Kembali</th>
                            <th class="text-center">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($data as $row) : ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td>#<?= $row->noInvoice ?></td>
                                <td><?= date('d-m-Y', $row->tanggalRetur) ?></td>
                                <td><?= $row->namaLengkap ?></td>
                                <td><?= $row->jumlahRetur == '0' ? 'Selesai' : 'Retur' ?></td>
                                <td><?= $row->merk . ' - ' . $row->namaBarang ?></td>
                                <td><?= rupiah($row->hargaSatuan) ?></td>
                                <td><?= $row->jumlahRetur ?></td>
                                <td><?= rupiah($row->jumlahRetur * $row->hargaSatuan) ?></td>
                                <td><?= $row->jumlahKembali ?></td>
                                <td class="text-center">
                                    <div class="btn-group mb-0">
                                        <a href="<?= base_url($linkin . '/returKembali/' . $row->idOrderSales . '/' . $row->idRetur) ?>" class="btn btn-info btn-sm" data-toggle="tooltip" title="Kembali"><i class="uil uil-repeat"></i></a>
                                    </div>
                                </td>
                            </tr>
                        <?php endforeach ?>
                    </tbody>
                </table>

            </div> <!-- end card body-->
        </div> <!-- end card -->
    </div><!-- end col-->
</div>
<!-- end row-->