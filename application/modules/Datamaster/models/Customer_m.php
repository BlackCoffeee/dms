<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Customer_m extends CI_Model
{

    public $namaTable = 'customer';
    public $pk = 'idCustomer';

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
            'idCustomer' => uniqid(),
            'namaLengkap' => $this->input->post('namaLengkap'),
            'alamatCustomer' => $this->input->post('alamatCustomer'),
            'noTelpon' => str_replace('-', '', $this->input->post('noTelpon')),
            'email' => $this->input->post('email'),
            'npwp' => $this->input->post('npwp'),
            'fotoCustomer' => $foto,

        ];
        $this->db->insert($this->namaTable, $object);
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil Disimpan</div>');
    }

    function update($Value, $foto)
    {
        $pass = password_hash($this->input->post('password'), PASSWORD_DEFAULT);

        if (empty($foto)) :
            $object = [
                'namaLengkap' => $this->input->post('namaLengkap'),
                'alamatCustomer' => $this->input->post('alamatCustomer'),
                'noTelpon' => str_replace('-', '', $this->input->post('noTelpon')),
                'email' => $this->input->post('email'),
                'npwp' => $this->input->post('npwp'),
            ];
        else :
            $object = [
                'namaLengkap' => $this->input->post('namaLengkap'),
                'alamatCustomer' => $this->input->post('alamatCustomer'),
                'noTelpon' => str_replace('-', '', $this->input->post('noTelpon')),
                'email' => $this->input->post('email'),
                'npwp' => $this->input->post('npwp'),
                'fotoCustomer' => $foto,
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
