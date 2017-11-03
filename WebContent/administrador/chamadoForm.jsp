<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" href="resources/img/icone-uberlandia-mototaxi.ico">
<meta http-equiv="X-UA-Compatible" content="IE-edge">
<meta name="description" content="">
<meta name="author" content="Anna Carolina Novaes">
<meta charset="UTF-8">

<title>Uberlândia Mototáxi</title>

<!--  +++++++++++ REFERENCIAS BASICAS DO BOOTSTRAP +++++++++++ -->
<%@ include file="/resources/includes/refs-bootstrap-inicio.jsp"%>
</head>

<body>
	<!--  +++++++++++ BARRA DE NAVEGACAO +++++++++++ -->
	<%@ include file="/resources/includes/barra-superior.jsp"%>

	<div id="main" class="container-fluid">
		<div class="section">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<h1>Cadastro do Chamado</h1>
						<p>Por gentileza, preencha os dados solicitados para que o
							cadastro seja efetivado.</p>
					</div>
				</div>
			</div>
		</div>

		<div class="section">
			<div class="container">

				<form method="post"
					action="<%=request.getContextPath()%>/administrador/ChamadoCRUD"
					name="formCha">

					<div class="row">
						<div class="form group col-md-6" style="visibility: hidden;">
							<label for="codChamado"> Código: </label> <input type="text"
								name="codChamado" value="${cha.codChamado}"
								class="form-control" id="codChamado" readonly="readonly" /> <br />
						</div>
					</div>

					<div class="row">
						<div class="form group col-md-6">
							<label for="origem"> Origem: </label> <input
								type="text" name="origem" value="${cha.origem}"
								class="form-control" id="origem"
								placeholder="Digite a origem do Chamado" /> <br />
						</div>
					</div>

					<div class="row">
						<div class="form group col-md-6">
							<label for="destino"> Destino: </label> <input
								type="text" name="destino" value="${cha.destino}"
								class="form-control" id="destino"
								placeholder="Digite o destino do Chamado" /> <br />
						</div>
					</div>

					<div class="row">
						<div class="form group col-md-6">
							<label for="bandeirada"> Bandeirada: </label> <input type="text"
								name="bandeiradaValor" value="${cha.bandeirada.valorInicial}" class="form-control"
								readonly="readonly"	id="bandeirada" /> <br />
						</div>
					</div>

					<div class="row">
						<div class="form group col-md-6">
							<label for="clienteNome"> Cliente: </label> <input type="text"
								name="clienteNome" value="${cha.cliente.nome}" class="form-control"
								id="clienteNome" readonly="readonly" /> <br />
						</div>
					</div>

					<div class="row">
						<div class="form group col-md-6">
							<label for="mototaxistaNome"> Mototaxista: </label> <input type="text" name="motoTaxistaNome"
								readonly="readonly" value="${cha.motoTaxista.nome}" class="form-control" id="motoTaxistaNome" /> <br />
						</div>
					</div>

					<input type="hidden" name="bandeirada" value="${cha.bandeirada.codBandeirada}" />
					<input type="hidden" name="cliente" value="${cha.cliente.codCliente}" />
					<input type="hidden" name="motoTaxista" value="${cha.motoTaxista.codMotoTaxista}" />
					
					<div id="actions" class="row">
						<div class="col-md-12">
							<button type="submit" class="btn btn-success btn-xs">Enviar</button>
							<a href="<%=request.getContextPath()%>/index.jsp"
								class="btn btn-danger btn-xs">Cancelar</a>
						</div>
					</div>
					

				</form>
			</div>
		</div>
		'
	</div>
</body>
</html>