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

    public function get_all_filter($search_term,$order_by,$order_dir,$limit,$offset,$filter=array()){

        $limit  = intval($limit) <= 0 || intval($offset) > PHP_INT_MAX  ? 20 : $limit;
        $offset = intval($offset) < 0 || intval($offset) > PHP_INT_MAX-2000 ? 0 : $offset;

        $list = [];
        $order_dirs=array("desc","asc");
        $key=array_search($order_dir,$order_dirs);
        $order_dir=$order_dirs[($key) ? $key : 0];

        $order_columns=array('pkuser','username','fullname','email','last_visit');
        $key=array_search($order_by,$order_columns);
        $order_by=$order_columns[($key) ? $key : 0];

        $where="";
        if(!empty($filter)){
            $filter_columns=array('user_type','enabled');
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
            ->select('pf_users.*,pf_user_types.title AS user_type_str')
            ->from($this->table_name)
            ->like("lower(concat(username, '', fullname, '', email))",$search_term)
            ->where($where)
            ->order_by($order_by,$order_dir)
            ->limit($limit,$offset)
            ->join('pf_user_types', 'pf_users.user_type = pf_user_types.pkusertype', 'left')
            ->get()
            ->result_object();
        return $result;
    }


    public function get_all_filter_total($search_term,$filter=array()){

        $where="";
        if(!empty($filter)){
            $filter_columns=array('user_type','enabled');
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
            ->select('pf_users.*,pf_user_types.title AS user_type_str')
            ->from($this->table_name)
            ->like("lower(concat(username, '', fullname, '', email))",$search_term)
            ->where($where)
            ->count_all_results();
        return $result;
    }

    public function get_user_types()
    {
        return $this->db
            ->select()
            ->from('pf_user_types')
            ->get()
            ->result_object();
    }

    //bu callback'in çalışması için public metod olmaları gerekiyor.
    //Bunları model içinde tanımlamamızın sebebi Controller da tanımlandığı zaman client tarafından erişilebilir oluyor

    //============================   Add User Form Validation ========================================
    //add user form - email validate
    public function email_validate($email)
    {
        if ($this->user_auth->email_check(trim($email)) == EXIST)
            return false;
        return true;
    }

    //add user form - username validate
    public function username_validate($username)
    {
        if ($this->user_auth->username_check(trim($username)) == EXIST)
            return false;
        return true;
    }
    //============================   Add Form Validation ========================================

    //============================   Edit User Form Validation ========================================
    //email değiştirilmiş ise validate etmeliyiz
    //budaki mantık şu. Eğer formda gelen mail adresi, sistemde edit yapılan kullanıcı dışında herhangi
    // bir user tarafından kayıt edilmiş ise o mail ile kayıt yapamamalı. Aynı şey username için de geçerli
    public function edit_email_validate($email)
    {
        global $edit_user_id;
        if ($this->get_total(array('pkuser !='=> $edit_user_id,'email'=>trim($email))) == 1)
            return false;
        return true;
    }
    public function edit_username_validate($username)
    {
        global $edit_user_id;
        if ($this->get_total(array('pkuser !='=> $edit_user_id,'username'=>trim($username))) == 1)
            return false;
        return true;
    }
    //============================   Edit User Form Validation ========================================
}

?>
