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

if ( ! function_exists('print_error'))
{
    function ger_error($field_name){
        return form_error($field_name,'<p class="text-danger">','</p>');
    }
}

if ( ! function_exists('send_message'))
{
    function send_message($message_id,$message = array()){
        $ci = &get_instance();
        $ci->session->set_flashdata($message_id,$message);
    }
}

if ( ! function_exists('get_message'))
{
    function get_message($message_id){
        $ci = &get_instance();
        return $ci->session->flashdata($message_id);
    }
}

if ( ! function_exists('has_message'))
{
    function has_message($message_id){
        $ci = &get_instance();
        return !empty($ci->session->flashdata($message_id));
    }
}

if ( ! function_exists('is_post_request'))
{
    function is_post_request(){
        if ($_SERVER['REQUEST_METHOD'] == 'POST')
            return true;
        return false;
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