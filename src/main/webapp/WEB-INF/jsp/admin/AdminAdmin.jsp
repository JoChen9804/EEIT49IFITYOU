<%@page import="java.util.Collections"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理員管理系統</title>
<!-- DataTable 連結 -->
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">

<!--引用css sweet alert-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" />
<!--引用SweetAlert2.js-->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
tr.active {
	background-color: rgb(150, 255, 127)
}
</style>


</head>
<body>
	<%@ include file="AdminstyleHead.jsp" %>
	<!-- JQuery  連結-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
	<!-- Custom scripts for all pages-->
	<!-- DataTable 連結 -->
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>
	<div id="pic"
		style="border: 1; width: 1000; height: 700; background: #FFD9EC; visibility: hidden">
	</div>

	<h4 style="display: inline">管理員資訊</h4>
	&emsp;&emsp;&emsp;

	<form name="AdminNew" id="add" action="AdminNew" method="post"
		class="btn btn-info btn-icon-split">
		<span class="icon text-white-50"> <i class="fas fa-flag"></i>
		</span> <span><input type="submit" value="新增管理員" class="text"
			style="border: none; background-color: #36b9cc; color: white" /></span>
	</form>
	&emsp;&emsp;&emsp;
	<form id="delete" class="btn btn-danger btn-icon-split"
		action="deleteNameAction.controller" method="post">
		<span class="icon text-white-50"> <i class="fas fa-trash"></i></span>
		<span> <input id="del" type="hidden" name=deleteNames> <input
			class="text" type="button" value="批次刪除" id="deleteSubmitCheck"
			style="border: none; background-color: #e74a3b; color: white" /></span>
	</form>
	<br>
	<br>
	<div class="table-responsive">
		<table class="table table-bordered" id="table_id"
			class="compact hover stripe">
			<thead>
				<tr>
					<!-- 欄位標題 -->
					<c:forEach var="title" items="${adminTitleList}">
						<th>${title}</th>
					</c:forEach>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${adminList}">
					<!-- 資料內容 -->
					<tr class="content">
						<td>
							<form class="target" action="modifyAdminNameAction.controller" method="post">
								<input type="hidden" name="modifyId" value="${row.id}" /> <input
									type="hidden" name="modifyAdminPhoto" value="${row.adminPhoto}" />
								<input type="hidden" name="modifyAdminName"
									value="${row.adminName}" /> <input type="hidden"
									name="modifyAdminPwd" value="${row.adminPwd}" /> <input
									type="hidden" name="modifyAuthority" value="${row.authority}" />
								<input type="submit" value="修改"/>
							</form>
						</td>
						<td><input class="delete" type="checkbox" value="刪除"></td>
						<td>${row.id}</td>

						<td><img src="${row.adminPhoto}" height=60 width=75></td>
						<td>${row.adminName}</td>
						<td>*****</td>
						<td><c:choose>
								<c:when test="${row.authority==0}">會員</c:when>
								<c:when test="${row.authority==1}">管理員</c:when>
								<c:when test="${row.authority==2}">高級管理員</c:when>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
		$('#table_id').dataTable({});1

	</script>
	<script src="js/admin/adminDeleteBatch.js"></script>
	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Page level custom scripts -->
	<%@ include file="AdminstyleFoot.jsp"%>
</body>
</html>