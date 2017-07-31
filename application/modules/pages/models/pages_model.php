<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class pages_model extends BS_Model
{
    public function __construct()
    {
        parent::__construct('pf_pages');
    }

    public function get_all_filter($search_term,$order_by,$order_dir,$limit,$offset,$filter = array()){

        $limit  = intval($limit) <= 0 || intval($offset) > PHP_INT_MAX  ? 20 : $limit;
        $offset = intval($offset) < 0 || intval($offset) > PHP_INT_MAX-2000 ? 0 : $offset;

        $list = [];
        $order_dirs=array("desc","asc");
        $key=array_search($order_dir,$order_dirs);
        $order_dir=$order_dirs[($key) ? $key : 0];

        $order_columns=array('pkpage','title','alias','allow_comments','created_at','status');

        $key=array_search($order_by,$order_columns);
        $order_by=$order_columns[($key) ? $key : 0];

        $where="";
        if(!empty($filter)){
            $filter_columns=array('status','allow_comments');
            $filterArr=array();
            foreach($filter as $fkey=>$fval){
                if(in_array($fkey,$filter_columns)){
                    $filterArr[]="{$fkey} = '{$fval}'";
                }
            }
            if(!empty($filterArr)){
                $where.=implode(' AND ',$filterArr);
            }
            else{
                $where=" 3>2 ";
            }
        }
        else{
            $where=" 3>2 ";
        }
        $result=$this->db
            ->select('*')
            ->from($this->table_name)
            ->like("lower(concat(title, '', alias, '', summary, '', content))",$search_term)
            ->where($where)
            ->order_by($order_by,$order_dir)
            ->limit($limit,$offset)
            ->get()
            ->result_object();
        return $result;
    }


    public function get_all_filter_total($search_term,$filter = array()){

        $where="";
        if(!empty($filter)){
            $filter_columns=array('status','allow_comments');
            $filterArr=array();
            foreach($filter as $fkey=>$fval){
                if(in_array($fkey,$filter_columns)){
                    $filterArr[]="{$fkey} = '{$fval}'";
                }
            }
            if(!empty($filterArr)){
                $where.=implode(' AND ',$filterArr);
            }
            else{
                $where=" 3>2 ";
            }
        }
        else{
            $where=" 3>2 ";
        }
        $result=$this->db
            ->select('*')
            ->from($this->table_name)
            ->like("lower(concat(title, '', alias, '', summary, '', content))",$search_term)
            ->where($where)
            ->count_all_results();
        return $result;
    }

}

?>
