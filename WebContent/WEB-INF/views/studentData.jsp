<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Data</title>
</head>
<body>
<br>
<h1>${message}</h1>
<br>
<table>
		<tr>
			<th>Name</th>
			<th>Last Name</th>
			<th>Age</th>
			<th>Status</th>
		</tr>
			<tr>
				<td>${student.sName}</td>
				<td>${student.lName}</td>
				<td>${student.sAge}</td>
				<td>${student.activoDelegate}</td>
			</tr>
	</table>
</body>
</html>