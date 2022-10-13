<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增健身房地點</title>
<!--   official Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>

<!-- Custom styles for this page -->
<link href="/group5/css/gymFrontAllStyle.css" rel="stylesheet">
<!-- Core plugin JavaScript-->
<script src="/group5/js/jquery.min.js"></script>
<script src="/group5/js/jquery.easing.min.js"></script>
<!-- Page level custom scripts -->
<script src="/group5/js/chooseAddress.js"></script>
<script src="/group5/js/confirmData.js"></script>
<!-- Page level plugins -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://kit.fontawesome.com/a3daa825b8.js"
	crossorigin="anonymous"></script>
<script>
$(function(){
	$('#submitAdd').on("click",function(){
		let name =$(".showNameText").text();
		let address =$(".showAddressText").text();
		let openhours =$(".showTimesText").html();
		let gymBean={"gymName":name, "gymAddress": address, "gymOpenHours": openhours}
		Swal.fire({
            title: '請問是否確定新增',
            showDenyButton: true,
            confirmButtonText: '確定新增',
            denyButtonText: `再想一下`,
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    icon: 'Saved!',
                    html: '<p>建立名稱：'+name+'</p><p>地址：'+address+'</p><p>營業時間：'+openhours+'</p>',
                    showCancelButton: true,
                    confirmButtonText: '確定新增',
                }).then((result2)=>{
                		if(result2.isConfirmed){
                			$.ajax({
                				type: "post",
                				url: "/group5/user/gym/addGym",
                				data: JSON.stringify(gymBean),
                				dataType: "json",
                				contentType: "application/json",
                				success: function(data){
                					let showResult="<p>建立完成</p><p>建立名稱："+data.gymName+"</p><p>地址："
                									+data.gymAddress+"</p><p>營業時間："+data.gymOpenHours+"</p>";
                					$("#ffid").val(data.gymId);
                					},
                					error: function(){
                						console.log("error");
                					}
                				});
                				Swal.fire('Saved!', '新增成功', 'success').then(result=>{
                					if (result.isConfirmed) {
                					    savePicture();
                					  }
                				});
                			}
                		});
                
            } else if (result.isDenied) {
                Swal.fire('Changes are not saved', '', 'info');
            }
        })
	})
	
	//picture
	$('#ff').on('change', function(e){      
		let file = this.files[0];
		let imagePath="/group5/images/"+file.name;
		$('#imagePathF').val(imagePath);
		//console.log();
		//預覽
		let objectURL = URL.createObjectURL(file);
		$('#img1').attr('src', objectURL);
	});
	
	//saving picture with ajax
	function savePicture(){
		$("#picture").submit();
	}
	
	$("#putAddData").on("click",function(){
		$("#gymName").val("資資健身工作室");
		$(".showNameText").text("資資健身工作室");
		$("option:contains('桃園市')").prop("selected","true");
        $("#district").append("<option value='中壢區' selected id='preSelected'>"+'中壢區');
        $("#gymAddressDetail").val("新生路二段421號");
		$(".showAddressText").text("桃園市中壢區新生路二段421號");
		$("#btncheck1").prop("checked","true");
		$("#btncheck2").prop("checked","true");
		$("#btncheck3").prop("checked","true");
		$("#btncheck4").prop("checked","true");
		$("#btncheck5").prop("checked","true");
		$("#btncheck6").prop("checked","true");
		$("#btncheck7").prop("checked","true");
		$("#btncheck1").prop("disabled","true");
		$("#btncheck2").prop("disabled","true");
		$("#btncheck3").prop("disabled","true");
		$("#btncheck4").prop("disabled","true");
		$("#btncheck5").prop("disabled","true");
		$("#btncheck6").prop("disabled","true");
		$("#btncheck7").prop("disabled","true");
		$(".openTime").val("06:00");
		$(".closeTime").val("22:00");
		$(".showTimesText").html("星期一,星期二,星期三,星期四,星期五,星期六,星期日06:00-22:00");
	})
	
	
	
	
	
});

</script>
</head>
<body onload="city()">
	<%@ include file="../admin/FrontStageHead.jsp"%>
	<div class="cards-2">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1>新增健身房</h1>
					<div class="input-group mb-3">
						<label class="input-group-text" for="gymName">名稱：</label> <input
							type="text" name="gymName" placeholder="請輸入健身房名稱" id="gymName"
							class="form-control">
					</div>
					<div class="input-group mb-4">
						<label class="input-group-text">地址：</label> <select
							class="form-select" name="city" id="city" onchange="districtC()">
							<option value="">請選擇縣市</option>
						</select> <select class="form-select" name="district" id="district">
							<option value="">請選擇鄉鎮區</option>
						</select> <input class="form-control" type="text" name="gymAddress"
							id="gymAddressDetail" placeholder="請輸入健身房地址" required
							maxlength="150">
					</div>
					<div class="mb-3"
						style="border: 1px solid lightgray; padding: 16px; border-radius: 15px;">
						<label class="form-label row"
							style="padding-left: 10px; padding-bottom: 5px;">營業時間：</label>
						<div class="row" style="padding-bottom: 16px;">
							<div class="btn-group" role="group"
								aria-label="Basic checkbox toggle button group">
								<input type="checkbox" class="btn-check" id="btncheck1"
									autocomplete="off" value="1" name="weekdays"> <label
									class="btn btn-outline-primary" for="btncheck1">星期一</label> <input
									type="checkbox" class="btn-check" id="btncheck2"
									autocomplete="off" value="2" name="weekdays"> <label
									class="btn btn-outline-primary" for="btncheck2">星期二</label> <input
									type="checkbox" class="btn-check" id="btncheck3"
									autocomplete="off" value="3" name="weekdays"> <label
									class="btn btn-outline-primary" for="btncheck3">星期三</label> <input
									type="checkbox" class="btn-check" id="btncheck4"
									autocomplete="off" value="4" name="weekdays"> <label
									class="btn btn-outline-primary" for="btncheck4">星期四</label> <input
									type="checkbox" class="btn-check" id="btncheck5"
									autocomplete="off" value="5" name="weekdays"> <label
									class="btn btn-outline-primary" for="btncheck5">星期五</label> <input
									type="checkbox" class="btn-check" id="btncheck6"
									autocomplete="off" value="6" name="weekdays"> <label
									class="btn btn-outline-primary" for="btncheck6">星期六</label> <input
									type="checkbox" class="btn-check" id="btncheck7"
									autocomplete="off" value="7" name="weekdays"> <label
									class="btn btn-outline-primary" for="btncheck7">星期日</label>
							</div>
						</div>
						<div class="input-group" style="padding-bottom: 16px;">
							<span class="input-group-text">開始營業時間：</span> <input
								class="form-control openTime" type="time" name="openTime">
							<span class="input-group-text">結束營業時間：</span> <input
								class="form-control closeTime" type="time" name="closeTime">
						</div>
						<div class="col-lg-12 d-flex justify-content-start" id="morePeriodsDiv" style="padding:0px;">
							<button class="btn btn-success" id="finishedAddPeriods">新增營業時間</button>
						</div>
						<input type="hidden" id="hiddenP">
						<input type="hidden" id="hiddenDiv">
					</div>
					<div class="md-3 d-flex justify-content-start" style="border: 1px solid lightgray; padding: 16px; border-radius: 15px;">
						<form class="st1" id="picture" action="/group5/user/gym/addPicture" method="post" enctype="multipart/form-data">
							<label>新增照片:</label>
							<input type="file" id="ff" name="photo"/>
							<input type="hidden" name="gymId" id="ffid">
							<img id="img1" width="230" />
						</form>
					</div>
					<div style="padding-bottom: 16px;">
						<p class="showNameText"></p>
						<p class="showAddressText"></p>
						<p class="showTimesText"></p>
						<input type="hidden" id="imagePathF">
					</div>
					<div class="col-12">
						<button class="btn-solid-reg page-scroll" type="submit" id="submitAdd">新增</button>
						<button class="btn-solid-reg page-scroll"  id="putAddData">一鍵輸入</button>
					</div>
					<div id="addResult" style="padding-top: 12px;"></div>
				</div>
			</div>
		</div>

	</div>

	<%@ include file="../admin/FrontStageFoot.jsp"%>

</body>
</html>