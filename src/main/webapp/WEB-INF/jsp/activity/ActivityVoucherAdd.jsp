<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,tw.group5.model.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title>新增優惠券</title>
<link rel="stylesheet" href="/css/voucherStyle.css">
<script>
 function chkinput(form)
 {
	 
	 let date = new Date();
	 console.log(date.toISOString().split('T')[0]);
	 
    if((form.voucherNo.value).lenth>15){
    	 alert("字數超過限制請重新輸入!");
         form.voucherNo.focus();
    	 return false;
     }else if((form.voucherTitle.value).lenth>15){
    	 alert("字數超過限制請重新輸入!");
         form.voucherTitle.focus();
    	 return false;
     }else if(date.toISOString().split('T')[0] >= form.expiryTime.value){
    	 alert("選擇日期已過請重新選擇!"); 
         form.expiryTime.focus();
         return false;
     }else{
    	 return true;
     }
 }
 </script>
 
</head>

<body>
	<form:form action="addvoucher.controller" method="post" modelAttribute="voucher" enctype="multipart/form-data" onsubmit=" return chkinput(this)">

		<form:input type="hidden" path="a_account" value="暫空"/>

		<div class="happy">
		<fieldset>
			<legend>優惠券資料</legend>
			
			<div class="st1">
				<label for="voucherNo" class="t1">優惠券編號:</label> 
				<form:input type="text" path="voucherNo" id="voucherNo" placeholder="voucherNo" required="required"/>＊請勿超過15個字
			</div>

			<div class="st1">
				<label for="voucherTitle" class="t1">優惠券標題:</label>
				<form:input type="text" path="voucherTitle" id="voucherTitle" placeholder="voucherTitle" required="required"/>＊請勿超過15個字
			</div>

			<div class="st1">
				<label for="date1" class="t1">到期日:</label> 
				<form:input type="date" path="expiryTime" id="expiryTime" required="required"/>
			</div>
			
			<br>

			<div class="st1">
				<label for="memo" style="float: left; margin: 3px;">內容:</label>
				<form:textarea path="voucherContent" id="voucherContent" cols="70" rows="15" required="required"></form:textarea>
			</div>
			
			<div class="st1">
				<label for="memo" style="float: left; margin: 3px;">圖片:</label> 
				<input type="file" name="photo"/>
			</div>
			<img width="400" />
		</fieldset>
		</div>
		
		<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
		
		<script>
    		$('input').on('change', function(e){      
      		const file = this.files[0];
      		const objectURL = URL.createObjectURL(file);
      
      		$('img').attr('src', objectURL);
    		});
  		</script>

		<div class="sub">
			<input type="submit" name="add" value="送出">
			<a href="vouchermain.controller"><input type="button" value="返回"></a>
		</div>
	</form:form>	
</body>
</html>