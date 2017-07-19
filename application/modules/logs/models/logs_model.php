<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class logs_model extends BS_Model
{
    public function __construct()
    {
        parent::__construct('pf_logs');
    }

    public function log($kind,$module,$description = '')
    {
        $data['kind'] = $kind;
        $data['module'] = $module;
        $data['description'] = $description;

        $data['session_id'] = session_id();
        $data['user_id'] = $this->user_auth->is_logged()?$this->user_auth->read('user_id'):null;
        $data['ip'] = $_SERVER['REMOTE_ADDR'];
        $this->insert($data);
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
