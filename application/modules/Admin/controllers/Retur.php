<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Retur extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Retur_m', 'primaryModel');
    }
    public $titles = 'Retur Barang';
    public $vn = 'Retur';

    public function index()
    {
        $data['title'] = $this->titles;
        $data['pageTitle'] = "Data " . $this->titles;
        $data['data'] = $this->primaryModel->getAllData();
        $this->template->load('template', $this->vn . '/list', $data);
    }

    function returKembali()
    {
        $data['title'] = $this->titles;
        $data['pageTitle'] = "Edit Data " . $this->titles;
        $idRetur = $this->uri->segment(5);
        $data['row'] = $this->primaryModel->getDataReturByIdRetur($idRetur);
        $this->template->load('template', $this->vn . '/returKembali', $data);
    }

    function returKembaliAction()
    {
        $idOrderSales = $this->uri->segment(4);
        $idRetur = $this->uri->segment(5);
        $this->primaryModel->returKembali($idOrderSales, $idRetur);
        redirect('Admin/' . $this->vn);
    }
}

/* End of file 
Muhammad Arif Budiman
*/
