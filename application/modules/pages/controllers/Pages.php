<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pages extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('pages_model');
    }

    public function index(){
        backend_login_check('pages','list');
        $data = array();
        $data['pages'] = $this->pages_model->get_all(array());

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
            $content = trim($this->input->post('content'));

            if ($this->pages_model->insert(array('title'=>$title,'content'=>$content,'created_by'=>$this->session->user_id))){
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
        if ($this->page_exist($pageid))
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

                    //update başarılı mı
                    //db de auto_update olarak ayarlandığından 'updated_at' field ında bir güncelleme yapmadık.
                    if ($this->pages_model->update(array('title'=>$title,'content'=>$content,'updated_by'=>$this->session->user_id),array('pkpage'=>$pageid))){
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
                    send_alert(array('error',t('Page can not be updated. Please update the form as suitable format')));
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
        if (!$this->page_exist($pageid)){
            send_alert(array('error',t('The page you have tried to delete is not exist')));
        }else{
            //mevcutsa sil
            $this->pages_model->delete(array('pkpage'=>$pageid));
            if (!$this->page_exist($pageid)){
                //database den silinen satır sayısı çekilemiyor.
                //Bu yüzden silinen obje tekrar çağrılıyor var ise hata ver yok ise silinmiştir.
                send_alert(array('success',sprintf(t('%s deleted successfully',t('Page'))).'!'));
            }else{
                send_alert(array('error',sprintf(t('An error occurred while deletion the %s'),strtolower(t('Page'))).'!'));
            }
        }
        redirect('/pages');
    }

    //post olarak gönderilen formu check eder
    private function page_form_validate(){
        $this->form_validation->set_rules('title','Title','trim|required|min_length[8]|max_length[255]');
        $this->form_validation->set_rules('content','Content','trim|required|min_length[50]');
        $this->form_validation->set_rules('status','Status','trim|required');
        return $this->form_validation->run();//belirtilen formatta ise tue değilse false döner
    }

    //db de bu id de bir sayfa var mı kontrol eder.
    private function page_exist($pageid){
        if (empty($this->pages_model->get(array('pkpage'=>$pageid))))
            return false;
        return true;
    }
}

?>
