<?php
$linkin = $this->uri->segment(1) . '/' . $this->uri->segment(2);
$no = '1';
?>
<div class="row page-title">
    <div class="col-md-12">
        <nav aria-label="breadcrumb" class="float-right mt-1">
            <ol class="breadcrumb">
                <li><a href="<?= base_url($linkin . '/add') ?>" class="btn btn-success">Tambah Data</a></li>
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
                            <th>Tanggal Order</th>
                            <th>Nama Customer</th>
                            <th>Status Pembayaran</th>
                            <th>Total Bayar</th>
                            <th class="text-center">Status Order</th>
                            <th>Nama Sales</th>
                            <th class="text-center">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($data as $row) : ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td>#<?= $row->noInvoice ?></td>
                                <td><?= $row->tanggalOrder ?></td>
                                <td><?= $row->namaLengkap ?></td>
                                <td><?= $row->statusPembayaran ?></td>
                                <td><?= rupiah(getSumField($row->idOrderSales)) ?></td>
                                <td class="text-center"><?= statusOrder($row->statusOrder) ?></td>
                                <td><?= $row->namaSales ?></td>
                                <td class="text-center">
                                    <div class="btn-group mb-0">
                                        <!-- <a href="<?= base_url('Sales/Dorder/list/' . $row->idOrderSales) ?>" class="btn btn-success btn-sm" data-toggle="tooltip" title="Tambah Item"><i class="uil uil-plus"></i></a> -->
                                        <a href="<?= base_url($linkin . '/lihat/' . $row->idOrderSales) ?>" class="btn btn-info btn-sm" data-toggle="tooltip" title="Lihat"><i class="uil uil-eye"></i></a>
                                        <!-- <a href="<?= base_url($linkin . '/delete/' . $row->idOrderSales) ?>" id="<?= $row->namaLengkap . ' - ' . $row->tanggalOrder ?>" class="delete-data btn btn-info btn-sm" data-toggle="tooltip" title="Hapus"><i class="uil uil-trash-alt"></i></a> -->
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