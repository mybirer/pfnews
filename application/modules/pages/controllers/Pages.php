<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pages extends BE_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index(){
        $data = array();
        $this->template->title('Printf News - Pages');
        $this->template->build('Pages', $data);

    }
}

?>