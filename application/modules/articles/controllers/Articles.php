<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Articles extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('articles_model');
    }

    //public alandan çağırılınca bu metoda düşer.
    public function show($article_alias = '',$article_id = 0)
    {
        //todo article public görüntülemesini created_at field ına göre yap
        $object = $this->articles_model->get(array('pkarticle'=>$article_id,'status'=>'published'));
        if (!empty($object))
        {
            //sayfa mevcut ise yükle
            $this->load->model('comments/comments_model');
            if ($object['allow_comments'] && add_comment_form_validate())
            {
                $object_id = $object['pkarticle'];
                $fullname = trim($_POST['fullname']);
                $content = trim($_POST['content']);
                $email = trim($_POST['email']);
                if ($this->comments_model->add_comment($object_id,'articles',$fullname,$email,$content) == false)
                    send_alert(array('error',t('Your comment can not be send at this time. Please try again later.')));
                else
                    send_alert(array('success',t('Your comment sent successfully. After approved it will display here.')));
                redirect(base_url('articles/'.$article_alias),'refresh');
                //todo adamı article url sine yönlendir
                die();
            }
            else
            {
                // public ekran yükleniyor
                $data = array('object'=>$object); // article objesi gönderiliyor
                //gösterim istatistiği 1 arttırılıyor
                $this->articles_model->increment_view(array('pkarticle'=>$object['pkarticle']));
                //yoruma açık mı?
                if ($object['allow_comments']){
                    //yorum tablosundan onaylanan ilk 10 yorumu getir.
                    $where = array('object_id'=>$object['pkarticle'],'module_name'=>'articles','status'=>'approved');
                    $data['comments'] = $this->comments_model->get_module_comments($where,10,0);
                    $data['comments_count'] = $this->comments_model->get_module_comments_count($where,10,0);
                }
                $this->template->title($object['title']);
                $this->template->build('article_show', $data);
            }
        }
        else
        {
            //değilse 404 hatası ver
            show_404();
        }
    }

    public function index(){
        backend_login_check('articles','list');

        $data = array();
        $filter_params = get_filter_params('pkarticle');

        $data['objects'] = $this->articles_model
            ->get_all_filter($filter_params['search_term'],
                $filter_params['order_by'],
                $filter_params['order_dir'],
                $filter_params['limit'],
                $filter_params['offset'],
                $filter_params['filter']);

        //build pagination
        $this->load->library('pagination');
        $config['base_url'] = base_url('dashboard/articles');
        $config['total_rows'] = $this->articles_model->get_all_filter_total($filter_params['search_term'],$filter_params['filter']);
        $config['per_page'] = $filter_params['limit'];
        $this->pagination->initialize($config);
        $data['pagination'] = $this->pagination->create_links();

        $this->template->title('Printf News - Articles');
        $this->template->build('Articles', $data);
    }

    public function add()
    {
        backend_login_check('articles','add');
        $data = array();

        //form gönderilmiş ise çalıştır.
        if ($this->article_form_validate()){
            $title = trim($this->input->post('title'));
            $alias = title_to_url($title);//todo article alias unique bir değer mi olacak?
            $content = trim($this->input->post('content'));
            $allow_comments = isset($_POST['allow_comments'])?true:false;
            $status = trim($this->input->post('status'))=='publish'?'published':'draft';

            if ($this->articles_model->insert(
                array('title'=>$title,
                    'alias'=>$alias,
                    'content'=>$content,
                    'created_by'=>$this->user_auth->read('user_id'),
                    'status'=>$status,
                    'allow_comments' => $allow_comments
                ))){
                //başarılı
                send_alert(array('success',sprintf(t('%s created successfully'),t('Article'))));
                redirect(base_url('dashboard/articles/edit/'.$this->articles_model->get_last_id()));
            }else{
                send_alert(array('error',sprintf(t('%s cannot be created'),t('Article'))));
                $this->template->title('Printf News - Articles');
                $this->template->build('Article_add', $data);
            }
        }else{
            $this->template->title('Printf News - Articles');
            $this->template->build('Article_add', $data);
        }
    }

    public function edit($object_id = 0)
    {
        backend_login_check('articles','edit');
        $data = array();
        $article = $this->articles_model->get(array('pkarticle'=>$object_id));
        if (!empty($article) && $this->author_has_permission($article))
        {
            //form gönderilmiş mi ve form uygun formatta mı
            if ($this->article_form_validate())
            {
                //update
                $title = trim($this->input->post('title'));
                $content = trim($this->input->post('content'));
                $allow_comments = isset($_POST['allow_comments'])?true:false;
                $status = trim($this->input->post('status'))=='publish'?'published':'draft';

                //update başarılı mı
                //db de auto_update olarak ayarlandığından 'updated_at' field ında bir güncelleme yapmadık.
                if ($this->articles_model->update(
                    array('title'=>$title,
                        'content'=>$content,
                        'updated_by'=>$this->user_auth->read('user_id'),
                        'allow_comments'=>$allow_comments,
                        'status'=>$status),array('pkarticle'=>$object_id))){
                    //başarılı
                    send_alert(array('success',sprintf(t('%s updated successfully'),t('Article'))));
                    redirect(current_url());
                }
                else
                {
                    //başarısız
                    //form doğrulamadan geçti fakat başka bir hata meydana geldi
                    send_alert(array('error',sprintf(t('%s cannot be updated'),t('Article'))));
                }
            }
            else
            {
                // güncellenen form formata uygun değil
                if (!empty($_POST))
                    send_alert(array('error',t('Article can not be updated. Please update the form as appropriate format')));

                //form gönderilmemiş. Sayfa db den çekiliyor.
                $data['object'] = $article;
            }

            $this->template->title('Printf News - Articles');
            $this->template->build('Article_edit', $data);
        }
        else
        {
            //sayfa sistemde yok
            send_alert(array('error',t('The article you have tried to edit is not exist')));
            redirect(base_url('dashboard/articles'));
        }

    }

    public function delete($object_id = 0)
    {
        backend_login_check('articles','remove');
        //sayfa sistemde mevcut mu
        $article = $this->articles_model->get(array('pkarticle'=>$object_id));
        if (!empty($article) && $this->author_has_permission($article))
        {
            //mevcutsa sil
            $this->articles_model->delete(array('pkarticle'=>$object_id));
            if (!$this->article_id_exist($object_id)){
                //database den silinen satır sayısı çekilemiyor.
                //Bu yüzden silinen obje tekrar çağrılıyor var ise hata ver yok ise silinmiştir.
                send_alert(array('success',sprintf(t('%s deleted successfully'),t('Article')).'!'));
            }
            else
            {
                send_alert(array('error',sprintf(t('An error occurred while deletion the %s'),strtolower(t('Article'))).'!'));
            }
        }
        else
        {
            send_alert(array('error',t('The article you have tried to delete is not exist')));
        }
        redirect(base_url('dashboard/articles'));
    }

    //post olarak gönderilen formu check eder
    private function article_form_validate(){
        $this->form_validation->set_rules('title','Title','trim|required|min_length[8]|max_length[255]');
        $this->form_validation->set_rules('content','Content','trim|required|min_length[50]');
        $this->form_validation->set_rules('status','Status','trim|required');
        return $this->form_validation->run();//belirtilen formatta ise tue değilse false döner
    }

    //db de bu id de bir sayfa var mı kontrol eder.
    private function article_id_exist($object_id){
        if (empty($this->articles_model->get(array('pkarticle'=>$object_id))))
            return false;
        return true;
    }

    /**
     * şu anki kullanıcının parametre olarak gönderilen article için görüntüleme, silme, düzenleme yapabilmesi için
     * kendisine mi ait veya başkasına mı ait olduğunu kontrol eder.
     *
     * Aksi halde url den article id sini değiştirerek başkasına ait olan ve kendisinin görüntüleyemediği köşe yazısında düzenleme yapabilir.
     *
     * Eğer kullanıcı tipi yazar ise bu kontolü gerçekleştirir.
     * Eğer yazar değilse (Yöneticidir çünkü diğer kullanıcı tipleri bu modüle erişemeyecek) erişime direkt izin verir
     *
     * @param $article
     * @return bool
     */
    private function author_has_permission(&$article)
    {
        $user_type = Globals::currentUser()->user_type;
        $permission = $user_type == USER_TYPE_YONETICI ? true : false;
        $permission = $user_type == USER_TYPE_YAZAR && $article['created_by'] == Globals::currentUser()->pkuser ? true : $permission;
        return $permission;
    }
}

?>
