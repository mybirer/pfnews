<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends MY_Controller {

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $data = array();
        # Set Layout
        $this->template->set_layout('backend_layout');
        $this->template->title('Printf News');
        $this->template->set_partial('header', 'partials/private_header');
        $this->template->set_partial('sidebar', 'partials/private_sidebar');
        $this->template->set_partial('footer', 'partials/private_footer');
        $this->template->build('Dashboard', $data);
    }
}