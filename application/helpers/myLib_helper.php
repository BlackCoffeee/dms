<?php

function cmb_dinamis($name, $table, $field, $pk, $selected = null, $extra = NULL)
{
    $ci = &get_instance();
    $cmb = "<select name='$name'class='form-control'$extra>";
    $data = $ci->db->get($table)->result();
    foreach ($data as $row) {
        $cmb .= "<option value='" . $row->$pk . "'";
        $cmb .= $selected == $row->$pk ? 'selected' : '';
        $cmb .= ">" . $row->$field . "</option>";
    }
    $cmb .= "</select>";
    return $cmb;
}

function cmb_dinamis2($name, $table, $field1, $field2, $pk, $selected = null, $extra = NULL)
{
    $ci = &get_instance();
    $cmb = "<select name='$name'class='form-control'$extra>";
    $data = $ci->db->get($table)->result();
    foreach ($data as $row) {
        $cmb .= "<option value='" . $row->$pk . "'";
        $cmb .= $selected == $row->$pk ? 'selected' : '';
        $cmb .= ">" . $row->$field1 . " - " . $row->$field2 . "</option>";
    }
    $cmb .= "</select>";
    return $cmb;
}

function noOtomatis($field, $as, $table)
{
    $ci = &get_instance();
    $sql = "SELECT MAX($field) as $as FROM $table";
    $result = $ci->db->query($sql)->row();
    $noUrut = $result->$as + 1;
    $kode = sprintf("%03s", $noUrut);
    return $kode;
}
function noOtomatisWhere($field, $as, $table, $where, $where_value)
{
    $ci = &get_instance();
    $sql = "SELECT MAX($field) as $as FROM $table WHERE $where ='$where_value'";
    $result = $ci->db->query($sql)->row();
    if (empty($result->$as)) :
        $noUrut = 0 + 1;
    else :
        $noUrut = $result->$as + 1;
    endif;
    $kode = sprintf("%03s", $noUrut);

    return $kode;
}

function getSumField($where)
{
    $ci = &get_instance();
    $query = "SELECT SUM(jumlahOrder * hargaSatuan) as totalHarga FROM ordersales_detail
    JOIN barang ON barang.idBarang= ordersales_detail.idBarang
    WHERE idOrderSales = '$where'";
    $data = $ci->db->query($query)->row();
    return $data->totalHarga;
}

function getSumFieldRetur($where)
{
    $ci = &get_instance();
    $query = "SELECT SUM(jumlahRetur * hargaSatuan) as totalHarga FROM retur
    JOIN barang ON barang.idBarang= retur.idBarang
    WHERE idOrderSales = '$where'";
    $data = $ci->db->query($query)->row();
    return $data->totalHarga;
}

function getSumPayment($where)
{
    $ci = &get_instance();
    $query = "SELECT SUM(bayar) as totalHarga FROM payment
    WHERE idOrderSales = '$where'";
    $data = $ci->db->query($query)->row();
    return $data->totalHarga;
}

function tgl_indo($tanggal)
{
    $bulan = array(
        1 =>   'Januari',
        'Februari',
        'Maret',
        'April',
        'Mei',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember'
    );
    $pecahkan = explode('-', $tanggal);

    // variabel pecahkan 0 = tanggal
    // variabel pecahkan 1 = bulan
    // variabel pecahkan 2 = tahun

    return $pecahkan[2] . ' ' . $bulan[(int) $pecahkan[1]] . ' ' . $pecahkan[0];
}

function wa_api($tujuan, $messsage)
{
    $kode_token = "qKcAhEAb";
    $id_device = "410";
    $to = $tujuan . "@s.whatsapp.net";

    $payload = json_encode([
        "id_device" => $id_device,
        "tujuan" => $to,
        "message" => $messsage,
    ]);

    $curl = curl_init();
    curl_setopt_array($curl, array(
        CURLOPT_URL => "https://whatsva.com/api/sendText",
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "POST",
        CURLOPT_POSTFIELDS => $payload,
        CURLOPT_HTTPHEADER => array(
            'Content-Type:application/json',
            "apikey: " . $kode_token,
        ),
    ));

    $response = curl_exec($curl);

    curl_close($curl);
    // echo $response;
}


function jk($val = null)
{
    $option = [
        '1' => 'Laki-laki',
        '2' => 'Perempuan',
    ];
    if (empty($val)) :
        return $option;
    else :
        return $option[$val];
    endif;
}

function fd_perkawinan($val = null)
{
    $option = [
        '1' => 'Belum Menikah',
        '2' => 'Sudah Menikah',
        '3' => 'Berpisah',
    ];
    if (empty($val)) :
        return $option;
    else :
        return $option[$val];
    endif;
}

function getRomawi($bln)
{
    switch ($bln) {
        case 1:
            return "I";
            break;
        case 2:
            return "II";
            break;
        case 3:
            return "III";
            break;
        case 4:
            return "IV";
            break;
        case 5:
            return "V";
            break;
        case 6:
            return "VI";
            break;
        case 7:
            return "VII";
            break;
        case 8:
            return "VIII";
            break;
        case 9:
            return "IX";
            break;
        case 10:
            return "X";
            break;
        case 11:
            return "XI";
            break;
        case 12:
            return "XII";
            break;
    }
}

function statusPembayaran($val = null)
{
    $option = [
        'Belum Bayar' => 'Belum Bayar',
        'Kredit' => 'Kredit',
        'Lunas' => 'Lunas',
    ];

    if (empty($val)) :
        return $option;
    else :
        return $option[$val];
    endif;
}

function statusOrder($val = null)
{
    $option = [

        '1' => 'PO',
        '2' => 'Accept',

    ];

    if (empty($val)) :
        return $option;
    else :
        return $option[$val];
    endif;
}
function statusRetur($value)
{
    $option = [
        '1' => 'Retur',
        '2' => 'Selesai',

    ];

    return $option[$value];
}

function qr($link, $kodeqr)
{
    if ($kodeqr) {
        $filename = 'qr/' . $kodeqr;
        $data = base_url($link . '/' . $kodeqr);
        if (!file_exists($filename)) {
            $ci = &get_instance();
            $ci->load->library('ciqrcode');
            $params['data'] = $data;
            $params['level'] = 'H';
            $params['size'] = 10;
            $params['savename'] = FCPATH . 'qr/' . $kodeqr . ".png";
            return  $ci->ciqrcode->generate($params);
        }
    }
}
function fd_aturanPakai($val = null)
{
    $option = [
        '1' => '1 X 1 Hari',
        '2' => '2 X 1 Hari',
        '3' => '3 X 1 Hari',
        '4' => '4 X 1 Hari',
        '5' => '6 X 1 Hari',
        '6' => '1 X 2 Hari',
        '7' => '1 X 3 Hari',
        '8' => '1 X 4 Hari',
        '9' => '1 X 5 Hari',
    ];
    if (empty($val)) :
        return $option;
    else :
        return $option[$val];
    endif;
}

function rupiah($angka)
{
    $hasil_rupiah = "Rp " . number_format($angka, 0, ',', '.');
    return $hasil_rupiah;
}
