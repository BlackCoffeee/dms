<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Order extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Order_m', 'primaryModel');
    }
    public $titles = 'Order';
    public $vn = 'Order';

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

    function lihat()
    {
        $data['title'] = $this->titles;
        $data['pageTitle'] = "Edit Data " . $this->titles;
        $idOrderSales = $this->uri->segment(4);
        $data['row'] = $this->primaryModel->getDataById($idOrderSales);
        $data['data'] = $this->primaryModel->getAllDataByidDistribusi($idOrderSales);
        $data['dataRetur'] = $this->primaryModel->getAllDataReturByIdOrderSales($idOrderSales);
        $this->template->load('template', $this->vn . '/edit', $data);
    }

    function cetak()
    {
        $data['title'] = $this->titles;
        $data['pageTitle'] = "Edit Data " . $this->titles;
        $idOrderSales = $this->uri->segment(4);
        $data['row'] = $this->primaryModel->getDataById($idOrderSales);
        $data['data'] = $this->primaryModel->getAllDataByidDistribusi($idOrderSales);
        $this->load->view('Order/cetak', $data);
    }

    function cetakRetur()
    {
        $data['title'] = $this->titles;
        $data['pageTitle'] = "Edit Data " . $this->titles;
        $idOrderSales = $this->uri->segment(4);
        $data['row'] = $this->primaryModel->getDataById($idOrderSales);
        $data['dataRetur'] = $this->primaryModel->getAllDataReturByIdOrderSales($idOrderSales);
        $this->load->view('Order/cetakRetur', $data);
    }

    function lihatAction()
    {
        $id = $this->uri->segment(4);
        $this->primaryModel->lihat($id);
        redirect('Admin/' . $this->vn);
    }

    function retur()
    {
        $data['title'] = $this->titles;
        $data['pageTitle'] = "Edit Data " . $this->titles;
        $idOrderSales = $this->uri->segment(4);
        $idBarang = $this->uri->segment(5);
        $data['row'] = $this->primaryModel->getDataOrderDetailByIdBarang($idOrderSales, $idBarang);
        $this->template->load('template', $this->vn . '/retur', $data);
    }

    function returAction()
    {
        $idOrderSales = $this->uri->segment(4);
        $idBarang = $this->uri->segment(5);
        $this->primaryModel->retur($idOrderSales, $idBarang);
        redirect('Admin/' . $this->vn . '/lihat/' . $idOrderSales);
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
        redirect('Admin/' . $this->vn . '/lihat/' . $idOrderSales);
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
