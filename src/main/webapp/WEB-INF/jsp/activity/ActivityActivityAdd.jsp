<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>新增活動</title>
<link rel="stylesheet" href="/css/voucherStyle.css">
<script type="text/javascript">
function chkinput(form)
{
	 
	 let date = new Date();
	 console.log(date.toISOString().split('T')[0]);
	 
   	if(date.toISOString().split('T')[0] >= form.endTime.value){
   	 alert("活動結束日請重新選擇!"); 
        form.expiryTime.focus();
        return false;
    }else{
   	 return true;
    }
}
</script>
</head>
<body>
	<form:form action="addactivity.controller" method="post" modelAttribute="activity" enctype="multipart/form-data">

		<form:input type="hidden" path="a_account" value="暫空"/>

		<div class="happy">
		<fieldset>
			<legend>活動資料</legend>
			
			<div class="st1">
				<label class="t1">活動名稱:</label> 
				<form:input type="text" path="activityTitle" placeholder="activityTitle" required="required"/>＊請勿超過20個字
			</div>
			
			<div class="st1">
				<label class="t1">活動類型:</label>
				<form:input type="text" path="typeContent" placeholder="typeContent" required="required"/>
			</div>
			
			<div class="st1">
				<label class="t1">主辦方:</label>
				<form:input type="text" path="holder" placeholder="holder" required="required"/>
			</div>
			
			<div class="st1">
				<label class="t1">活動地點:</label>
				<form:input type="text" path="location" placeholder="location" required="required"/>
			</div>
			
			<div class="st1">
				<label class="t1">活動開始日:</label> 
				<form:input type="date" path="startTime" id="startTime" required="required"/>
			</div>
			
			<div class="st1">
				<label class="t1">活動結束日:</label> 
				<form:input type="date" path="endTime" id="endTime" required="required"/>
			</div>
			
			<br>

			<div class="st1">
				<label style="float: left; margin: 3px;">活動內容:</label>
				<form:textarea path="activityContent" id="activityContent" cols="70" rows="15" required="required"></form:textarea>
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
			<a href="activitymain.controller"><input type="button" value="返回"></a>
		</div>
	</form:form>
</body>
</html>