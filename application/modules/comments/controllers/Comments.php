<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: ERDEN
 * Date: 15.07.2017
 * Time: 23:06
 */
class Comments extends BE_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('comments_model','mcomments');
    }
    //status -> all, approved, moderated, trash
    //durum  -> tümü, onaylanmış, beklemede, çöp
    public function index($status = 'all')
    {
        $data = array();
        $status = strtolower($status);

        if (!in_array($status,array('all','approved','moderated','trash')))
            $status = 'all';

        if ($status == 'all')
            $data['comments'] = $this->mcomments->get_all();
        else if ($status == 'approved')
            $data['comments'] = $this->mcomments->get_all(array('status' => comments_model::$APPROVED));
        else if ($status == 'moderated')
            $data['comments'] = $this->mcomments->get_all(array('status' => comments_model::$MODERATED));
        else if ($status == 'trash')
            $data['comments'] = $this->mcomments->get_all(array('status' => comments_model::$TRASH));

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

        if (empty($comment))
            echo 'boş';
        else
            echo 'dolu';

        $this->template->build('Comment_edit',$data);
    }
}