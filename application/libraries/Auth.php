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
            return EMAIL_EXIST;
        }
        return EMAIL_NOT_EXIST;
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
        if(array_key_exists($this->side,$_SESSION)){
            if($current-$this->read('logged_in')>SESSION_TIMEOUT){
                //timeout -- autologout
                $this->logout();
                return FALSE;
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
        $this->ci->db->where(array($this->primary_key => $this->read('user_id')))->update($this->user_table,array('last_visit'=>$current));

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
        $user = $this->ci->users_model->get(array('pkuser'=>intval($this->read('user_id'))));

        $user_type = $user->user_type;
        $this->ci->load->model('user_type_model');
        $user_type_model =  $this->ci->user_type_model->get(array('pkusertype'=>$user_type));
        $modules = json_decode($user_type_model->modules,true);

        if (array_key_exists($module,$modules)){
            if (!empty($action)){
                if(in_array($action,$modules[$module])){
                    return true;
                }
                return false;
            }
            return true;
        }
        return false;
    }

}
