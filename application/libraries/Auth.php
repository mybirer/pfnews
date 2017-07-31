<?php defined('BASEPATH') OR exit('No direct script access allowed');


class Auth {

    private $ci;

    private $user_table;
    private $primary_key;
    private $side;
    private $log;

    function __construct($params = array())
    {
        $this->user_table  = $params[0];
        $this->primary_key = $params[1];

        $this->side = $this->user_table=='pf_users' ? 'backend_session' : 'frontend_session';

        $this->ci =& get_instance();
        $this->ci->load->database();
        $this->ci->load->library('session');
        $this->log = $this->ci->logs_model;
    }

    public function email_check($email)
    {
        $query = $this->ci->db->where('email', $email)->get($this->user_table);
        
        if ($query->num_rows() > 0)
        {
            return EXIST;
        }
        return NOT_EXIST;
    }

    public function username_check($username)
    {
        $query = $this->ci->db->where('username', $username)->get($this->user_table);

        if ($query->num_rows() > 0)
        {
            return EXIST;
        }
        return NOT_EXIST;
    }

    // gerçek login değildir.
    // bu metod ile kullanıcı Controller tarafından giriş yapmaya çalışacak
    // Eğer true dönerse bilgiler doğrudur ve kullanıcı engellenmiş mi onu kontrol etmeliyiz
    // Bu kontrol, Controller tarafında yapılıyor. Engellenmemiş ise login() metodu çağırılıyor.
    //  attempt_login() ile login() arasındaki tek fark attempt_login() sadece check eder
    //  login() ise check ettikten sonra session a kayıt yapar.
    public function attempt_login($email, $password)
    {
        $user = $this->ci->db
            ->select($this->primary_key.' as user_id')
            ->where(array('email'=>$email,'password'=>md5($password)))
            ->get($this->user_table);

        if ($user->num_rows() == 0)
        {
            return FALSE;
        }
        return TRUE;
    }

    public function login($email, $password)
    {
        $user = $this->ci->db
            ->select($this->primary_key.' as user_id')
            ->where(array('email'=>$email,'password'=>md5($password)))
            ->get($this->user_table);

        if ($user->num_rows() == 0)
        {
            //login başarılı değil

            if ($this->side == 'backend_session')
                $this->log->log('warning','auth','Login failed '.$email);
            return FALSE;
        }

        $user_details = $user->row_array();
        $ses_data = array($this->side => array(
            'user_id' => $user_details['user_id'],
            'logged_in' => time(),
            'last_visit' => time()
        ));

        $this->ci->session->set_userdata($ses_data);

        //başarıyla giriş yapıldı
        if ($this->side == 'backend_session')
            $this->log->log('info','auth','Login success '.$email);
        return TRUE;
    }

    public function is_logged()
    {
        $current = time();
        if(array_key_exists($this->side,$_SESSION))
        {
            if($current-$this->read('last_visit')>SESSION_TIMEOUT)
            {
                //timeout -- autologout
                $this->logout();
                return FALSE;
            }
            else
            {
                //timeout ile logout olmaz ise kullanıcı engellenmiş mi bakılması lazım
                //kullanıcı db den çekiliyor
                $user = $this->ci->db->where(array($this->primary_key => $this->read('user_id')))
                    ->get($this->user_table)->row_array();
                if ($this->side == 'backend_session' && $user['enabled'] != '1')
                {
                    //kullanıcı private alanda ise (yani user ise)
                    $this->logout();
                    return false;
                }
                elseif ($this->side == 'frontend_session' && $user['banned'] == '1')
                {
                    //kullanıcı public alanda ise (yani subscriber ise)
                    $this->logout();
                    return false;
                }
            }
            $this->update_session();
            return TRUE;
        }
        return FALSE;
    }

    private function update_session()
    {
        $current = time();
        $_SESSION[$this->side]['last_visit']=$current;
        $this->ci->db->where(array($this->primary_key => $this->read('user_id')))
            ->update($this->user_table,array('last_visit'=>date('Y-m-d H:i:s',$current)));
    }

    public function read($key)
    {
        return array_key_exists($key,$_SESSION[$this->side]) ? $_SESSION[$this->side][$key] : '';
    }

    public function logout()
    {
        $this->ci->session->unset_userdata($this->side);
        return TRUE;
    }

    public function has_access($module, $action='')
    {
        $user = $this->ci->users_model->get_with_modules(array('pkuser'=>intval($this->read('user_id'))));

        if (array_key_exists($module,$user->modules)){
            if (!empty($action)){
                if(in_array($action,$user->modules[$module])){
                    return true;
                }
                return false;
            }
            return true;
        }
        return false;
    }

}
