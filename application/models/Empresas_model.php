<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Empresas_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }
    public function get($id = null)
    {
        if (!is_null($id)) {
            $query = $this->db->select('*')->from('empresas')->where('emp_id', $id)->get();
            if ($query->num_rows() === 1) {
                return $query->row_array();
            }

            return null;
        }

        $query = $this->db->select('*')->from('empresas')->get();
        if ($query->num_rows() > 0) {
            return $query->result_array();
        }

        return null;
    }


	public function save ( $empresa ){
		$this->db->insert('empresas', $empresa ) ;
		if($this->db->affected_rows() === 1) {
			return true;
		}
		return null;
	}

	public function update ( $empresa ){
		$this->db->replace('empresas' , $empresa ) ;
		if($this->db->affected_rows() === 2){
		return true;
		}
		return null;
	}

	public function delete ( $id ){
		$this->db->where('emp_id',$id)->delete('empresas');
		if($this->db->affected_rows() > 0){
			return true;
		}
		return null;
	}

}
