<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Laporan extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('laporan_m', 'primaryModel');
    }


    function retur()
    {
        $dari = $this->input->post('dari');
        $sampai = $this->input->post('sampai');
        $data['data'] = $this->primaryModel->retur($dari, $sampai);
        $this->load->view('laporan/retur', $data);
    }

    function barangMasuk()
    {
        $dari = $this->input->post('dari');
        $sampai = $this->input->post('sampai');
        $data['data'] = $this->primaryModel->bm($dari, $sampai);
        $this->load->view('laporan/bm', $data);
    }

    function bk()
    {
        $dari = $this->input->post('dari');
        $sampai = $this->input->post('sampai');
        $data['data'] = $this->primaryModel->bk($dari, $sampai);
        $this->load->view('laporan/bk', $data);
    }

    function ar()
    {
        $dari = $this->input->post('dari');
        $sampai = $this->input->post('sampai');
        $data['data'] = $this->primaryModel->ar($dari, $sampai);
        $this->load->view('laporan/ar', $data);
    }

    function invoice()
    {
        $dari = $this->input->post('dari');
        $sampai = $this->input->post('sampai');
        $data['data'] = $this->primaryModel->inv($dari, $sampai);
        $this->load->view('laporan/inv', $data);
    }
}

/* End of file Laporan.php */
