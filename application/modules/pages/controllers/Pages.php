<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: ERDEN
 * Date: 16.07.2017
 * Time: 19:05
 */
class Pages extends BE_Controller
{
    public function index(){
        $data = array();
        $this->template->title('Printf News - Pages');
        $this->template->build('Pages', $data);
    }
}

?>