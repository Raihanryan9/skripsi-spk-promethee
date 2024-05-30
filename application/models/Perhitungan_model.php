<?php
    
    defined('BASEPATH') OR exit('No direct script access allowed');
    
    class Perhitungan_model extends CI_Model {
       
        public function get_kriteria()
        {
            $query = $this->db->query("SELECT * FROM kriteria ORDER BY kode_kriteria ASC");
            return $query->result();
        }
        public function get_alternatif()
        {
            $query = $this->db->query("SELECT * FROM alternatif ORDER BY id_alternatif ASC;");
            return $query->result();
        }
		
		public function get_alt($id_alternatif)
        {
			$query = $this->db->query("SELECT * FROM alternatif WHERE id_alternatif NOT IN ($id_alternatif) ORDER BY id_alternatif ASC;");
            return $query->result();
        }
		
		public function data_nilai($id_alternatif,$id_kriteria)
		{
			$query = $this->db->query("SELECT * FROM penilaian JOIN sub_kriteria WHERE penilaian.nilai=sub_kriteria.id_sub_kriteria AND penilaian.id_alternatif='$id_alternatif' AND penilaian.id_kriteria='$id_kriteria';");
			return $query->row_array();
		}
		
		public function get_hasil()
        {
			$query = $this->db->query("SELECT * FROM hasil ORDER BY nilai DESC;");
            return $query->result();
        }
		
		public function get_hasil_alternatif($id_alternatif)
		{
			$query = $this->db->query("SELECT * FROM alternatif WHERE id_alternatif='$id_alternatif';");
			return $query->row_array();		
		}
		
		public function insert_nilai_hasil($hasil = [])
        {
            $result = $this->db->insert('hasil', $hasil);
            return $result;
        }
		
		public function hapus_hasil()
        {
            $query = $this->db->query("TRUNCATE TABLE hasil;");
			return $query;
        }
    }
    