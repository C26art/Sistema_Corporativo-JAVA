<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.ControleSaida"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="br.com.controller.ControleSaidaController" %>
<%@ page import=" java.text.SimpleDateFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import=" model.Produtos" %>
<%@ page import="br.com.controller.ProdutoController" %>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Listagem Controle Saida de Produtos</title>
<link rel="icon" href="img/favicon.ico">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<style>
section {
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	font-family: "Open Sans", sans-serif;
	background: url(../img/explore2.jpg);
	background-repeat: no-repeat;
	background-size: cover;
	font-weight: 600;
}

.container {
	width: 100%;
	height: 700px;
	overflow-y: scroll;
	box-shadow: 0 10px 100px rgba(0, 0, 0, 0.5);
	margin-bottom: 60px;
}

table {
	width: 100%;
}

table, th, td {
	border: 1px solid #fff;
	border-collapse: collapse;
	text-align: left;
}

th {
	position: sticky;
	top: 0;
	box-sizing: border-box;
}

tr th:nth-child(1) {
	width: 60px;
	text-align: center;
	background:#122b53;
}

tr td:nth-child(1) {
	text-align: center;
	background: #f28123;
	color: #fff;
}
</style>
</head>
<body>
	<a href="index.jsp"></a>
	<section>
		<div class="container">
			<table class="table table-success">
				<thead>
					<tr class="table-dark">
						
						
						<th>Quantidade Saida:</th>
						<th>Data Saida:</th>
						<th>Estoque:</th>						
						<th>Cód Prod:</th>
						<th>Valor:</th>
						<th>Desconto:</th>
						<th>Total:</th>	
						<th>Total_Desc:</th>
						<th>EstoqueAtual:</th>					
						<th>Ações:</th>
					</tr>
				</thead>
				<tbody>
				<% 
					String nomeBusca = request.getParameter("busca");
					if(nomeBusca == null){
						nomeBusca = "";
					}
					
					
					
					Produtos produto = new Produtos();
					
					ControleSaidaController controller = new ControleSaidaController();
					ArrayList<ControleSaida> saidas = controller.listar();
					
					SimpleDateFormat fmtData = new SimpleDateFormat("dd/MM/yyyy");
					DecimalFormat fmt = new DecimalFormat("###,##0.00");
					for(ControleSaida saida : saidas){
						
				%>
				
					<tr>
						
						<td><%= saida.getQuantidadeSaida() %></td>
						<td><%= saida.getDataSaida() %></td>
						<td><%= saida.getEstoque() %></td>
						<td><% 
                         ProdutoController controllerr = new ProdutoController();
                         ArrayList<Produtos> lista = controllerr.listar();
                         for(Produtos p: lista){
                       	%>
						<%= p.getIdProduto() %></td>
						 <% } %>
						<td><%= saida.getValor() %></td>
						<td><%= saida.getDesconto() %></td>
						<td><%= saida.getPreco_total() %></td>
						<td><%= saida.getPreco_desconto() %></td>
						<td><%= saida.getEstoque_atual() %></td>
									
						<td>
						
			<a href="InicioAlteraControleSaida?idSaida=<%= saida.getIdSaida() %>" style="color:#03707d">Alterar</a>
			<a href="ExcluirControleSaida?idSaida=<%= saida.getIdSaida() %>"
			   onclick="return confirm('Deseja excluir esse controle?');" style="color:#f00">Excluir</a>			
			<a href="graficoVertical" style="padding-left:4px;">Gráfico1</a>						
			<a href="cadastrocontrolesaida.jsp" style="padding-left:4px;">Voltar</a>
			
			</td>		
	</tr>
			
		<% } %>		
				
				</tbody>
			</table>
		</div>
	</section>
		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>