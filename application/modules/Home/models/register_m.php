<?php

defined('BASEPATH') or exit('No direct script access allowed');

class register_m extends CI_Model
{

    public $table = "register";
    public $pk = "idRegister";

    public function getByNik($Value)
    {
        $this->db->where('nik', $Value);
        return $this->db->get($this->table)->row();
    }


    public function insert()
    {
        $object = [
            'nik' => $this->input->post('nik', TRUE),
            'noWa' => $this->input->post('noWa', TRUE),
            'password' => password_hash($this->input->post('password', TRUE), PASSWORD_DEFAULT),
            'time' => time(),
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
