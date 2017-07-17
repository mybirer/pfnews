<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends FE_Controller {

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

        if ($this->auths->is_loggedin())
            echo 'logged_in';
        else
            echo 'not logged_in';
    }

    public function login()
    {
        if ($this->auths->is_loggedin()){
            //giriş yapılmış ise
            redirect('/index');
        }else{
            //giriş yapılammış ise

            $this->form_validation->set_rules('email','Email','trim|required|valid_email|callback_mail_exist');
            $this->form_validation->set_rules('password','Password','trim|required|min_length[5]|max_length[12]');

            //form gönderilmiş ise çalıştır.
            if ($this->form_validation->run($this)){
                $email = trim($this->input->post('email'));
                $password = trim($this->input->post('password'));
                if ($this->auths->login($email,$password)){
                    redirect('/index');
                }
                else{
                    echo 'login error';
                }
            }else{
                $this->template->title('PfNews - Login');
                $this->template->build('login',array());
            }
        }
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

    public function mail_exist($email){
        //bu email in sistemde olup olmadığını denetler.
        if ($this->auths->username_exist($email)){
            return TRUE;
        }else{
            $this->form_validation->set_message('mail_exist', 'Deneme');
            return FALSE;
        }
    }
}