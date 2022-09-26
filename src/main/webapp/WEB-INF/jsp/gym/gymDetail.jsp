<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-hang-TW">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>詳細資訊</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link rel="stylesheet" href="/group5/css/ratingAndSaved-style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <link href="/group5/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <script src="/group5/js/jquery.dataTables.min.js"></script>
    <script src="/group5/js/dataTables.bootstrap4.min.js"></script>

</head>
<body>
<%@ include file="../admin/AdminstyleHead.jsp" %>
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">${selectedGym.gymName }</h1>
    </div>

    <div class="row">
        <div class="col-lg-6">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Google Map</h6>
                </div>
                <div class="card-body">
                    <div id="map" style="margin:20px; width: 500px; height: 500px;"></div>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Location Info</h6>
                </div>
                <div class="card-body">
                    地址：<span id="address">${selectedGym.gymAddress}</span><br>
                    營業時間：${selectedGym.gymOpenHours}<br>
                    健友評分：${selectedGym.rating}
                    <input type="hidden" value="${selectedGym.gymId}" id="gymIdFromDetail">
                    <input type="hidden" value="${logStatus.logId }" id="gymLogIdNow">
                    <input type="hidden" value="${logStatus.favorite }" id="logFavorite">
                    <input type="hidden" value="${logStatus.rating }" id="logRating">
                    <input type="hidden" value="10003" id="memberIdNow">
                </div>
                <div class="card-body">
                    <div class="saved">收藏：
                        <input type="checkbox" id="saved" name="saved" /><label for="saved"></label>
                    </div>
                    <div class="rating-wrap">
                        <span>評分:</span>
                        <div class="center">
                            <div class="rating">
                                <input type="radio" id="start5" name="rating" value="5" class="star" /><label
                                    for="start5" class="full"></label>
                                <input type="radio" id="start4" name="rating" value="4" class="star" /><label
                                    for="start4" class="full"></label>
                                <input type="radio" id="start3" name="rating" value="3" class="star" /><label
                                    for="start3" class="full"></label>
                                <input type="radio" id="start2" name="rating" value="2" class="star" /><label
                                    for="start2" class="full"></label>
                                <input type="radio" id="start1" name="rating" value="1" class="star" /><label
                                    for="start1" class="full"></label>
                            </div>
                        </div>
                        <div id="rating-value"></div>
                        <input type="hidden" name="ratingValue" value="評分" id="ratingValue">
                    </div>
                </div>
            </div>
                        <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">曾對${selectedGym.gymName }評分／收藏會員名單</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered display" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>會員編號</th>
                                    <th>會員名稱</th>
                                    <th>會員性別</th>
                                    <th>收藏狀態(1表示收藏，0表示未收藏)</th>
                                    <th>對健身房評分</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>會員編號</th>
                                    <th>會員帳號</th>
                                    <th>會員性別</th>
                                    <th>收藏狀態</th>
                                    <th>對健身房評分</th>
                                </tr>
                            </tfoot>
                            <tbody>
                            <c:forEach var="gymlog" items="${memberlist}">
                                <tr>
                                    <td>${gymlog.member.id }</td>
                                    <td>${gymlog.member.memberAccount }</td>
                                    <td>${gymlog.member.memberDetail.gender }</td>
                                    <td>${gymlog.favorite }</td>
                                    <td>${gymlog.rating }</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div>
                <a href="/group5/admin/gym/allMain" class="btn btn-secondary">回上一頁</a>
            </div>
        </div>
    </div>

    <script>
        let map;
        // let currentPosition;
        let gymLocation;
        let marker;


        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: 24.9854134, lng: 121.2212636 },
                zoom: 5, //值越大，地圖縮放程度也越大
            });

            var request = {
                query: ($('#address').text()),
                fields: ['place_id', 'geometry'],
            };

            var service = new google.maps.places.PlacesService(map);
            let placeId;
            let text = '';
            service.findPlaceFromQuery(request, function (results, status) {
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
                        map: map,
                    });
                }
                marker.setPosition(gymLocation);
            });
        }
    </script>
    <script async
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCQvR9v8XyZl476ki2PsDcJZtLwpo023gs&libraries=places&callback=initMap&region=TW&language=zh-TW"></script>

    <!-- Core plugin JavaScript-->
    <script src="/group5/js/jquery.easing.min.js"></script>
	<script src="/group5/js/ratingAndSaved.js"></script>
    <!-- Custom scripts for all pages-->
<%@ include file="../admin/AdminstyleFoot.jsp" %>
</body>

</html>