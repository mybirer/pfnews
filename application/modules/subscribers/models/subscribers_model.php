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

    public function get_all_filter($search_term,$order_by,$order_dir,$limit,$offset,$filter = array()){

        $limit  = intval($limit) <= 0 || intval($offset) > PHP_INT_MAX  ? 20 : $limit;
        $offset = intval($offset) < 0 || intval($offset) > PHP_INT_MAX-2000 ? 0 : $offset;

        $list = [];
        $order_dirs=array("desc","asc");
        $key=array_search($order_dir,$order_dirs);
        $order_dir=$order_dirs[($key) ? $key : 0];

        $order_columns=array('pksubscriber','name','email','username','created_at','last_visit','banned');
        $key=array_search($order_by,$order_columns);
        $order_by=$order_columns[($key) ? $key : 0];

        $where="";
        if(!empty($filter)){
            $filter_columns=array('banned');
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
            ->like("lower(concat(name, '', email))",$search_term)
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
            $filter_columns=array('pksubscriber','name','email','username','created_at','last_visit','banned');
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
            ->like("lower(concat(name, '', email))",$search_term)
            ->where($where)
            ->count_all_results();
        return $result;
    }
}

?>
