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

    public function get_all_filter($search_term,$order_by,$order_dir,$limit,$offset,$filter=array()){

        $limit  = intval($limit) <= 0 || intval($offset) > PHP_INT_MAX  ? 20 : $limit;
        $offset = intval($offset) < 0 || intval($offset) > PHP_INT_MAX-2000 ? 0 : $offset;

        $list = [];
        $order_dirs=array("desc","asc");
        $key=array_search($order_dir,$order_dirs);
        $order_dir=$order_dirs[($key) ? $key : 0];

        $order_columns=array('pklog','kind','module','description','created_at','ip');
        $key=array_search($order_by,$order_columns);
        $order_by=$order_columns[($key) ? $key : 0];


        $where='';
        if(!empty($filter)){
            $filter_columns=array('kind','module');
            $filterArr=array();
            foreach($filter as $fkey=>$fval){
                if(in_array($fkey,$filter_columns)){
                    $filterArr[]="{$fkey} = '{$fval}'";
                }
            }
            $where.=implode(' AND ',$filterArr);
        }
        else{
            $where=" 3>2 ";
        }

        $result=$this->db
            ->select('*')
            ->from($this->table_name)
            ->like("lower(concat(kind, '', module, '', description,'',ip))",$search_term)
            ->where($where)
            ->order_by($order_by,$order_dir)
            ->limit($limit,$offset)
            ->get()
            ->result_object();
        return $result;
    }

    public function get_all_filter_total($search_term,$filter=array()){
        $where="";
        if(!empty($filter)){
            $filter_columns=array('kind','module');
            $filterArr=array();
            foreach($filter as $fkey=>$fval){
                if(in_array($fkey,$filter_columns)){
                    $filterArr[]="{$fkey} = '{$fval}'";
                }
            }
            $where.=implode(' AND ',$filterArr);
        }
        else{
            $where=" 3>2 ";
        }

        $result=$this->db
            ->select('*')
            ->from($this->table_name)
            ->like("lower(concat(kind, '', module, '', description,'',ip))",$search_term)
            ->where($where)
            ->count_all_results();
        return $result;
    }
}

?>
