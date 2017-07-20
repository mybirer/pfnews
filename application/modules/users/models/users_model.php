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

    public function get_with_modules($where = array()){
        $user = $this->db
            ->select()
            ->from($this->table_name)
            ->where($where)
            ->join('pf_user_types', 'pf_users.user_type = pf_user_types.pkusertype', 'left')
            ->get()
            ->row();
        $modules=json_decode($user->modules,true);
        $user->modules=!empty($modules) ? $modules : [];
        return $user;
    }
}

?>