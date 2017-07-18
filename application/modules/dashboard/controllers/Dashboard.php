<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index(){
        if (!$this->user_auth->is_logged()){
            $auth_module = modules::load('authentication/Authentication/');
            $auth_module->dashboard_login();
        }
        else{
            $data = array();
            $this->template->title('Printf News - Pages');
            $this->template->build('dashboard',$data);
        }
    }

}

?>
