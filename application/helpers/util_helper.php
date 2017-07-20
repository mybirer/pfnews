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

<<<<<<< HEAD
if ( ! function_exists('t'))
{
    function t($text){
        $translation = lang($text);
        if (empty($translation))
            return $text;
        return $translation;
    }
}
=======
if ( ! function_exists('is_route_active'))
{
    function is_route_active($route,$uri){

        var_dump($uri);
        die();
    }
}
>>>>>>> origin/master
