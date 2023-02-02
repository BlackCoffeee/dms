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
        $nik = $this->input->post('nik', TRUE);
        $password = $this->input->post('password', TRUE);

        $user = $this->register_m->getByNik($nik);
        if ($user) :
            if ($user->isActive == 1) :
                if (password_verify($password, $user->password)) :
                    $data = [
                        'nik' => $user->nik,
                    ];
                    $this->session->set_userdata($data);
                    if ($user->roleId == 1) :
                        redirect('admin');
                    elseif ($user->roleId == 2) :
                        redirect('admin');
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
