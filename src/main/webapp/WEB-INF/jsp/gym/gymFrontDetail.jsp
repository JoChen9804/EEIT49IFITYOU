<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>詳細資訊</title>
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
<link rel="stylesheet" href="/group5/css/ratingAndSaved-style.css">
<!-- Core plugin JavaScript-->
<script src="/group5/js/jquery.min.js"></script>
<script src="/group5/js/jquery.easing.min.js"></script>
<!-- Page level plugins -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://kit.fontawesome.com/a3daa825b8.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
<!-- Page level custom scripts -->

<script>
$(function(){
	countFavorite();
	if("${logStatus.favorite}"==1){
		$("#saved").prop("checked","true");
	}
	if("${loginMember.id}"==""){
		$("#saved").next().css("display","none");
		$(".saved").append("<span style='color:#C62828'>請登入開啟收藏功能</span>");
		$(".center").css("display","none");
		$("#rating-text").append("<span style='color:#C62828'>&nbsp;請登入開啟評分功能</span>");
		$("#preDelete").css("display","none");
		$("#editGym").css("display","none");
	}
	let logRating="${logStatus.rating}"
	if(logRating!=""){
		$("#start"+logRating).prop("checked","true");
	}
	
	$("#preDelete").click(function(){
		Swal.fire({
            title: '請輸入刪除原因',
            input: 'text',
            inputAttributes: {
                autocapitalize: 'off'
            },
            showCancelButton: true,
            confirmButtonText: 'Look up',
        }).then((result) => {
            if (result.isConfirmed) {
            	let reason=result.value;
            	preDelete(reason);
                Swal.fire({
                    title: '已提出刪除',
                })
            }
        })
	})
	if("${logStatus.gymDel}"==1){
		$("#preDelete").text("已提出刪除申請");
	}
	
})
let mId = "${loginMember.id }";
let logId = '${logStatus.logId}';
let gymBean={"gymId":"${gymDetail.gymId}","gymName":"${gymDetail.gymName }","gymAddress":"${gymDetail.gymAddress }","gymOpenHours":"${gymDetail.gymOpenHours }","rating":"${gymDetail.rating }","gymPicture":"${gymDetail.gymPicture }"};
function countFavorite(reason){
	$.ajax({
		type:'post',
		url:'/group5/gym/countFavorite',
		dataType:'json',
		contentType:'application/json',
		data:JSON.stringify(gymBean),
		success:function(data){
			$('#numberOfFavorite').append(data.numberOfFavorite);
			$('#genderPart').append(data.numberOfMale+"："+data.numberOfFemale);
			
			const genderData = {
					labels: ['男', '女'],
					datasets: [{
								 	label: '收藏性別比',
								    data: [data.numberOfMale,data.numberOfFemale],
								    backgroundColor: ["#a8baef","#7d98e7"]
								}]
					};
			const genderConfig = {
						  type: 'pie',
						  data: genderData,
						  options: {
						    responsive: true
						  },
						};
			
			const ctx = $('#genderChart')[0].getContext('2d');
	        const myChart = new Chart(ctx, genderConfig);
			
		},
		error: function(){
			console.log("errorrrrrrrrrrrrrrrrrrrrr");
		}
		
	})		
}

function preDelete(reason){
	let gymlog;
	if(logId==""){
		gymlog={"member": {"id":"${loginMember.id}"}, "gym":{"gymId":"${gymDetail.gymId}"},"gymDel":1,"delReason":reason};
		console.log(gymlog);
	}else{
		gymlog={"logId":logId,"member": {"id":"${loginMember.id}"}, "gym":{"gymId":"${gymDetail.gymId}"},"gymDel":1,"delReason":reason};
		console.log(gymlog);
	}
	$.ajax({
		type:'post',
		url:'/group5/user/gym/delete/',
		contentType: 'application/json',
		data:JSON.stringify(gymlog),
		success:function(){
			$("#preDelete").text("已提出刪除申請");
		},
		error:function(){
			Swal.fire(
					  '刪除失敗',
					  '請洽管理員諮，或詢稍後再試一次！',
					  'error'
					)
		}
	});
}
</script>
<script src="/group5/js/ratingAndSavedFront.js" defer></script>
</head>
<body>
	<%@ include file="../admin/FrontStageHead.jsp"%>
	<!-- Details -->
	<div id="details" class="basic-1">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 d-flex align-items-center">
					<div class="text-container">
						<h2>${gymDetail.gymName }</h2>
						<ul class="list-unstyled li-space-lg">
							<li class="media"><i class="fas fa-square"></i>
								<div class="media-body">
									地址：<span id="address">${gymDetail.gymAddress}</span>
								</div></li>
							<li class="media"><i class="fas fa-square"></i>
								<div class="media-body">營業時間：<br>${gymDetail.gymOpenHours}</div></li>
							<li class="media"><i class="fas fa-square"></i>
								<div class="media-body">健友評分：${gymDetail.rating}</div></li>
						</ul>
						<a class="btn-outline-reg" href="/group5/user/gym/edit/${gymDetail.gymId }" id="editGym">編輯</a>
						<button class="btn-outline-red" id="preDelete">申請刪除</button>
                    	<input type="hidden" value="${loginMember.id }" id="memberIdNow">
						<hr>
						<div class="saved">
							收藏： <input type="checkbox" id="saved" name="saved" /><label
								for="saved"></label>
						</div>
						<div class="rating-wrap">
							<span id="rating-text">評分:</span>
							<div class="center">
								<div class="rating d-flex" style="padding-top: 15px">
									<input type="radio" id="start5" name="rating" value="5" class="star" /><label for="start5" class="full order-4"></label>
									<input type="radio" id="start4" name="rating" value="4" class="star" /><label for="start4" class="full order-3"></label>
									<input type="radio" id="start3" name="rating" value="3" class="star" /><label for="start3" class="full order-2"></label>
									<input type="radio" id="start2" name="rating" value="2" class="star" /><label for="start2" class="full order-1"></label>
									<input type="radio" id="start1" name="rating" value="1" class="star" /><label for="start1" class="full order-0"></label>
								</div>
							</div>
							<div id="rating-value"></div>
							<input type="hidden" name="ratingValue" value="評分"
								id="ratingValue">
						</div>
					</div><!-- end of text-container -->
				</div><!-- end of col -->
					
				<div class="col-lg-6">
					<div>
						<div id="map" style="margin: 20px; width: 500px; height: 500px;"></div>
					</div>
					<!-- end of image-container -->
				</div>
				<!-- end of col -->
				</div>
				<!-- end of row -->
				<div class="row" style="background-color:rgba(211,220,247,0.2);">
					<div class="col-lg-6 d-flex align-items-center justify-content-end">
						<div class="text-container">
							<h2><span class="material-symbols-outlined">waving_hand</span>&nbsp;健友在這裡</h2>
							<p id="numberOfFavorite">收藏人數：</p>
							<p id="genderPart">收藏性別（男／女）</p>
							<a class="btn-solid-reg popup-with-move-anim" href="#">我要配對</a>
							<form action="/group5/user/pairing/start2pair" method="post" id="goPairForm">
				        		<input type="hidden" name="mainPid" id="mPdId" value="${loginMember }">
				        		<input type="submit" value="今日配對" class="btn-solid-reg goPair">
				    		</form>
						</div><!-- end of text-container -->
					</div><!-- end of col -->
					<div class="col-lg-6">
						<div class="text-container">
							<div style="width:285px; padding:25px;">
								<canvas id="genderChart"></canvas>
							</div>
						</div><!-- end of text-container -->
					</div><!-- end of col -->
				</div>
				<!-- end of row -->
			</div>
			<!-- end of container -->
		</div>
		<!-- end of basic-1 -->
		<!-- end of details -->

		<%@ include file="../admin/FrontStageFoot.jsp"%>
		<script>
			let map;
			// let currentPosition;
			let gymLocation;
			let marker;

			function initMap() {
				map = new google.maps.Map(document.getElementById('map'), {
					center : {
						lat : 24.9854134,
						lng : 121.2212636
					},
					zoom : 5, //值越大，地圖縮放程度也越大
				});

				var request = {
					query : ($('#address').text()),
					fields : [ 'place_id', 'geometry' ],
				};

				var service = new google.maps.places.PlacesService(map);
				let placeId;
				let text = '';
				service.findPlaceFromQuery(request, function(results, status) {
					if (status === google.maps.places.PlacesServiceStatus.OK) {
						for (var i = 0; i < results.length; i++) {
							gymLocation = results[0].geometry.location;
							placeId = results[0].place_id;
						}
						map.setCenter(results[0].geometry.location);
						map.setZoom(14);
					}
					if (!marker) {
						marker = new google.maps.Marker({
							map : map,
						});
					}
					marker.setPosition(gymLocation);
				});
			}
		</script>
		<script async
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCQvR9v8XyZl476ki2PsDcJZtLwpo023gs&libraries=places&callback=initMap&region=TW&language=zh-TW"></script>
</body>
</html>