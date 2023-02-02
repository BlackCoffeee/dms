<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Beranda_m extends CI_Model
{

    function getCovid()
    {
        return $this->db->get('covid_positive')->num_rows();
    }
    function getCovidByStatus($Value)
    {
        $this->db->where('statusPositive', $Value);

        return $this->db->get('covid_positive')->num_rows();
    }
}

/* End of file ModelName.php */
