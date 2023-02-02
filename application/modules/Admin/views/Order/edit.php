<?php
$linkin = $this->uri->segment(1) . '/' . $this->uri->segment(2);
$tglkemarin = date('Y-m-d', strtotime("-1 day", strtotime(date("Y-m-d"))));
$tglA = date('d');
$getTgl = $tglA - 1;
$kurangTgl        = mktime(0, 0, 0, date("n"), date("j") - $getTgl, date("Y"));
$hasilTgl =  date('Y-m-d', strtotime("21 day", strtotime(date("Y-m-d"))));
$no = 1;
$nor = 1;
?>

<div class="row page-title">
    <div class="col-md-12">
        <nav aria-label="breadcrumb" class="float-right mt-1">
            <ol class="breadcrumb">
                <li> <a href="<?= base_url($linkin) ?>" class="btn btn-danger">Kembali</a></li>
            </ol>
        </nav>
        <h4 class="mb-1 mt-0">Detail <?= $title ?></h4>
    </div>
</div>
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <form class="needs-validation" novalidate="" action="<?= base_url($linkin . '/lihatAction/' . $this->uri->segment(4)) ?>" enctype="multipart/form-data" method="post">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group mb-3">
                                <label for="validationCustom01">No Invoice</label>
                                <input type="text" class="form-control" value="<?= $row->noInvoice ?>" required readonly>
                                <div class="invalid-feedback">
                                    Harus diisi!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group mb-3">
                                <label for="validationCustom01">Tanggal Jatuh Tempo</label>
                                <input type="date" class="form-control" value="<?= $hasilTgl ?>" name="jatuhTempo" required name="jt">
                                <div class="invalid-feedback">
                                    Harus diisi!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group mb-3">
                                <label for="validationCustom01">Nama Customer</label>
                                <input type="text" class="form-control" value="<?= $row->namaLengkap ?>" required readonly>
                                <div class="invalid-feedback">
                                    Harus diisi!
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group mb-3">
                                <label for="validationCustom01">Nama Sales</label>
                                <input type="text" class="form-control" value="<?= $row->namaSales ?>" required readonly>
                                <div class="invalid-feedback">
                                    Harus diisi!
                                </div>
                            </div>
                        </div>
                    </div>
                    <h4 class="text-center mb-3 mt-5">DAFTAR BARANG ORDER</h4>

                    <table class="table mt-2 mb-5">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Merk</th>
                                <th>Nama Barang</th>
                                <th>Harga</th>
                                <th>Jumlah</th>
                                <th>Satuan</th>
                                <th>Jumlah Harga</th>
                                <th class="text-center">Return</th>
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
                                    <td class="text-center">
                                        <div class="btn-group mb-0">
                                            <a href="<?= base_url($linkin . '/retur/' . $rows->idOrderSales . '/' . $rows->idBarang) ?>" class="btn btn-info btn-sm" data-toggle="tooltip" title="Retur"><i class="uil uil-repeat"></i></a>
                                        </div>
                                    </td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th class="text-center" colspan="6">TOTAL HARGA</th>
                                <th><?= rupiah(getSumField($row->idOrderSales)) ?></th>
                            </tr>
                        </tfoot>
                    </table>

                    <button class="btn btn-primary" type="submit">Kirim</button>
                    <a href="<?= base_url($linkin . '/cetak/' . $row->idOrderSales) ?>" target="_blank" class="btn btn-warning">Cetak</a>
                </form>
                <?php if (!empty($dataRetur)) : ?>
                    <hr>
                    <h4 class="text-center mb-3 mt-5">DAFTAR BARANG RETUR</h4>
                    <table class="table mt-2 mb-5">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Merk</th>
                                <th>Nama Barang</th>
                                <th>Harga</th>
                                <th>Jumlah</th>
                                <th>Satuan</th>
                                <th>Jumlah Harga</th>
                                <th>Status</th>
                                <th>Jumlah Kembali</th>
                                <th class="text-center">Return</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($dataRetur as $rowRetur) : ?>
                                <tr>
                                    <td><?= $nor++ ?></td>
                                    <td><?= $rowRetur->merk ?></td>
                                    <td><?= $rowRetur->namaBarang ?></td>
                                    <td><?= rupiah($rowRetur->hargaSatuan) ?></td>
                                    <td><?= $rowRetur->jumlahRetur ?></td>
                                    <td><?= $rowRetur->satuan ?></td>
                                    <td><?= rupiah($rowRetur->jumlahRetur * $rowRetur->hargaSatuan) ?></td>
                                    <td><?= $rowRetur->jumlahRetur == '0' ? 'Selesai' : 'Retur' ?></td>
                                    <td><?= $rowRetur->jumlahKembali ?></td>
                                    <td class="text-center">
                                        <div class="btn-group mb-0">
                                            <a href="<?= base_url($linkin . '/returKembali/' . $rowRetur->idOrderSales . '/' . $rowRetur->idRetur) ?>" class="btn btn-info btn-sm" data-toggle="tooltip" title="Retur"><i class="uil uil-repeat"></i></a>
                                        </div>
                                    </td>
                                </tr>
                            <?php endforeach ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th class="text-center" colspan="6">TOTAL UANG</th>
                                <th><?= rupiah(getSumFieldRetur($row->idOrderSales)) ?></th>
                            </tr>
                        </tfoot>
                    </table>
                    <a href="<?= base_url($linkin . '/cetakRetur/' . $row->idOrderSales) ?>" target="_blank" class="btn btn-warning">Cetak</a>

                <?php else : ?>
                <?php endif ?>
            </div> <!-- end card-body-->
        </div>
    </div>
</div>