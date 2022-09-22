<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*,tw.group5.activity.model.*"%>
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
<title>動作資訊修改</title>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

<form:form action="updateMenuForm.controller" method="post" enctype="multipart/form-data" modelAttribute="menu">

<h3>動作資訊修改</h3>

<fieldset>
           <div class="st1">
				<label class="t1">種類:</label> 
				<label>
					<form:input type="text" id="part" path="part" value="${update_menu.part}" class="need"/>＊
				</label>
			</div>
			
			<div class="st1">
				<label class="t1">運動名稱:</label> <label>
					<form:input type="text" id="exerciseName" path="exerciseName" value="${update_menu.exerciseName}" class="need"/>＊
				</label>
			</div>
			
			<div class="st1">
				<label class="t1">組數:</label> <label>
					<form:input type="text" id="setCount" path="setCount" value="${update_menu.setCount}" class="need"/>＊
				</label>
			</div>
			
			<div class="st1">
				<label class="t1">公斤數:</label> <label>
					<form:input type="text" id="exercisekilloo" path="exercisekilloo" value="${update_menu.exercisekilloo}" class="need"/>＊
				</label>
			</div>

			<div class="st1">
				<label class="t1">運動次數:</label> 
				<form:input type="date" id="exerciseTimes" path="exerciseTimes" value="${update_menu.exerciseTimes}" class="need"/>＊
			</div>
			
			<div class="st1">
				<label class="t1">休息間隔:</label> 
				<form:input type="date" id="breakTime" path="breakTime" value="${update_menu.breakTime}" />
			</div>
   </fieldset>
   	<div class="sub">
			<input type="button" class="update1" value="送出">
			<input type="hidden" name="update" value="送出">
			<a href="mainmenu.controller"><input type="button" value="返回"></a>
		</div>
		<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
		
		<script>
    	
    		$(".update1").on('click', function(event){
    			var rs = false;
        		$(".need").each(function(){
        			if($(this).val()==""){
       
            			Swal.fire({
        					title:'尚有資訊未填',
        					text:'請檢查＊號欄位是否有漏',
        					icon:'warning'
        				});
        		   		rs = true;
            		}
        		});
        		if(rs)return;
        		
				Swal.fire({
					  title:'確定要修改?',
					  icon: 'question',
					  cancelButtonText: '取消',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText:'確定'
					}).then((result) => {
					  if (result.isConfirmed) {
						  Swal.fire({
							  title:'修改成功!',
							  icon:'success'
						  }).then((result) => {
					   				 $(this).parent().parent().submit();
							});
					  }
					});
			});
  		</script>
</form:form>

</body>
</html>