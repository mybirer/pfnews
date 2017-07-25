<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Logs extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index(){
        backend_login_check('logs','list');
        $data = array();

        $search_term=isset($_GET['search_term']) ? clear_string($_GET['search_term']) : '';
        $order_by=isset($_GET['order_by']) && !empty($_GET['order_by']) ? strtolower(clear_string($_GET['order_by'])) : "pkuser";
        $order_dir=isset($_GET['order_dir']) && !empty($_GET['order_dir']) ? strtolower(clear_string($_GET['order_dir'])) : "desc";
        $limit=isset($_GET['limit']) && !empty($_GET['limit']) ? (int) clear_string($_GET['limit']) : 10;
        $page=isset($_GET['page']) && !empty($_GET['page']) ? (int) clear_string($_GET['page']) : 1;
        $offset=($page-1)*$limit;
        $filters=isset($_GET['f_key']) ? $_GET['f_key'] : [];
        $filter=[];
        foreach($filters as $f_key=>$f_val){
            if($f_val!=''){
                $filter[clear_string($f_key)]= clear_string($f_val);
            }
        }

        $data['objects'] = $this->logs_model->get_all_filter($search_term,$order_by,$order_dir,$limit,$offset,$filter);
        $data['modules'] = $this->db->distinct()->select('module')->get('pf_logs')->result_array();
        //build pagination
        $this->load->library('pagination');
        $config['base_url'] = base_url('dashboard/logs');
        $config['total_rows'] = $this->logs_model->get_all_filter_total($search_term,$filter);
        $config['per_page'] = $limit;
        $this->pagination->initialize($config);
        $data['pagination'] = $this->pagination->create_links();

        $this->template->title('Printf News - Pages');
        $this->template->build('logs',$data);
    }

    public function delete()
    {
        backend_login_check('logs','remove');
        $id_array = explode(',',$_POST['id_array']);
        if (count($id_array)!=0)
        {
            foreach ($id_array as $id)
                $this->logs_model->delete(array('pklog'=>$id));
            send_alert(array('success','Selected log record deleted successfully!'));
        }
        redirect('dashboard/logs');
    }
}

?>
