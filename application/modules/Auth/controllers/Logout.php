<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Logout extends CI_Controller
{

    public function Index()
    {

        $this->session->sess_destroy();

        $this->session->unset_userdata('idUser');
        $this->session->unset_userdata('namaLengkap');
        $this->session->unset_userdata('noWa');
        $this->session->unset_userdata('username');
        $this->session->unset_userdata('foto');
        $this->session->set_flashdata('message', '<div class="alert alert-success" role="alert">Anda Beerhasil Logout!</div>');
        redirect(base_url());
    }
}
