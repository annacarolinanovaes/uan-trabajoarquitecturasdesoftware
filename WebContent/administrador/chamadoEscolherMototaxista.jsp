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
<meta name="author" content="Aparício Pedrosa Franco Junior">

<title>Uberlândia Mototáxi</title>
<!--  +++++++++++ REFERENCIAS BASICAS DO BOOTSTRAP +++++++++++ -->
<%@ include file="/resources/includes/refs-bootstrap-inicio.jsp"%>
</head>

<body>
	<!--  +++++++++++ BARRA DE NAVEGACAO +++++++++++ -->
	<%@ include file="/resources/includes/barra-superior.jsp"%>

	<!--  +++++++++++ SECAO PRINCIPAL +++++++++++ -->
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="text-center">UC013 - Solicitar Chamado</h1>
					<p class="text-center">Seja bem-vindo! Por favor, escolha um
						Mototaxista para abrir um novo Chamado:</p>
				</div>
			</div>
		</div>
	</div>

	<!--  +++++++++++ SECAO PRINCIPAL +++++++++++ -->
	<div id="main" class="container-fluid">
		<div id="top" class="row">
			<div class="col-md-3">
				<h2>Mototaxistas cadastrados:</h2>
			</div>

			<div class="col-md-12" style="padding-left: 510px"></div>

			<!--  <div class="col-md-3">
    				<a class="btn btn-success btn-xs pull-right h2" href="<%=request.getContextPath()%>/cliente/EmpresaCRUD?cmd=novo"
				 >Adicionar nova Empresa</a>
				</div> -->
		</div>

		<!--  +++++++++ LISTAGEM ++++++++ -->
		<div id="list" class="row">

			<div class="table-responsive col-md-12">
				<table class="table table-striped" cellspacing="0" cellpadding="0">
					<thead>
						<tr>
							<th>Código</th>
							<th>Nome</th>
							<th>Placa</th>
							<th>Empresa</th>
							<th>Escolher</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lista}" var="x">
							<c:choose>
								<c:when test="${x.disponivel == true}">
									<tr>
										<td>${x.codMotoTaxista}</td>
										<td>${x.nome}</td>
										<td>${x.placa}</td>
										<td>${x.empresa.nomeFantasia}</td>
										<td><a class="btn btn-success btn-xs"
											href="<%=request.getContextPath()%>/administrador/ChamadoCRUD?cmd=novo&codCliente=${codCliente.codCliente}&codBandeirada=${codBandeirada.codBandeirada}&codMototaxista=${x.codMotoTaxista}">Escolher
												este</a></td>
									</tr>
								</c:when>
							</c:choose>

						</c:forEach>
					</tbody>
				</table>

			</div>

		</div>
		<!-- /#list -->
	</div>
	<!--  +++++++++++ REFERENCIAS ADICIONAIS DO BOOTSTRAP +++++++++++ -->
	<%@ include file="/resources/includes/refs-bootstrap-final.jsp"%>



</body>
</html>