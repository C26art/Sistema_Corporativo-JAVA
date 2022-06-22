<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.Login"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="br.com.controller.LoginController" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Listagem de Login's</title>
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
						
						<th>Nome</th>
						<th>Login</th>
						<th>Senha</th>						
						<th>Ações</th>
					</tr>
				</thead>
				<tbody>
				<% 
					String nomeBusca = request.getParameter("busca");
					if(nomeBusca == null){
						nomeBusca = "";
					}
					
					LoginController controller = new LoginController();
					ArrayList<Login>lista = controller.listar("");
					for(Login l : lista){
						
				%>
				
					<tr>					    
						<td><%= l.getNome() %></td>
						<td><%= l.getLogin() %></td>
						<td><%= l.getSenha() %></td>								
						<td>
						
			<a href="InicioAlteraLogin?id=<%= l.getId() %>" style="color:#03707d">Alterar</a>
			<a href="ExcluirLogin?id=<%= l.getId() %>"
			   onclick="return confirm('Deseja excluir esse Login?');" style="color:#f00">Excluir</a>			
			<a href="indexFunc.jsp" style="padding-left:4px;">Voltar</a>
			
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