<?php
$no = 1;
$now = date('Y-m-d');

?>

<script type="text/javascript">
    window.print();
</script>

<!DOCTYPE html>
<html>

<head>
    <title>LAPORAN</title>
    <link rel="shortcut icon" href="<?= base_url() ?>assets/images/favicon.ico">
</head>

<body>
    <p align="left">
        <b>
            <img src="<?= base_url() ?>/assets/images/logo.png" align="left" width="52">
            PT. PULAU INDAH JAYA <br>
            Jl. A. Yani Km 5,7 No 56 <br>
            Pemurus Luar Banjarmasin Timur
        </b><br>
    </p>
    <!-- <hr size="1px" color="black">
    <hr size="4px" color="black"> -->

    <h2>
        <center>
            <u>
                INVOICE
            </u>
        </center>
    </h2>
    <div class="row">
        <table>
            <tr>
                <th style="text-align:left">Tanggal Order</th>
                <th>:</th>
                <th style="text-align:left"><?= tgl_indo($row->tanggalOrder) ?></th>
            </tr>
            <tr>
                <th style="text-align:left">Tanggal JT</th>
                <th>:</th>
                <th style="text-align:left"><?= tgl_indo($row->jatuhTempo) ?></th>
            </tr>
            <tr>
                <th style="text-align:left">No Inv</th>
                <th>:</th>
                <th style="text-align:left"><?= $row->noInvoice ?></th>
            </tr>
            <tr>
                <th style="text-align:left">Nama Customer</th>
                <th>:</th>
                <th style="text-align:left"><?= $row->namaLengkap ?></th>
            </tr>
            <tr>
                <th style="text-align:left">Nama Sales</th>
                <th>:</th>
                <th style="text-align:left"><?= $row->namaSales ?></th>
            </tr>
        </table>

    </div>
    <br>
    <br>
    <div class="row">
        <div class="col-sm-12">
            <div class="card-box table-responsive">
                <table border="1" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th style="text-align:center; font-size: 18px;">No</th>
                            <th style="text-align:center; font-size: 18px;">Merk</th>
                            <th style="text-align:center; font-size: 18px;">Nama Barang</th>
                            <th style="text-align:center; font-size: 18px;">Harga</th>
                            <th style="text-align:center; font-size: 18px;">Jumlah</th>
                            <th style="text-align:center; font-size: 18px;">Satuan</th>
                            <th style="text-align:center; font-size: 18px;">Jumlah Harga</th>



                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($data as $rows) : ?>
                            <tr>
                                <td><?= $no++ ?></td>
                                <td><?= $rows->merk ?></td>
                                <td><?= $rows->namaBarang ?></td>
                                <td><?= rupiah($rows->hargaSatuan) ?></td>
                                <td><?= $rows->jumlahOrder ?></td>
                                <td><?= $rows->satuan ?></td>
                                <td><?= rupiah($rows->jumlahOrder * $rows->hargaSatuan) ?></td>
                            </tr>
                        <?php endforeach ?>
                    </tbody>

                </table>

            </div>
        </div>
    </div>
    <br>

    <br>
    <table width="100%">
        <tr>
            <td width="40%"></td>
            <td width="20%"></td>
            <td align="center">Banjarmasin, <?= tgl_indo($now) ?></td>
        </tr>
        <tr>
            <td align="center">Customer<br><br><br></td>
            <td></td>
            <td align="center">Administrator <br><br><br></td>
        </tr>
        <tr>
            <td align="center"><?= $row->namaLengkap ?></td>
            <td></td>
            <td align="center"><?= $this->session->userdata('namaLengkap'); ?></td>
        </tr>
    </table>
</body>

</html>