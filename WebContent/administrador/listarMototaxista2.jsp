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
		<meta name="author" content="Apar�cio Pedrosa Franco Junior">
		
		<title>Uberl�ndia Motot�xi</title>

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
           				 <h1 class="text-center">UC005 - Mostrar m�dia de um MotoTaxista</h1>
            			 <p class="text-center">Seja bem-vindo! Por favor, escolha um dos Mototaxistas para listar a m�dia, de acordo com as avalia��es realizadas at� o momento:</p>
          			</div>
       			 </div>
      		</div>
    	</div>
    	
    	<!--  +++++++++++ SECAO PRINCIPAL +++++++++++ -->
		<div id="main" class="container-fluid">
			<div id="top" class="row">
				<div class="col-md-3">
    				<h2>Moto Taxistas cadastrados:</h2>
				</div>
				
				<div class="col-md-3">
    		
				</div>
				
				<div class="col-md-3">

				</div>
			</div>
			
			<!--  +++++++++ LISTAGEM ++++++++ -->
				<div id="list" class="row">
				 
				    <div class="table-responsive col-md-12">
				        <table class="table table-striped" cellspacing="0" cellpadding="0">
				            <thead>
				                <tr>
				                    <th>C�digo</th>
									<th>Nome</th>
									<th>Placa</th>
									<th>Dispon�vel</th>
									<th>Empresa</th>
									<th colspan="2">A��o</th> 
				                 </tr>
				            </thead>
				            <tbody>
				 				<c:forEach items="${lista}" var="x">
				                <tr>
				                    <td>${x.codMotoTaxista}</td>
									<td>${x.nome}</td>
									<td>${x.placa}</td>
									<td>
										<c:if
										test="${x.disponivel == true}">
    									Sim
									</c:if>
									<c:if
										test="${x.disponivel == false}">
    									N�o
									</c:if>
									</td>					
									<td>${x.empresa.nomeFantasia}</td>
									
				                    <td class="actions">
				                        <a class="btn btn-success btn-xs" href="<%=request.getContextPath()%>/cliente/MotoTaxistaCRUD?cmd=mediacalc&cod=${x.codMotoTaxista}">Mostrar
							m�dia</a>
				                    </td>
				                </tr>
							 </c:forEach>
				            </tbody>
				         </table>
				 
				     </div>
				    
				 </div> <!-- /#list -->
      </div>	
		 <!--  +++++++++++ REFERENCIAS ADICIONAIS DO BOOTSTRAP +++++++++++ -->
		 <%@ include file="/resources/includes/refs-bootstrap-final.jsp"%> 
		 
		 <!--  +++++++++++ CODIGO DA JANELA MODAL DE CONFIRMAR EXCLUSAO +++++++++++ 
		 <%@ include file="/resources/includes/confirmar-exclusao-modal.jsp"%>-->
		
	</body>
</html>