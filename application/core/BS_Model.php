<?php
    class BS_Model extends CI_Model{
        protected $table_name;

        public function __construct($table_name)
        {
            parent::__construct();
            $this->table_name=$table_name;
        }

        public function select($columns = array(), $where = array())
        {
            $query = '';
            foreach ($columns as $column)
                $query = $query.$column;

            return $this->ci->db
                        ->select($query)
                        ->where($where)
                        ->get($this->user_table)
                        ->result();
        }

        public function get($where = array()){
            $result = $this->db
                ->where($where)
                ->get($this->table_name)
                ->row();
            return $result;
        }

        public function get_all($where = array()){
            //pagination için ayarlandı
            $limit = 0;
            $offset = 0;

            if (array_key_exists('limit',$where)){
                $limit=$where['limit'];
                unset($where['limit']);//@todo fix me Muhammed Yasin. Is this a logic design??
            }
            if (array_key_exists('offset',$where)){
                $offset=$where['offset'];
                unset($where['offset']);//@todo fix me Muhammed Yasin. Is this a logic design??
            }

            $result = null;

            //I am using here that where array,
            // so limit and offset keys will not be match with any field in db
            // thus I unset that elements
            if ($limit>0)//limit tanımlanmış ise limit ve offsete göre çekiyor
                $result = $this->db->where($where)->limit($limit,$offset)->get($this->table_name)->result();
            else//tanımlanmamış ise offsete GEREK YOĞĞ.
                $result = $this->db->where($where)->get($this->table_name)->result();

            return $result;
        }

        public function get_total($where = array()){
            $result = $this->db
                ->where($where)
                ->count_all_results($this->table_name);
            return $result;
        }
        
        public function delete($where = array()){
            $result = $this->db
                ->where($where)
                ->delete($this->table_name);
            return $result;
        }
        
        public function insert($data = array()){
            $result = $this->db
                ->insert($this->table_name, $data);
            return $result;
        }
        
        public  function update($data = array(), $where = array()){
            $result = $this->db
                ->where($where)
                ->update($this->table_name, $data);
            return $result;
        }
        
        public function query($query){
            $result = $this->db
                ->query($query)
                ->result();
            return $result;
        }
        
        public function get_last_id(){
            return $this->db->insert_id();
        }

    }
?>
