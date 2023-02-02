<?php
$linkin = $this->uri->segment(1) . '/' . $this->uri->segment(2);
$no = '1';
?>
<div class="row page-title">
    <div class="col-md-12">
        <nav aria-label="breadcrumb" class="float-right mt-1">
            <ol class="breadcrumb">
                <!-- <li><a href="<?= base_url($linkin . '/add') ?>" class="btn btn-success">Tambah Data</a></li> -->
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
                            <th>Nama Customer</th>
                            <th>Status Pembayaran</th>
                            <th>Total Tagihan</th>
                            <th>Total Bayar</th>
                            <th>Sisa Tagihan</th>
                            <th>Jatuh Tempo</th>
                            <th class="text-center">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($data as $row) : ?>
                            <?php
                            $tt = getSumField($row->idOrderSales);
                            $tb = getSumPayment($row->idOrderSales);
                            if ($tb <= '0') :
                                $stat = 'Belum Bayar';
                            elseif ($tt > $tb) :
                                $stat = 'Kredit';
                            elseif ($tb >= $tt) :
                                $stat = 'Lunas';
                            endif;
                            ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td>#<?= $row->noInvoice ?></td>
                                <td><?= $row->namaLengkap ?></td>
                                <td><?= $stat ?></td>
                                <td><b><?= rupiah($tt) ?></b></td>
                                <td class="text-success"><b><?= rupiah($tb) ?></b></td>
                                <td class="text-danger"><b><?= rupiah($tt - $tb) ?></b></td>
                                <td><?= tgl_indo($row->jatuhTempo) ?></td>
                                <td class="text-center">
                                    <div class="btn-group mb-0">
                                        <a href="<?= base_url($linkin . '/payment/' . $row->idOrderSales) ?>" class="btn btn-info btn-sm" data-toggle="tooltip" title="Update Pembayaran"><i class="uil uil-edit"></i></a>
                                        <a href="<?= base_url($linkin . '/listBayar/' . $row->idOrderSales) ?>" class="btn btn-success btn-sm" data-toggle="tooltip" title="List Pembayaran"><i class="uil uil-eye"></i></a>
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