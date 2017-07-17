<?php defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Authentication Class
 *
 * Very basic user authentication for CodeIgniter.
 *
 * @package		Authentication
 * @version		1.0
 * @author		Joel Vardy <info@joelvardy.com>
 * @link		https://github.com/joelvardy/Basic-CodeIgniter-Authentication
 */
class Authu {
    /**
     * CodeIgniter
     *
     * @access	private
     */
    private $ci;
    /**
     * Config items
     *
     * @access	private
     */
    private $user_table;
    private $identifier_field;
    private $email_field;
    private $password_field;
    private $session_fields;
    private $user_view_levels;
    private $view_levels;

    /**
     * Constructor
     */
    function __construct()
    {
        // Assign CodeIgniter object to $this->ci
        $this->ci =& get_instance();
        // Load config
        $this->ci->config->load('authentication_u');
        $authentication_config = $this->ci->config->item('authentication_u');
        // Set config items
        $this->user_table = $authentication_config['user_table'];
        $this->identifier_field = $authentication_config['identifier_field'];
        $this->email_field = $authentication_config['email_field'];
        $this->password_field = $authentication_config['password_field'];
        $this->session_fields = $authentication_config['session_fields'];
        // Load database
        $this->ci->load->database();
        // Load libraries
        $this->ci->load->library('session');
    }
    /**
     * Check whether the email is unique
     *
     * @access	public
     * @param	string [$username] The username to query
     * @return	boolean
     */
    public function email_check($email)
    {
        // Read users where email matches
        $query = $this->ci->db->where($this->email_field, $email)->get($this->user_table);
        // If there are users
        if ($query->num_rows() > 0)
        {
            // Email is not available
            return EMAIL_NOT_AVAILABLE;
        }
        // No users were found
        return EMAIL_AVAILABLE;
    }
    /**
     * Generate a salt
     *
     * @access	protected
     * @param	integer [$cost] The strength of the resulting hash, must be within the range 04-31
     * @return	string The generated salt
     */
    protected function generate_salt($cost = 16)
    {
        // We are using blowfish, so this must be set at the beginning of the salt
        $salt = '$2a$'.$cost.'$';
        // Generate a random string based on time
        $salt .= substr(str_replace('+', '.', base64_encode(sha1(microtime(TRUE), TRUE))), 0, 22);
        // Return salt
        return $salt.'$';
    }
    /**
     * Generate a hash
     *
     * @access	protected
     * @param	string [$password] The password for which the hash should be generated for
     * @param	string [$salt] The salt can either be the one returned from the generate_salt method or the current password
     * @return	string The generated hash
     */
    protected function generate_hash($password, $salt)
    {
        // Hash the generated details with a salt to form a secure password hash
        return crypt($password, $salt);
    }
    /**
     * Create user
     *
     * @access	public
     * @param	string [$email] The email of the user to be created
     * @param	string [$password] The users password
     * @return	integer|boolean Either the user ID or FALSEupon failure
     */
    public function create_user($email, $password)
    {
        // Ensure email is available
        if ( ! $this->email_check($email))
        {
            // Email is not available
            return FALSE;
        }
        // Generate salt
        $salt = $this->generate_salt();
        // Generate hash
        $password = $this->generate_hash($password, $salt);
        // Define data to insert
        $data = array(
            $this->email_field => $email,
            $this->password_field => $password
        );
        // If inserting data fails
        if ( ! $this->ci->db->insert($this->user_table, $data))
        {
            // Return false
            return FALSE;
        }
        // Return user ID
        return (int) $this->ci->db->insert_id();
    }
    /**
     * Login
     *
     * @access	public
     * @param	string [$email] The email of the user to authenticate
     * @param	string [$password] The password to authenticate
     * @return	boolean Either TRUE or FALSE depending upon successful login
     */
    public function login($email, $password)
    {
        $query = $this->identifier_field.' as identifier, '.$this->email_field.' as email, '.$this->password_field.' as password';

        foreach (array_keys($this->session_fields) as $db_key)
            $query = $query.', '.$db_key;

        // Select user details
        $user = $this->ci->db
            ->select($query)
            ->where($this->email_field, $email)
            ->get($this->user_table);
        // Ensure there is a user with that username
        if ($user->num_rows() == 0)
        {
            // There is no user with that username, but we won't tell the user that
            return FALSE;
        }
        // Set the user details
        $user_details = $user->row_array();
        // Do passwords match
        if ($this->generate_hash($password, $user_details['password']) == $user_details['password'])
        {
            // Yes, the passwords match
            // Set the userdata for the current user
            $ses_data = array(
                'user_id' => $user_details['identifier'],
                'email' => $user_details['email'],
                'logged_in' => $_SERVER['REQUEST_TIME'],
                'last_visit' => time()
            );

            foreach ($this->session_fields as $db_name => &$ses_name)
            {
                $ses_data[$ses_name] = $user_details[$db_name];
            }
            $this->ci->session->set_userdata($ses_data);
            return TRUE;
            // The passwords don't match
        } else {
            // The passwords don't match, but we won't tell the user that
            return FALSE;
        }
    }
    /**
     * Check whether a user is logged in
     *
     * @access	public
     * @return	boolean TRUE for a logged in user otherwise FALSE
     */
    public function is_loggedin()
    {
        $current = time();
        if ($current-$this->read('last_visit')>SESSION_TIMEOUT){
            $this->logout();
            return FALSE;
        }
        $this->ci->session->set_userdata('last_visit',$current);
        return TRUE;
    }
    /**
     * Read user details
     *
     * @access	public
     * @return	mixed or FALSE
     */
    public function read($key)
    {
        return $this->ci->session->userdata($key);
    }
    /**
     * Change password
     *
     * @access	public
     * @param	string [$password] The new password
     * @param	string [$user_identifier] The identifier of the user whos password will be changed, if none is set the current users password will be changed
     * @return	boolean Either TRUE or FALSE depending upon successful login
     */
    public function change_password($password, $user_identifier = null)
    {
        // If no user identifier has been set
        if ( ! $user_identifier)
        {
            // Ensure the current user is logged in
            if ($this->is_loggedin())
            {
                // Read the user identifier
                $user_identifier = $this->ci->session->userdata('user_id');
                // There is no current logged in user
            } else {
                return FALSE;
            }
        }
        // Generate salt
        $salt = $this->generate_salt();
        // Generate hash
        $password = $this->generate_hash($password, $salt);
        // Define data to update
        $data = array(
            $this->password_field => $password
        );
        // Update the users password
        if ($this->ci->db->where($this->identifier_field, $user_identifier)->update($this->user_table, $data))
        {
            return TRUE;
            // There was an error updating the user
        } else {
            return FALSE;
        }
    }
    /**
     * Log a user out
     *
     * @access	public
     * @return	boolean Will always return TRUE
     */
    public function logout()
    {
        // Remove userdata
        $this->ci->session->unset_userdata('user_id');
        $this->ci->session->unset_userdata('email');
        $this->ci->session->unset_userdata('logged_in');
        $this->ci->session->unset_userdata('last_visit');
        foreach (array_values($this->session_fields) as $ses_name)
            $this->ci->session->unset_userdata($ses_name);
        // Return true
        return TRUE;
    }
    /**
     * Delete user account
     *
     * @access	public
     * @param	string [$user_identifier] The identifier of the user to delete
     * @return	boolean Either TRUE or FALSE depending upon successful login
     */
    public function delete_user($user_identifier)
    {
        // Update the users password
        if ($this->ci->db->where($this->identifier_field, $user_identifier)->delete($this->user_table))
        {
            return TRUE;
            // There was an error deleting the user
        } else {
            return FALSE;
        }
    }

    public function has_access($module, $action)
    {
        if(!isset($user_view_levels))
            $user_view_levels = $this->ci->musers->select('view_levels',array('pkuser' => $this->read('user_id')));
        if (empty($user_view_levels))
            return FALSE;
        $this->ci->load->model('viewlevels_model','mviewlevels');

        if(!isset($view_levels)){
            $view_levels_list = $this->ci->mviewlevels->where_in('pkviewlevels',$user_view_levels[0]->view_levels);

        }


    }

}
/* End of file Authu.php */
/* Location: ./application/libraries/Authu.php */