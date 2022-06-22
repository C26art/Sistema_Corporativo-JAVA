<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Produtos"%>
<%@ page import="java.util.ArrayList"%>
<%
	ArrayList<Produtos> lista = (ArrayList<Produtos>)
	request.getAttribute("cadastros");


%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Listagem de Produtos</title>
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
						<th>Id</th>
						<th>Nome</th>
						<th>Descrição</th>
						<th>Quantidade</th>						
						<th>Categoria</th>
						<th>Marca</th>						
						<th>Valor</th>						
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>
					<% for (int i = 0; i < lista.size(); i++){ %>
					<tr>
			<td><%= lista.get(i).getIdProduto() %></td>
			<td><%= lista.get(i).getNome() %></td>
			<td><%= lista.get(i).getDescricao() %></td>
			<td><%= lista.get(i).getQuantidade() %></td>						
			<td><%= lista.get(i).getCategoria() %></td>
			<td><%= lista.get(i).getMarca() %></td>			
			<td><%= lista.get(i).getValor() %></td>							
			<td>	
					
			<a href="select?idProduto=<%= lista.get(i).getIdProduto() %>" style="color:#03707d">Alterar</a>
			<a href="javascript: confirmar(<%= lista.get(i).getIdProduto() %>)" style="color:#f00">Excluir</a>
			<a href="Relatorio"style="padding-left:4px;">Relatório</a>
			<a href="graficoVertical" style="padding-left:4px;">Gráfico1</a>
			<a href="graficoPie" style="padding-left:4px;">Gráfico2</a>
			<a href="cadastroproduto.jsp" style="padding-left:4px;">Voltar</a>
			
		</td>		
	</tr>
			
					<%} %>
				
				</tbody>
			</table>
		</div>
	</section>
	<script>
	/**
	 * Confirmar a exclusao de um contato
	 * 
	 * @author SkateClub
	 * @param id
	 */
	 function confirmar(idProduto) {
		let resposta = confirm("Confirma a exclusão deste produto?")
		if (resposta === true) {
			window.location.href = "delete?idProduto=" + idProduto
		}
	}
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>