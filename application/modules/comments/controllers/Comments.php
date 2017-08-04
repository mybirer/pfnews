<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: ERDEN
 * Date: 15.07.2017
 * Time: 23:06
 */
class Comments extends MY_Controller
{
    //todo actionlar için alert hazırla.
    public function __construct()
    {
        parent::__construct();
        $this->load->model('comments_model');
    }
    //status -> all, approved, pending, removed
    //durum  -> tümü, onaylanmış, beklemede, çöp
    public function index()
    {
        backend_login_check('comments','list');
        $data = array();
        $filter_params = get_filter_params('pkcomment');

        $data['objects'] = $this->comments_model
            ->get_all_filter($filter_params['search_term'],
                $filter_params['order_by'],
                $filter_params['order_dir'],
                $filter_params['limit'],
                $filter_params['offset'],
                $filter_params['filter']);

        //build pagination
        $this->load->library('pagination');
        $config['base_url'] = base_url('dashboard/comments');
        $config['total_rows'] = $this->comments_model->get_all_filter_total($filter_params['search_term'],$filter_params['filter']);
        $config['per_page'] = $filter_params['limit'];
        $this->pagination->initialize($config);
        $data['pagination'] = $this->pagination->create_links();

        $this->template->title('Printf News - Comments');
        $this->template->build('Comments', $data);
    }

    public function show($id = 0){
        backend_login_check('comments','list');
        //go to comment's news(or whatever)
        //@todo id'si girilen yorumun yapıldığı sayfaya yönlendir.
    }

    public function edit($id = 0){
        backend_login_check('comments','edit');
        $data = array();
        if (isset($_POST['content']))
        {
            //güncelle
            $content = trim($_POST['content']);
            $status = $_POST['status'];
            $this->comments_model->update(array('content'=>$content,'status'=>$status),array('pkcomment'=>$id));
            send_alert(array('success','Comment updated successfully'));
            redirect(current_url());
        }
        else
        {
            $comment = $this->comments_model->get(array('pkcomment'=>$id));
            if (empty($comment)){
                send_alert(array('warning','The comment doesn\'t exist in the system'));
                redirect(base_url('dashboard/comments'));
            }
            else{
                $data['comment'] = $comment;
                $this->template->build('Comment_edit',$data);
            }
        }
    }

    /**
     * @param int $id
     * tek bir yorum /dashboard/comments/approve/14 şeklinde onaylanabilir
     * veya listeden seçilen yorumlar post ile gönderilerek de onaylanabilir
     */
    public function approve($id = 0)
    {
        backend_login_check('comments','confirm');
        $id_array = array();
        //liste gönderilmiş ise
        if (isset($_POST['id_array']))
            $id_array = explode(',',$_POST['id_array']);
        elseif ($id > 0)
            array_push($id_array,$id);
        foreach ($id_array as $id_element)
            $this->comments_model->update(array('status'=>'approved'),array('pkcomment'=>$id_element));

        redirect(base_url('dashboard/comments'));
    }

    public function delete($id = 0)
    {
        backend_login_check('comments','remove');
        $id_array = array();
        //liste gönderilmiş ise
        if (isset($_POST['id_array']))
            $id_array = explode(',',$_POST['id_array']);
        elseif ($id > 0)
            array_push($id_array,$id);
        foreach ($id_array as $id_element)
            $this->comments_model->delete(array('pkcomment'=>$id_element));
        redirect(base_url('dashboard/comments'));
    }

    public function set_pending($id = 0)
    {
        backend_login_check('comments','confirm');
        $id_array = array();
        //liste gönderilmiş ise
        if (isset($_POST['id_array']))
            $id_array = explode(',',$_POST['id_array']);
        elseif ($id > 0)
            array_push($id_array,$id);
        foreach ($id_array as $id_element)
            $this->comments_model->update(array('status'=>'pending'),array('pkcomment'=>$id_element));
        redirect(base_url('dashboard/comments'));
    }

    public function set_spam($id = 0)
    {
        backend_login_check('comments','confirm');
        $id_array = array();
        //liste gönderilmiş ise
        if (isset($_POST['id_array']))
            $id_array = explode(',',$_POST['id_array']);
        elseif ($id > 0)
            array_push($id_array,$id);
        foreach ($id_array as $id_element)
            $this->comments_model->update(array('status'=>'spam'),array('pkcomment'=>$id_element));
        redirect(base_url('dashboard/comments'));
    }

}
