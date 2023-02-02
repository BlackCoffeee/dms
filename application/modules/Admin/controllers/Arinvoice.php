<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Arinvoice extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Arinvoice_m', 'primaryModel');
    }
    public $titles = 'AR Invoice';
    public $vn = 'Arinvoice';

    public function index()
    {
        $data['title'] = $this->titles;
        $data['pageTitle'] = "Data " . $this->titles;
        $data['data'] = $this->primaryModel->getAllData();
        $this->template->load('template', $this->vn . '/list', $data);
    }

    function add()
    {
        $data['title'] = $this->titles;
        $data['pageTitle'] = "Tambah Data " . $this->titles;
        $data['cust'] = $this->primaryModel->getDataCustomer();;
        $this->template->load('template', $this->vn . '/add', $data);
    }

    function addAction()
    {
        $this->primaryModel->save();
        redirect('Admin/' . $this->vn);
    }

    function Payment()
    {
        $data['title'] = $this->titles;
        $data['pageTitle'] = "Payment ";
        $idOrderSales = $this->uri->segment(4);
        $data['row'] = $this->primaryModel->getDataById($idOrderSales);
        $this->template->load('template', $this->vn . '/payment', $data);
    }

    function paymentAction()
    {
        $id = $this->uri->segment(4);
        $this->primaryModel->payment($id);
        redirect('Admin/' . $this->vn);
    }

    function listBayar()
    {
        $data['title'] = $this->titles;
        $data['pageTitle'] = "Payment ";
        $idOrderSales = $this->uri->segment(4);
        $data['data'] = $this->primaryModel->getDataPaymentById($idOrderSales);
        $this->template->load('template', $this->vn . '/listbayar', $data);
    }

    function delete()
    {
        $id = $this->uri->segment(4);
        $this->primaryModel->delete($id);
        redirect('Admin/' . $this->vn);
    }

    function upload_foto()
    {
        $config['upload_path']          = './upload/barang/';
        $config['allowed_types']        = 'jpg|png|jpeg';
        $config['max_size']             = 100240; // imb
        $this->load->library('upload', $config);
        // proses upload
        $this->upload->do_upload('foto');
        $upload = $this->upload->data();
        return $upload['file_name'];
    }
}

/* End of file */
