<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<form action="/casadocodigo/produtos" method="post">
			<div>
				<label>Título:</label> <input type="text" name="titulo" />
			</div>
			<div>
				<label>Descrição:</label>
				<textarea rows="10" cols="20" name="descricao"></textarea>
			</div>
			<div>
				<label>Páginas:</label> <input type="text" name="paginas" />
			</div>
			<c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
				<div>
					<label>Preço ${tipoPreco}:</label> <input type="text"
						name="precos[${status.index}].valor" /> <input type="hidden"
						name="precos[${status.index}].tipo" value="${tipoPreco}" />
				</div>
			</c:forEach>
			<button type="submit">Cadastrar</button>
		</form>
	</div>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
</body>
</html>