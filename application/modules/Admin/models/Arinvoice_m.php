<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Arinvoice_m extends CI_Model
{

    public $namaTable = 'ordersales';
    public $pk = 'idOrderSales';

    function getAllData()
    {
        $this->db->order_by('tanggalOrder', 'desc');
        $this->db->where('statusOrder', '2');
        $this->db->join('customer', 'customer.idCustomer = ordersales.idCustomer', 'left');
        $this->db->join('sales', 'sales.idSales = ordersales.idSales', 'left');

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

    function getDataPaymentById($idOrderSales)
    {
        $this->db->where('idOrderSales', $idOrderSales);
        return $this->db->get('payment')->result();
    }

    // function save()
    // {
    //     $object = [
    //         'idOrderSales' => uniqid(),
    //         'idCustomer' => $this->input->post('idCustomer'),
    //         'tanggalOrder' => date('Y-m-d'),
    //         'statusPembayaran' => 'Belum Bayar',
    //         'statusOrder' => '1',
    //         'idSales' =>  $this->session->userdata('idUser')
    //     ];
    //     $this->db->insert($this->namaTable, $object);
    //     $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil Disimpan</div>');
    // }

    function payment($Value)
    {

        $object = [
            'idPayment' => uniqid(),
            'idOrderSales' => $Value,
            'bayar' => str_replace('.', '', $this->input->post('bayar')),
            'tanggalPembayaran' => time()

        ];
        $this->db->insert('payment', $object);
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil Di Tambah</div>');
    }

    function delete($idPayment)
    {
        $this->db->where('idPayment', $idPayment);
        $this->db->delete('payment');
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil Di Hapus</div>');
    }
}

/* End of file */
