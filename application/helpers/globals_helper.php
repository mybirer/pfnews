<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: MyBirer
 * Date: 19.07.2017
 * Time: 14:27
 */

class Globals
{
    private static $currentUser = null;
    private static $modules = [];
    private static $active_module = 'dashboard';
    private static $initialized = false;

    public static function setCurrentUser($userObj)
    {
        self::$currentUser = $userObj;
    }

    public static function currentUser()
    {
        return self::$currentUser;
    }

    public static function setModules($obj)
    {
        self::$modules = $obj;
    }

    public static function modules()
    {
        return self::$modules;
    }

    public static function setActiveModule($obj)
    {
        self::$active_module = $obj;
    }

    public static function activeModule()
    {
        return self::$active_module;
    }
}