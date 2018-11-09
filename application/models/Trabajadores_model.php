<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Trabajadores_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }
    public function get($id = null)
    {
        if (!is_null($id)) {
            $query = $this->db->select('*')->from('trabajadores')->where('tra_id', $id)->get();
            if ($query->num_rows() === 1) {
                return $query->row_array();
            }

            return null;
        }

        $query = $this->db->select('*')->from('trabajadores')->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }

        return null;
    }


	public function save ( $trabajador ){
		$this->db->insert('trabajadores', $trabajador ) ;
		if($this->db->affected_rows() === 1) {
			return true;
		}
		return null;
	}

	public function update ( $trabajador ){
		$this->db->replace('trabajadores' , $trabajador ) ;
		if($this->db->affected_rows() === 2){
		return true;
		}
		return null;
	}

	public function delete ( $id ){
		$this->db->where('tra_id',$id)->delete('trabajadores');
		if($this->db->affected_rows() > 0){
			return true;
		}
		return null;
	}

}
