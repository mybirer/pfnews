<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Logs extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index($page_number = 1){
        $data = array();

        $this->load->library('pagination');
        $config['base_url'] = 'http://pfnews.com/logs/index';
        $config['total_rows'] = $this->logs_model->get_total(array());
        $config['per_page'] = 10;
        $config['num_links'] = 10;
        $config['use_page_numbers'] = TRUE;

        $this->pagination->initialize($config);

        $links=$this->pagination->create_links();
        echo $links;


        $data['objects'] = $this->logs_model->get_all(array('limit'=>10,'offset'=>($page_number-1)*10));//page_number dan 1 çıkarmamızın sebebi offseti 0 dan başlatmamızdır. Mantıksal olarak sayfa numaramız 1 den başlar fakat offset 0 dan limit 10 a kadar olan kayıtları döndürür
        $this->template->title('Printf News - Pages');
        $this->template->build('logs',$data);
    }
}

?>
