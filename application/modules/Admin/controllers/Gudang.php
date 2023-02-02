<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Gudang extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Gudang_m', 'primaryModel');
    }
    public $titles = 'Stock Gudang Barang';
    public $vn = 'Gudang';

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
        $this->template->load('template', $this->vn . '/add', $data);
    }

    function addAction()
    {
        $this->primaryModel->save();
        redirect('Admin/' . $this->vn);
    }

    function Terima()
    {
        $data['title'] = $this->titles;
        $data['pageTitle'] = "Terima " . $this->titles;
        $idPermintaan = $this->uri->segment(4);
        $data['row'] = $this->primaryModel->getDataById($idPermintaan);
        $this->template->load('template', $this->vn . '/terima', $data);
    }

    function terimaAction()
    {
        $foto = $this->upload_foto();
        $idPermintaan = $this->uri->segment(4);
        $this->primaryModel->terima($idPermintaan, $foto);
        redirect('Admin/' . $this->vn);
    }

    function Cancel()
    {
        $idPermintaan = $this->uri->segment(4);
        $this->primaryModel->cancel($idPermintaan);
        redirect('Admin/' . $this->vn);
    }


    function upload_foto()
    {
        $config['upload_path']          = './upload/ba/';
        $config['allowed_types']        = 'jpg|png|jpeg|pdf';
        $config['max_size']             = 102400; // imb
        $this->load->library('upload', $config);
        // proses upload
        $this->upload->do_upload('beritaAcara');
        $upload = $this->upload->data();
        return $upload['file_name'];
    }

    function Cetak()
    {
        $data['title'] = $this->titles;
        $idPermintaan = $this->uri->segment(4);
        $data['row'] = $this->primaryModel->getDataById($idPermintaan);
        $data['data'] = $this->Item_m->getAllDataByIdPermintaan($idPermintaan);
        $this->load->view($this->vn . '/surat', $data);
    }
}

/* End of file 
Muhammad Arif Budiman
*/
