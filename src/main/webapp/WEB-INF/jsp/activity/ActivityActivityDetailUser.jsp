<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I FIT YOU</title>
</head>
<body>
<%@ include file="../admin/FrontStageHead.jsp"%>

	<!-- Video -->
    <div id="video" class="basic-2" style="background-color: white">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">

                    <!-- Video Preview -->
                    <div class="image-container">
                        <div class="video-wrapper">
                        	<img class="img-fluid" src="/Path/${query_activity.photoData}" alt="alternative">
                        </div> <!-- end of video-wrapper -->
                    </div> <!-- end of image-container -->
                    <!-- end of video preview -->
                    
                    <h1>${query_activity.activityTitle}</h1>
                    
                    <div class="p-heading">
                    	${query_activity.activityContent}
                    </div>
                   	<form action="/group5/user/toactivitysignup" method="post" style="display:inline">
                   		<input type="hidden" name="userId" value=""/>
                   		<input type="hidden" name="activityId" value="${query_activity.activityId}"/>
                    	<input type="submit" class="btn-solid-reg page-scroll" value="我想報名"/>
                   	</form>
                   	&emsp;
                    <a class="btn-solid-reg page-scroll" href="../activityuser">返回</a>
                    
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of basic-2 -->
    <!-- end of video -->

<%@ include file="../admin/FrontStageFoot.jsp"%>
</body>
</html>