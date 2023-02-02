<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Sales_m extends CI_Model
{

    public $namaTable = 'sales';
    public $pk = 'idSales';

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
            'idSales' => uniqid(),
            'namaSales' => $this->input->post('namaSales'),
            'tempatLahir' => $this->input->post('tempatLahir'),
            'tanggalLahir' => $this->input->post('tanggalLahir'),
            'jk' => $this->input->post('jk'),
            'noWa' => str_replace('-', '', $this->input->post('noWa')),
            'username' => $this->input->post('username'),
            'password' => password_hash($this->input->post('password'), PASSWORD_DEFAULT),
            'foto' => $foto,
            'roleId' => '3',
            'isActive' =>  $this->input->post('isActive'),
            'dateCreated' => time()

        ];
        $this->db->insert($this->namaTable, $object);
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Data Berhasil Disimpan</div>');
    }

    function update($Value, $foto)
    {
        $pass = password_hash($this->input->post('password'), PASSWORD_DEFAULT);

        if (empty($foto) && empty($pass)) :
            $object = [
                'idSales' => uniqid(),
                'namaSales' => $this->input->post('namaSales'),
                'tempatLahir' => $this->input->post('tempatLahir'),
                'tanggalLahir' => $this->input->post('tanggalLahir'),
                'jk' => $this->input->post('jk'),
                'noWa' => $this->input->post('noWa'),
                'username' => $this->input->post('username'),
                'roleId' => $this->input->post('roleId'),
                'isActive' =>  $this->input->post('isActive'),
                'dateCreated' => time()

            ];
        elseif (empty($foto) && !empty($pass)) :
            $object = [
                'idSales' => uniqid(),
                'namaSales' => $this->input->post('namaSales'),
                'tempatLahir' => $this->input->post('tempatLahir'),
                'tanggalLahir' => $this->input->post('tanggalLahir'),
                'jk' => $this->input->post('jk'),
                'noWa' => $this->input->post('noWa'),
                'username' => $this->input->post('username'),
                'password' => password_hash($this->input->post('password'), PASSWORD_DEFAULT),
                'roleId' => $this->input->post('roleId'),
                'isActive' =>  $this->input->post('isActive'),
                'dateCreated' => time()

            ];
        elseif (!empty($foto) && empty($pass)) :
            $object = [
                'idSales' => uniqid(),
                'namaSales' => $this->input->post('namaSales'),
                'tempatLahir' => $this->input->post('tempatLahir'),
                'tanggalLahir' => $this->input->post('tanggalLahir'),
                'jk' => $this->input->post('jk'),
                'noWa' => $this->input->post('noWa'),
                'username' => $this->input->post('username'),
                'foto' => $foto,
                'roleId' => $this->input->post('roleId'),
                'isActive' =>  $this->input->post('isActive'),
                'dateCreated' => time()

            ];
        else :
            $object = [
                'idSales' => uniqid(),
                'namaSales' => $this->input->post('namaSales'),
                'tempatLahir' => $this->input->post('tempatLahir'),
                'tanggalLahir' => $this->input->post('tanggalLahir'),
                'jk' => $this->input->post('jk'),
                'noWa' => $this->input->post('noWa'),
                'username' => $this->input->post('username'),
                'password' => password_hash($this->input->post('password'), PASSWORD_DEFAULT),
                'foto' => $foto,
                'roleId' => $this->input->post('roleId'),
                'isActive' =>  $this->input->post('isActive'),
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
