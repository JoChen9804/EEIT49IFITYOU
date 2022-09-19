<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tw.group5.model.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>新增優惠券確認</title>
<style>
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
	<h2>資料如下請確認</h2>
	<form action="activitymain.controller" method="get">
		<input type="hidden" name="selec_page" value="voucher">

		<fieldset>
			<legend>優惠券資料</legend>
			<div class="st1">
				<label for="voucherNo" class="t1">優惠券編號:</label>
				<c:choose>
						<c:when test="${upd}">${update_voucher.voucherNo}</c:when>
						<c:otherwise>${add_voucher.voucherNo}</c:otherwise>
				</c:choose>
			</div>

			<div class="st1">
				<label for="voucherTitle" class="t1">優惠券標題:</label> <label>
					<c:choose>
						<c:when test="${upd}">${update_voucher.voucherTitle}</c:when>
						<c:otherwise>${add_voucher.voucherTitle}</c:otherwise>
					</c:choose>
				</label>
			</div>

			<div class="st1">
				<label for="date1" class="t1">到期日:</label>
				<c:choose>
					<c:when test="${upd}">${update_voucher.expiryTime}</c:when>
					<c:otherwise>${add_voucher.expiryTime}</c:otherwise>
				</c:choose>
			</div>
		</fieldset>

		<fieldset>
			<legend>說明內容</legend>

				<label for="memo" style="float: left; margin: 3px;">內容:</label>
			<div class="st1">
				<br>
				<c:choose>
					<c:when test="${upd}">${update_voucher.voucherContent}</c:when>
					<c:otherwise>${add_voucher.voucherContent}</c:otherwise>
				</c:choose>
			</div>
			
			<div class="st1">
				<label for="memo" style="float: left; margin: 3px;">圖片:</label> 
				<br>
				<br>
				<img width="400" src='/Path/<c:choose>
					<c:when test="${upd}">${update_voucher.photoData}</c:when>
					<c:otherwise>${add_voucher.photoData}</c:otherwise>
				</c:choose>' />
			</div>
			
		</fieldset>
		
		<div class="sub">
			<input type="submit" value="返回查詢">
		</div>
	</form>
</body>
</html>