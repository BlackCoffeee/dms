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

    function getDataById($Value)
    {
        $this->db->where($this->pk, $Value);
        return $this->db->get($this->namaTable)->row();
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

    function update($Value, $foto)
    {
        if (empty($foto)) :
            $object = [
                'namaBarang' => $this->input->post('namaBarang'),
                'merk' => $this->input->post('merk'),
                'satuan' => $this->input->post('satuan'),
                'dateCreated' => time()

            ];
        elseif (!empty($foto)) :
            $object = [
                'namaBarang' => $this->input->post('namaBarang'),
                'merk' => $this->input->post('merk'),
                'satuan' => $this->input->post('satuan'),
                'gambarBarang' => $foto,
                'dateCreated' => time()

            ];
        endif;
        $this->db->where($this->pk, $Value);
        $this->db->update($this->namaTable, $object);
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil Di Rubah</div>');
    }

    function delete($Value)
    {
        $this->db->where($this->pk, $Value);
        $this->db->delete($this->namaTable);
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil Di Hapus</div>');
    }
}

/* End of file */
