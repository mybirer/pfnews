<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: ERDEN
 * Date: 14.07.2017
 * Time: 15:48
 */
class subscribers_model extends BS_Model
{
    public function __construct()
    {
        parent::__construct('pf_subscribers');
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