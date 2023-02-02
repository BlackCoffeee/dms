<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard_m extends CI_Model
{
    function jumlahPelanggan()
    {
        return $this->db->get('customer')->num_rows();
    }

    function omset()
    {
        $bulan = date('m');
        $sql = ("SELECT SUM(jumlahOrder * hargaSatuan) as totalHarga FROM `ordersales_detail` LEFT JOIN `ordersales` ON `ordersales`.`idOrdersales` = `ordersales_detail`.`idOrdersales` LEFT JOIN `barang` ON `barang`.`idBarang` = `ordersales_detail`.`idBarang` WHERE month(tanggalOrder) = '$bulan'");
        $data =  $this->db->query($sql)->row();
        return $data->totalHarga;
    }

    function order()
    {
        $bulan = date('m');
        $this->db->where('month(tanggalOrder)', $bulan);
        return $this->db->get('ordersales')->num_rows();
    }

    function um()
    {
        $this->db->select_sum('bayar');
        $data = $this->db->get('payment')->row();
        return $data->bayar;
    }

    function recentOrder()
    {
        $this->db->order_by('idOrderSalesDetail', 'desc');
        $this->db->join('barang', 'barang.idBarang = ordersales_detail.idBarang', 'left');

        return $this->db->get('ordersales_detail', 5)->result();
    }

    function salesOrder()
    {

        $sql = "SELECT COUNT(idOrderSales)as jumlah , sales.namaSales FROM ordersales JOIN sales ON sales.idSales= ordersales.idSales GROUP BY ordersales.idSales";
        return $this->db->query($sql)->result();
    }
}
/* End of file */
