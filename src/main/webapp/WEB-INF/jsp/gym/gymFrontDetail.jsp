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
<!-- Page level custom scripts -->
<!-- Page level plugins -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://kit.fontawesome.com/a3daa825b8.js"
	crossorigin="anonymous"></script>
<script src="/group5/js/ratingAndSaved.js"></script>

</head>
<body>
	<%@ include file="../admin/FrontStageHead.jsp"%>
	<!-- Details -->
	<div id="details" class="basic-1">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="text-container">
						<h2>${gymDetail.gymName }</h2>
						<ul class="list-unstyled li-space-lg">
							<li class="media"><i class="fas fa-square"></i>
								<div class="media-body">
									地址：<span id="address">${gymDetail.gymAddress}</span>
								</div></li>
							<li class="media"><i class="fas fa-square"></i>
								<div class="media-body">營業時間：${gymDetail.gymOpenHours}</div></li>
							<li class="media"><i class="fas fa-square"></i>
								<div class="media-body">健友評分：${gymDetail.rating}</div></li>
						</ul>
						<input type="hidden" value="${selectedGym.gymId}" id="gymIdFromDetail">
                    	<input type="hidden" value="${logStatus.logId }" id="gymLogIdNow">
                    	<input type="hidden" value="${logStatus.favorite }" id="logFavorite">
                    	<input type="hidden" value="${logStatus.rating }" id="logRating">
                    	<input type="hidden" value="${loginMember.id }" id="memberIdNow">
						<div class="saved">
							收藏： <input type="checkbox" id="saved" name="saved" /><label
								for="saved"></label>
						</div>
						<div class="rating-wrap">
							<span>評分:</span>
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
						<br>
						<h2>Fit With You!</h2>
						<div class="row">
							<div class="col-lg-6">男女比例：</div>
							<div class="col-lg-6">收藏人數：</div>
						</div>
						<a class="btn-solid-reg popup-with-move-anim" href="#">我要配對</a>
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