<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Barang_m extends CI_Model
{

    public $namaTable = 'barang';
    public $pk = 'idBarang';

    function getAllData()
    {
        return $this->db->get($this->namaTable)->result();
    }

    function getDataById($Value)
    {
        $this->db->where($this->pk, $Value);
        return $this->db->get($this->namaTable)->row();
    }


    function save($foto)
    {
        $object = [
            'idBarang' => uniqid(),
            'namaBarang' => $this->input->post('namaBarang'),
            'merk' => $this->input->post('merk'),
            'hargaSatuan' => str_replace('.', '', $this->input->post('hargaSatuan')),
            'satuan' => $this->input->post('satuan'),
            'gambarBarang' => $foto,
            'dateCreated' => time()

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
                'hargaSatuan' => str_replace('.', '', $this->input->post('hargaSatuan')),
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
