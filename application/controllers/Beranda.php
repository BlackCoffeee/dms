<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Beranda extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Beranda_m');
    }


    public function index()
    {
        $data['pageTitle'] = 'Beranda';
        if (empty($this->session->userdata('idUser'))) :

        else :
            if ($this->session->userdata('validate') == '0') :
                if ($this->session->userdata('jr') == '1') :
                    redirect('Posyandu/Ibu/Setup');
                else :
                    redirect('Kesmas/Pasien/Setup');
                endif;
            else :

            endif;
        endif;
        $data['covid'] = $this->Beranda_m->getCovid();
        $data['positive'] = $this->Beranda_m->getCovidByStatus(1);
        $data['negative'] = $this->Beranda_m->getCovidByStatus(0);
        $this->template->load('Home', 'Beranda/list', $data);
    }
}

/* End of file Beranda.php */
