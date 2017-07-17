<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * User table
 *
 * This table should contain the username and password fields specified below. It can contain any other fields, such as "first_name"
 */
$config['authentication_u']['user_table'] = 'pf_users';
/**
 * User identifier field
 *
 * This field will usually be "id" or "user_id" but you could use something like "username"
 */
$config['authentication_u']['identifier_field'] = 'pkuser';
/**
 * Username field
 *
 * This field can be named what ever you like, an example would be "email"
 */
$config['authentication_u']['email_field'] = 'email';
/**
 * Password field
 */
$config['authentication_u']['password_field'] = 'password';
/**
 * Fields to store in Session
 *
 * As default, identifier, email and Request Time (logged_in) field will be stored in session
 *
 * Example usage: 'field_name' => 'variable_name'
 *
 * array=('username' => 'user_name');
 *
 * At the above exaple, the 'username' field which in the database will be stored as 'user_name'
 */
$config['authentication_u']['session_fields'] = array('fullname' => 'fullname');
/* End of file authentication_u.php */
/* Location: ./application/config/authentication_u.php */