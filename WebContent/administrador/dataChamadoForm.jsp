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
						<h1>UC001 - Mostrar chamados por período</h1>
						<p>Por gentileza, preencha os dados solicitados para que a
							consulta seja efetivada.</p>
					</div>
				</div>
			</div>
		</div>

		<div class="section">
			<div class="container">

				<form method="post"
					action="<%=request.getContextPath()%>/cliente/MotoTaxistaCRUD">
					<input type="hidden" name="cod" value="${cod}" />

					<div class="row">
						<div class="form group col-md-6">
							<label for="campo1"> Data Inicial: </label> <input
								type="text" name="dataInicial"
								class="form-control" id="campo1"
								placeholder="Digite a data mínima" /> <br />
						</div>
					</div>

					<div class="row">
						<div class="form group col-md-6">
							<label for="campo2"> Data Final: </label> <input
								type="text" name="dataFinal" class="form-control" id="campo2"
								placeholder="Digite a data máxima" /> <br />
						</div>
					</div>

					<div id="actions" class="row">
						<div class="col-md-12">
							<button type="submit" class="btn btn-success btn-xs">Enviar</button>
							<button type="reset" class="btn btn-danger btn-xs">Limpar</button>
						</div>
					</div>

				</form>
			</div>
		</div>
		'
	</div>
</body>
</html>