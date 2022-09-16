<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="tw.group5.model.*, java.util.*"%>
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
table {
	border: 1px solid gray;
	border-collapse: collapse
}

td, th {
	width: 175px;
	border: 1px solid gray;
	border-collapse: collapse
}

input {
	margin: 3px;
}

.box {
	height: 400px;
	width: auto;
	overflow: auto;
}
</style>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<!-- JQuery  連結-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- DataTable 連結 -->
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>

	<!-- sweetalert2   連結-->
	
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

	<H2 style="display: inline">優惠券總覽</H2>
	&emsp;&emsp;&emsp;

	<form name="AdminNew" id="add" action="addvoucher.controller" enctype="multipart/form-data" method="post" class="btn btn-info btn-icon-split">
		<input type="hidden" name="page" value="voucher">
		<span class="icon text-white-50"> <i class="fas fa-flag"></i></span>
		<input type="submit" name="add" value="新增" class="text" style="border: none; background-color: #36b9cc; color: white"/>
	</form>

	<table id="table_id">
		<thead>
			<tr>
				<th>優惠券號</th>
				<th>優惠券名</th>
				<th>到期日</th>
				<th>負責管理員</th>
				<th>最後修改時間</th>
				<th>操作</th>
			</tr>
		</thead>
		<%
		@SuppressWarnings("unchecked")
		List<ActivityVoucher> voucher = (List<ActivityVoucher>) request.getAttribute("voucher_queryAll");
		for (ActivityVoucher v : voucher) {
		%>
		<tr>
			<td><%=v.getVoucherNo()%></td>
			<td><%=v.getVoucherTitle()%></td>
			<td><%=v.getExpiryTime()%></td>
			<td><%=v.getA_account()%></td>
			<td><%=v.getReviseTime()%></td>

			<td>
				<form ACTION="queryvoucher.controller" method="post" style="float: left; " >
					<input type="hidden" name="page" value="voucher" />
					<input type="hidden" name="dataId" value="<%=v.getVoucherId()%>" />
					<input type="submit" name="query" value="查看內文" />
				</form> 
				<form ACTION="updatevoucher.controller" method="post" enctype="multipart/form-data" style="float: left;">
					<input type="hidden" name="page" value="voucher" />
					<input type="hidden" name="dataId" value="<%=v.getVoucherId()%>" />
					<input type="submit" name="update" value="修改" />
				</form> 
				<form ACTION="deletevoucher.controller" method="post" onsubmit="return deleteConfirm(this)">
					<input type="hidden" name="page" value="voucher" />
					<input type="hidden" name="dataId" value="<%=v.getVoucherId()%>" id="dd" />
					<input type="submit" id="delete" name="delete" value="刪除" />
				</form>
			</td>
		</tr>
		<%
		}
		%>
	</table>
	<script>$('#table_id').dataTable({});</script>

	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
	<script src="sweetalert2.all.min.js"></script>


	<script>
	
	function deleteConfirm(form){
		var id = $("#dd").val();
		Swal.fire({
			  title: 'Are you sure?',
			  text: " delete voucher : "+id,
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
			  if (result.isConfirmed) {
			    form.submit();
			  }
			});
				return false;
	}
			
	</script>
</body>
</html>