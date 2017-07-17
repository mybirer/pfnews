<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pages extends BE_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('pages_model','mpages');
    }

    public function index(){
        $data = array();
        $data['pages'] = $this->mpages->get_all(array());

        $this->template->title('Printf News - Pages');
        $this->template->build('Pages', $data);

    }

    public function add()
    {
        $data = array();
        $this->template->title('Printf News - Pages');
        $this->template->build('Page_add', $data);
    }
}

?>