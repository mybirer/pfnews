<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Subscribers extends BE_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('subscribers_model','msubscribers');
    }

    public function index()
    {
        $data = array();
        $data['subscribers'] = $this->msubscribers->get_all();
        $this->template->title('Printf News - Subscribers');
        $this->template->build('Subscribers', $data);
    }

    public function edit($id = 0){
        $data = array();
        $this->template->title('Printf News - Edit Subscriber');
        $result = $this->msubscribers->get(array('pksubscriber'=>intval($id)));
        if (empty($result)){
            //there is no any record
            $this->template->build('Subscriber_edit_blank');
        }else{
            //load the record
            $data['subscribers'] = array($result);
            $this->template->build('Subscriber_edit', $data);
        }
    }

    public function search($term = ''){
        $data = array();
        $data['subscribers'] = $this->msubscribers->search($term);
        $this->template->title('Printf News - Subscribers');
        $this->template->build('Subscribers', $data);
    }

    public function ban($id = 0){

    }
}