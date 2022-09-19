<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,tw.group5.model.*"%>
<!DOCTYPE html>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>優惠券查詢</title>
<style>
form{
margin = 0;
padding = 0;
}

h2 {
	text-align: center;
}

fieldset {
	width: 950px;
	border: 1px solid #D1BBFF;
	border-radius: 15px;
	margin: auto;
}

.happy {
	width: 800px;
	margin: 30px auto;
}

.sub {
	width: 500px;
	margin: 15px auto 15px auto;
	text-align: center;
}

.t1 {
	width: 100px;
	float: left;
	text-align: right;
	margin-right: 3px;
}

.st1 {
	margin-bottom: 5px;
}
</style>
</head>

<body>
	<form action="activitymain1.controller" method="post">
		<input type="hidden" name="selec_page" value="voucher">
		<input type="hidden" name="a_account" value="${a_account}">
		<input type="hidden" name="reviseTime" value="${reviseTime}">
		<h2>優惠券資料</h2>

<div class="happy">

		<fieldset>
			
			<div class="st1">
				<label for="voucherNo" class="t1">優惠券編號:</label>
				<label>${query_voucher.voucherNo}</label>
			</div>
			
			<div class="st1">
				<label for="voucherTitle" class="t1">優惠券標題:</label>
				<label>
					${query_voucher.voucherTitle}
				</label>
			</div>

			<div class="st1">
				<label for="date1" class="t1">到期日:</label>
					${query_voucher.expiryTime}
			</div>
			
			<div class="st1">
				<label for="date1" class="t1">負責人:</label>
					${query_voucher.a_account}
			</div>
		</fieldset>

		<fieldset>
			<legend>說明內容</legend>
			<div class="st1">
				<textarea name="voucherContent" readonly style="width:500px;height:200px;resize: none;">${query_voucher.voucherContent}</textarea>
			</div>
			
			<div class="st1">
				<label for="memo" style="float: left; margin: 3px;">圖片:</label> 
				<br>
				<br>
				<img width="400" src='/Path/${query_voucher.photoData}'/>
			</div>
		</fieldset>

	</div>

		<div class="sub">
			<a href="activitymain.controller"><input type="button" value="返回"></a>
		</div>
	</form>
</body>
</html>