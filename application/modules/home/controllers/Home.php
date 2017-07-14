<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends BE_Controller {

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
        $this->template->set_partial('header', 'partials/header');
        $this->template->set_partial('footer', 'partials/footer');
        $this->template->build('home', $data);
    }
    public function login()
    {
        $data = array();
        # Set Layout
        $this->template->set_layout('frontend_layout');
        $this->template->title('Login page CodeIgniter');
        $this->template->set_partial('header', 'partials/header');
        $this->template->set_partial('footer', 'partials/footer');
        $this->template->build('login', $data);
    }
}