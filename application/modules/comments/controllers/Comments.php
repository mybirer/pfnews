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
    public function __construct()
    {
        parent::__construct();
        $this->load->model('comments_model','comments_model');
    }
    //status -> all, approved, pending, removed
    //durum  -> tümü, onaylanmış, beklemede, çöp
    public function index()
    {
        $data = array();
        $status = $this->input->get('status');
        $status = strtolower($status);

        if (!in_array($status,array('approved','pending','removed')))
            $status = 'pending';

        $data['approved_count'] = $this->comments_model->get_total(array('status' => comments_model::$APPROVED));
        $data['pending_count'] = $this->comments_model->get_total(array('status' => comments_model::$PENDING));
        $data['removed_count'] = $this->comments_model->get_total(array('status' => comments_model::$REMOVED));

        if ($status == 'approved')
            $data['comments'] = $this->comments_model->get_all(array('status' => comments_model::$APPROVED));
        else if ($status == 'pending')
            $data['comments'] = $this->comments_model->get_all(array('status' => comments_model::$PENDING));
        else if ($status == 'removed')
            $data['comments'] = $this->comments_model->get_all(array('status' => comments_model::$REMOVED));

        $data['status'] = $status;
        $this->template->title('Printf News - Comments');
        $this->template->build('Comments', $data);
    }

    public function show($id = 0){
        //go to comment's news(or whatever)
        //@todo id'si girilen yorumun yapıldığı sayfaya yönlendir.
    }

    public function edit($id = 0){
        $data = array();
        $comment = $this->comments_model->get(array('pkcomment'=>$id));

        if (empty($comment)){
            $this->template->build('Comment_edit_blank');
        }
        else{
            $data['comments'] = array($comment);
            $this->template->build('Comment_edit',$data);
        }
    }

    public function action($status = '',$id = 0){
        $status = strtolower($status);
        $data = array('action'=>$status);
        $result = false;
        if (!in_array($status,array('approved','pending','removed','delete')) || intval($id) <= 0){
            //@todo geçersiz eylem
            $data['result'] = $result;
            redirect('/comments');
        }else{
            //do action
            if ($status == 'delete')
                $result = $this->comments_model->delete(array('pkcomment'=>intval($id)));
            else if ($status == 'approved')
                $result = $this->comments_model->update(array('status' => comments_model::$APPROVED),array('pkcomment'=>intval($id)));
            else if ($status == 'pending')
                $result = $this->comments_model->update(array('status' => comments_model::$PENDING),array('pkcomment'=>intval($id)));
            else if ($status == 'removed')
                $result = $this->comments_model->update(array('status' => comments_model::$REMOVED),array('pkcomment'=>intval($id)));

            $data['result'] = $result;
            $data['affected_rows'] = $this->db->affected_rows();
        }

        $this->template->build('Comment_action',$data);
    }
}
