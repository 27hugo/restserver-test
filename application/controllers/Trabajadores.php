<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH . '/libraries/REST_Controller.php';


class Trabajadores extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('trabajadores_model');
    }

    public function index_get()
    {
        $trabajadores = $this->trabajadores_model->get();

        if (!is_null($trabajadores)) {
            $this->response($trabajadores, REST_Controller::HTTP_OK); 

        } else {
            $this->response(array('error' => 'No hay ciudades en la base de datos...'), 404);
        }
    }
    public function find_get($id){
	if(!$id){
		$this->response(null,400);
	}
	$trabajador = $this->trabajadores_model->get($id);
	if(!is_null($trabajador)){
		$this->response(array('response' => $trabajador) , 200);
	}else{
		$this->response(array('error' => 'trabajador no encontrada...'),404);
	}
    }

    public function create_post(){
	$trabajador = array ('tra_nombre' => $this->post('tra_nombre'));
	if (!$this->post('tra_nombre')) {
		$this->response ( null , 400) ;
	}else{
		$status = $this-> trabajadores_model->save( $trabajador );
		if ( $status == null ) {
			$this->response ( array ('response' => 'Sin crear') , 400) ;
		}
		$this->response( array('response' => ' Ciudad Creada') , 200) ;
   	}
    }

    public function update_put (){
	$city = array ('id' => $this->put('id') ,'tra_nombre' => $this->put('tra_nombre')) ;
	if (!$this->put('id')) {
		$this->response(null,400);
	}else{
		$status = $this->cities_model->update($city);
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
		$status = $this->trabajadores_model->delete( $id ) ;
		if (!is_null($status)){
			$this->response( array( 'response' => 'Ciudad eliminada!') , 200) ;
		} else {
			$this->response( array( 'error' , 'Ciudad no eliminada') , 400);
		}
	}

}
