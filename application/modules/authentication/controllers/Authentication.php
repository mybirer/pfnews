<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Authentication extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('users/users_model');
        $this->load->model('subscribers/subscribers_model');
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
            if ($this->form_validation->run()){
                $email = trim($this->input->post('email'));
                $password = trim($this->input->post('password'));
                if ($this->user_auth->attempt_login($email,$password)){
                    $user = $this->users_model->get(array('email'=>$email));
                    if ($user['enabled'] == '1')
                    {
                        $this->user_auth->login($email,$password);
                        redirect('/dashboard');
                        die();
                    }
                    else
                    {
                        send_alert(array('warning','Your account has been suspended. You can not log in for now. Please try again later.'));
                        redirect('/dashboard');
                        die();
                    }
                }
                else{
                    send_alert(array('error','Username or Password is invalid'));
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
        redirect('/dashboard','location','303');
        die();
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
            if ($this->form_validation->run())
            {
                $email = trim($this->input->post('email'));
                $password = trim($this->input->post('password'));
                if ($this->subscriber_auth->attempt_login($email,$password))
                {
                    $subscriber = $this->subscribers_model->get(array('email'=>$email));
                    if ($subscriber->banned == '1')
                    {
                        send_alert(array('warning','Your account has been suspended because of the following reason:<br><br>'.$subscriber->ban_message));
                        redirect('/login');
                        die();
                    }
                    else
                    {
                        $this->subscriber_auth->login($email,$password);
                        redirect('/panel');
                        die();
                    }
                }
                else{
                    send_alert(array('error','Username or Password is invalid'));
                }
            }

            $this->template->title('PfNews - Subscriber Login');
            $this->template->build('authentication/public_login',$data);
        }
    }

    public function panel_logout()
    {
        $this->subscriber_auth->logout();
        redirect('/');
    }

    public function panel_register()
    {

        if ($this->register_form_validate())
        {
            $email = trim($_POST['email']);
            if ($this->subscriber_auth->email_check($email) == EXIST)
            {
                send_alert(array('error','This email has already been taken by another user.'));
                redirect('/register');
                die();
            }
            else
            {
                $data_set = array();
                $data_set['email'] = $email;
                $data_set['password'] = md5($_POST['password']);
                $data_set['name'] = trim($_POST['fullname']);
                $this->subscribers_model->insert($data_set);
                send_alert(array('success','Your account created successfully!<br>You can go to '.anchor(base_url('login'),'login page').' to sign in.'));
                redirect('register');
            }
        }
        else
        {
            $data = array();
            $this->template->title('PfNews - Subscriber Login');
            $this->template->build('authentication/public_register',$data);
        }
    }

    private function register_form_validate()
    {
        $this->form_validation->set_rules('fullname','Fullname','trim');
        $this->form_validation->set_rules('email','Email','trim|required|valid_email|min_length[6]|max_length[255]');
        //$this->form_validation->set_rules('username','Username','trim|required|min_length[4]|max_length[32]');
        $this->form_validation->set_rules('password','Password','required|min_length[4]|max_length[32]|matches[confirm_password]');
        $this->form_validation->set_rules('confirm_password','Password','required|min_length[4]|max_length[32]');
        $this->form_validation->set_rules('terms','Terms','required',array('required'=>'You must agree the terms to Register'));
        return $this->form_validation->run();
    }
}

?>
