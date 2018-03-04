<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<html>
<head>
<!--Import Google Icon Font-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!--Import materialize.css-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta charset="utf-8" />
<title>Cadastro de produtos</title>
</head>

<body>
	<div class="container">
		<h1 style="font-size: 300%" align="center">Cadastro de livros</h1>
		<form:form action="${s:mvcUrl('PC#gravar').build()}" method="post"
			commandName="produto">
			<div>
				<label>Título: </label>
				<form:errors path="titulo" />
				<form:input path="titulo" />
			</div>
			<div>
				<label>Descrição: </label>
				<form:errors path="descricao" />
				<form:textarea rows="10" cols="20" path="descricao" />
			</div>
			<div>
				<label>Páginas: </label>
				<form:errors path="paginas" />
				<form:input path="paginas" type="number" />
			</div>
			<div>
				<label>Data de Lançamento: </label>
				<form:errors path="dataLancamento" />
				<form:input path="dataLancamento" placeholder="dd/mm/yyyy" />
			</div>
			<c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
				<div>
					<label>Preço ${tipoPreco}:</label>
					<form:input type="number" path="precos[${status.index}].valor" />
					<form:hidden path="precos[${status.index}].tipo"
						value="${tipoPreco}" />
				</div>
			</c:forEach>
			<button type="submit">Cadastrar</button>
		</form:form>
	</div>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
</body>
</html>