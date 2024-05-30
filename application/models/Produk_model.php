<?php
    
    defined('BASEPATH') OR exit('No direct script access allowed');
    
    class Produk_model extends CI_Model {

            public function get_produk() {
                $query = $this->db->get('produk');
                return $query->result();
            }
        }
        