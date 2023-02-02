<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Gudang_m extends CI_Model
{

    public $namaTable = 'gudang';
    public $pk = 'idBarang';

    function getAllData()
    {
        $this->db->join('barang', 'barang.idBarang = gudang.idBarang', 'left');
        return $this->db->get($this->namaTable)->result();
    }

    function getDataById($idItem)
    {
        $this->db->where($this->pk, $idItem);
        return $this->db->get($this->namaTable)->row();
    }


    function save($idPermintaan)
    {
        $object = [
            'idPermintaan' => $idPermintaan,
            'idBarang' => htmlspecialchars($this->input->post('idBarang', TRUE)),
            'jumlahItem' => htmlspecialchars($this->input->post('jumlahItem', TRUE)),
        ];
        $this->db->insert($this->namaTable, $object);
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil Disimpan</div>');
    }

    function update($idItem)
    {
        $object = [
            'idBarang' => htmlspecialchars($this->input->post('idBarang', TRUE)),
            'jumlahItem' => htmlspecialchars($this->input->post('jumlahItem', TRUE)),

        ];
        $this->db->where($this->pk, $idItem);
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
