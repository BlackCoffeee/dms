<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Register_m extends CI_Model
{

    public $table = "user";
    public $pk = "idUser";

    public function getDataByUser($Value)
    {
        $this->db->where('username', $Value);
        return $this->db->get($this->table)->row();
    }



    function getDataByIbu($Value)
    {
        $this->db->where('username', $Value);
        return $this->db->get('ibu')->row();
    }

    function getDataByPasien($Value)
    {
        $this->db->where('username', $Value);
        return $this->db->get('pasien')->row();
    }
    function getDataBySales($Value)
    {
        $this->db->where('username', $Value);
        return $this->db->get('sales')->row();
    }

    public function insert()
    {
        $object = [
            'nik' => $this->input->post('nik', TRUE),
            'noWa' => $this->input->post('noWa', TRUE),
            'password' => password_hash($this->input->post('password', TRUE), PASSWORD_DEFAULT),
            'time' => time(),
            'roleId' => '3',
            'isActive' => '0'
        ];

        $array = array(
            'nik' => $this->input->post('nik', TRUE),
        );

        $this->session->set_userdata($array);

        $this->db->insert($this->table, $object);
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Register Berhasil, Silakan Login!</div>');
    }
}

/* End of file user_m.php */
