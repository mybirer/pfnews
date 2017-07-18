<?php
    class MY_Controller extends MX_Controller{
        function __construct(){
            parent::__construct();

            $this->load->library('auth',array('pf_users','pkuser'),'user_auth');
            $this->load->library('auth',array('pf_subscribers','pksubscriber'),'subscriber_auth');


            if ($this->user_auth->is_logged())
            {
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
