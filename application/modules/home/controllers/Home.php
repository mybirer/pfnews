<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends MY_Controller {

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $data = array();
        # Set Layout
//        $this->template->set_layout('frontend_layout');
        $this->template->title('Welcome to CodeIgniter');
        $this->template->build('home', $data);
    }

}
