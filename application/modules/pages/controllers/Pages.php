<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pages extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('pages_model');
    }

    //public alandan çağırılınca bu metoda düşer.
    public function show($alias)
    {
        $page = (array)$this->pages_model->get(array('alias'=>$alias,'status'=>'published'));
        if (!empty($page))
        {
            //sayfa mevcut ise yükle
            $this->load->model('comments/comments_model');
            if ($page['allow_comments'] && $this->add_comment_form_validate())
            {
                $object_id = $page['pkpage'];
                $content = trim($_POST['content']);
                $email = trim($_POST['email']);
                if ($this->comments_model->add_comment($object_id,'pages',$content,$email) == false)
                    send_alert(array('error',t('Your comment can not be send at this time. Please try again later.')));
                else
                    send_alert(array('success',t('Your comment sent successfully. After approved it will display here.')));
                redirect(base_url($alias),'refresh');
                die();
            }
            else
            {
                $data = array('page'=>$page);
                $where = array('object_id'=>$page['pkpage'],'module_name'=>'pages','status'=>'approved');
                $data['comments'] = $this->comments_model->get_module_comments($where,10,0);
                $data['comments_count'] = $this->comments_model->get_module_comments_count($where,10,0);
                $this->template->title($page['title']);
                $this->template->build('page_show', $data);
            }
        }
        else
        {
            //değilse 404 hatası ver
            show_404();
        }
    }

    public function index(){
        backend_login_check('pages','list');

//        $data['pages'] = $this->pages_model->get_all(array());

        $data = array();
        $filter_params = get_filter_params('pkpage');

        $data['pages'] = $this->pages_model
            ->get_all_filter($filter_params['search_term'],
                $filter_params['order_by'],
                $filter_params['order_dir'],
                $filter_params['limit'],
                $filter_params['offset'],
                $filter_params['filter']);

        //build pagination
        $this->load->library('pagination');
        $config['base_url'] = base_url('dashboard/pages');
        $config['total_rows'] = $this->pages_model->get_all_filter_total($filter_params['search_term'],$filter_params['filter']);
        $config['per_page'] = $filter_params['limit'];
        $this->pagination->initialize($config);
        $data['pagination'] = $this->pagination->create_links();

        $this->template->title('Printf News - Pages');
        $this->template->build('Pages', $data);
    }

    public function add()
    {
        backend_login_check('pages','add');
        $data = array();

        //form gönderilmiş ise çalıştır.
        if ($this->page_form_validate()){
            $title = trim($this->input->post('title'));
            $alias = trim($this->input->post('alias'));
            $content = trim($this->input->post('content'));
            $allow_comments = isset($_POST['allow_comments'])?true:false;
            $status = trim($this->input->post('status'))=='publish'?'published':'draft';

            if ($this->pages_model->insert(
                array('title'=>$title,
                    'content'=>$content,
                    'created_by'=>$this->user_auth->read('user_id'),
                    'status'=>$status,
                    'allow_comments' => $allow_comments
                ))){
                //başarılı
                send_alert(array('success',sprintf(t('%s created successfully'),t('Page'))));
                redirect('/pages/edit/'.$this->pages_model->get_last_id());
            }else{
                send_alert(array('error',sprintf(t('%s cannot be created'),t('Page'))));
                $this->template->title('Printf News - Pages');
                $this->template->build('Page_add', $data);
            }
        }else{
            $this->template->title('Printf News - Pages');
            $this->template->build('Page_add', $data);
        }
    }

    public function edit($pageid = 0)
    {
        backend_login_check('pages','edit');
        $data = array();

        //sayfa sistemde var mı
        if ($this->page_id_exist($pageid))
        {
            //form gönderilmiş mi
            if (!empty($_POST))
            {
                //form uygun formatta mı
                if ($this->page_form_validate())
                {
                    //update
                    $title = trim($this->input->post('title'));
                    $content = trim($this->input->post('content'));
                    $allow_comments = isset($_POST['allow_comments'])?true:false;
                    $status = trim($this->input->post('status'))=='publish'?'published':'draft';

                    //update başarılı mı
                    //db de auto_update olarak ayarlandığından 'updated_at' field ında bir güncelleme yapmadık.
                    if ($this->pages_model->update(
                        array('title'=>$title,
                            'content'=>$content,
                            'updated_by'=>$this->user_auth->read('user_id'),
                            'allow_comments'=>$allow_comments,
                            'status'=>$status),array('pkpage'=>$pageid))){
                        //başarılı
                        send_alert(array('success',sprintf(t('%s updated successfully'),t('Page'))));
                        redirect('/pages/edit/'.$pageid);
                    }
                    else
                    {
                        //başarısız
                        //form doğrulamadan geçti fakat başka bir hata meydana geldi
                        send_alert(array('error',sprintf(t('%s cannot be updated'),t('Page'))));
                        $this->template->title('Printf News - Pages');
                        $this->template->build('Page_add', $data);
                    }
                }
                else
                {
                    // güncellenen form formata uygun değil
                    send_alert(array('error',t('Page can not be updated. Please update the form as appropriate format')));
                    $data['pages'] = $this->pages_model->get_all(array('pkpage' => $pageid));
                }
            }
            else
            {
                //form gönderilmemiş. Sayfa db den çekiliyor.
                $data['pages'] = $this->pages_model->get_all(array('pkpage' => $pageid));
            }

            $this->template->title('Printf News - Pages');
            $this->template->build('Page_edit', $data);
        }
        else
        {
            //sayfa sistemde yok
            send_alert(array('error',t('The page you have tried to edit is not exist')));
            redirect('/pages');
        }

    }

    public function delete($pageid = 0)
    {
        backend_login_check('pages','remove');
        //sayfa sistemde mevcut mu
        if (!$this->page_id_exist($pageid)){
            send_alert(array('error',t('The page you have tried to delete is not exist')));
        }else{
            //mevcutsa sil
            $this->pages_model->delete(array('pkpage'=>$pageid));
            if (!$this->page_id_exist($pageid)){
                //database den silinen satır sayısı çekilemiyor.
                //Bu yüzden silinen obje tekrar çağrılıyor var ise hata ver yok ise silinmiştir.
                send_alert(array('success',sprintf(t('%s deleted successfully',t('Page'))).'!'));
            }else{
                send_alert(array('error',sprintf(t('An error occurred while deletion the %s'),strtolower(t('Page'))).'!'));
            }
        }
        redirect('/pages');
    }

    public function publish($pageid = 0)
    {

    }

    public function unpublish($pageid = 0)
    {

    }

    //post olarak gönderilen formu check eder
    private function page_form_validate(){
        $this->form_validation->set_rules('title','Title','trim|required|min_length[8]|max_length[255]');
        $this->form_validation->set_rules('alias','Alias','trim|required|min_length[8]|max_length[255]');
        $this->form_validation->set_rules('content','Content','trim|required|min_length[50]');
        $this->form_validation->set_rules('status','Status','trim|required');
        return $this->form_validation->run();//belirtilen formatta ise tue değilse false döner
    }

    //db de bu id de bir sayfa var mı kontrol eder.
    private function page_id_exist($pageid){
        if (empty($this->pages_model->get(array('pkpage'=>$pageid))))
            return false;
        return true;
    }

    private function add_comment_form_validate()
    {
        $this->form_validation->set_rules('email','Email','trim|required|valid_email|min_length[6]|max_length[255]');
        $this->form_validation->set_rules('content','Content','trim|required|min_length[5]|max_length[5000]');
        return $this->form_validation->run();
    }
    //db de bu alias ile kayıtlı bir sayfa var mı kontrol eder.
    //page add ve edit ekranında lazım olabilir
    private function page_alias_exist($alias){
        if (empty($this->pages_model->get(array('alias'=>$alias))))
            return false;
        return true;
    }

}

?>
