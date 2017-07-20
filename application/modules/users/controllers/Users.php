<?php
/**
 * Created by PhpStorm.
 * User: MyBirer
 * Date: 19.07.2017
 * Time: 17:39
 */
class Users extends MY_Controller {
    public function __construct()
    {
        parent::__construct();
        $this->load->model('users_model');
    }
    public function index(){
        $data = array();
        Globals::setActiveModule('users');
        $data['objects'] = $this->users_model->get_all();

        $this->template->title('Printf News - Pages');
        $this->template->build('Users', $data);
    }
}