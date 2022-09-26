<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>優惠券總覽</title>
<style>

input {
	margin: 3px;
}

.box {
	height: 400px;
	width: auto;
	overflow: auto;
}
</style>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

	<%@ include file="../admin/AdminstyleHead.jsp" %>

	<!-- JQuery  連結-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- DataTable 連結 -->
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>

	<!-- sweetalert2   連結-->
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
	
	<!-- fontawesome 連結 -->
	<script src="https://kit.fontawesome.com/5b36a12f3a.js" crossorigin="anonymous"></script>

	<div id="show"></div>
	
	<script>
	$(function() {
		var page = `${page}`;
		console.log(page);
		
		if(page=="voucher"){
			
			$('#show').html(`
				<H2 style="display: inline">優惠券總覽</H2>
				&emsp;&emsp;&emsp;
				<form id="add" action="addvoucher.controller" enctype="multipart/form-data" method="post" class="btn btn-info btn-icon-split">
					<span class="icon text-white-50"> <i class="fas fa-flag"></i></span>
					<input type="submit" name="add" value="新增" class="text" style="border: none; background-color: #36b9cc; color: white"/>
				</form>
				<table class="table table-bordered" id="table_id" class="compact hover stripe" style="border:none">
					<thead>
						<tr>
							<th style="width: 65px">持有會員</th>
							<th>優惠券號</th>
							<th>優惠券名</th>
							<th>到期日</th>
							<th>負責管理員</th>
							<th>最後修改時間</th>
							<th style="width: 170px">操作</th>
						</tr>
					</thead>
					<c:forEach var="vqa" items="${voucher_queryAll}">
						<tr>
							<td>
								<center>
								<form ACTION="promotionsmain.controller" method="post" >
									<input type="hidden" name="dataId" value="${vqa.voucherId}" />
									<input type="submit" name="query" value="編輯" class="btn btn-outline-primary " />
								</form>
								</center>
							</td>
							<td>${vqa.voucherNo}</td>
							<td>${vqa.voucherTitle}</td>
							<td>${vqa.expiryTime}</td>
							<td>${vqa.a_account}</td>
							<td>${vqa.reviseTime}</td>
							<td>
								<form ACTION="queryvoucher.controller" method="post" style="float: left; margin-left: 3px" >
									<input type="hidden" name="dataId" value="${vqa.voucherId}" />
									<input type="submit" name="query" value="查看" class="btn btn-outline-info " />
								</form> 
								<form ACTION="updatevoucher.controller" method="post" enctype="multipart/form-data" style="float: left; margin-left: 3px">
									<input type="hidden" name="dataId" value="${vqa.voucherId}" />
									<input type="submit" name="update" value="修改" class="btn btn-outline-secondary " />
								</form> 
								<form ACTION="deletevoucher.controller" method="post" style="float: left; margin-left: 3px">
									<input type="hidden" name="dataId" value="${vqa.voucherId}" />
									<input type="hidden" name="voucherTitle" value="${vqa.voucherTitle}" />
									<input type="submit" id="delete" name="delete" value="刪除" class="del btn btn-outline-danger " />
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
			`);
			
		}else if(page=="activity"){
			
			$('#show').append(`
				<H2 style="display: inline">活動總覽</H2>
				&emsp;&emsp;&emsp;
				<form id="add" action="addactivity.controller" enctype="multipart/form-data" method="post" class="btn btn-info btn-icon-split">
					<span class="icon text-white-50"> <i class="fas fa-flag"></i></span>
					<input type="submit" name="add" value="新增" class="text" style="border: none; background-color: #36b9cc; color: white"/>
				</form>
				<table class="table table-bordered" id="table_id" class="compact hover stripe">
					<thead>
						<tr>
							<th>活動名稱</th>
							<th style="width:80px">活動類型</th>
							<th>活動時間</th>
							<th>主辦方</th>
							<th>負責管理員</th>
							<th>最後修改時間</th>
							<th style="width: 170px">操作</th>
						</tr>
					</thead>
					<c:forEach var="aqa" items="${activity_queryAll}">
						<tr>
							<td>${aqa.activityTitle}</td>
							<td>${aqa.typeContent}</td>
							<td>${aqa.startTime}<br>~${aqa.endTime}</td>
							<td>${aqa.holder}</td>
							<td>${aqa.a_account}</td>
							<td>${aqa.reviseTime}</td>
							<td>
								<form ACTION="queryactivity.controller" method="post" style="float: left; margin-left: 3px" >
									<input type="hidden" name="dataId" value="${aqa.activityId}" />
									<input type="submit" name="query" value="查看" class="btn btn-outline-info " />
								</form> 
								<form ACTION="updateactivity.controller" method="post" enctype="multipart/form-data" style="float: left; margin-left: 3px">
									<input type="hidden" name="dataId" value="${aqa.activityId}" />
									<input type="submit" name="update" value="修改" class="btn btn-outline-secondary " />
								</form> 
								<form ACTION="deleteactivity.controller" name="ddeell" method="post" style="float: left; margin-left: 3px">
									<input type="hidden" name="dataId" value="${aqa.activityId}" id="dd" />
									<input type="hidden" name="voucherTitle" value="${aqa.activityTitle}" />
									<input type="submit" id="delete" name="delete" value="刪除" class="del btn btn-outline-danger "/>
								</form>
								
							</td>
						</tr>
					</c:forEach>
				</table>
			`);
		}
		
		$('#table_id').dataTable({'bAutoWidth': false});
		
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
	
	<%@ include file="../admin/AdminstyleFoot.jsp"%>
	
</body>
</html>