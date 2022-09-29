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
                            	<p>活動日期<br>${aqa.startTime}~${aqa.endTime}</p>
                        	</div>
                    	</a>
                    	<!-- end of card -->
                    	
					</c:forEach>

                    <!-- Card -->
                    <div class="card">
                        <div class="card-image">
                            <img class="img-fluid" src="images/description-1.png" alt="alternative">
                        </div>
                        <div class="card-body">
                            <h4 class="card-title">Lists Builder</h4>
                            <p>It's very easy to start creating email lists for your marketing actions. Just create your Tivo account</p>
                        </div>
                    </div>
                    <!-- end of card -->

                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of cards-1 -->
    <!-- end of description -->

<%@ include file="../admin/FrontStageFoot.jsp"%>
</body>
</html>