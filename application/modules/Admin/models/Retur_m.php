<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Retur_m extends CI_Model
{

    public $namaTable = 'retur';
    public $pk = 'idRetur';

    function getAllData()
    {
        $this->db->order_by('tanggalOrder', 'desc');
        $this->db->where('statusOrder', '2');
        $this->db->join('ordersales', 'ordersales.idOrderSales = retur.idOrderSales', 'left');
        $this->db->join('customer', 'customer.idCustomer = ordersales.idCustomer', 'left');
        $this->db->join('barang', 'barang.idBarang = retur.idBarang', 'left');

        return $this->db->get($this->namaTable)->result();
    }

    function getDataById($Value)
    {
        $this->db->where($this->pk, $Value);
        return $this->db->get($this->namaTable)->row();
    }

    function getDataCustomer()
    {
        return $this->db->get('customer')->result();
    }

    function getDataPaymentById($idRetur)
    {
        $this->db->where('idRetur', $idRetur);
        return $this->db->get('payment')->result();
    }


    function getDataReturByIdRetur($idRetur)
    {
        $this->db->where('idRetur', $idRetur);
        $this->db->join('barang', 'barang.idBarang = retur.idBarang', 'left');

        return $this->db->get('retur')->row();
    }

    function retur($idOrderSales, $idBarang)
    {
        $retur = [
            'idRetur' => uniqid(),
            'tanggalRetur' => time(),
            'idOrderSales' => $idOrderSales,
            'idBarang' => $idBarang,
            'jumlahRetur' => $this->input->post('jumlahRetur')
        ];

        $this->db->insert('retur', $retur);

        $orderDetail = [
            'jumlahOrder' => $this->input->post('jumlahOrder') - $this->input->post('jumlahRetur')
        ];
        $this->db->where('idOrderSales', $idOrderSales);
        $this->db->where('idBarang', $idBarang);
        $this->db->update('ordersales_detail', $orderDetail);
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil Di Rubah</div>');
    }

    function returKembali($idOrderSales, $idRetur)
    {
        $retur = [
            'jumlahKembali' => $this->input->post('jumlahKembali') + $this->input->post('oldjumlahKembali'),
            'jumlahRetur' => $this->input->post('jumlahRetur') - $this->input->post('jumlahKembali')
        ];
        $this->db->where('idRetur', $idRetur);
        $this->db->update('retur', $retur);
        $idBarang = $this->input->post('idBarang');
        $data = $this->getDataOrderDetail($idOrderSales, $idBarang);

        $order = [
            'jumlahOrder' => $data->jumlahOrder + $this->input->post('jumlahKembali'),
        ];
        $this->db->where('idOrderSales', $idOrderSales);
        $this->db->where('idBarang', $idBarang);
        $this->db->update('ordersales_detail', $order);
    }

    function getDataOrderDetail($idOrderSales, $idBarang)
    {
        $this->db->where('idOrderSales', $idOrderSales);
        $this->db->where('idBarang', $idBarang);
        return $this->db->get('ordersales_detail')->row();
    }
}

/* End of file */
