<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Authentication extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function dashboard_login()
    {
        if ($this->user_auth->is_logged()) {
            redirect('/dashboard');
        }else{
            $data = array();
            $this->form_validation->set_rules('email','Email','trim|required|valid_email');
            $this->form_validation->set_rules('password','Password','trim|required|min_length[5]|max_length[12]');
            //form gönderilmiş ise çalıştır.
            if ($this->form_validation->run($this)){
                $email = trim($this->input->post('email'));
                $password = trim($this->input->post('password'));
                if ($this->user_auth->login($email,$password)){
                    redirect('/dashboard');
                    return;
                }
                else{
                    $data['login_error'] = 'Username or Password is invalid.';
                }
            }
            $this->template->set_layout('frontend_layout');
            $this->template->set_partial('header', 'partials/header');
            $this->template->set_partial('footer', 'partials/footer');

            $this->template->title('PfNews - Login');
            $this->template->build('authentication/private_login',$data);
        }
    }
    public function dashboard_logout()
    {
        $this->user_auth->logout();
        redirect('/');
    }

    public function panel_login()
    {
        if ($this->subscriber_auth->is_logged()) {
            redirect('/panel');
        }else{
            $data = array();
            $this->form_validation->set_rules('email','Email','trim|required|valid_email');
            $this->form_validation->set_rules('password','Password','trim|required|min_length[5]|max_length[12]');
            //form gönderilmiş ise çalıştır.
            if ($this->form_validation->run($this)){
                $email = trim($this->input->post('email'));
                $password = trim($this->input->post('password'));
                if ($this->subscriber_auth->login($email,$password)){
                    redirect('/panel');
                    return;
                }
                else{
                    $data['login_error'] = 'Username or Password is invalid.';
                }
            }
            $this->template->set_layout('frontend_layout');
            $this->template->set_partial('header', 'partials/header');
            $this->template->set_partial('footer', 'partials/footer');

            $this->template->title('PfNews - Subscriber Login');
            $this->template->build('authentication/public_login',$data);
        }
    }
    public function panel_logout()
    {
        $this->subscriber_auth->logout();
        redirect('/');
    }
}

?>
