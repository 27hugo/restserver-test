<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH . '/libraries/REST_Controller.php';


class Empresas extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('empresas_model');
    }

    public function index_get()
    {
        $empresas = $this->empresas_model->get();

        if (!is_null($empresas)) {
            $this->response($empresas, REST_Controller::HTTP_OK); 

        } else {
            $this->response(array('error' => 'No hay ciudades en la base de datos...'), 404);
        }
    }
    public function find_get($id){
	if(!$id){
		$this->response(null,400);
	}
	$empresa = $this->empresas_model->get($id);
	if(!is_null($empresa)){
		$this->response(array('response' => $empresa) , 200);
	}else{
		$this->response(array('error' => 'Empresa no encontrada...'),404);
	}
    }

    public function create_post(){
	$empresa = array (
		'emp_nombre' => $this->post('emp_nombre'),
		'emp_cantidad_tra' => $this->post('emp_cantidad_tra')
	);
	if (!$this->post('emp_nombre')) {
		$this->response ( null , 400) ;
	}else{
		$status = $this-> empresas_model->save( $empresa );
		if ( $status == null ) {
			$this->response ( array ('response' => 'Sin crear') , 400) ;
		}
		$this->response( array('response' => ' Ciudad Creada') , 200) ;
   	}
    }

    public function update_put (){
	$empresa = array (
		'emp_id' => $this->put('emp_id') ,
		'emp_nombre' => $this->put('emp_nombre'),
		'emp_cantidad_tra' => $this->put('emp_cantidad_tra')
	);
	if (!$this->put('emp_id')) {
		$this->response(null,400);
	}else{
		$status = $this->empresas_model->update($empresa);
		if ( is_null ( $status ) ) {
		$this->response( array ( 'response' => 'Sin actualizar') , 400) ;
	}
	$this->response ( array ('response' => 'Ciudad actualizada! ') , 200) ;
	}
   }

	public function delete_delete ($id){
		if(!$id){
			$this->response(null,400);
		}
		$status = $this->empresas_model->delete( $id ) ;
		if (!is_null($status)){
			$this->response( array( 'response' => 'Ciudad eliminada!') , 200) ;
		} else {
			$this->response( array( 'error' , 'Ciudad no eliminada') , 400);
		}
	}

}
