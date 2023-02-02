<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Barangmasuk extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Barangmasuk_m', 'primaryModel');
    }
    public $titles = 'Barang Masuk Gudang';
    public $vn = 'Barangmasuk';

    public function index()
    {
        $data['title'] = $this->titles;
        $data['pageTitle'] = "Data " . $this->titles;
        $data['data'] = $this->primaryModel->getAllDataByIdPermintaan();
        $this->template->load('template', $this->vn . '/list', $data);
    }

    function add()
    {
        $data['title'] = $this->titles;
        $data['pageTitle'] = "Tambah Data " . $this->titles;
        $this->template->load('template', $this->vn . '/add', $data);
    }

    function addAction()
    {
        $this->primaryModel->save();
        redirect('Admin/' . $this->vn);
    }

    function edit()
    {
        $data['title'] = $this->titles;
        $data['pageTitle'] = "Edit Data " . $this->titles;
        $idBarangMasuk = $this->uri->segment(4);
        $data['row'] = $this->primaryModel->getDataById($idBarangMasuk);
        $this->template->load('template', $this->vn . '/edit', $data);
    }

    function editAction()
    {
        $idBarangMasuk = $this->uri->segment(4);
        $this->primaryModel->update($idBarangMasuk);
        redirect('Admin/' . $this->vn);
    }

    function delete()
    {
        $idBarangMasuk = $this->uri->segment(4);
        $this->primaryModel->delete($idBarangMasuk);
        redirect('Admin/' . $this->vn);
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

    function Cetak()
    {
        $data['title'] = $this->titles;
        $id = $this->uri->segment(4);
        $data['row'] = $this->primaryModel->getDataById($id);
        $this->load->view($this->vn . '/surat', $data);
    }
}

/* End of file 
Muhammad Arif Budiman
*/
