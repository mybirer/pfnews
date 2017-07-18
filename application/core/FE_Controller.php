<?php
    class FE_Controller extends MX_Controller{
        function __construct(){
            parent::__construct();
            $this->load->library('Auth',array('pf_subscribers','pksubscriber'));
            $this->template->set_layout('frontend_layout');
            $this->template->set_partial('header', 'partials/header');
            $this->template->set_partial('footer', 'partials/footer');
        }
    }

?>