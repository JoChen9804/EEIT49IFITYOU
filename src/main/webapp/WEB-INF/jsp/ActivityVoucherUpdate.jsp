<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,tw.group5.model.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<title>優惠券修改</title>
<style>
h2 {
	text-align: center;
}

fieldset {
	width: 500px;
	margin: 15px auto 15px auto;
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
<div class="happy">
	<form:form action="updatevoucher.controller" method="post" enctype="multipart/form-data" modelAttribute="voucher">
		<input type="hidden" name="page" value="voucher">
		<input type="hidden" name="selec_page" value="voucher">
		<form:input type="hidden" path="voucherId" value="${update_voucher.voucherId}"/>
		<form:input type="hidden" path="voucherNo" value="${update_voucher.voucherNo}"/>
		<form:input type="hidden" path="a_account" value="暫空,修改"/>
		<input type="hidden" name="dataId" value="123"/>
		<h2>修改優惠券</h2>

		<fieldset>
			<legend>優惠券資料</legend>
			
			<div class="st1">
				<label for="voucherTitle" class="t1">優惠券標題:</label> <label>
					<form:input type="text" path="voucherTitle" placeholder="voucherTitle" value="${update_voucher.voucherTitle}"/>＊請勿超過15個字
				</label>
			</div>

			<div class="st1">
				<label for="date1" class="t1">到期日:</label> 
				<form:input type="date" path="expiryTime" value="${update_voucher.expiryTime}"/>
			</div>
		</fieldset>

		<fieldset>
			<legend>說明內容</legend>
			<div class="st1">
				<label for="memo" style="float: left; margin: 3px;">內容:</label>
				<form:textarea path="voucherContent" id="t1" cols="70" rows="15"/>
			</div>
			
			<script>
				document.getElementById("t1").value = '${update_voucher.voucherContent}';
			</script>
			
			<div class="st1">
				<label for="memo" style="float: left; margin: 3px;">圖片:</label> 
				<img width="230" src="/Path/${update_voucher.photoData}"/>
			</div>
			
			<input type="hidden" name="oldimg" value="${update_voucher.photoData}"/>
			
			<div class="st1">
			<label for="memo" style="float: left; margin: 3px;">修改圖片:</label>
				<input type="file" name="photo"/>
				<img id="img1" width="230" />
			</div>
		</fieldset>

		<div class="sub">
			<input type="submit"  name="update" value="送出">
			<a href="activitymain.controller"><input type="button" value="返回"></a>
		</div>
	</form:form>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
		<script>
    		$('input').on('change', function(e){      
      		const file = this.files[0];
      		const objectURL = URL.createObjectURL(file);
      
      		$('#img1').attr('src', objectURL);
    		});
  		</script>
</body>
</html>