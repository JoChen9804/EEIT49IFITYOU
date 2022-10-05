<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="tw.group5.activity.model.*"%>
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
<title>新增確認</title>
<link rel="stylesheet" href="/group5/css/voucherStyle.css">

<link href="/group5/css/bootstrap.css" rel="stylesheet">
<link href="/group5/css/fontawesome-all.css" rel="stylesheet">
<link href="/group5/css/swiper.css" rel="stylesheet">
<link href="/group5/css/magnific-popup.css" rel="stylesheet">
<link href="/group5/css/styles.css" rel="stylesheet">

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>

	<%@ include file="../admin/AdminstyleHead.jsp" %>

	<!-- JQuery  連結-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- DataTable 連結 -->
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>
	<script src="/group5/js/dataTables.bootstrap4.min.js"></script>
	
	<!-- sweetalert2   連結-->
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

	<h1 style="text-align: left">活動詳細資料確認</h1>
	
	<!-- Details -->
    <div id="details" class="basic-1" style="padding-top: 2.5rem; padding-bottom: 2.5rem;">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="text-container">
                        <form action="/group5/user/signupadd.controller" method="post" >
                        <ul class="list-unstyled li-space-lg">
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
										活動名稱:
										<c:choose>
											<c:when test="${upd}">${update_activity.activityTitle}</c:when>
											<c:when test="${query}">${query_activity.activityTitle}</c:when>
											<c:otherwise>${add_activity.activityTitle}</c:otherwise>
										</c:choose>
									</div>
								</li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
                               		活動類型:
										<c:choose>
											<c:when test="${upd}">${update_activity.typeContent}</c:when>
											<c:when test="${query}">${query_activity.typeContent}</c:when>
											<c:otherwise>${add_activity.typeContent}</c:otherwise>
										</c:choose>
									</div>
                            </li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
										主辦方:
										<c:choose>
											<c:when test="${upd}">${update_activity.holder}</c:when>
											<c:when test="${query}">${query_activity.holder}</c:when>
											<c:otherwise>${add_activity.holder}</c:otherwise>
										</c:choose>
									</div>
                            </li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
										活動地點:
										<c:choose>
											<c:when test="${upd}">${update_activity.location}</c:when>
											<c:when test="${query}">${query_activity.location}</c:when>
											<c:otherwise>${add_activity.location}</c:otherwise>
										</c:choose>
									</div>
                            </li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
										活動開始日:
										<c:choose>
											<c:when test="${upd}">${update_activity.startTime}</c:when>
											<c:when test="${query}">${query_activity.startTime}</c:when>
											<c:otherwise>${add_activity.startTime}</c:otherwise>
										</c:choose>
									</div>
                            </li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
									活動結束日:
									<c:choose>
										<c:when test="${upd}">${update_activity.endTime}</c:when>
										<c:when test="${query}">${query_activity.endTime}</c:when>
										<c:otherwise>${add_activity.endTime}</c:otherwise>
									</c:choose>
								</div>
							</li>
							<li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
									活動內容:
									<br>
									<c:choose>
										<c:when test="${upd}">${update_activity.activityContent}</c:when>
										<c:when test="${query}">${query_activity.activityContent}</c:when>
										<c:otherwise>${add_activity.activityContent}</c:otherwise>
									</c:choose>
								</div>
							</li>
                        </ul>
                        </form>
                       
                    </div> <!-- end of text-container -->
                </div> <!-- end of col -->
                <div class="col-lg-6" style="align-items: center; display: flex;">
                    <div class="image-container">
                    <img width="600" src='/Path/<c:choose>
										<c:when test="${upd}">${update_activity.photoData}</c:when>
										<c:when test="${query}">${query_activity.photoData}</c:when>
										<c:otherwise>${add_activity.photoData}</c:otherwise>
									</c:choose>' />
					</div> <!-- end of image-container -->
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of basic-1 -->
    <!-- end of details -->
    
    <div id="showSignUp">
    <hr>
    <h1 style="text-align: left">報名名單</h1>
    <br>
    <div id= "tableVal">

			<table class="table table-bordered" id="table_id" class="compact hover stripe">
				<thead>
					<tr>
						<th>報名序號</th>
						<th>報名帳號</th>
						<th>報名姓名</th>
						<th style="width: 250px">email</th>
						<th>連絡電話</th>
						<th style="width: 250px">報名時間</th>
						<th style="width: 70px">操作</th>
					</tr>
				</thead>
				<tbody id="dt"></tbody>
			</table>
		</div>
	</div>

	<form action="activitymain.controller" method="get">
		<div class="sub">
			<input type="submit" class="btn-solid-reg page-scroll" value="返回查詢">
		</div>
	</form>
	
	<script type="text/javascript">
		$(function() {
			
			$('#forColor').attr('style', 'background-color:white' );
			
			reloadTable("${query_activity.activityId}");
			
			//if("${notShowSignUp}"){
			//	$('#showSignUp').attr('style', 'display:none' );
			//};
			
			$(document).on('click','.del', function(){
				
				console.log("抓刪除健");
				
				var id = $(this).prev().val();
				var activityId = ${query_activity.activityId};
				console.log("抓取刪除:" + id);
				console.log("抓取活動:" + activityId);
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
						  
						  $.ajax({
								type: "post",
								url: "/group5/admin/signupdelete.controller",
								data: id,
								contentType: "application/json",
								success: function(){
									console.log("delete signUp success");
									$('#table_id').DataTable().destroy();
									reloadTable(activityId);
									Swal.fire({
										      title:'刪除成功!',
										      text:'已刪除',
										      icon:'success',
											  confirmButtonColor: '#3085d6',
											  cancelButtonColor: '#d33',
											  confirmButtonText: '確定',
									});
								},
								error: function(){
									console.log("delete signUp error");
									Swal.fire(
										      '刪除失敗!',
										      '請在試一次',
										      'error'
										    ).then((result) => {
										    	reloadTable(id);
										    });
								}
							
							});
					  }
					});
			});
		});
		
		function reloadTable(id) {
			$("#dt").empty();
			var table ='';
			console.log("測試有沒有進來");
			$.ajax({
				type: "post",
				url: "/group5/admin/queryactivityajax.controller/"+id,
				data:[],
				contentType: "application/json",
				success: function(data){
					console.log(data);
					data.forEach(element => table+='<tr><td>'+element.signUpId+'</td><td>'+element.memberId+'</td><td>'+element.memberName+'</td><td>'+element.email+'</td><td>'+element.phone+'</td><td>'+element.signUpTime+'</td><td><input type="hidden" name="dataId" value="'+element.signUpId+'" id="dd" /><input type="button" name="delete" value="刪除" class="del btn btn-outline-danger " /></td></tr>');
					$('#dt').html(table);
					$('#table_id').DataTable({'bAutoWidth' : false});
				},
				error: function(){
					console.log("reload showSignUp error");
					Swal.fire(
						      'reload!',
						      '請再試一次',
						      'error'
						    );
				}
				
			});
			
		}
		
	</script>
	
	<%@ include file="../admin/AdminstyleFoot.jsp"%>
	
</body>
</html>