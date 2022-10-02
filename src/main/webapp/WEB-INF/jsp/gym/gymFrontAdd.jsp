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
						<div class="col-10" id="morePeriodsDiv" style="padding-bottom: 12px;">
							<button class="btn btn-success" id="morePeriods">多段營業時間</button>
							<button class="btn btn-success" id="finishedAddPeriods" disabled>新增營業時間</button>
						</div>
						<p id="hiddenP"></p>
						<div id="hiddenDiv"></div>
					</div>
					<div style="padding-bottom: 16px;">
						<p class="showNameText"></p>
						<p class="showAddressText"></p>
						<p class="showTimesText"></p>
					</div>
					<div class="col-12">
						<button class="btn-solid-reg page-scroll" type="submit" id="submitAdd">新增</button>
					</div>
					<div id="addResult" style="padding-top: 12px;"></div>
				</div>
			</div>
		</div>

	</div>

	<%@ include file="../admin/FrontStageFoot.jsp"%>

</body>
</html>