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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
	<form:form action="addactivity.controller" method="post" modelAttribute="activity" enctype="multipart/form-data">

		<form:input type="hidden" path="a_account" value="暫空"/>

		<div class="happy">
		<fieldset>
			<legend>活動資料</legend>
			
			<div class="st1">
				<label class="t1">活動名稱:</label> 
				<form:input type="text" path="activityTitle" placeholder="activityTitle" class="need"/>＊請勿超過20個字
			</div>
			
			<div class="st1">
				<label class="t1">活動類型:</label>
				<form:input type="text" path="typeContent" placeholder="typeContent" class="need"/>＊
			</div>
			
			<div class="st1">
				<label class="t1">主辦方:</label>
				<form:input type="text" path="holder" placeholder="holder" class="need"/>＊
			</div>
			
			<div class="st1">
				<label class="t1">活動地點:</label>
				<form:input type="text" path="location" placeholder="location" class="need"/>＊
			</div>
			
			<div class="st1">
				<label class="t1">活動開始日:</label> 
				<form:input type="date" path="startTime" id="startTime" class="need"/>＊
			</div>
			
			<div class="st1">
				<label class="t1">活動結束日:</label> 
				<form:input type="date" path="endTime" id="endTime" class="need"/>＊
			</div>
			
			<br>

			<div class="st1">
				<label style="float: left; margin: 3px;">活動內容:</label>
				<form:textarea path="activityContent" id="activityContent" cols="70" rows="15" class="need"></form:textarea>
			</div>
			
			<div class="st1">
				<label for="memo" style="float: left; margin: 3px;">圖片:</label> 
				<input type="file" id="ff" name="photo"/>
			</div>
			<img width="400" />
		</fieldset>
		</div>
		
		<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
		
		<script>
    		$('#ff').on('change', function(e){      
      		const file = this.files[0];
      		const objectURL = URL.createObjectURL(file);
  		</script>

		<div class="sub">
			<input type="button" id="add" value="送出">
			<input type="hidden" name="add" value="送出">
			<a href="activitymain.controller"><input type="button" value="返回"></a>
		</div>
	</form:form>
	
	<script type="text/javascript">    		
    	$("#add").on('click', function(event){
			
    		if($(".need").val()==""){
	    		console.log('檢查到欄位有空值!');
    			Swal.fire({
					title:'資料不完整',
					text:'請檢查＊號欄位是否都有填入',
					icon:'warning'
				});
		   		return;
    		}
    		
    		let date = new Date();
			if(date.toISOString().split('T')[0] >= $('#endTime').val()){
				Swal.fire({
					title:'日期錯誤',
					text:'結束日期已過請重新選擇',
					icon:'warning'
				})
		   		return;
		    }
			if($('#startTime').val() >= $('#endTime').val()){
				Swal.fire({
					title:'日期錯誤',
					text:'開始日期大於結束日期',
					icon:'warning'
				})
		   		return;
		    }
			$(this).parent().parent().submit();
    	});
	</script>
</body>
</html>