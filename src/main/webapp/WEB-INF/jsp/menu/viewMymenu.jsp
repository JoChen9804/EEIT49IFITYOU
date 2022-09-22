<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>

<head>
<meta charset="UTF-8">
<title>My building menu</title>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MY CURRENT MENU</title>
<link rel="stylesheet" href="CSS/menuStyle.css">
</head>

<body>

	<h1>MY CURRENT MENU</h1>

	<table border="1" width="90%" class="table table-dark table-hover">
		<tr>
			<th>種類</th>
			<th>運動名稱</th>
			<th>組數</th>
			<th>公斤數</th>
			<th>運動次數</th>
			<th>休息間隔</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>

	<c:forEach var="views" items="${view}"> 
		<tr>
			<td>${views.part}</td>
			<td>${views.exerciseName}</td>
			<td>${views.setCount}</td>
			<td>${views.exercisekilloo}</td>
			<td>${views.exerciseTimes}</td>
			<td>${views.breakTime}</td>

			<td>
				<form action="updateMenu.controller" method="post">
					<input type="hidden" name="editto" value="${views.id}">
					<input type="submit" name="editgo" value="修改">
				</form>
			</td>
			<td>
				<form action="menuDeletebyId.controller" method="get">
					<input type="hidden" name="deleteit" value="${views.id}">
					<input type="submit" name="deletetsubmit" value="刪除">
				</form>
			</td>
		</tr>
</c:forEach>
	</table>

	<br />
	
	
	<h3>Unsure ?</h3>
	<form action="menuBuildup.controller" method="GET">
	<button class=" btn btn-dark">Return back</button>
	</form>
	
	
	
	

</body>

</html>