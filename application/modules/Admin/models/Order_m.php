<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Order_m extends CI_Model
{

    public $namaTable = 'ordersales';
    public $pk = 'idOrderSales';

    function getAllData()
    {
        $this->db->order_by('tanggalOrder', 'desc');
        $this->db->join('customer', 'customer.idCustomer = ordersales.idCustomer', 'left');
        $this->db->join('sales', 'sales.idSales = ordersales.idSales', 'left');

        return $this->db->get($this->namaTable)->result();
    }

    function getDataOrderDetailByIdBarang($idOrderSales, $idBarang)
    {
        $this->db->where('idOrderSales', $idOrderSales);
        $this->db->where('ordersales_detail.idBarang', $idBarang);
        $this->db->join('barang', 'barang.idBarang = ordersales_detail.idBarang', 'left');
        return $this->db->get('ordersales_detail')->row();
    }

    function getDataById($Value)
    {
        $this->db->where($this->pk, $Value);
        $this->db->join('customer', 'customer.idCustomer = ordersales.idCustomer', 'left');
        $this->db->join('sales', 'sales.idSales = ordersales.idSales', 'left');
        return $this->db->get($this->namaTable)->row();
    }

    function getAllDataReturByIdOrderSales($idOrderSales)
    {
        $this->db->where('idOrderSales', $idOrderSales);
        $this->db->join('barang', 'barang.idBarang = retur.idBarang', 'left');

        return $this->db->get('retur')->result();
    }

    function getDataReturByIdRetur($idRetur)
    {
        $this->db->where('idRetur', $idRetur);
        $this->db->join('barang', 'barang.idBarang = retur.idBarang', 'left');

        return $this->db->get('retur')->row();
    }

    function getAllDataByidDistribusi($idOrderSales)
    {
        $this->db->where('idOrderSales', $idOrderSales);
        $this->db->join('barang', 'barang.idBarang = ordersales_detail.idBarang', 'left');

        return $this->db->get('ordersales_detail')->result();
    }

    function getDataCustomer()
    {
        return $this->db->get('customer')->result();
    }

    function save()
    {
        $object = [
            'idOrderSales' => uniqid(),
            'idCustomer' => $this->input->post('idCustomer'),
            'noInvoice' => time(),
            'tanggalOrder' => date('Y-m-d'),
            'statusPembayaran' => 'Belum Bayar',
            'statusOrder' => '1',
            'idSales' =>  $this->session->userdata('idUser')
        ];
        $this->db->insert($this->namaTable, $object);
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil Disimpan</div>');
    }

    function lihat($Value)
    {
        $object = [
            'jatuhTempo' => $this->input->post('jatuhTempo'),
            'statusOrder' => '2',
        ];

        // $payment = [
        //     'idPayment'=> uniqid(),
        //     'idOrderSales'=> $Value,
        //     'totalBayar'=> getSumField($Value),
        //     ''
        // ];
        $this->db->where($this->pk, $Value);
        $this->db->update($this->namaTable, $object);
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil Di Rubah</div>');
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
