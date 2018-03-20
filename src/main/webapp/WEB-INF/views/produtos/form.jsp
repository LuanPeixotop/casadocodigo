<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<html>
<head>
<c:url value="/resources/css" var="cssPath" />
<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" />
<link rel="stylesheet" href="${cssPath}/bootstrap-theme.min.css" />
<meta charset="utf-8" />
<title>Cadastro de produtos</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${s:mvcUrl('HC#index').build()}">Casa
				do Código</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="${s:mvcUrl('PC#listar').build()}">Lista de
						Produtos</a></li>
				<li><a href="${s:mvcUrl('PC#form').build()}">Cadastro de
						Produtos</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"> <security:authentication
							property="principal" var="usuario" /> Usuário:
						${usuario.username}
				</a>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	</nav>

	<div class="container">
		<h1>Cadastro de livros</h1>
		<form:form action="${s:mvcUrl('PC#gravar').build()}" method="post"
			commandName="produto" enctype="multipart/form-data">
			<div class="form-group">
				<label>Título: </label>
				<form:errors path="titulo" />
				<form:input path="titulo" cssClass="form-control" />
			</div>
			<div class="form-group">
				<label>Descrição: </label>
				<form:errors path="descricao" />
				<form:textarea rows="10" cols="20" path="descricao"
					cssClass="form-control" />
			</div>
			<div class="form-group">
				<label>Páginas: </label>
				<form:errors path="paginas" />
				<form:input path="paginas" type="number" cssClass="form-control" />
			</div>
			<div class="form-group">
				<label>Data de Lançamento: </label>
				<form:errors path="dataLancamento" />
				<form:input path="dataLancamento" placeholder="dd/mm/yyyy"
					cssClass="form-control" />
			</div>
			<c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
				<div class="form-group">
					<label>Preço ${tipoPreco}:</label>
					<form:input type="number" step="0.01"
						path="precos[${status.index}].valor" cssClass="form-control" />
					<form:hidden path="precos[${status.index}].tipo"
						value="${tipoPreco}" />
				</div>
			</c:forEach>
			<div class="form-group">
				<label for="sumario">Sumário: </label> <input type="file"
					name="sumario" class="form-control">
			</div>
			<button type="submit" class="btn btn-primary">Cadastrar</button>
		</form:form>
	</div>
</body>
</html>