<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I FIT YOU</title>
	<!-- JQuery -->
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 	
 	<!-- fontawesome -->
    <script src="https://kit.fontawesome.com/5b36a12f3a.js" crossorigin="anonymous"></script>
    
    <!-- vegas -->
    <link rel="stylesheet" href="/group5/js/activity/vegas/vegas.min.css">	   
    <script src="/group5/js/activity/vegas/vegas.min.js"></script> 
    <link rel="stylesheet" href="/group5/js/activity/slide.css">	   
</head>
<body>
<%@ include file="../admin/FrontStageHead.jsp"%>

		<div style="width:500px; height:500px" id="test"></div>
	<div class="container" style="margin-top: -24rem;">
        <div class="wrap">
            <a class="slide-arrow" id="slidePrev"><i class="fa-solid fa-angle-left"></i></a>
            <a class="slide-arrow right" id="slideNext"><i class="fa-solid fa-angle-right"></i></a>
            <ul class="slide-img">
            	<c:forEach var="si" items="${showImg}">
            		<li><img src="/Path/${si.photoData}" alt=""></li>
            	</c:forEach>
            </ul>
            <ul class="pages">
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>
    </div>
		
		
	  <div class="cards-1">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="above-heading">DESCRIPTION</div>
                    <h2 class="h2-heading">所有活動</h2>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
            <div class="row">
                <div class="col-lg-12">
                
                	<c:forEach var="aqa" items="${activity_queryAll}">
						<!-- Card -->
                   		<a class="card " href="/group5/toactivity/${aqa.activityId}"  style="text-decoration:none;">
                       		<div class="card-image">
                           		<img class="img-fluid" src="/Path/${aqa.photoData}" alt="alternative">
                        	</div>
                        	<div class="card-body">
                            	<h4 class="card-title">${aqa.activityTitle}</h4>
                            	<p id="eventData"><i class="fa-regular fa-calendar"></i> 
                            		<c:choose>
										<c:when test="${aqa.startTime == aqa.endTime}">${aqa.startTime}</c:when>
										<c:otherwise>${aqa.startTime}~${aqa.endTime}</c:otherwise>
									</c:choose>
                            	</p>
                            	<!-- <p id="count"><i class="fa-solid fa-user"></i> 已報名人數: ${activity_countMember[aqa.activityId]}</p> -->
                            	<p id="count"><i class="fa-solid fa-user"></i> 已報名人數: ${aqa.totalSignUp}</p>
                        	</div>
                    	</a>
                    	<!-- end of card -->
					</c:forEach>

                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of cards-1 -->
    <!-- end of description -->
      <!--  
<script>
          
    	$(function(){
    		$("#test").css("background-color","yellow");
    		$("#test").vegas({
                slides: [
                    { src: "/Path/slide1 (1).jpg" },
                    { src: "/Path/slide1 (2).jpg" },
                    { src: "/Path/slide1 (3).jpg" },
                ]
            });
    	});
    </script>
    -->
        <script type="text/javascript" src="/group5/js/activity/slide.js"></script>
<%@ include file="../admin/FrontStageFoot.jsp"%>
</body>
</html>