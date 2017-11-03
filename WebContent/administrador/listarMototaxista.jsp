<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="icon" href="resources/img/icone-uberlandia-mototaxi.ico">
		 <!--  Bootstrap core CSS -->
		 <link href="<%=request.getContextPath()%>/resources/css/bootstrap.css" rel ="stylesheet">
		 
		 <!-- Custom styles for this template -->
		 <link href="<%=request.getContextPath()%>/resources/css/2.css" rel ="stylesheet">
				<meta http-equiv="X-UA-Compatible" content="IE-edge">
		<meta name="description" content="">
		<meta name="author" content="Anna Carolina Novaes">
		
		<title>Uberlândia Mototáxi</title>
		
		<script src="/1-mototaxi-web/resources/js/jquery-3.1.0.js"></script>
		<script>
           $(function(){
            $(".exclusao").on('click', function(){
            	var id = $(this).data('id'); //recuperar qual o id da linha
            	   //agora vamos usar o id da linha para recuperar cada campo.. 
            	    
            	   var nome = $('#nome' + id).text(); //vai retornar nome da linha do botão
            
                //depois de jogar tudo, voce pode exibir seu modal manualmente:
                $("#myModal").modal();
                $("#idno").append("Opa" + id);
                $(".confirma").append("<li>Índice adicionado ao final da lista</li>");
             });
           });
           </script>
	</head>
	<body>
	
	
		<!--  +++++++++++ BARRA DE NAVEGACAO +++++++++++ -->
		 <%@ include file="/resources/includes/barra-superior.jsp"%> 
		
		<!--  +++++++++++ SECAO PRINCIPAL +++++++++++ -->
		  <div class="section">
      		<div class="container">
       			 <div class="row">
         			 <div class="col-md-12">
           				 <h1 class="text-center">UC004 - Gerenciar MotoTaxista</h1>
            			 <p class="text-center">Seja bem-vindo! Por favor, escolha um dos Mototaxistas para efetuar as manutenções desejadas ou adicione um novo:</p>
          			</div>
       			 </div>
      		</div>
    	</div>
    	
    	<!--  +++++++++++ SECAO PRINCIPAL +++++++++++ -->
		<div id="main" class="container-fluid">
			<div id="top" class="row">
				<div class="col-md-3">
    				<h2>MotoTaxistas cadastrados:</h2>
				</div>
				
				<div class="col-md-3">
    				
				</div>
				
				<div class="col-md-3">
    				<a class="btn btn-success btn-xs pull-right h2" href="<%=request.getContextPath()%>/cliente/MotoTaxistaCRUD?cmd=escolherEmpresa"
				 >Adicionar MotoTaxista</a>
				</div>
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
									<th>Disponível</th>
									<th>Empresa</th>
									<th colspan="2">Ação</th> 
				                 </tr>
				            </thead>
				            <tbody>
				 				<c:forEach items="${lista}" var="x">
				                <tr>
				                    <td id="codigo${x.codMotoTaxista}">${x.codMotoTaxista}</td>
									<td id="codigo${x.nome}">${x.nome}</td>
									<td>${x.placa}</td>
									<td>
										<c:if
										test="${x.disponivel == true}">
    									Sim
									</c:if>
									<c:if
										test="${x.disponivel == false}">
    									Não
									</c:if>
									</td>					
									<td>${x.empresa.nomeFantasia}</td>
									
				                    <td class="actions">
				                        <a class="btn btn-success btn-xs" href="<%=request.getContextPath()%>/cliente/MotoTaxistaCRUD?cmd=visualizar&cod=${x.codMotoTaxista}">Visualizar</a>
				                        <a class="btn btn-warning btn-xs" href="<%=request.getContextPath()%>/cliente/MotoTaxistaCRUD?cmd=editar&cod=${x.codMotoTaxista}">Editar</a>
				                        <a class="btn btn-warning btn-xs" href="<%=request.getContextPath()%>/cliente/MotoTaxistaCRUD?cmd=deletar&cod=${x.codMotoTaxista}">Excluir</a>
				                        <!--  <input type="button" class="btn btn-danger exclusao" data-toggle="modal" value="Excluir" data-target="#myModal" data-id="${x.codMotoTaxista}"/> -->
				                    </td>
				                </tr>
							 </c:forEach>
				            </tbody>
				         </table>
				         
				         <div class="modal fade" id="myModal" role="dialog">
				            <div class="modal-dialog">
				                <div class="modal-content">
				                    <div class="modal-header">
				                        <button type="button" class="close" data-dismiss="modal">
				                            <span aria-hidden="true">x</span>
				                        </button>
				                        <h3 class="modal-title">Exclusão</h3>
				                    </div>
				                    <div class="modal-body">
				                        <p>Tem certeza que deseja excluir o MotoTaxista?</p>
				                          Deseja mesmo apagar <span id="idno"></span>
				                    </div>
				                    <div class="modal-footer confirma">
				                     	<a href="<%=request.getContextPath()%>/cliente/MotoTaxistaCRUD?cmd=deletar&cod=${x.codMotoTaxista}" class="btn btn-primary yes">Sim</a>
				                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
				                    </div>
				                </div>
				            </div>
				        </div>
				 
				     </div>
				    
				 </div> <!-- /#list -->
      </div>	    
	</body>
</html>