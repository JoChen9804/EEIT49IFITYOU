<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Delete Query database</title>
	<!-- official Bootstrap-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
		
    <!-- Custom fonts for this template -->
    <link rel="stylesheet" type="text/css" href="/group5/css/fontawsome-free-all.min.css">
    
    <!-- Custom styles for this template -->
    <link href="/group5/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/group5/css/dataTables.bootstrap4.min.css" rel="stylesheet">
	<script src="/group5/js/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script>
		$(function(){
			$('.edit').on("click",function(){
				let name=$(this).parent().siblings(".gymNameOfList").text();
				console.log(name);
				editGym(name);
			});
			
			$("#submitUpdate").on("click",function(){
				let gName=$(".showNameText").text();
				let gAddress=$(".showAddressText").text();
				let gTime=$(".showTimesText").html();
				let gymBean={"gymId": gymid, "gymName":gName, "gymAddress": gAddress, "gymOpenHours": gTime}
				$.ajax({
					type: "post",
					url: "/group5/admin/gym/allUpdateAction",
					dataType: "json",
					data: JSON.stringify(gymBean),
					contentType: "application/json",
					success: function(data){
						console.log("success");
						location.reload();
					},
					error: function(){
						console.log("error");
					}
					
				});
				
			});
			
			$(".deletegymoflist").click(function(){
				Swal.fire({
					  title: '確定刪除此健身房？',
					  text: "刪除後資料將無法復原！",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '刪除'
					}).then((result) => {
					  if (result.isConfirmed) {
						let deleteName = $(this).parent().siblings(".gymNameOfList").text();
						deleteGym(deleteName);
					    Swal.fire(
					      'Deleted!',
					      '此健身房已刪除！',
					      'success'
					    ).then((result) =>{
					    	if(result.isConfirmed){
								location.reload();
					    	}
					    });
					  }
					});
			});
		});
		var gymid=""
		function editGym(name){
			$.ajax({
				type: "post",
				url: "/group5/admin/gym/allUpdate/"+name,
				dataType: "json",
				success: function(data){
					console.log(data);
					gymid=data.gymId;
					$("#updateTitle").text(data.gymName);
					$("#gymName").val(data.gymName);
					$(".showNameText").text(data.gymName);
					$(".showAddressText").text(data.gymAddress);
					$(".showTimesText").html(data.gymOpenHours);
				},
				error: function(){
					console.log("error");
				}
			});
		}
		
		function deleteGym(deleteName){
			$.ajax({
				type: "post",
				url: "/group5/admin/gym/allDelete/" + deleteName,
				success: function(){
					console.log("deleted!!")
				}
			})
		}
	</script>

</head>
<body>
<%@ include file="../admin/AdminstyleHead.jsp" %>
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">Gym Tables</h1>		
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">DataTables
					Example</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>名稱</th>
								<th>地址</th>
								<th>營業時間</th>
								<th>評分</th>
								<th>-</th>
								<th>-</th>
								<th>-</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>名稱</th>
								<th>地址</th>
								<th>營業時間</th>
								<th>評分</th>
								<th>-</th>
								<th>-</th>
								<th>-</th>
							</tr>
						</tfoot>
						<tbody>
						<c:forEach var="gymlist" items="${queryAll}">	
							<tr>
								<td class="gymNameOfList">${gymlist.gymName}</td>
								<td>${gymlist.gymAddress}</td>
								<td>${gymlist.gymOpenHours}</td>
								<td>${gymlist.rating}</td>
								<td><form action="/group5/admin/gym/gymDetail/${gymlist.gymName}" method="post">
									<input type="hidden" value="10003" name="memberIdNow">
									<input type="submit" class="btn btn-outline-success gymDetail" value="詳細資訊">
								</form></td>
								<td><button type="button" class="btn btn-outline-secondary edit" 
									data-bs-toggle="modal" data-bs-target="#btnEdit" onclick="city()">編輯</button></td>
								<td><button type="button" class="btn btn-outline-danger deletegymoflist">刪除</button></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
	<!-- /.container-fluid -->
	
	<!-- Modal -->
	<div class="modal fade" id="btnEdit" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">修改健身房：<span id="updateTitle"></span></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container-fluid ">
					<div class="input-group mb-3">
						<div id="updateDataTable" >
							<div style="padding-bottom: 16px;">
									<p id="showOldName">準備更改的名稱：</p>
									<p class="showNameText"></p>
									<p class="showAddressText"></p>
									<p class="showTimesText"></p>
							</div>
							<div class="input-group mb-3">
								<label class="input-group-text" for="gymName">新更改名稱：</label>
								<input type="text" name="gymName" placeholder="請輸入健身房名稱" id="gymName" class="form-control">
							</div>
								<div class="input-group mb-4">
									<label class="input-group-text">地址：</label>
										<select class="form-select" name="city" id="city" onchange="districtC()">
											<option value="">請選擇縣市</option>
										</select> 
										<select class="form-select" name="district" id="district">
											<option value="">請選擇鄉鎮區</option>
										</select>
										<input class="form-control" type="text" name="gymAddress" id="gymAddressDetail" placeholder="請輸入健身房地址" maxlength="150">
								</div>
								<div class="mb-3" style="border: 1px solid lightgray; padding: 16px; border-radius: 15px;">
									<label class="form-label row" style="padding-left: 10px; padding-bottom: 5px;">營業時間：</label>
									<div class="row" style="padding-bottom: 16px;">
										<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
											<input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off" value="1" name="weekdays">
											<label class="btn btn-outline-primary" for="btncheck1">星期一</label>
											<input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off" value="2" name="weekdays">
											<label class="btn btn-outline-primary" for="btncheck2">星期二</label>
											<input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off" value="3" name="weekdays">
											<label class="btn btn-outline-primary" for="btncheck3">星期三</label>
											<input type="checkbox" class="btn-check" id="btncheck4" autocomplete="off" value="4" name="weekdays">
											<label class="btn btn-outline-primary" for="btncheck4">星期四</label>
											<input type="checkbox" class="btn-check" id="btncheck5" autocomplete="off" value="5" name="weekdays">
											<label class="btn btn-outline-primary" for="btncheck5">星期五</label>
											<input type="checkbox" class="btn-check" id="btncheck6" autocomplete="off" value="6" name="weekdays">
											<label class="btn btn-outline-primary" for="btncheck6">星期六</label>
											<input type="checkbox" class="btn-check" id="btncheck7" autocomplete="off" value="7" name="weekdays">
											<label class="btn btn-outline-primary" for="btncheck7">星期日</label>
										</div>
									</div>
									<div class="input-group" style="padding-bottom: 16px;">
										<span class="input-group-text">開始營業時間：</span>
										<input class="form-control openTime" type="time" name="openTime">
										<span class="input-group-text">結束營業時間：</span>
										<input class="form-control closeTime" type="time" name="closeTime">
									</div>
									<div class="col-10" id="morePeriodsDiv" style="padding-bottom: 12px;">
										<button class="btn btn-success" id="morePeriods">多段營業時間</button>
										<button class="btn btn-success" id="finishedAddPeriods" disabled>營業時間更新完成</button>
									</div>
									<p id="hiddenP"></p>
									<div id="hiddenDiv"></div>
								</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="submitUpdate">確定修改</button>
				</div>
			</div>
			</div>
		</div>
	</div>
	
	
	
	

	<!-- Bootstrap core JavaScript-->
    
    <script src="/group5/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/group5/js/jquery.easing.min.js"></script>
	
    <!-- Custom scripts for all pages-->
    <script src="/group5/js/sb-admin-2.min.js"></script>
	
    <!-- Page level plugins -->
    <script src="/group5/js/jquery.dataTables.min.js"></script>
    <script src="/group5/js/dataTables.bootstrap4.min.js"></script>
	<script src="/group5/js/chooseAddress.js"></script>
	<script src="/group5/js/confirmData.js"></script>

    <!-- Page level custom scripts -->
    <script src="/group5/js/datatables-demo.js"></script>
<%@ include file="../admin/AdminstyleFoot.jsp" %>	
</body>
</html>