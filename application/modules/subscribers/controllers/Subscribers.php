<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Subscribers extends MY_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('subscribers_model');
    }

    public function index()
    {
        backend_login_check('subscribers','list');

        $data = array();
        $filter_params = get_filter_params('pksubscriber');

        $data['objects'] = $this->subscribers_model
            ->get_all_filter($filter_params['search_term'],
                $filter_params['order_by'],
                $filter_params['order_dir'],
                $filter_params['limit'],
                $filter_params['offset'],
                $filter_params['filter']);

        //build pagination
        $this->load->library('pagination');
        $config['base_url'] = base_url('dashboard/subscribers');
        $config['total_rows'] = $this->subscribers_model->get_all_filter_total($filter_params['search_term'],$filter_params['filter']);
        $config['per_page'] = $filter_params['limit'];
        $this->pagination->initialize($config);
        $data['pagination'] = $this->pagination->create_links();

        $this->template->title('Printf News - Subscribers');
        $this->template->build('Subscribers', $data);

    }

    public function edit($id = 0)
    {
        backend_login_check('subscribers','edit');
        $data = array();
        $this->template->title('Printf News - Edit Subscriber');
        $object = $this->subscribers_model->get(array('pksubscriber'=>intval($id)));
        if (empty($object)){
            //subscriber sistemde yok
            send_alert(array('error',t('The subscriber you have tried to edit is not exist')));
            redirect(base_url('dashboard/subscribers'));
        }else{
            //load the record
            //todo subscriber update ayarla
            $data['object'] = $object;
            $this->template->build('Subscriber_edit', $data);
        }
    }

    public function enable($id = 0)
    {
        backend_login_check('subscribers','edit');
        $id_array = array();
        //liste gönderilmiş ise
        if (isset($_POST['id_array']))
            $id_array = explode(',',$_POST['id_array']);
        elseif ($id > 0)
            array_push($id_array,$id);
        foreach ($id_array as $id_element)
            $this->subscribers_model->update(array('banned'=>0),array('pksubscriber'=>$id_element));

        redirect('/dashboard/subscribers');
    }

    public function disable($id = 0)
    {
        backend_login_check('subscribers','edit');
        $id_array = array();
        //liste gönderilmiş ise
        if (isset($_POST['id_array']))
            $id_array = explode(',',$_POST['id_array']);
        elseif ($id > 0)
            array_push($id_array,$id);
        foreach ($id_array as $id_element)
            $this->subscribers_model->update(array('banned'=>1),array('pksubscriber'=>$id_element));

        redirect('/dashboard/subscribers');
    }

    public function delete($id = 0)
    {
        backend_login_check('subscribers','remove');
        $id_array = array();
        //liste gönderilmiş ise
        if (isset($_POST['id_array']))
            $id_array = explode(',',$_POST['id_array']);
        elseif ($id > 0)
            array_push($id_array,$id);
        foreach ($id_array as $id_element)
            $this->subscribers_model->delete(array('pksubscriber'=>$id_element));

        redirect('/dashboard/subscribers');
    }
}

?>
