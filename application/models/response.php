<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Model class'ından return edilmesi gereken temel class.
 * Response::create() ile bir response objesi oluşturuluyor.
 * Bu response objesinin addError($title,$message) addWarning 
 * gibi metodları bulunmaktadır.
 *
 * Örnek Kullanım: 
 *
 *   Response::create()
 *  .setSuccess(true)
 *   .setWarning('Uyarı','şifrenizi yenileyiniz')
 *   .setResponse($result);
 */
class Response
{
    public $success = false;
    public $errors = array();
    public $warnings = array();
    public $response;

    public function setSuccess($success){
        $this->success = $success;
        return $this;
    }

    public function addError($title,$message){
        $this->errors[]=new Error($title,$message);
        return $this;
    } 

    public function addWarning($title,$message){
        $this->warnings[]=new Warning($title,$message);
        return $this;
    }

    public function setResponse($response){
        $this->response = $response;
        return $this;
    }


    /**
    * Response objesi oluşturur.
    */
    public static function create(){
        return new Response;
    }
}
class Error
{
    public $title;
    public $message;

    function Error($title,$message){
        $this->title = $title;
        $this->message = $message;
    }

}
class Warning
{
    public $title;
    public $message;

    function __construct($title,$message){
        $this->title = $title;
        $this->message = $message;
    }
}
?>