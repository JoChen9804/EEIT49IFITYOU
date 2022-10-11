<%@page import="java.util.Collections"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理員管理系統</title>
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

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">
<!-- RWD CSS連結 -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/responsive/2.2.9/css/responsive.dataTables.min.css">
</head>
<body>
	<%@ include file="AdminstyleHead.jsp"%>
	<!-- JQuery  連結-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- DataTable 連結 -->
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>

	<!-- RWD Javascript連結 -->
	<script
		src="https://cdn.datatables.net/responsive/2.2.9/js/dataTables.responsive.min.js"></script>

	<div id="pic"
		style="border: 1; width: 1000; height: 700; background: #FFD9EC; visibility: hidden">
	</div>

	<h4 style="display: inline">會員資訊</h4>
	&emsp;&emsp;&emsp;

	<form name="AdminMemberNew" id="add" action="AdminMemberNew"
		method="post" class="btn btn-info btn-icon-split">
		<span class="icon text-white-50"> <i class="fas fa-flag"></i>
		</span> <span><input type="submit" value="新增會員" class="text"
			style="border: none; background-color: #36b9cc; color: white" /></span>
	</form>
	&emsp;&emsp;&emsp;
	<form id="delete" class="btn btn-danger btn-icon-split"
		action="deleteMemberNameAction.controller" method="post">
		<span class="icon text-white-50"> <i class="fas fa-trash"></i></span>
		<span> <input id="del" type="hidden" name=deleteNames> <input
			class="text" type="button" value="批次刪除" id="deleteSubmitCheck"
			style="border: none; background-color: #e74a3b; color: white" /></span>
	</form>
	<br>
	<br>
	<div class="table-responsive">
		<table class="table table-bordered" id="table_id"
			class="compact hover stripe responsive">
			<thead>
				<tr>
					<th>顯示</th>
					<!-- 欄位標題 -->
					<c:forEach var="title" items="${memberTitleList}">
						<th>${title}</th>
					</c:forEach>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${MemberList}">
					<!-- 資料內容 -->
					<tr class="content">
						<td></td>
						<td>
							<form class="md" action="modifyMemberNameAction.controller" method="post">
								<input class="modify" type="hidden" name="modifyId" value="${row.id}"> <input
									type="submit" value="修改" />
							</form>
						</td>
						<td><input class="delete" type="checkbox" value="刪除"></td>
						<td><c:choose>
								<c:when test="${row.authority==0}">正常</c:when>
								<c:when test="${row.authority==99}">未開通</c:when>
							</c:choose></td>
						<td>${row.id}</td>
						<td><img src="${row.memberPhoto}" height=60 width=75></td>
						<td>${row.memberAccount}</td>
						<td>****</td>
						<td>${row.memberName}</td>
						<td>${row.email}</td>
						<td>${row.memberDetail.gender}</td>
						<td>${row.memberDetail.birthday}</td>
						<td>${row.memberDetail.cellphone}</td>
						<td>${row.memberDetail.postalCode}</td>
						<td>${row.memberDetail.memberAddress}</td>
						<td>${row.memberDetail.referralCode}</td>
						<td>${row.memberDetail.registerReferralCode}</td>
						<td><c:choose>
								<c:when test="${row.memberDetail.mute==0}">無</c:when>
								<c:when test="${row.memberDetail.mute==1}">禁言中</c:when>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${row.memberDetail.pairWilling==0}">無</c:when>
								<c:when test="${row.memberDetail.pairWilling==1}">有</c:when>
							</c:choose></td>
						<td>${row.memberDetail.createDate}</td>
						<td>${row.memberDetail.recentLoginDate}</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
		$('#table_id').dataTable({
			responsive: {
		        details: {
		            type: 'column'
		        }
		    },
		    columnDefs: [ {
		        className: 'dtr-control',
		        orderable: false,
		        targets:   0
		    } ],
		   
		} );
	</script>
	<script src="js/admin/adminDeleteBatch.js"></script>
	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<!-- Page level custom scripts -->
	<%@ include file="AdminstyleFoot.jsp"%>
</body>
</html>