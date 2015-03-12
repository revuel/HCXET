<!DOCTYPE html>
<html lang = "es">
	<head>
		<title> HCXET </title>
		
		<base href="../">
		 
		<!-- METADATOS -->
		<meta charset="utf-8">
		<meta name="author" content="Olga Peñalba Rodríguez, Miguel Revuelta Espinosa">
		<meta name="description" content="Human Centered Systems Experimental Evaluation Tool">
		<meta name="keywords" content="HCS, HCC, HCD, Human Centered Systems, Sistemas Centrados en la Persona">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- CSS -->
		<link rel="stylesheet" href="CSS/reset.css" type="text/css" media="screen">
		<link rel="stylesheet" href="CSS/bootstrap.css" type="text/css" media="screen">
		<link rel="stylesheet" href="CSS/bootstrap-theme.css" type="text/css" media="screen">
		<!--<link rel="stylesheet" href="Web/Nuevo/dist/bootstrap-tokenfield.css" type="text/css" media="screen">-->
		
		<style>
			body { padding-top: 70px; }
		</style>
		
		<!-- JAVASCRIPT -->
		<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		
		<script src="Web/Nuevo/dist/bootstrap-tokenfield.js"></script>-->
		
	</head>
	
	<body>
		<!-- Cabecera -->
		<header>
			<?php include 'Include2/cabecera2.php'; ?>
		</header>
		
		<!-- Contenido principal -->
		<main>
			<h3 class="text-center">Nuevo estudio</h3>
			<hr><br>
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-8 col-md-offset-2">
						<h4 class = "text-center">Introduzca los datos del sistema a evaluar</h4>
						<div class = "row well">
						...
						</div>
						<div class = "row">
							<div class="col-xs-6 col-sm-4 col-md-8 col-md-offset-2 well">
								<form class="form-horizontal">
									<div class="form-group form-group-sm">
										<label class="col-sm-2 control-label" for="formGroupInputSmall">Nombre</label>
										<div class="col-sm-10">
											<input class="form-control" type="text" id="formGroupInputSmall" placeholder="Nombre del estudio">
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label class="col-sm-2 control-label" for="formGroupInputSmall">Sistema</label>
										<div class="col-sm-10">
											<input class="form-control" type="text" id="formGroupInputSmall" placeholder="Aplicación/Sistema">
										</div>
									</div>
									<div class="form-group form-group-sm">
										<label class="col-sm-2 control-label" for="formGroupInputSmall">Añadir</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="tokenfield"  placeholder="Participantes..." />
										</div>
									</div>
									<div class = "row text-center">
										<button type="button" class="btn btn-primary">Nuevo estudio</button>
									</div>
								</form>
							</div>
						</div>	
					</div>
				</div>
			</div>
		</main>
		
		<!-- Pie de página-->
		<footer>
			<?php include '../Include/pie.php'; ?>
		</footer>
	</body>
</html>