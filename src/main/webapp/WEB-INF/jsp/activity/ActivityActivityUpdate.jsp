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
<link rel="stylesheet" href="/css/voucherStyle.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>

	<!-- JQuery  連結-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<!-- sweetalert2   連結-->
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

<div class="happy">
	<form:form action="updateactivity.controller" method="post" enctype="multipart/form-data" modelAttribute="activity">
		<form:input type="hidden" path="activityId" value="${update_activty.activityId}"/>
		<form:input type="hidden" path="a_account" value="暫空,修改"/>
		<input type="hidden" name="dataId" value="123"/>
		<h2>修改優惠券</h2>

		<fieldset>
			<legend>活動資料</legend>
			
			<div class="st1">
				<label class="t1">活動名稱:</label> <label>
					<form:input type="text" id="activityTitle" path="activityTitle" value="${update_activity.activityTitle}"/>
				</label>
			</div>
			
			<div class="st1">
				<label class="t1">活動類型:</label> <label>
					<form:input type="text" id="typeContent" path="typeContent" value="${update_activity.typeContent}"/>
				</label>
			</div>
			
			<div class="st1">
				<label class="t1">主辦方:</label> <label>
					<form:input type="text" id="holder" path="holder" value="${update_activity.holder}"/>
				</label>
			</div>
			
			<div class="st1">
				<label class="t1">活動地點:</label> <label>
					<form:input type="text" id="location" path="location" value="${update_activity.location}"/>
				</label>
			</div>

			<div class="st1">
				<label class="t1">活動開始日:</label> 
				<form:input type="date" id="startTime" path="startTime" value="${update_activity.startTime}"/>
			</div>
			
			<div class="st1">
				<label class="t1">活動結束日:</label> 
				<form:input type="date" id="endTime" path="endTime" value="${update_activity.endTime}"/>
			</div>
		</fieldset>

		<fieldset>
			<legend>說明內容</legend>
			<div class="st1">
				<label style="float: left; margin: 3px;">活動內容:</label>
				<form:textarea path="activityContent" id="t1" cols="70" rows="15"/>
			</div>
			
			<script>
				document.getElementById("t1").value = '${update_activity.activityContent}';
			</script>
			
			<div class="st1">
				<label style="float: left; margin: 3px;">圖片:</label> 
				<img width="230" src="/Path/${update_activity.photoData}"/>
			</div>
			
			<input type="hidden" name="oldimg" value="${update_activity.photoData}"/>
			
			<div class="st1">
			<label style="float: left; margin: 3px;">修改圖片:</label>
				<input type="file" name="photo"/>
				<img id="img1" width="230" />
			</div>
		</fieldset>

		<div class="sub">
			<input type="submit" class="upd" name="update" value="送出">
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
    		
    		$(".upd").on('click', function(event){
				event.preventDefault();
				Swal.fire({
					  title:'確定要修改此筆資料?',
					  text:'活動:'+$('#activityTitle').val(),
					  icon: 'question',
					  cancelButtonText: '取消',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText:'確定'
					}).then((result) => {
					  if (result.isConfirmed) {
						  Swal.fire(
							      '修改成功!'
							    ).then((result) => {
					   				 $(this).parent().parent().submit();
							    });
					  }
					});
			});
  		</script>
</body>
</html>