<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Logs extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index(){
        $data = array();
        $data['logs'] = $this->logs_model->get_all();
        $this->template->title('Printf News - Pages');
        $this->template->build('logs',$data);
    }
}

?>
