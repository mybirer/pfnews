<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Panel extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->template->set_layout('frontend_layout');
        $this->template->set_partial('footer', 'partials/footer');
        $this->template->set_partial('header', 'partials/header');

    }

    public function index(){
        if (!$this->subscriber_auth->is_logged()){
            $auth_module = modules::load('authentication/Authentication/');
            $auth_module->panel_login();
        }
        else{
            $data = array();
            $this->template->title('Printf News - Panels');
            $this->template->build('panel',$data);
        }
    }

}

?>
