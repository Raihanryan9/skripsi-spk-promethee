<?php
$this->load->view('layouts/header_admin');
?>

<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800"><i class="fas fa-fw fa-calculator"></i> Data Perhitungan</h1>
</div>

<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-dark"><i class="fa fa-table"></i> Data Penilaian</h6>
    </div>

    <div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead class="bg-warning text-dark">
					<tr align="center">
						<th width="5%">No</th>
						<th width="20%">Kode Alternatif</th>
						<th>Nama Alternatif</th>
						<?php foreach ($kriteria as $key): ?>
						<th><?= $key->kode_kriteria ?></th>
						<?php endforeach ?>
					</tr>
				</thead>
				<tbody>
					<?php 
						$no=1;
						foreach ($alternatif as $keys): ?>
					<tr align="center">
						<td><?= $no; ?></td>
						<td><?= $keys->kode_alternatif ?></td>
						<td align="left"><?= $keys->nama ?></td>
						<?php foreach ($kriteria as $key): ?>
						<td>
						<?php 
							$data_pencocokan = $this->Perhitungan_model->data_nilai($keys->id_alternatif,$key->id_kriteria);
							echo $data_pencocokan['nilai'];
						?>
						</td>
						<?php endforeach ?>
					</tr>
					<?php
						$no++;
						endforeach
					?>
				</tbody>
			</table>
		</div>
	</div>
</div>

<?php 
$tip = array();
$jumlahaleternatif = array();
$entering = array();
$leaving = array();
$net = array();

$jkriteria = count($kriteria);
foreach ($kriteria as $r){ ?>
<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-dark"><i class="fa fa-table"></i> Kriteria <?= $r->keterangan ?> (<?= $r->kode_kriteria ?>)</h6>
    </div>

    <div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead class="bg-warning text-dark">
					<tr align="center">
						<th colspan='2' class='text-center'>Alternatif</th>
						<th rowspan='2' class='text-center'>f(a)</th>    
						<th rowspan='2' class='text-center'>f(b)</th>
						<th rowspan='2' class='text-center'>d (selisih)</th>
						<th rowspan='2' class='text-center'>Nilai Prefrensi</th>
					</tr>
				</thead>
				<tbody>
					<?php
						$i = 1;
						$sub = array();
						foreach ($alternatif as $a1){
							if($i==1){
								$idk = "'".$a1->id_alternatif."'";
							}else{
								$idk = $idk.",'".$a1->id_alternatif."'";
							}
							
							$alternatif2 = $this->Perhitungan_model->get_alt($idk);
							
							foreach ($alternatif2 as $a2){
								
								$data_pencocokan1 = $this->Perhitungan_model->data_nilai($a1->id_alternatif,$r->id_kriteria);
								$data_pencocokan2 = $this->Perhitungan_model->data_nilai($a2->id_alternatif,$r->id_kriteria);
								$d1 = $data_pencocokan1['nilai'] - $data_pencocokan2['nilai'];
								$d2 = $data_pencocokan2['nilai'] - $data_pencocokan1['nilai'];
								if($d1<= "0") {
									$p1 = "0";
								}else{
									$p1 = "1";
								}
								if($d2<= "0") {
									$p2 = "0";
								}else{
									$p2 = "1";
								}
								echo "		
								<tr align='center'>
									<td>[$a1->kode_alternatif] $a1->nama</td>
									<td>[$a2->kode_alternatif] $a2->nama</td>
									<td>".$data_pencocokan1['nilai']."</td>
									<td>".$data_pencocokan2['nilai']."</td>
									<td>$d1</td>
									<td>".$p1."</td>
								</tr>
								<tr align='center'>
									<td>[$a2->kode_alternatif] $a2->nama</td>
									<td>[$a1->kode_alternatif] $a1->nama</td>
									<td>".$data_pencocokan2['nilai']."</td>
									<td>".$data_pencocokan1['nilai']."</td>
									<td>$d2</td>
									<td>".$p2."</td>
								</tr>";
								
								if(isset($tip[$a1->id_alternatif][$a2->id_alternatif])){
									$tip[$a1->id_alternatif][$a2->id_alternatif] = $tip[$a1->id_alternatif][$a2->id_alternatif]+$p1;
								}else{
									$tip[$a1->id_alternatif][$a2->id_alternatif] = $p1;
								}


								if(isset($tip[$a2->id_alternatif][$a1->id_alternatif])){
									$tip[$a2->id_alternatif][$a1->id_alternatif] = $tip[$a2->id_alternatif][$a1->id_alternatif]+$p2;
								}else{
									$tip[$a2->id_alternatif][$a1->id_alternatif] = $p2;
								}
							}
							$i++;
						}
					?>
				</tbody>
			</table>
		</div>
	</div>
</div>
<?php
}
?>
<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-dark"><i class="fa fa-table"></i> Total Indeks Preferensi</h6>
    </div>

    <div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				<thead class="bg-warning text-dark">
					<tr align="center">
						<th colspan='2'>Alternatif</th>
						<th width="35%">Total Nilai</th>
					</tr>
				</thead>
				<tbody>
					<?php 
						$i = 1;
						foreach ($alternatif as $a1){
							if($i==1){
								$idk = "'".$a1->id_alternatif."'";
							}else{
								$idk = $idk.",'".$a1->id_alternatif."'";
							}
							
							$alternatif2 = $this->Perhitungan_model->get_alt($idk);
							
							foreach ($alternatif2 as $a2){
								$tip[$a2->id_alternatif][$a1->id_alternatif] = $tip[$a2->id_alternatif][$a1->id_alternatif]/$jkriteria;
								$tip[$a1->id_alternatif][$a2->id_alternatif] = $tip[$a1->id_alternatif][$a2->id_alternatif]/$jkriteria;
								

								echo "
								<tr align='center'>
									<td>[$a1->kode_alternatif] $a1->nama</td>
									<td>[$a2->kode_alternatif] $a2->nama</td>
									<td>".$tip[$a1->id_alternatif][$a2->id_alternatif]."</td>
								</tr>
								<tr align='center'>
									<td>[$a2->kode_alternatif] $a2->nama</td>
									<td>[$a1->kode_alternatif] $a1->nama</td>
									<td>".$tip[$a2->id_alternatif][$a1->id_alternatif]."</td>
								</tr>";
							}
						$i++;
						}
					?>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-dark"><i class="fa fa-table"></i> Menghitung Indeks Preferensi</h6>
    </div>

    <div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				
				<thead class="bg-warning text-dark">
					<tr align="center">
						<th>Alternatif</th>
						<?php foreach ($alternatif as $key): ?>
						<th>[<?= $key->kode_alternatif ?>] <?= $key->nama ?></th>
						<?php endforeach ?>
						<th>Jumlah</th>
						<th>Leaving Flow</th>
					</tr>
				</thead>
				<tbody>
					<?php 
						foreach ($alternatif as $baris) {
							$jumlah = 0 ;
							echo "<tr align='center'><th class='bg-warning text-dark'>[$baris->kode_alternatif] $baris->nama</th>";
							foreach ($alternatif as $kolom) {
								echo "<td>";
								if(isset($tip[$baris->id_alternatif][$kolom->id_alternatif])){
									echo $tip[$baris->id_alternatif][$kolom->id_alternatif];
									$jumlah = $jumlah + $tip[$baris->id_alternatif][$kolom->id_alternatif];
								}else{
									echo "0";
									$tip[$baris->id_alternatif][$kolom->id_alternatif] = 0;
								} 
								echo "</td>";

								if(isset($jumlahaleternatif[$kolom->id_alternatif])){
									$jumlahaleternatif[$kolom->id_alternatif] = $jumlahaleternatif[$kolom->id_alternatif] + $tip[$baris->id_alternatif][$kolom->id_alternatif];
								}else{
									$jumlahaleternatif[$kolom->id_alternatif] = $tip[$baris->id_alternatif][$kolom->id_alternatif];
								}
							}
							$i++;
							$leaving[$baris->id_alternatif] = $jumlah/(count($alternatif)-1); 
							echo "<td>$jumlah</td><td>".round($leaving[$baris->id_alternatif], 5)."</td></tr>";
						}
						echo "<tr align='center'><th class='bg-warning text-white'>Jumlah</th>";
						foreach ($alternatif as $kolom) {
							echo "<td>".$jumlahaleternatif[$kolom->id_alternatif]."</td>";
						}
						echo "<td colspan='2'></td></tr>";

						echo "<tr align='center'><th class='bg-warning text-white'>Entering Flow</th>";
						foreach ($alternatif as $kolom) {
							$entering[$kolom->id_alternatif] = $jumlahaleternatif[$kolom->id_alternatif]/(count($alternatif)-1); 
							echo "<td>".round($entering[$kolom->id_alternatif],5)."</td>";
						}
						echo "<td colspan='2'></td></tr>";	
					?>
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="card shadow mb-4">
    <!-- /.card-header -->
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-dark"><i class="fa fa-table"></i> Menghitung Leaving Flow, Entering Flow, Net Flow</h6>
    </div>

    <div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" width="100%" cellspacing="0">
				
				<thead class="bg-warning text-dark">
					<tr align="center">
						<th>Kode Alternatif</th>
						<th>Alternatif</th>
						<th>Leaving Flow</th>
						<th>Entering Flow</th>
						<th>Net Flow</th>
					</tr>
				</thead>
				<tbody>
					<?php 
						$this->Perhitungan_model->hapus_hasil();
						foreach ($alternatif as $baris) {
							$net[$baris->id_alternatif][0] = $leaving[$baris->id_alternatif] - $entering[$baris->id_alternatif]; 
							$net[$baris->id_alternatif][1] = $baris->nama;
							$net[$baris->id_alternatif][2] = $baris->id_alternatif;
							
							echo "
							<tr align='center'>
								<td>$baris->kode_alternatif</td>
								<td>$baris->nama</td>
								<td>".round($leaving[$baris->id_alternatif], 5)."</td>
								<td>".round($entering[$baris->id_alternatif], 5)."</td>
								<td>".round($net[$baris->id_alternatif][0], 5)."</td>
							</tr>";
							$nilai_hasil = [
								'id_alternatif' => $baris->id_alternatif,
								'nilai' => $net[$baris->id_alternatif][0]
							];
							$this->Perhitungan_model->insert_nilai_hasil($nilai_hasil);
						}	
					?>
				</tbody>
			</table>
		</div>
	</div>
</div>

<?php
$this->load->view('layouts/footer_admin');
?>