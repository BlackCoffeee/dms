<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Dorder_m extends CI_Model
{

    public $namaTable = 'ordersales_detail';
    public $pk = 'idOrderSalesDetail';

    function getAllDataByidDistribusi($idOrderSales)
    {
        $this->db->where('idOrderSales', $idOrderSales);
        $this->db->join('barang', 'barang.idBarang = ordersales_detail.idBarang', 'left');

        return $this->db->get($this->namaTable)->result();
    }

    function getAllDataGudang()
    {
        $this->db->join('barang', 'barang.idBarang = gudang.idBarang', 'left');
        return $this->db->get('gudang')->result();
    }

    function getDataById($idItem)
    {
        $this->db->where($this->pk, $idItem);
        return $this->db->get($this->namaTable)->row();
    }


    function save($idOrderSales)
    {
        $object = [
            'idOrderSalesDetail' => uniqid(),
            'idOrderSales' => $idOrderSales,
            'idBarang' => htmlspecialchars($this->input->post('idBarang', TRUE)),
            'jumlahOrder' => htmlspecialchars($this->input->post('jumlahOrder', TRUE)),
        ];
        $this->db->insert($this->namaTable, $object);
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil Disimpan</div>');
    }

    function update($idDistribusiDetail)
    {
        $object = [
            'idBarang' => htmlspecialchars($this->input->post('idBarang', TRUE)),
            'jumlahOrder' => htmlspecialchars($this->input->post('jumlahOrder', TRUE)),
        ];
        $this->db->where($this->pk, $idDistribusiDetail);
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
