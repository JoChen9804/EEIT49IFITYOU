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
<title>MAIN MENU</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
 
</head>
<body>
   <%@ include file="../admin/AdminstyleHead.jsp" %>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

 
	<div id="show"></div>

   
    
	<script>
  $(function(){
	var page = `${page}`;
	console.log(page);
	
	if(page=="menuall"){
		
		$('#show').html(`
				<h3  class="h3 mb-2 text-gray-800">目前菜單</h3>
				&emsp;&emsp;&emsp;
				
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
				<thead>
				<tr>
				<th>種類</th>
				<th>運動名稱</th>
				<th>組數</th>
				<th>公斤數</th>
				<th>運動次數</th>
				<th>休息間隔</th>
				<th>修改 刪除</th>
				</tr>
			</thead>
			
			<c:forEach var="mql" items="${menu_queryAll}">
			<tr>
			<td>${mql.part}</td>
			<td>${mql.exerciseName}</td>
			<td>${mql.setCount}</td>
			<td>${mql.exercisekilloo}</td>
			<td>${mql.exerciseTimes}</td>
			<td>${mql.breakTime}</td>
			<td>
			<form action="updateMenuForm.controller" method="post">
				<input type="hidden" name="dataId" value="${mql.id}">
				<input type="submit" name="update" value="修改">
			</form>
			
			<form action="menuDelete.controller" method="get">
				<input type="hidden" name="id" value="${mql.id}">
				<input type="submit" id="delete" name="delete" class="del" value="刪除" />
			</form>
		</td>
		</tr>
		</c:forEach>
		</table>	
		
		<form action="oneallxxmenu.controller" method="post">
		<hidden type="text" class="data" name="complete" id="test1" value="">
		<button type="submit" name="confirm_add" id="menuok" class="" value="">
			<i>看看我的菜單</i>
		</button>
	     </form>
	`);
	}
	
	$('#table_id').dataTable({});
	
    });
    </script>
	<script>
	$(function() {
		$(".del").on('click', function(event){
			event.preventDefault();
			var id = $(this).prev().val();
			console.log("抓取刪除:" + id);
			Swal.fire({
				  title:'確定要刪除'+id+'?',
				  text: '如刪除後不可復原...',
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '確認',
				  cancelButtonText: '取消'
				}).then((result) => {
				  if (result.isConfirmed) {
					  Swal.fire(
						      '刪除成功!',
						      id+'已刪除',
						      'success'
						    ).then((result) => {
				   				 $(this).parent().submit();
						    });
				  }
				});
		});
	})
	</script>
	<%@ include file="../admin/AdminstyleFoot.jsp" %>
	
</body>
</html>