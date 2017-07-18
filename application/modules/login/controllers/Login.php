<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MX_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    //front end login ekranı
    public function index(){
        $data = array();
        $this->load->model('users/users_model');
        $this->load->library('auth',array('pf_subscribers','pksubscriber'));

        if ($this->auth->is_logged('fe')){
            redirect('/home/index');
        }else{
            $this->template->set_layout('frontend_layout');
            $this->template->set_partial('header', 'partials/header');
            $this->template->set_partial('footer', 'partials/footer');

            $this->form_validation->set_rules('email','Email','trim|required|valid_email');
            $this->form_validation->set_rules('password','Password','trim|required|min_length[5]|max_length[12]');

            //form gönderilmiş ise çalıştır.
            if ($this->form_validation->run($this)){
                $email = trim($this->input->post('email'));
                $password = trim($this->input->post('password'));
                if ($this->auth->login($email,$password)){
                    redirect('/home/index');
                }
                else{
                    $data['login_error'] = 'Username or Password is invalid.';
                }
            }

            $this->template->title('PfNews - Login');
            $this->template->build('public_login',$data);
            //$this->load->view('public_login');
        }
    }

    //back end login ekranı
    public function admin()
    {
        $data = array();
        $this->load->model('users/users_model');
        $this->load->library('auth',array('pf_users','pkuser'));

        if ($this->auth->is_logged('be')) {
            redirect('/admin/index');
        }else{
            $this->template->set_layout('frontend_layout');
            $this->template->set_partial('header', 'partials/header');
            $this->template->set_partial('footer', 'partials/footer');
            $this->form_validation->set_rules('email','Email','trim|required|valid_email');
            $this->form_validation->set_rules('password','Password','trim|required|min_length[5]|max_length[12]');
            //form gönderilmiş ise çalıştır.
            if ($this->form_validation->run($this)){
                $email = trim($this->input->post('email'));
                $password = trim($this->input->post('password'));
                if ($this->auth->login($email,$password)){
                    redirect('/admin/index');
                }
                else{
                    $data['login_error'] = 'Username or Password is invalid.';
                }
            }

            $this->template->title('PfNews - Login');
            $this->template->build('private_login',$data);
        }
    }

}

?>
