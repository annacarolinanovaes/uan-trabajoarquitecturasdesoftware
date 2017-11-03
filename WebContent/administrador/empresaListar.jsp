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
           				 <h1 class="text-center">UC013 - Gerenciar Empresa</h1>
            			 <p class="text-center">Seja bem-vindo! Por favor, escolha uma Bandeirada para efetuar as manutenções desejadas ou adicione um novo:</p>
          			</div>
       			 </div>
      		</div>
    	</div>
    	
    	<!--  +++++++++++ SECAO PRINCIPAL +++++++++++ -->
		<div id="main" class="container-fluid">
			<div id="top" class="row">
				
				
				<div class="col-md-12" style="padding-left: 510px">
    			
    			
    			<!--  <div class="col-md-6"> -->
     				<div class="input-group h2" >
        				<a style="margin-left: 600px; margin-bottom: 0px;" class="btn btn-success btn-xs pull-right h2"
					href="<%=request.getContextPath()%>/cliente/EmpresaCRUD?cmd=novo&codEmpresa=${x.codEmpresa}">Adicionar
					nova Empresa</a>
					
					
			
     				</div>
				<!-- </div> -->
    			
    			 	
				</div>
				
				<div class="col-md-3">
    				<h2>Empresas cadastradas:</h2>
				</div>
				
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
									<th>Nome Fantasia</th>
									<th style="text-align: left;">Razão Social</th>
									<th>Telefone</th>
									<th style="text-align: center;">Ação</th>
									<th colspan="2" style="padding-left: 260px">Outras ações</th> 
				                 	
				                 </tr>
				            </thead>
				            <tbody>
				 				<c:forEach items="${lista}" var="x">
				                <tr>
				                    <td>${x.codEmpresa}</td>
									<td>${x.nomeFantasia}</td>
									<td>${x.razaoSocial}</td>
									<td>${x.telefone}</td>
														
									<td>                   
				<a style="margin-left: 100px" class="btn btn-warning btn-xs" href="<%=request.getContextPath()%>/cliente/EmpresaCRUD?cmd=visualizar&cod=${x.codEmpresa}">Visualizar</a>
				<a class="btn btn-warning btn-xs" href="<%=request.getContextPath()%>/cliente/EmpresaCRUD?cmd=editar&cod=${x.codEmpresa}">Editar</a>
				<a class="btn btn-warning btn-xs" href="<%=request.getContextPath()%>/cliente/EmpresaCRUD?cmd=deletar&cod=${x.codEmpresa}">Excluir</a>
									</td>
				<td>
				<a style="margin-left: 70px" class="btn btn-danger btn-xs"
					href="<%=request.getContextPath()%>/cliente/MotoTaxistaCRUD?cmd=chamados&cod=${x.codEmpresa}">Chamados
					por período</a>
			
			<a style="margin-left: 0px" class="btn btn-danger btn-xs"
								href="<%=request.getContextPath()%>/cliente/MototaxistaServlet?cmd=acimamedia&cod=${x.codEmpresa}">Mototaxistas
									acima da média</a>
			
			<a style="margin-left: 0px" class="btn btn-danger btn-xs"
			href="<%=request.getContextPath()%>/cliente/MototaxistaServlet2?cmd=abaixomedia&cod=${x.codEmpresa}">Mototaxistas
									abaixo da média</a>
				
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
		 
		
		
	</body>
</html>