<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Subscribers extends BE_Controller {

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $data = array();
        # Set Layout
        $this->load->model('subscribers_model','modeli');
        $result = $this->modeli->get($data);

        $this->template->title('Printf News');
        $this->template->build('Subscribers', $data);
    }
}