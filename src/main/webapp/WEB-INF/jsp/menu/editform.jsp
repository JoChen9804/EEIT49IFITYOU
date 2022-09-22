
<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<title>Editform</title>

<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>


<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MENU EDIT</title>
<link rel="stylesheet" href="CSS/menuStyle.css">
</head>

<body>
	<header>
	<h1>Edit Form</h1>
	</header>

	<form action="updateMenu2.controller" method="post">

		<input type="hidden" name="id" value="${rid.id}">
		<table>
		
			<tr>
				<td>種類:</td>
				<td><input type="text" name="part" readonly="readonly" value="${rid.part}" /></td>
			</tr>
			<tr>
				<td>運動名稱:</td>
				<td><input type="text" name="exerciseName" readonly="readonly"
					value="${rid.exerciseName}" /></td>
			</tr>
			<tr>
				<td>組數:</td>
				<td><input type="text" name="setCount"
					value="${rid.setCount}" /></td>
			</tr>
			<tr>
				<td>公斤數:</td>
				<td><input type="text" name="setexercisekilloo"
					value="${rid.exercisekilloo}" /></td>
			</tr>
			<tr>
				<td>運動次數:</td>
				<td><input type="text" name="setexerciseTimes"
					value="${rid.exerciseTimes}" /></td>
			</tr>
			<tr>
				<td>休息間隔:</td>
				<td><input type="text" name="setbreakTime"
					value="${rid.breakTime}" /></td>
			</tr>
			
			
			<tr>
			
				<td colspan="2"><input type="submit" name="editok" value="修改"></td>
			</tr>
		</table>
			
	</form>

</body>

</html>

