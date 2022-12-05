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
    <!--   official Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
		
    <!-- Custom for this template -->
    <link rel="stylesheet" href="/group5/css/ratingAndSaved-style.css">
    <link href="/group5/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <!-- Core plugin JavaScript-->
    <script src="/group5/js/jquery.easing.min.js"></script>
    <!-- Custom scripts for this pages-->
    <script src="/group5/js/jquery.dataTables.min.js"></script>
    <script src="/group5/js/dataTables.bootstrap4.min.js"></script>
    <script src="/group5/js/datatables-demo.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
    <script>
 	var gymBean={"gymId":"${selectedGym.gymId}","gymName":"${selectedGym.gymName }","gymAddress":"${selectedGym.gymAddress }","gymOpenHours":"${selectedGym.gymOpenHours }","rating":"${gymDetail.rating }","gymPicture":"${selectedGym.gymPicture }"};
    $(function(){
    	countFavorite();
    	
    	$(".denyDel").on("click",function(){
    		let delmemberId=$(this).parent().siblings(".delmember").text();
			console.log(delmemberId);
    		$.ajax({
    			type:'post',
    			url:'/group5/admin/gym/gymDetail/deldata/'+delmemberId,
    			data:JSON.stringify(gymBean),
    			contentType:'application/json',
    			success:function(){
    				console.log("dsijosa");
    				location.reload();
    			}
    			
    		});
    	})
    })
    function countFavorite(){
    	$.ajax({
    		type:'post',
    		url:'/group5/gym/countFavorite',
    		dataType:'json',
    		contentType:'application/json',
    		data:JSON.stringify(gymBean),
    		success:function(data){
    			const genderData = {
    					labels: ['男', '女'],
    					datasets: [{
    								 	label: '收藏數',
    								    data: [data.numberOfMale,data.numberOfFemale],
    								    backgroundColor: ["#a8baef","#7d98e7"]
    								}]
    					};
    			const genderConfig = {
    						  type: 'bar',
    						  data: genderData,
    						  options: {
    						    responsive: true,
    						    scales: {
    						        y: {
    						          beginAtZero: true,
    						          grace: '5%'
    						        },
    						      }
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
    
    </script>
</head>
<body>
<%@ include file="../admin/AdminstyleHead.jsp" %>
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">${selectedGym.gymName } <a href="/group5/admin/gym/allMain" class="btn btn-secondary">回上一頁</a></h1> 
    </div>

    <div class="row">
        <div class="col-lg-6">
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Google Map</h6>
                </div>
                <div class="card-body d-flex">
                    <div id="map" style="margin:20px; width: 500px; height: 500px;"></div>
                </div>
            </div>
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Location Info</h6>
                </div>
                <div class="card-body">
                    地址：<span id="address">${selectedGym.gymAddress}</span><br>
                    營業時間：${selectedGym.gymOpenHours}<br>
                    健友評分：${selectedGym.rating}
                    <input type="hidden" value="${selectedGym.gymId}" id="gymIdFromDetail">
                    <input type="hidden" value="10003" id="memberIdNow">
                </div>
            </div>
        </div> <!-- col end -->
        <div class="col-lg-6">
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
            </div> <!-- card end -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">收藏會員性別比</h6>
                </div>
                <div class="card-body d-flex">
                    <div class="w-100">
						<canvas id="genderChart"></canvas>
					</div>
                </div>
            </div><!-- card end -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">申請${selectedGym.gymName }刪除會員</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered display" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>會員編號</th>
                                    <th>會員帳號</th>
                                    <th>欲刪除之原因</th>
                                    <th>駁回刪除</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>會員編號</th>
                                    <th>會員帳號</th>
                                    <th>欲刪除之原因</th>
                                    <th>駁回刪除</th>
                                </tr>
                            </tfoot>
                            <tbody>
                            <c:forEach var="dellog" items="${delLogs}">
                                <tr>
                                    <td class="delmember">${dellog.member.id }</td>
                                    <td>${dellog.member.memberAccount }</td>
                                    <td>${dellog.delReason }</td>
                                    <td><button class="btn btn-outline-danger denyDel">駁回</button></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div> <!-- card end -->
        </div> <!-- col end -->
    </div><!-- row end -->

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
        src="https://maps.googleapis.com/maps/api/js?key=GOOGLEMAPS_KEY&libraries=places&callback=initMap&region=TW&language=zh-TW"></script>


<%@ include file="../admin/AdminstyleFoot.jsp" %>
</body>

</html>