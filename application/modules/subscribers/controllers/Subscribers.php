<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Subscribers extends MY_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('subscribers_model','subscriber_model');
    }

    public function index()
    {
        backend_login_check('subscribers','list');
        $data = array();
        $data['objects'] = $this->subscriber_model->get_all();
        $this->template->title('Printf News - Subscribers');
        $this->template->build('Subscribers', $data);
    }

    public function edit($id = 0){
        backend_login_check('subscibers','edit');
        $data = array();
        $this->template->title('Printf News - Edit Subscriber');
        $result = $this->subscriber_model->get(array('pksubscriber'=>intval($id)));
        if (empty($result)){
            //there is no any record
            $this->template->build('Subscriber_edit_blank');
        }else{
            //load the record
            $data['objects'] = array($result);
            $this->template->build('Subscriber_edit', $data);
        }
    }

    public function search($term = ''){
        $data = array();
        $data['objects'] = $this->subscriber_model->search($term);
        $this->template->title('Printf News - Subscribers');
        $this->template->build('Subscribers', $data);
    }

    public function ban($id = 0){

    }
}

?>
