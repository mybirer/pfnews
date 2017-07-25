<?php
/**
 * Created by PhpStorm.
 * User: MyBirer
 * Date: 19.07.2017
 * Time: 17:39
 */
class Users extends MY_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->model('users_model');
    }

    public function index(){
        backend_login_check('users','list');
        $data = array();
        $filter_params = get_filter_params('pkusers');
        $data['objects'] = $this->users_model
            ->get_all_filter($filter_params['search_term'],
                $filter_params['order_by'],
                $filter_params['order_dir'],
                $filter_params['limit'],
                $filter_params['offset'],
                $filter_params['filter']);

        $data['user_types'] = $this->users_model->get_user_types();

        //build pagination
        $this->load->library('pagination');
        $config['base_url'] = base_url('dashboard/users');
        $config['total_rows'] = $this->users_model->get_all_filter_total($filter_params['search_term'],$filter_params['filter']);
        $config['per_page'] = $filter_params['limit'];
        $this->pagination->initialize($config);
        $data['pagination'] = $this->pagination->create_links();

        $this->template->title('Printf News - Pages');
        $this->template->build('Users', $data);
    }

    public function add()
    {
        backend_login_check('users','add');
        if(empty($_POST))
        {
            //post edilmemiş ise sayfayı yükle
            $data = array();
            $data['user_types']= $this->users_model->get_user_types();
            $this->template->build('user_add',$data);
        }
        else
        {
            //submit var ise
            if ($this->add_user_form_validate())
            {
                //form validation başarılı
                if ($this->user_auth->email_check(trim($_POST['email'])) == NOT_EXIST)
                {
                    //email sistemde yok.
                    //username var mı
                    if ($this->user_auth->username_check(trim($_POST['username'])) == NOT_EXIST)
                    {
                        //trim atılıyor.
                        $username = trim($_POST['username']);
                        $fullname = trim($_POST['fullname']);
                        $password = trim($_POST['password']);
                        $email = trim($_POST['email']);
                        $enabled = trim($_POST['enabled']) == 'on' ? 1 : 0;
                        $user_type = trim($_POST['user_type']);
                        $this->users_model->insert(
                            array('username'=>$username,
                                'fullname'=>$fullname,
                                'password'=>$password,
                                'email'=>$email,
                                'enabled'=>$enabled,
                                'user_type'=>$user_type));
                        if ($this->db->affected_rows() == 1)
                            send_alert(array('success','User created successfully!'));
                        else
                            send_alert(array('error','An error occurred.<br>User can not be created!'));
                    }
                    else
                    {
                        send_alert(array('error','This username already exist in the system!'));
                    }
                }
                else
                {
                    //email sistemde kayıtlı
                    send_alert(array('error','This email already exist in the system!'));
                }
            }
            else
            {
                //form validation başarısız

                send_alert(array('error','Please fill required fields to create a user!'));
            }
            redirect('/dashboard/users/add');
        }
    }

    public function edit($id = 0)
    {
        backend_login_check('users','edit');
        //valid bir id ise
        if ($id>0)
        {
            $user = (array)$this->users_model->get(array('pkuser'=>$id));
            if (!empty($user))//kullanıcı sistemde mevcut ise
            {
                if (empty($_POST))
                {
                    //post request yok ise ekranı yükle.
                    $data = array();
                    $data['user'] = $user;
                    //ekranı yükle
                    $data['user_types']= $this->users_model->get_user_types();
                    $this->template->build('user_edit',$data);
                }
                else
                {
                    //ve post request var ise ya kullanıcı edit yapılmıştır)
                    if (isset($_POST['save']))
                    {
                        $this->edit_user($user);
                    }
                    elseif (isset($_POST['change']))
                    {
                        $this->change_password($user);
                    }
                    //redirect('/users/edit/'.$id,'refresh');
                    //normalde redirect yapabiliriz ama gıcık oluyor
                    $data = array();
                    $data['user'] = (array)$this->users_model->get(array('pkuser'=>$id));
                    //ekranı yükle
                    $data['user_types']= $this->users_model->get_user_types();
                    $this->template->build('user_edit',$data);
                }
            }
            else
            {
                //böyle bir kullanıcı yok
                send_alert(array('error','The user you have requested is not found!'));
                redirect('/dashboard/users');
            }
        }
        else
        {
            redirect('/dashboard/users');
        }
    }

    //post ile gönderilen veri kayıt edilir
    private function edit_user($user)
    {
        //edit form validate et
        if ($this->edit_user_form_validate())
        {
            //email and username validate
            //kullanıcı email veya username kısmını değiştirmemiş ise email validation sırasında
            //kendi email i çekilecek. yani sistemde aynı email den bir tane mevcutmuş gibi görünecek
            //biz email duplicate i engellemek için kullanıcının email ve username bilgisini çekip
            //yenisi ile karşılaştıracağız
            //eğer aynı ise validate etmeye gerek yok
            //eğer farklı ise o email de sistemde bir kayıt var mı kontrol edilmeli

            $mail_validated = true;
            $username_validated = true;
            //email değiştirilmiş ise validate etmeliyiz
            if ($user['email'] != trim($_POST['email']))
            {
                //post ile gelen email kullanıcının eski email adresi değil ise
                //sistemde var olup olmadığı denetlenmelidir.
                if ($this->user_auth->email_check(trim($_POST['email'])) == EXIST)
                    $mail_validated=false;
            }
            if ($user['username'] != trim($_POST['username']))
            {
                //post ile gelen username kullanıcının eski username i değil ise
                //sistemde var olup olmadığı denetlenmelidir.
                if ($this->user_auth->username_check(trim($_POST['username'])) == EXIST)
                    $username_validated=false;
            }
            if ($mail_validated && $username_validated)
            {
                //güncelle
                $username = trim($_POST['username']);
                $fullname = trim($_POST['fullname']);
                $email = trim($_POST['email']);
                $enabled = isset($_POST['enabled']) && $_POST['enabled'] == 'on' ? 1 : 0;
                $user_type = trim($_POST['user_type']);
                $this->users_model->update(
                    array('username'=>$username,
                        'fullname'=>$fullname,
                        'email'=>$email,
                        'enabled'=>$enabled,
                        'user_type'=>$user_type),array('pkuser'=>$user['pkuser']));
                if ($this->db->affected_rows() == 1)
                    send_alert(array('success','User updated successfully!'));
                else
                    send_alert(array('error','An error occurred.<br>User can not be updated!'));
            }
            else
            {
                //hata
                send_alert(array('error','This email or username already exist in the system.'));
            }
        }
        else
        {
            send_alert(array('error','Please fill all required fields'));
            redirect('/users/edit/'.$user['pkuser'],'refresh');
        }
    }

    //post ile gönderilen veri kayıt edilir
    private function change_password($user)
    {
        //edit form validate et
        if ($this->change_user_password_validate())
        {
            $this->users_model->update(array('password'=>md5($_POST['password'])),array('pkuser'=>$user['pkuser']));
            send_alert(array('success','Password changed successfully'));
        }
        else
        {
            send_alert(array('error','Password should be;<br>
            - At least 4 length<br>- Max 32 length<br>- Should match re-entered password'));
        }
    }

    //toplu olarak seçilen kullanıcılar ile işlem yapmaya yarar
    public function action($type = ''){
        backend_login_check('users','edit');
        //@todo güvenlik açıklarını kapat.

        if (($type=='enable' || $type=='disable' || $type=='delete') && !empty($_POST['id_array']))
        {
            $id_array = explode(',',$_POST['id_array']);
            if (count($id_array)==0)
                send_alert(array('error','Invalid argument type.'));
            else
            {
                switch ($type):
                    case 'enable':
                        foreach ($id_array as $id)
                            $this->users_model->update(array('enabled'=>1),array('pkuser'=>$id));
                        send_alert(array('success','Seçilen kullanıcılar başarılı bir şekilde aktif hale getirilmiştir.'));
                        break;
                    case 'disable':
                        foreach ($id_array as $id)
                            $this->users_model->update(array('enabled'=>0),array('pkuser'=>$id));
                        send_alert(array('success','Seçilen kullanıcılar başarılı bir şekilde deaktif hale getirilmiştir.'));
                        break;
                    case 'delete':
                        foreach ($id_array as $id)
                            $this->users_model->delete(array('pkuser'=>$id));
                        send_alert(array('success','Seçilen kullanıcılar başarılı bir şekilde silinmiştir.'));
                        break;
                endswitch;
            }
        }
        else
        {
            send_alert(array('error','Parameter is missing.'));
        }
        redirect('/dashboard/users');
    }

    //post olarak gönderilen yeni kullanıcı ekle formunu check eder
    private function add_user_form_validate(){
        $this->form_validation->set_rules('email','Email','trim|required|min_length[6]|max_length[255]');
        $this->form_validation->set_rules('username','Username','trim|required|min_length[4]|max_length[32]');
        $this->form_validation->set_rules('password','Password','trim|required|min_length[4]|max_length[32]|matches[confirm_password]');
        $this->form_validation->set_rules('user_type','User Type','trim|required');
        return $this->form_validation->run();//belirtilen formatta ise tue değilse false döner
    }

    //post olarak gönderilen kullanıcı düzenleme formunu check eder
    private function edit_user_form_validate(){
        $this->form_validation->set_rules('email','Email','trim|required|min_length[6]|max_length[255]');
        $this->form_validation->set_rules('username','Username','trim|required|min_length[4]|max_length[32]');
        $this->form_validation->set_rules('user_type','User Type','trim|required');
        return $this->form_validation->run();//belirtilen formatta ise tue değilse false döner
    }

    //post olarak gönderilen kullanıcı şifre değiştirme formunu check eder
    private function change_user_password_validate(){
        $this->form_validation->set_rules('password','Password','trim|required|min_length[4]|max_length[32]|matches[confirm_password]');
        $this->form_validation->set_rules('confirm_password','Password','trim|required|min_length[4]|max_length[32]');
        return $this->form_validation->run();//belirtilen formatta ise tue değilse false döner
    }
}
