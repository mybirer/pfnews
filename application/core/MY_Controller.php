<?php
    class MY_Controller extends MX_Controller{
        function __construct(){
            parent::__construct();

            $this->load->library('auth',array('pf_users','pkuser'),'user_auth');
            $this->load->library('auth',array('pf_subscribers','pksubscriber'),'subscriber_auth');

            //default olarak ön arayüz yükleniyor.
            //kullanıcı private alana erişmek için erişim kontrolü yaptığı zaman
            //eğer erişim hakkı var ise otomatik private arayüz seçilecek.
            $this->template->set_layout('frontend_layout');
            $this->template->set_partial('footer', 'partials/footer');
            $this->template->set_partial('header', 'partials/header');

        }
    }

?>
