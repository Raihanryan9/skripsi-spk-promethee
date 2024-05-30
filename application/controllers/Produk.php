<?php
    
    defined('BASEPATH') OR exit('No direct script access allowed');
    
    class Produk extends CI_Controller {
        public function index() {
            $data['page'] = 'Produk'; 
            $this->load->model('Produk_model'); 
            $data['produk'] = $this->Produk_model->get_produk();
            $this->load->view('Produk/index', $data);
        }
    }