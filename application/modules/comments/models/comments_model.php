<?php

/**
 * Created by PhpStorm.
 * User: ERDEN
 * Date: 14.07.2017
 * Time: 15:48
 */
class comments_model extends BS_Model
{
    /**
     * @var int
     * beklemede
     */
    public static $MODERATED = 1;
    /**
     * @var int
     * onaylanmış
     */
    public static $APPROVED = 2;
    /**
     * @var int
     * çöp
     */
    public static $TRASH = 3;

    public function __construct()
    {
        parent::__construct('pf_comments');
    }

    public function search($term = ''){
        $result = $this->db
            ->like('name', $term)
            ->or_like('email', $term)
            ->or_like('username', $term)
            ->get($this->table_name)
            ->result();
        return $result;
    }
}

?>