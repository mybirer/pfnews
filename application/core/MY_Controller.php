<?php
    class MY_Controller extends MX_Controller{
        function __construct(){
            parent::__construct();

            $this->load->library('auth',array('pf_users','pkuser'),'user_auth');
            $this->load->library('auth',array('pf_subscribers','pksubscriber'),'subscriber_auth');
//            $this->lang->load('modules','turkish');
//            $this->lang->load('actions','turkish');
//            $this->lang->load('authentication','turkish');
            if ($this->user_auth->is_logged())
            {
                $this->load->model('users/users_model');
                Globals::setCurrentUser($this->users_model->get_with_modules(array('pkuser'=>$_SESSION['backend_session']['user_id'])));
                Globals::setModules($this->db->get('pf_modules')->result_array());

                $this->template->set_layout('backend_layout');
                $this->template->set_partial('footer', 'partials/private_footer');
                $this->template->set_partial('header', 'partials/private_header');
                $this->template->set_partial('sidebar', 'partials/private_sidebar');
            }
            else{
                $this->template->set_partial('footer', 'partials/footer');
                $this->template->set_partial('header', 'partials/header');
            }
        }
    }

?>
