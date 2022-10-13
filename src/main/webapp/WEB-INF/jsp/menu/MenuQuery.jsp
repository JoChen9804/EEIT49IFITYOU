<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ALL MY MENU</title>
<script>$('#table_id').dataTable({});</script>

</head>

<body>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

	<div id="show"></div>

	
	<script type="text/javascript">
		
		$(function(){
			
			var page = `${page}`;
			console.log( `${page}`);
			if(page=="queryresult"){
				
				$('#show').html(`
						
						<h3>菜單總覽</h3>
						&emsp;&emsp;&emsp;
						
				  <table id="table_id">
				  <thead>
						<tr>
						<th>菜單ID</th>
						<th>菜單名稱</th>
						
						
				
						<th>查看 刪除</th>
						</tr>
					</thead>
					
						<c:forEach var="mqa" items="${menu_queryAccount}">
						<tr>
						<td>${mqa.menuSet}</td>
						
						
						<td>
						
						<form action="/oneallxxmenu.controller" method="GET">
						<input type="hidden" name="menuTitle" class="menuTitle" value="${mqa.menuTitle}">
						<input type="submit" name="trans" value="查看">
					    </form>
						
					   
						
						</td>
						</tr>
						</c:forEach>
		                
						 
						</table>
				
				
						`)
			
			}	
		    })

		
		
		</script>
<%@ include file="../admin/AdminstyleFoot.jsp" %>

</body>
</html>