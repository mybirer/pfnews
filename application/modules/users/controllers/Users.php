<?php
/**
 * Created by PhpStorm.
 * User: MyBirer
 * Date: 19.07.2017
 * Time: 17:39
 */
class Users extends MY_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('users_model');
    }
    public function index(){
        $data = array();
        Globals::setActiveModule('users');

        //get filter params
        $search_term=isset($_GET['search_term']) ? clear_string($_GET['search_term']) : "";
        $order_by=isset($_GET['order_by']) && !empty($_GET['order_by']) ? strtolower(clear_string($_GET['order_by'])) : "pkuser";
        $order_dir=isset($_GET['order_dir']) && !empty($_GET['order_dir']) ? strtolower(clear_string($_GET['order_dir'])) : "desc";
        $limit=isset($_GET['limit']) && !empty($_GET['limit']) ? (int) clear_string($_GET['limit']) : 1;
        $page=isset($_GET['page']) && !empty($_GET['page']) ? (int) clear_string($_GET['page']) : 1;
        $offset=($page-1)*$limit;
        $filters=isset($_GET['f_key']) ? $_GET['f_key'] : [];
        $filter=[];
        foreach($filters as $f_key=>$f_val){
            if($f_val!=''){
            $filter[clear_string($f_key)]= clear_string($f_val);
            }
        }
        $data['objects'] = $this->users_model->get_all_filter($search_term,$order_by,$order_dir,$limit,$offset,$filter);
        $data['user_types'] = $this->users_model->get_user_types();

        //build pagination
        $this->load->library('pagination');
        $config['base_url'] = base_url('dashboard/users');
        $config['total_rows'] = $this->users_model->get_all_filter_total($search_term,$filter);
        $config['per_page'] = $limit;
        $this->pagination->initialize($config);
        $data['pagination'] = $this->pagination->create_links();

        $this->template->title('Printf News - Pages');
        $this->template->build('Users', $data);
    }
}