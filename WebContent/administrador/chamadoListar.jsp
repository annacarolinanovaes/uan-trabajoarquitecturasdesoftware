<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" href="resources/img/icone-uberlandia-mototaxi.ico">
<meta http-equiv="X-UA-Compatible" content="IE-edge">
<meta name="description" content="">
<meta name="author" content="Anna Carolina Novaes">
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
					<h1 class="text-center">UC006 - Manter Chamados</h1>
					<p class="text-center">Seja bem-vindo! Por favor, escolha um
						dos Chamados para efetuar as manutenções desejadas ou adicione um
						novo:</p>
				</div>
			</div>
		</div>
	</div>

	<!--  +++++++++++ SECAO PRINCIPAL +++++++++++ -->
	<div id="main" class="container-fluid">
		<div id="top" class="row">
			<div class="col-md-3">
				<h2>Chamados solicitados:</h2>
			</div>

			<div class="col-md-3"></div>

			<div class="col-md-3" style="margin-left: 936px; margin-bottom: 30px">
				<a class="btn btn-success btn-xs pull-right h2"
					href="<%=request.getContextPath()%>/administrador/ChamadoCRUD?cmd=escolherBandeirada">Adicionar
					novo Chamado</a>
			</div>
		</div>

		<!--  +++++++++ LISTAGEM ++++++++ -->
		<div id="list" class="row">

			<div class="table-responsive col-md-12">
				<table class="table table-striped" cellspacing="0" cellpadding="0">
					<thead>
						<tr>
							<th>Código</th>
							<th>Origem</th>
							<th>Destino</th>
							<th>Data/hora</th>
							<th>Distância</th>
							<th>Mototaxista</th>
							<th>Cliente</th>
							<th>Bandeirada</th>
							<th colspan=2>Ação</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${lista}" var="x">
				<tr>
					<td>${x.codChamado}</td>
					<td>${x.origem}</td>
					<td>${x.destino}</td>
					<td>${x.dataHora}</td>
					<td>${x.distancia}</td>
					<td>${x.motoTaxista.nome}</td>
					<td>${x.cliente.nome}</td>
					<td>${x.bandeirada.valorInicial}</td>

					<td class="actions">
				    <a class="btn btn-success btn-xs" href="<%=request.getContextPath()%>/administrador/ChamadoCRUD?cmd=editar&cod=${x.codChamado}">Editar</a>
				    <a class="btn btn-danger btn-xs" href="<%=request.getContextPath()%>/administrador/ChamadoCRUD?cmd=deletar&cod=${x.codChamado}">Excluir</a>
				    </td>
				</tr>
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