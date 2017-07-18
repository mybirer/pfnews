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
        $data = array();
        $data['pages'] = $this->pages_model->get_all(array());

        $this->template->title('Printf News - Pages');
        $this->template->build('Pages', $data);

    }

    public function add()
    {
        $data = array();

        //form gönderilmiş ise çalıştır.
        if ($this->page_form_validate()){
            $title = trim($this->input->post('title'));
            $content = trim($this->input->post('content'));

            if ($this->pages_model->insert(array('title'=>$title,'content'=>$content,'created_by'=>$this->session->user_id))){
                //başarılı
                send_message('form_response',array('success','Page created successfully.'));
                redirect('/pages/edit/'.$this->pages_model->get_last_id());
            }else{
                send_message('form_response',array('failed','Page cannot be created.'));
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
        $data = array();

        //sayfa sistemde var mı
        if ($this->page_exist($pageid))
        {
            //form gönderilmiş mi
            if (is_post_request())
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
                        send_message('form_response',array('success','Page updated successfully.'));
                        redirect('/pages/edit/'.$pageid);
                    }
                    else
                    {
                        //başarısız
                        //form doğrulamadan geçti fakat başka bir hata meydana geldi
                        send_message('form_response',array('failed','Page cannot be updated.'));
                        $this->template->title('Printf News - Pages');
                        $this->template->build('Page_add', $data);
                    }
                }
                else
                {
                    // güncellenen form formata uygun değil
                    send_message('form_response',array('failed','Sayfa güncellenemedi. Sayfayı formata uygun güncelleyin.'));
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
            send_message('form_response',array('failed','Düzenlemeye çalıştığınız sayfa sistemde mevcut değil.'));
            redirect('/pages');
        }

    }

    public function delete($pageid = 0)
    {
        //sayfa sistemde mevcut mu
        if (!$this->page_exist($pageid)){
            $this->session->set_flashdata('form_response',array('failed','Sayfa sistemde bulunamadı!'));
        }else{
            //mevcutsa sil
            $this->pages_model->delete(array('pkpage'=>$pageid));
            if (!$this->page_exist($pageid)){
                //database den silinen satır sayısı çekilemiyor.
                //Bu yüzden silinen obje tekrar çağrılıyor var ise hata ver yok ise silinmiştir.
                $this->session->set_flashdata('form_response',array('success','Sayfa başarılı bir şekilde silindi!'));
            }else{
                $this->session->set_flashdata('form_response',array('failed','Sayfa silinirken hata oluştu!'));
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
