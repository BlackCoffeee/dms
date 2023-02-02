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

    <h3>
        <center>
            LAPORAN A/R INVOICE
        </center>
    </h3>
    <div class="row">
        <div class="col-sm-12">
            <div class="card-box table-responsive">
                <table border="1" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th style="text-align:center; font-size: 18px;">No</th>
                            <th style="text-align:center; font-size: 18px;">Tanggal</th>
                            <th style="text-align:center; font-size: 18px;">No Invoice</th>
                            <th style="text-align:center; font-size: 18px;">Nama Customer</th>
                            <th style="text-align:center; font-size: 18px;">Status Pembayaran</th>
                            <th style="text-align:center; font-size: 18px;">Total Tagihan</th>
                            <th style="text-align:center; font-size: 18px;">Total Bayar</th>
                            <th style="text-align:center; font-size: 18px;">Sisa Tagihan</th>
                        </tr>
                    </thead>

                    <tbody>
                        <?php foreach ($data as $row) :
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
                                <td align="center"><?= tgl_indo($row->tanggalOrder) ?></td>
                                <td>#<?= $row->noInvoice ?></td>
                                <td><?= $row->namaLengkap ?></td>
                                <td align="center"><?= $stat ?></td>
                                <td align="right"><b><?= rupiah($tt) ?></b></td>
                                <td align="right"><b><?= rupiah($tb) ?></b></td>
                                <td align="right"><b><?= rupiah($tt - $tb) ?></b></td>
                            </tr>
                        <?php endforeach; ?>
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
            <td align="center"><br><br><br></td>
            <td></td>
            <td align="center">Administrator <br><br><br></td>
        </tr>
        <tr>
            <td align="center"></td>
            <td></td>
            <td align="center"><?= $this->session->userdata('namaLengkap'); ?></td>
        </tr>
    </table>
</body>

</html>