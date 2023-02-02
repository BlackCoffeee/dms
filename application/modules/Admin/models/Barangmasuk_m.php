<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Barangmasuk_m extends CI_Model
{

    public $namaTable = 'barangmasuk';
    public $pk = 'idBarangMasuk';

    function getAllDataByIdPermintaan()
    {
        $this->db->join('barang', 'barang.idBarang = barangmasuk.idBarang', 'left');

        return $this->db->get($this->namaTable)->result();
    }

    function getDataById($idBarangMasuk)
    {
        $this->db->where($this->pk, $idBarangMasuk);
        return $this->db->get($this->namaTable)->row();
    }


    function save()
    {
        $object = [
            'idBarangMasuk' => uniqid(),
            'idBarang' => htmlspecialchars($this->input->post('idBarang', TRUE)),
            'jumlah' => htmlspecialchars($this->input->post('jumlah', TRUE)),
            'tanggalMasuk' => date('Y-m-d')
        ];
        $this->db->insert($this->namaTable, $object);
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil Disimpan</div>');
    }

    function update($idBarangMasuk)
    {
        $object = [
            'idBarang' => htmlspecialchars($this->input->post('idBarang', TRUE)),
            'jumlah' => htmlspecialchars($this->input->post('jumlah', TRUE)),

        ];
        $this->db->where($this->pk, $idBarangMasuk);
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
