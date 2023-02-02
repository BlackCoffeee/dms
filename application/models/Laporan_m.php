<?php

defined('BASEPATH') or exit('No direct script access allowed');

class laporan_m extends CI_Model
{

    function bm($dari, $sampai)
    {
        $this->db->where('tanggalMasuk BETWEEN "' . $dari . '" AND "' . $sampai . '"');
        $this->db->join('barang', 'barang.idBarang = barangMasuk.idBarang', 'left');
        return $this->db->get('barangMasuk')->result();
    }

    function bk($dari, $sampai)
    {
        $this->db->where('tanggalOrder BETWEEN "' . $dari . '" AND "' . $sampai . '"');
        $this->db->join('barang', 'barang.idBarang = ordersales_detail.idBarang', 'left');
        $this->db->join('ordersales', 'ordersales.idOrderSales = ordersales_detail.idOrderSales', 'left');
        return $this->db->get('ordersales_detail')->result();
    }

    function retur($dari, $sampai)
    {
        $this->db->where('tanggalRetur BETWEEN "' . strtotime($dari) . '" AND "' . strtotime($sampai)  . '"');
        $this->db->join('barang', 'barang.idBarang = retur.idBarang', 'left');
        $this->db->join('ordersales', 'ordersales.idOrderSales = retur.idOrderSales', 'left');
        $this->db->join('customer', 'customer.idCustomer = ordersales.idCustomer', 'left');

        return $this->db->get('retur')->result();
    }

    function ar($dari, $sampai)
    {
        $this->db->where('statusOrder', '2');
        $this->db->where('tanggalOrder BETWEEN "' . $dari . '" AND "' . $sampai  . '"');
        $this->db->join('customer', 'customer.idCustomer = ordersales.idCustomer', 'left');
        $this->db->join('sales', 'sales.idSales = ordersales.idSales', 'left');

        return $this->db->get('ordersales')->result();
    }

    function inv($dari, $sampai)
    {
        $this->db->where('tanggalOrder BETWEEN "' . $dari . '" AND "' . $sampai  . '"');
        $this->db->join('customer', 'customer.idCustomer = ordersales.idCustomer', 'left');
        $this->db->join('sales', 'sales.idSales = ordersales.idSales', 'left');

        return $this->db->get('ordersales')->result();
    }
}

/* End of file ModelName.php */
