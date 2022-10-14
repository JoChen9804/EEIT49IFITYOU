<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢地點</title>
	<!--   official Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
		
    <!-- Custom styles for this page -->
    <link href="/group5/css/dataTables.bootstrap4.min.css" rel="stylesheet">
	<script src="/group5/js/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Core plugin JavaScript-->
    <script src="/group5/js/jquery.easing.min.js"></script>

	
    <!-- Page level plugins -->
    <script src="/group5/js/jquery.dataTables.min.js"></script>
    <script src="/group5/js/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/group5/js/datatables-demo.js"></script>

</head>
<body>
<%@ include file="../admin/AdminstyleHead.jsp" %>
	<div class="container-fluid">		
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">成功配對之會員名單</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>會員1帳號</th>
								<th>會員2帳號</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>會員1帳號</th>
								<th>會員2帳號</th>
							</tr>
						</tfoot>
						<tbody id="maintbody">
						<c:forEach var="plog" items="${allSP}">	
							<tr>
								<td>${plog.mainPd.member.memberAccount}</td>
								<td>${plog.pairPd.member.memberAccount}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->
	
<%@ include file="../admin/AdminstyleFoot.jsp" %>	
    
</body>
</html>