<?php
    class BE_Controller extends MX_Controller{
        function __construct(){
            parent::__construct();
            $this->template->set_layout('backend_layout');
            $this->template->set_partial('header', 'partials/private_header');
            $this->template->set_partial('sidebar', 'partials/private_sidebar');
            $this->template->set_partial('footer', 'partials/private_footer');
        }
    }

?>