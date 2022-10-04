<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

input {
	margin: 3px;
}

.box {
	height: 400px;
	width: auto;
	overflow: auto;
}
</style>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">
<link rel="stylesheet" href="/group5/css/voucherStyle.css">
</head>
<body>

	<%@ include file="../admin/AdminstyleHead.jsp" %>

	<!-- JQuery  連結-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- official Bootstrap-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
	
	<!-- DataTable 連結 -->
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>

	<!-- sweetalert2   連結-->
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
	
	<!-- fontawesome 連結 -->
	<script src="https://kit.fontawesome.com/5b36a12f3a.js" crossorigin="anonymous"></script>

	<div id="show"></div>
	
	<script>
	$(function() {
		var page = `${page}`;
		console.log(page);
		
		if(page=="voucher"){
			
			$('#show').html(`
				<H2 style="display: inline">優惠券總覽</H2>
				&emsp;&emsp;&emsp;
				<button type="button" onclick="randomVoucher()" data-bs-toggle="modal" data-bs-target="#btnEdit" class=" btn btn-info btn-icon-split" style="border: none; background-color: #36b9cc; color: white">新增</button>
				<table class="table table-bordered" id="table_id" class="compact hover stripe" style="border:none">
					<thead>
						<tr>
							<th>優惠券號</th>
							<th>折數</th>
							<th>到期日</th>
							<th>負責管理員</th>
							<th>最後修改時間</th>
							<th style="width: 65px">操作</th>
						</tr>
					</thead>
					<c:forEach var="vqa" items="${voucher_queryAll}">
						<tr>
							<td>${vqa.voucherNo}</td>
							<td>${vqa.voucherTitle}%</td>
							<td>${vqa.expiryTime}</td>
							<td>${vqa.a_account}</td>
							<td>${vqa.reviseTime}</td>
							<td>
								<form ACTION="deletevoucher.controller" method="post" style="float: left; margin-left: 3px">
									<input type="hidden" name="dataId" value="${vqa.voucherId}" />
									<input type="hidden" name="voucherTitle" value="${vqa.voucherNo}" />
									<input type="submit" id="delete" name="delete" value="刪除" class="del btn btn-outline-danger " />
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
				
				<!-- Modal -->
				<div class="modal fade" id="btnEdit" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered">
			    		<div class="modal-content">
			     			<div class="modal-header">
			        			<h5 class="modal-title" id="exampleModalLabel">新增優惠券 : <span id="voucherNo"></span></h5>
			        			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      			</div>
			      			<div class="modal-body">
			      				
			      				<div style="display: inline">
									<label for="voucherTitle">優惠券折數:</label>
									<select name="voucherTitle" id="voucherTitle" >
										<option disabled selected style="display:none">請選擇</option>
			                			<option value="95">95折</option>
			               	 			<option value="90">9折</option>
			               	 			<option value="85">85折</option>
			                			<option value="80">8折</option>
			                			<option value="70">7折</option>
			                			<option value="60">6折</option>
			                			<option value="50">5折</option>
			            			</select>
			            		</div>
			            		
			            		&emsp;&emsp;
			            		
								<div style="display: inline">
									<label for="date1" >到期日:</label> 
									<input type="date" name="expiryTime" id="expiryTime" />
								</div>
								
								<input type="hidden" id="a_account" value="${loginMember.adminName }"/>
						
			      			</div>
			      			<div class="modal-footer">
			        			<button type="button" class="btn btn-primary" id="comfirmNewVoucher">確定</button>
			        			<button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="emptySpan()">取消</button>
			      			</div>
			    		</div>
			  		</div>
				</div>
				<!-- end of Modal -->
			`);
			
		}else if(page=="activity"){
			
			$('#show').append(`
				<H2 style="display: inline">活動總覽</H2>
				&emsp;&emsp;&emsp;
				<form id="add" action="addactivity.controller" enctype="multipart/form-data" method="post" style="display: inline">
					<input type="submit" name="add" value="新增" class=" btn btn-info btn-icon-split" style="border: none; background-color: #36b9cc; color: white"/>
				</form>
				<table class="table table-bordered" id="table_id" class="compact hover stripe">
					<thead>
						<tr>
							<th>活動名稱</th>
							<th style="width:80px">活動類型</th>
							<th>活動時間</th>
							<th>主辦方</th>
							<th>負責管理員</th>
							<th>最後修改時間</th>
							<th style="width: 170px">操作</th>
						</tr>
					</thead>
					<c:forEach var="aqa" items="${activity_queryAll}">
						<tr>
							<td>${aqa.activityTitle}</td>
							<td>${aqa.typeContent}</td>
							<td>${aqa.startTime}<br>~${aqa.endTime}</td>
							<td>${aqa.holder}</td>
							<td>${aqa.a_account}</td>
							<td>${aqa.reviseTime}</td>
							<td>
								<form ACTION="queryactivity.controller" method="post" style="float: left; margin-left: 3px" >
									<input type="hidden" name="dataId" value="${aqa.activityId}" />
									<input type="submit" name="query" value="查看" class="btn btn-outline-info " />
								</form> 
								<form ACTION="updateactivity.controller" method="post" enctype="multipart/form-data" style="float: left; margin-left: 3px">
									<input type="hidden" name="dataId" value="${aqa.activityId}" />
									<input type="submit" name="update" value="修改" class="btn btn-outline-secondary " />
								</form> 
								<form ACTION="deleteactivity.controller" name="ddeell" method="post" style="float: left; margin-left: 3px">
									<input type="hidden" name="dataId" value="${aqa.activityId}" id="dd" />
									<input type="hidden" name="voucherTitle" value="${aqa.activityTitle}" />
									<input type="submit" id="delete" name="delete" value="刪除" class="del btn btn-outline-danger "/>
								</form>
								
							</td>
						</tr>
					</c:forEach>
				</table>
			`);
		}
		
		$('#table_id').dataTable({'bAutoWidth': false});
		
	});
	</script>
	
	<script>
	$(function() {
		//確認刪除sweet alert
		$(".del").on('click', function(event){
			event.preventDefault();
			var id = $(this).prev().val();
			console.log("抓取刪除:" + id);
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
					  Swal.fire(
						      '刪除成功!',
						      id+'已刪除',
						      'success'
						    ).then((result) => {
				   				 $(this).parent().submit();
						    });
				  }
				});
		});
		
		//優惠券新增確定送出
		$('#comfirmNewVoucher').on('click', function(){
			let date = new Date();
			if($('#voucherTitle').val()==null || $('#expiryTime').val()==''){
				console.log("voucher新增有空欄位");
				Swal.fire({
					title:'資料不完整',
					text:'請檢查＊號欄位是否都有填入',
					icon:'warning'
				});
			}else if(date.toISOString().split('T')[0] >= $('#expiryTime').val()){
				console.log("vouher新增日期錯誤");
				Swal.fire({
					title:'日期錯誤',
					text:'結束日期已過請重新選擇',
					icon:'warning'
				})
		   		return;
		    }else{
				let voucherNo=$("#voucherNo").text();
				let a_account=$("#a_account").val();
				let voucherTitle=$("#voucherTitle").val();
				let expiryTime=$("#expiryTime").val();
				let voucherBean={"voucherNo": voucherNo, "a_account":a_account, "voucherTitle": voucherTitle, "expiryTime": expiryTime}
				$.ajax({
					type: "post",
					url: "/group5/admin/addvoucher.controller",
					dataType: "json",
					data: JSON.stringify(voucherBean),
					contentType: "application/json",
					success: function(data){
						console.log("new voucher success");
						Swal.fire({
							      title:'新增成功!',
							      text:'已加入'+voucherNo+',是否繼續新增?',
							      icon:'success',
								  confirmButtonColor: '#3085d6',
								  cancelButtonColor: '#d33',
								  confirmButtonText: '繼續新增',
								  cancelButtonText: '回查詢頁',
								  showCancelButton: true
						}).then((result) => {
							console.log("result");
							if(result.isConfirmed){
									emptySpan();
								randomVoucher();
								return;	
							}else{
								console.log("reload");
								location.reload();
							}
						});
					},
					error: function(){
						console.log("new voucher error");
						Swal.fire(
							      '新增失敗!',
							      '請在試一次',
							      'error'
							    ).then((result) => {
							    	location.reload();
							    });
					}
				
				});
		    }
		});
		
	});
	
	</script>
	
	<script type="text/javascript">
	//產生隨機優惠券碼
	function randomVoucher(){
		console.log('偵測到按鈕');
		var random1 = [];
		var tt = '';
		var temp;
 	   	while (random1.length < 10) {
 	   		if (Math.floor(Math.random() * 11) % 2 == 0) {
 	           temp = String.fromCharCode(65 + Math.floor(Math.random() * 26));
	        } else {
	            temp = Math.floor(Math.random() * 10);
    	    }
    	    if (random1.length > 0) {
    	        for (let j = 0; j < random1.length; j++) {
    	            if (random1[j] == temp) {
    	                break;
        	        } else if (j == random1.length - 1) {
    	                random1.push(temp);
						tt+=temp;
            	    }
            	}
        	} else {
            	random1.push(temp);
        	}
    	}
    	$('#voucherNo').append(tt);
	};

	//重置優惠券碼區塊
	function emptySpan() {
		$('#voucherNo').empty();
	};
	</script>
	
	<%@ include file="../admin/AdminstyleFoot.jsp"%>
	
</body>
</html>