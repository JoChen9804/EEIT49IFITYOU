<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I FIT YOU</title>

</head>
<body>
<%@ include file="../admin/FrontStageHead.jsp"%>

	<!-- JQuery -->
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 	
 	<!-- fontawesome -->
    <script src="https://kit.fontawesome.com/5b36a12f3a.js" crossorigin="anonymous"></script>

		<br><br>
		
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
                            	<p id="count"><i class="fa-solid fa-user"></i> 已報名人數: ${activity_countMember[aqa.activityId]}</p>
                        	</div>
                    	</a>
                    	<!-- end of card -->
                    	
					</c:forEach>

                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of cards-1 -->
    <!-- end of description -->
    
<%@ include file="../admin/FrontStageFoot.jsp"%>
</body>
</html>