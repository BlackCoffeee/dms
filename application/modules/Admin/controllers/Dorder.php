<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Dorder extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Dorder_m', 'primaryModel');
    }
    public $titles = 'Order Barang';
    public $vn = 'Dorder';

    public function list()
    {
        $data['title'] = $this->titles;
        $data['pageTitle'] = "Data " . $this->titles;
        $idDistribusi = $this->uri->segment(4);
        $data['data'] = $this->primaryModel->getAllDataByidDistribusi($idDistribusi);

        $this->template->load('template', $this->vn . '/list', $data);
    }

    function add()
    {
        $data['title'] = $this->titles;
        $data['pageTitle'] = "Tambah Data " . $this->titles;
        $data['stok'] = $this->primaryModel->getAllDataGudang();
        $this->template->load('template', $this->vn . '/add', $data);
    }

    function addAction()
    {
        $idOrderSales = $this->uri->segment(4);
        $this->primaryModel->save($idOrderSales);
        redirect('Admin/' . $this->vn . '/list/' . $idOrderSales);
    }

    function edit()
    {
        $data['title'] = $this->titles;
        $data['pageTitle'] = "Edit Data " . $this->titles;
        $idOrderSalesDetail = $this->uri->segment(5);
        $data['stok'] = $this->primaryModel->getAllDataGudang();
        $data['row'] = $this->primaryModel->getDataById($idOrderSalesDetail);
        $this->template->load('template', $this->vn . '/edit', $data);
    }

    function editAction()
    {
        $idOrderSales = $this->uri->segment(4);
        $idOrderSalesDetail = $this->uri->segment(5);
        $this->primaryModel->update($idOrderSalesDetail);
        redirect('Admin/' . $this->vn . '/list/' . $idOrderSales);
    }

    function delete()
    {
        $idOrderSales = $this->uri->segment(4);
        $idOrderSalesDetail = $this->uri->segment(5);
        $this->primaryModel->delete($idOrderSalesDetail);
        redirect('Admin/' . $this->vn . '/list/' . $idOrderSales);
    }

    function upload_foto()
    {
        $config['upload_path']          = './upload/';
        $config['allowed_types']        = 'jpg|png';
        $config['max_size']             = 1024; // imb
        $this->load->library('upload', $config);
        // proses upload
        $this->upload->do_upload('gambar');
        $upload = $this->upload->data();
        return $upload['file_name'];
    }
}

/* End of file 
Muhammad Arif Budiman
*/
