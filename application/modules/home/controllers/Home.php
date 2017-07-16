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

    public function isloggedin()
    {
        $this->load->library('Auths');
        if ($this->auths->is_loggedin())
            echo 'logged_in';
        else
            echo 'not logged_in';
    }

    public function login()
    {
        $email = $this->input->get('email');
        $password = $this->input->get('password');

        $this->load->library('Auths');
        if ($this->auths->login($email,$password))
            echo 'logged in';
        else
            echo 'error';
    }

    public function logout()
    {
        $this->load->library('Auths');
        $this->auths->logout();
    }

    public function create()
    {
        $email = $this->input->get('email');
        $password = $this->input->get('password');

        $this->load->library('Auths');
        $user_id = $this->auths->create_user($email,$password);

        echo 'User: '.$user_id;
    }

}