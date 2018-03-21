<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<c:url value="/resources/css" var="cssPath" />
<link rel="stylesheet" href="${cssPath}/bootstrap.min.css" />
<link rel="stylesheet" href="${cssPath}/bootstrap-theme.min.css" />
<meta charset="utf-8" />
<title>Login</title>
</head>
<body>
	<div class="container">
		<h1>Login</h1>
		<form:form servletRelativeAction="/login" method="post">
			<div class="form-group">
				<label>Email: </label> 
				<input type="text" name="username" Class="form-control" />
			</div>
			<div class="form-group">
				<label>Email: </label> 
				<input type="password" name="password" Class="form-control" />
			</div>
			<button type="submit" class="btn btn-primary">Logar</button>
		</form:form>
	</div>
</body>
</html>