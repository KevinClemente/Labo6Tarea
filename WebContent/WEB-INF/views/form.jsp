<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Añadir estudiante</title>
</head>
<body>
	<form:form action="${pageContext.request.contextPath}/save" method="POST" modelAttribute="student">
	<label>Ingrese un nombre: </label>
	<form:input type="text" name= "name" path="sName"/><br>
	<label>Ingrese un apellido: </label>
	<form:input type="text" name= "lname" path="lName"/><br>
	<label>Ingrese edad: </label>
	<form:input type="age" name= "age" path="sAge"/><br>
	<label>Estado del estudiante</label><br>
	<form:radiobutton name="status" path="bActivo" value="true"/><label>Activo</label><br>
	<form:radiobutton name="status" path="bActivo" value="false"/><label>Inactivo</label><br>
	<input type="submit" value="Agregar estudiante">
	</form:form>
</body>
</html>