<?php
defined('BASEPATH') OR exit('No direct script access allowed');

if ( ! function_exists('has_error'))
{
    function has_error($field_name){
        $error = form_error($field_name,'<p class="text-danger">','</p>');
        if ($error)
            return TRUE;
        else
            return FALSE;
    }
}

if ( ! function_exists('get_error'))
{
    function get_error($field_name){
        return form_error($field_name,'<p class="text-danger">','</p>');
    }
}

if ( ! function_exists('t'))
{
    function t($text){
        $translation = lang($text);
        if (empty($translation))
            return $text;
        return $translation;
    }
}

if ( ! function_exists('send_alert'))
{
    function send_alert($message = array()){
        $ci = &get_instance();
        $ci->session->set_flashdata('message_helper',$message);
    }
}

if ( ! function_exists('get_message_helper'))
{
    //controller dan send_alert() metodu kullanılarak gönderilen mesajları view ekranında bastırmaya yarar.
    function get_message_helper(){
        $ci = &get_instance();
        //session a 'message_helper' adı ile mesaj kaydediliyor.
        //bir defa kullanılınca otomatik siliniyor
        $form_response = $ci->session->flashdata('message_helper');
        if (!empty($form_response)):
            $kind = 'info';
            $icon = 'fa-info';
            $title = t('Information');
            if ($form_response[0] == 'success'){
                $kind='success';
                $icon='fa-check';
                $title=t('Success');
            }
            elseif ($form_response[0] == 'error'){
                $kind='danger';
                $icon='fa-danger';
                $title=t('Error');
            }
            elseif ($form_response[0] == 'warning'){
                $kind='warning';
                $icon='fa-warning';
                $title=t('Warning');
            }
            ?>
            <div class="alert alert-<?php echo $kind;?> alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa <?php echo $icon;?>"></i> <?php echo $title;?>!</h4>
                <?php echo $form_response[1];?>
            </div>
        <?php endif;
    }
}

if ( ! function_exists('get_url_variable_value'))
{
    function get_url_variable_value($variable){
        $vars=explode('&',$_SERVER['QUERY_STRING']);
        if($vars){
            foreach($vars as $per){
                $pm=explode("=",$per);
                if($pm[0]==$variable){
                    return isset($pm[1]) ? $pm[1] : "";
                }
            }
        }
        return "";
    }
}

if ( ! function_exists('clear_string'))
{
    function clear_string($string,$replaceDash=false){
        $string=preg_replace("/[;]|[\\\*]/","",$string);
        $string=str_replace("'","''",$string);
        $string=($replaceDash) ? str_replace("-","\-",$string) : $string;
        return $string;
    }
}

if ( ! function_exists('is_filter_opt_selected'))
{
    function is_filter_opt_selected($filter,$opt){
        if(isset($_GET['f_key']) && isset($_GET['f_key'][$filter]) && $_GET['f_key'][$filter]==$opt){
            return 'selected';
        }
        return '';
    }
}

if ( ! function_exists('is_ordered'))
{
    function is_ordered($field){
        $qs=$_SERVER["QUERY_STRING"];
        $qrArray=[];
        $pairs=explode("&",$qs);
        foreach($pairs as $pair){
            $pr=explode("=",$pair);
            $qrArray[$pr[0]]=isset($pr[1]) ? $pr[1] : "";
        }
        if(array_key_exists("order_by",$qrArray)){
            foreach($pairs as $pair){
                $pr=explode("=",$pair);
                if($pr[0]=="order_by" && $pr[1]==$field){
                    echo $qrArray["order_dir"];
                    return true;
                }
            }
        }
        else{
            echo $field=="date" ? "desc" : "";
        }
    }
}

if ( ! function_exists('backend_login_check'))
{
    /**
     * Parametre olarak gönderilen modül ve action a ait kullanıcının yetkisinin olup olmadığını kontrol eder
     * Eğer kullanıcı login olmamış ise login sayfasına yönlendirir
     * Kullanıcı login olmuş fakat action için yetkisi yok ise default olarak Dashboard a yönlendirir.
     * @param $module
     * erişilmeye çalışılan modül
     * @param $action
     * o modüle ait action
     */
    function backend_login_check($module,$action){
        $ci = &get_instance();
        if ($ci->user_auth->is_logged())
        {
            //kullanıcı login olmuşşsa
            //o modüle erişimi var mo kontrol edilmeli
            if ($ci->user_auth->has_access($module,$action))
            {
                //erişime izin ver
                Globals::setActiveModule($module);
            }
            else
            {
                //kullanıcı giriş yapmış fakat yetkisi yok ise
                //todo 403 ekran hatası ver
                redirect('/dashboard');
                die();
            }
        }
        else
        {
            //login olmamışsa logine yönlendir
            redirect('/dashboard');
            die();
        }
    }
}

if ( ! function_exists('get_filter_params'))
{
    /**
     * @param $default_order_by
     * primary_key olmalı
     * @return array
     */
    function get_filter_params($default_order_by){
        //get filter params
        $params = array();
        $params['search_term']  =   isset($_GET['search_term']) ? clear_string($_GET['search_term']) : '';
        $params['order_by']     =   isset($_GET['order_by']) && !empty($_GET['order_by']) ? strtolower(clear_string($_GET['order_by'])) : $default_order_by;
        $params['order_dir']    =   isset($_GET['order_dir']) && !empty($_GET['order_dir']) ? strtolower(clear_string($_GET['order_dir'])) : 'desc';
        $params['limit']        =   isset($_GET['limit']) && !empty($_GET['limit']) ? (int) clear_string($_GET['limit']) : 10;
        $params['page']         =   isset($_GET['page']) && !empty($_GET['page']) ? (int) clear_string($_GET['page']) : 1;
        $params['offset']       =   ($params['page']-1)*$params['limit'];
        $filters                =   isset($_GET['f_key']) ? $_GET['f_key'] : [];
        $filter=[];
        foreach($filters as $f_key=>$f_val){
            if($f_val!=''){
                $filter[clear_string($f_key)]= clear_string($f_val);
            }
        }
        $params['filter']       =   $filter;
        return $params;
    }
}
