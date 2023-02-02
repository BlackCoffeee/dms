<?php


defined('BASEPATH') or exit('No direct script access allowed');

class Login extends CI_Controller
{


    public function __construct()
    {
        parent::__construct();
        $this->load->model('register_m');
    }

    public function index()
    {
        $this->load->view('login/list');
    }

    public function logon()
    {
        $username = $this->input->post('username', TRUE);
        $password = $this->input->post('password', TRUE);

        if (!empty($userData = $this->register_m->getDataByUser($username))) :
            $userData  = $this->register_m->getDataByUser($username);
        elseif (!empty($userData = $this->register_m->getDataBySales($username))) :
            $userData = $this->register_m->getDataBySales($username);
        else :
            $userData = $this->register_m->getDataByPasien($username);
        endif;

        if ($userData) :
            if ($userData->isActive == 1) :
                if (password_verify($password, $userData->password)) :

                    if ($userData->roleId == 1) :
                        $data = [
                            'idUser' => $userData->idUser,
                            'namaLengkap' => $userData->namaLengkap,
                            'noWa' => $userData->noWa,
                            'username' => $userData->username,
                            'foto' => $userData->foto,
                            'roleId' => $userData->roleId,
                        ];
                        $this->session->set_userdata($data);
                        redirect('Admin/Dashboard');
                    elseif ($userData->roleId == 3) :

                        $data = [
                            'idUser' => $userData->idSales,
                            'namaLengkap' => $userData->namaSales,
                            'noWa' => $userData->noWa,
                            'username' => $userData->username,
                            'foto' => $userData->foto,
                            'roleId' => $userData->roleId,

                        ];
                        $this->session->set_userdata($data);
                        redirect('Admin/Dashboard');
                    elseif ($userData->roleId == 5) :
                        $data = [
                            'idUser' => $userData->idNakes,
                            'namaLengkap' => $userData->namaNakes,
                            'noWa' => $userData->noWa,
                            'username' => $userData->username,
                            'foto' => $userData->foto,
                            'roleId' => $userData->roleId,
                        ];
                        $this->session->set_userdata($data);
                        redirect('Admin/Dashboard');
                    elseif ($userData->roleId == 8) :
                        $data = [
                            'idUser' => $userData->idNakes,
                            'namaLengkap' => $userData->namaNakes,
                            'noWa' => $userData->noWa,
                            'username' => $userData->username,
                            'foto' => $userData->foto,
                            'roleId' => $userData->roleId,
                        ];
                        $this->session->set_userdata($data);
                        redirect('Admin/Dashboard');
                    else :
                        redirect('home');
                    endif;
                else :
                    $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Gagal Login!, Email atau Password Salah!</div>');
                    redirect('Auth/login');
                endif;
            else :
                $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Gagal Login!, Akun Anda Belum Aktif!</div>');
                redirect('Auth/login');
            endif;
        else :
            $this->session->set_flashdata('message', '<div class="alert alert-danger" role="alert">Gagal Login!, Email atau Password Salah!</div>');
            redirect('Auth/login');
        endif;
    }
}

/* End of file Login.php */
