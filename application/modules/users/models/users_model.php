<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class users_model extends BS_Model
{
    public function __construct()
    {
        parent::__construct('pf_users');
    }

    public function search($term = ''){
        $result = $this->db
            ->like('name', $term)
            ->or_like('email', $term)
            ->or_like('username', $term)
            ->get($this->table_name)
            ->result();
        return $result;
    }
}

?>