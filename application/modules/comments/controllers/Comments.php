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
        $this->load->model('comments_model','mcomments');
    }
    //status -> all, approved, moderated, trash
    //durum  -> tümü, onaylanmış, beklemede, çöp
    public function index()
    {
        $data = array();
        $status = $this->input->get('status');
        $status = strtolower($status);

        if (!in_array($status,array('approved','moderated','trash')))
            $status = 'moderated';

        $data['approved_count'] = $this->mcomments->get_total(array('status' => comments_model::$APPROVED));
        $data['moderated_count'] = $this->mcomments->get_total(array('status' => comments_model::$MODERATED));
        $data['trash_count'] = $this->mcomments->get_total(array('status' => comments_model::$TRASH));

        if ($status == 'approved')
            $data['comments'] = $this->mcomments->get_all(array('status' => comments_model::$APPROVED));
        else if ($status == 'moderated')
            $data['comments'] = $this->mcomments->get_all(array('status' => comments_model::$MODERATED));
        else if ($status == 'trash')
            $data['comments'] = $this->mcomments->get_all(array('status' => comments_model::$TRASH));

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
        $comment = $this->mcomments->get(array('pkcomment'=>$id));

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
        if (!in_array($status,array('approved','moderated','trash','delete')) || intval($id) == 0){
            //@todo geçersiz eylem
            $data['result'] = $result;
        }else{
            //do action
            if ($status == 'delete')
                $result = $this->mcomments->delete(array('pkcomment'=>intval($id)));
            else if ($status == 'approved')
                $result = $this->mcomments->update(array('status' => comments_model::$APPROVED),array('pkcomment'=>intval($id)));
            else if ($status == 'moderated')
                $result = $this->mcomments->update(array('status' => comments_model::$MODERATED),array('pkcomment'=>intval($id)));
            else if ($status == 'trash')
                $result = $this->mcomments->update(array('status' => comments_model::$TRASH),array('pkcomment'=>intval($id)));

            $data['result'] = $result;
            $data['affected_rows'] = $this->db->affected_rows();
        }

        $this->template->build('Comment_action',$data);
    }
}