<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class user_types_model extends BS_Model
{
    public function __construct()
    {
        parent::__construct('pf_view_levels');
    }

    public function where_in($column = '' ,$where_in = array())
    {
        $result = $this->db
            ->where_in($column,$where_in)
            ->get($this->table_name)
            ->result();
        return $result;
    }
}

?>