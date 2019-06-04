<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>SpingJPA</title>
</head>
<body>
	<br>
	<form action="${pageContext.request.contextPath}/search" method="post">
	<label>Busqueda por codigo: </label>
	<input type="text" placeholder="Ingrese codigo" name="code">
	<input type="submit" value="Enviar">
	</form>
	<br>
	<br>
	<table class="table">
		<tr>
			<th>Id</th>
			<th>Name</th>
			<th>Last Name</th>
			<th>Age</th>
			<th>Status</th>
			<th></th>
			<th></th>
		</tr>
		<c:forEach items="${students}" var="students">
			<tr>
				<td>${students.cStudent}</td>
				<td>${students.sName}</td>
				<td>${students.lName}</td>
				<td>${students.sAge}</td>
				<td>${students.activoDelegate}</td>
				<td>
					<form action="${pageContext.request.contextPath}/edit" method = "post">
					<input type="submit" value="Edit">
					<input type="hidden" value="${students.cStudent}" name="code">
					</form>
				</td>
				<td>
					<form action="${pageContext.request.contextPath}/delete" method = "post">
					<input type="submit" value="Delete">
					<input type="hidden" value="${students.cStudent}" name="code">
					</form>
				</td>
			</tr>
			
		</c:forEach>
	</table>
	<br>
	<br>
	<br>
	<form action="${pageContext.request.contextPath}/edit" method = "post">
	<input type="hidden" value="" name="code">
	<input type="submit" value="Agregar un nuevo usuario">
	</form>
</body>
</html>