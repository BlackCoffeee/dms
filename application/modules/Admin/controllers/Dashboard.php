<?php


defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Dashboard_m', 'primaryModel');
    }
    public $titles = 'Dashboard';
    public $vn = 'Dashboard';

    public function index()
    {
        $data['title'] = $this->titles;
        $data['pageTitle'] = "Data " . $this->titles;
        $data['jumlahPelanggan'] = $this->primaryModel->jumlahPelanggan();
        $data['omset'] = $this->primaryModel->omset();
        $data['order'] = $this->primaryModel->order();
        $data['um'] = $this->primaryModel->um();
        $data['recentOrder'] = $this->primaryModel->recentOrder();
        $data['salesOrder'] = $this->primaryModel->salesOrder();
        $this->template->load('template', $this->vn . '/list', $data);
    }
}

/* End of file Rt.php */
