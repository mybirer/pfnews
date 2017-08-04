<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class articles_model extends BS_Model
{
    public function __construct()
    {
        parent::__construct('pf_articles');
    }

    public function get_all_filter($search_term,$order_by,$order_dir,$limit,$offset,$filter = array()){

        $limit  = intval($limit) <= 0 || intval($offset) > PHP_INT_MAX  ? 20 : $limit;
        $offset = intval($offset) < 0 || intval($offset) > PHP_INT_MAX-2000 ? 0 : $offset;

        $list = [];
        $order_dirs=array("desc","asc");
        $key=array_search($order_dir,$order_dirs);
        $order_dir=$order_dirs[($key) ? $key : 0];

        $order_columns=array('pkarticle','title','alias','allow_comments','created_at','publish_date','view','status');

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

        //eğer yazar ise kendi oluşturduğu makaleler listelenmeli başkalarınınkini görememeli
        //ayrıca yazar olmayanlar o modüle erişemeyeceği için diğer
        //durumlar için if atmaya gerek yok.
        //erişenler de yöneticiler olacak. Onlar da zaten herşeyi görebilmeliler.
        if (Globals::currentUser()->user_type == 4){
            $where.= ' AND created_by='.Globals::currentUser()->pkuser;
        }
        $result=$this->db
            ->select('*')
            ->from($this->table_name)
            ->like("lower(concat(title, '', alias, '', content))",$search_term)
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
        //eğer yazar ise kendi oluşturduğu makaleler listelenmeli
        //ayrıca yazar olmayanlar o modüle erişemeyeceği için diğer
        //durumlar için if atmaya gerek yok.
        //erişenler de yöneticiler olacak. Onlar da zaten herşeyi görebilmeliler.
        if (Globals::currentUser()->user_type == 4){
            $where.= ' AND created_by='.Globals::currentUser()->pkuser;
        }
        $result=$this->db
            ->select('*')
            ->from($this->table_name)
            ->like("lower(concat(title, '', alias, '', content))",$search_term)
            ->where($where)
            ->count_all_results();
        return $result;
    }

}

?>
