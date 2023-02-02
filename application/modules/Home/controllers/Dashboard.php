<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Dashboard extends CI_Controller
{

    public function index()
    {
        $data['titlePage'] = "Dashboard";
        $this->template->load("home", "form", $data);
    }
}

/* End of file Dashboard.php */
