<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * User table
 *
 * This table should contain the username and password fields specified below. It can contain any other fields, such as "first_name"
 */
$config['authentication_s']['user_table'] = 'pf_subscribers';
/**
 * User identifier field
 *
 * This field will usually be "id" or "user_id" but you could use something like "username"
 */
$config['authentication_s']['identifier_field'] = 'pksubscriber';
/**
 * Username field
 *
 * This field can be named what ever you like, an example would be "email"
 */
$config['authentication_s']['username_field'] = 'email';
/**
 * Password field
 */
$config['authentication_s']['password_field'] = 'password';
/* End of file authentication_s.php */
/* Location: ./application/config/authentication_s.php */