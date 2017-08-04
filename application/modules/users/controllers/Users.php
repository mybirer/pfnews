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
        $data = array();
        //submit var ise
        if ($this->add_user_form_validate())
        {
            //form validation başarılı

            $data_set = array();
            $data_set['username'] = trim($_POST['username']);
            $data_set['fullname'] = trim($_POST['fullname']);
            $data_set['password'] = md5($_POST['password']);
            $data_set['email'] = trim($_POST['email']);
            $data_set['enabled'] = trim($_POST['enabled']) == 'on' ? 1 : 0;
            $data_set['user_type'] = trim($_POST['user_type']);

            if ($this->users_model->insert($data_set))
            {
                send_alert(array('success','User created successfully!'));
                redirect(base_url('/users/edit/'.$this->users_model->get_last_id()));
            }
            else
            {
                send_alert(array('error','An error occurred.<br>User can not be created!'));
            }
        }

        $this->template->title('Printf News - Users');
        $data['user_types']= $this->users_model->get_user_types();
        $this->template->build('user_add',$data);
    }

    public function edit($id = 0)
    {
        backend_login_check('users','edit');
        $user = $this->users_model->get(array('pkuser'=>$id));
        if (!empty($user))//kullanıcı sistemde mevcut ise
        {
            //post request var ise ya kullanıcı edit yapılmıştır
            //========================   Edit User   =========================================
            if (isset($_POST['save']) && $this->edit_user_form_validate($user['pkuser']))
            {
                $username = trim($_POST['username']);
                $fullname = trim($_POST['fullname']);
                $email = trim($_POST['email']);
                $enabled = isset($_POST['enabled']) && $_POST['enabled'] == 'on' ? 1 : 0;
                $user_type = trim($_POST['user_type']);

                //güncelle
                $this->users_model->update(
                    array('username'=>$username,
                        'fullname'=>$fullname,
                        'email'=>$email,
                        'enabled'=>$enabled,
                        'user_type'=>$user_type),array('pkuser'=>$user['pkuser']));
                $this->logs_model->log('info','users','User edited successfully: '.$username);
                send_alert(array('success','User updated successfully!'));
                //formda hiçbir veri değiştirilmeden save tuşuna basıldığı zaman aşağıdaki
                //if e değil de else bloğuna girip hata veriyor.
//                if ($this->db->affected_rows() == 1)
//                {
//                    $this->logs_model->log('info','users','User edited successfully: '.$username);
//                    send_alert(array('success','User updated successfully!'));
//                }
//                else
//                {
//                    $this->logs_model->log('info','users','An error occurred while updating user: '.$username);
//                    send_alert(array('error','An error occurred.<br>User can not be updated!'));
//                }
                redirect(current_url(),'refresh');
            }
            //ya da password change yapılmıştır.
            //========================   Password Change   =========================================
            elseif (isset($_POST['change']) && $this->change_user_password_validate())
            {
                $this->users_model->update(array('password'=>md5($_POST['password'])),array('pkuser'=>$user['pkuser']));
                $this->logs_model->log('info','users','Change password: '.$user['username']);
                send_alert(array('success','Password changed successfully'));
                redirect(current_url(),'refresh');
            }
            else
            {
                // burayı else bloğundan çıkarsak aynen çalışacaktır fakat edit yapıldıktan sonra
                // sayfa yenilenmek istediğinde 'confirm form resubmition' uyarısı veriyor ve alert
                // sayfa yenilense bile 2. defa görüntüleniyor. Bu şekilde sıkıntı olmuyor.
                $data = array();
                $data['user'] = $this->users_model->get(array('pkuser'=>$id));
                //ekranı yükle
                $data['user_types']= $this->users_model->get_user_types();
                $this->template->build('user_edit',$data);
            }
        }
        else
        {
            //böyle bir kullanıcı yok
            send_alert(array('error','The user you have try to edit is not found!'));
            redirect(base_url('/dashboard/users'));
        }
    }

    public function enable($id = 0)
    {
        backend_login_check('users','edit');
        $id_array = array();
        //liste gönderilmiş ise
        if (isset($_POST['id_array']))
            $id_array = explode(',',$_POST['id_array']);
        elseif ($id > 0)
            array_push($id_array,$id);
        foreach ($id_array as $id_element)
            $this->users_model->update(array('enabled'=>1),array('pkuser'=>$id_element));
        $this->logs_model->log('info','users','Users has been enabled: '.implode(',',$id_array));
        send_alert(array('success','Seçilen kullanıcılar başarılı bir şekilde aktif hale getirilmiştir.'));
        redirect(base_url('/dashboard/users'));
    }

    public function disable($id = 0)
    {
        backend_login_check('users','edit');
        $id_array = array();
        //liste gönderilmiş ise
        if (isset($_POST['id_array']))
            $id_array = explode(',',$_POST['id_array']);
        elseif ($id > 0)
            array_push($id_array,$id);
        foreach ($id_array as $id_element)
            $this->users_model->update(array('enabled'=>0),array('pkuser'=>$id_element));
        $this->logs_model->log('info','users','Users has been disabled: '.implode(',',$id_array));
        send_alert(array('success','Seçilen kullanıcılar başarılı bir şekilde deaktif hale getirilmiştir.'));
        redirect(base_url('/dashboard/users'));
    }

    public function delete($id = 0)
    {
        backend_login_check('users','remove');
        $id_array = array();
        //liste gönderilmiş ise
        if (isset($_POST['id_array']))
            $id_array = explode(',',$_POST['id_array']);
        elseif ($id > 0)
            array_push($id_array,$id);
        foreach ($id_array as $id_element)
            $this->users_model->delete(array('pkuser'=>$id_element));
        $this->logs_model->log('info','users','Users has been deleted: '.implode(',',$id_array));
        send_alert(array('success','Seçilen kullanıcılar başarılı bir şekilde silinmiştir.'));
        redirect(base_url('/dashboard/users'));
    }

    private function upload_profile_picture()
    {
        $result = array();
        $config['upload_path'] = './uploads/';
        $config['allowed_types'] = 'gif|jpg|png';
        $config['remove_spaces'] = true;
        $config['detect_mime'] = true;//önemli. shell injection a karşı güvenlik önlemi alıyor
        $this->load->library('upload', $config);
//                        max_size
//                        max_width
//                        max_height
//                        min_width
//                        min_height
//                        max_filename
//                        max_filename_increment
//                        encrypt_name

        if ($this->upload->do_upload('profile_picture'))
        {
            $result['success'] = true;
            $result['response'] = $this->upload->data();
        }
        else
        {
            $result['success'] = false;
            $result['response'] = $this->upload->display_errors('','');
        }

        return $result;
    }

    //post olarak gönderilen yeni kullanıcı ekle formunu check eder
    private function add_user_form_validate(){
        $this->form_validation->set_rules('email','Email',
            array('trim','required','valid_email','min_length[6]','max_length[255]',//->> Rules
                array('email_validate',array($this->users_model,'email_validate'))),//->> Rules
            array('email_validate'=>'This email already exist in the system')//->>error messages
        );
        $this->form_validation->set_rules('username','Username',
            array('trim','required','min_length[4]','max_length[32]',//->> Rules
                array('username_validate',array($this->users_model,'username_validate'))),//->> Rules
            array('username_validate'=>'This username already exist in the system')//->>error messages
        );
        $this->form_validation->set_rules('password','Password','required|min_length[4]|max_length[32]|matches[confirm_password]');
        $this->form_validation->set_rules('confirm_password','Password','required|min_length[4]|max_length[32]');
        $this->form_validation->set_rules('user_type','User Type','trim|required');

        return $this->form_validation->run($this);
    }

    //post olarak gönderilen kullanıcı düzenleme formunu check eder
    private function edit_user_form_validate($user_id){
        global $edit_user_id; // users model içerisindeki edit form validation metodundan erişiliyor.
        $edit_user_id = $user_id;
        $this->form_validation->set_rules('email','Email',
            array('trim','required','valid_email','min_length[6]','max_length[255]',//->> Rules
                array('edit_email_validate',array($this->users_model,'edit_email_validate'))),//->> Rules
            array('edit_email_validate'=>'This email already exist in the system')//->>error messages
            );
        $this->form_validation->set_rules('username','Username',
            array('trim','required','min_length[4]','max_length[32]',//->> Rules
                array('edit_username_validate',array($this->users_model,'edit_username_validate'))),//->> Rules
            array('edit_username_validate'=>'This username already exist in the system')//->>error messages
        );
        $this->form_validation->set_rules('user_type','User Type','trim|required');

        return $this->form_validation->run($this);
    }

    //post olarak gönderilen kullanıcı şifre değiştirme formunu check eder
    private function change_user_password_validate(){
        $this->form_validation->set_rules('password','Password','required|min_length[4]|max_length[32]|matches[confirm_password]');
        $this->form_validation->set_rules('confirm_password','Password','required|min_length[4]|max_length[32]');
        return $this->form_validation->run();//belirtilen formatta ise tue değilse false döner
    }
}
