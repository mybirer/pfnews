<?php
    class BE_Controller extends MX_Controller{
        function __construct(){
            parent::__construct();

            $this->load->model('users/users_model');
            $this->load->library('auth',array('pf_users','pkuser'));

            //javascript ve css dosyalarını include ediyor
            if ($this->auth->is_logged('be'))
            {
                //back end login oldu
                $this->template->set_layout('backend_layout');
                $this->template->set_partial('footer', 'partials/private_footer');
                $this->template->set_partial('header', 'partials/private_header');
                $this->template->set_partial('sidebar', 'partials/private_sidebar');
                //@todo Controller a erişim var mı check et
            }
            else{
                //be erişim yok
                //@todo login ekrarnına git.
                //modules::run('login/admin');
                redirect('/login/admin');
                //die();
                //die() kullanmamızın sebebi, else scope undan ayrılınca BE_Controller child objesinin construct ını engellemektir.
            }
        }
    }

?>
