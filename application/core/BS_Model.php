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
                ->row_array();
            return $result;
        }

        public function get_all($where = array()){
            $result = $this->db
                ->where($where)
                ->get($this->table_name)
                ->result();

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


        //sayfa görüntülemesini 1 arttırır
        //kullandığın tabloda view field ı var mı yok mu check etmen gerek
        public function increment_view($where)
        {
            //https://stackoverflow.com/a/6447291/4133449
            $this->db->where($where);
            $this->db->set('view', 'view+1', FALSE);
            $this->db->update($this->table_name);
        }

    }
?>
