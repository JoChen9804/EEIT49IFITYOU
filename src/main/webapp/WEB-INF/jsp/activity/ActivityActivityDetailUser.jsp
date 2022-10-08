<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I FIT YOU</title>
<style>
        .divtest{
        	width: 60%;
            font: 400 1.3rem/1.625rem "Open Sans", sans-serif;
        	margin-right: auto;
            margin-left: auto;
        }
    </style>
</head>
<body>

	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
	
	<!-- official Bootstrap-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
	

	<!-- ckeditor5 -->
	<script src="https://cdn.ckeditor.com/ckeditor5/35.2.0/super-build/ckeditor.js"></script>

<%@ include file="../admin/FrontStageHead.jsp"%>

	<!-- Video -->
    <div id="video" class="basic-2" style="background-color: white; margin-bottom: -6rem;">
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
                    
                   
                    
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of basic-2 -->
    <!-- end of video -->
    
    <div class="divtest">
    
    	 <h1 style="text-align: center;">${query_activity.activityTitle}</h1>
                    
                    <div >
                    	${query_activity.activityContent}
                    </div>
                    <div style="text-align: center; margin-bottom: 3rem;">
                   		<form action="/group5/user/toactivitysignup" method="post" style="display:inline">
          	         		<input type="hidden" name="userId" value=""/>
          	         		<input type="hidden" name="activityId" value="${query_activity.activityId}"/>
          		          	<input type="submit" id="wantToSignUp" class="btn-solid-reg page-scroll" value="我想報名"/>
              	     	</form>
            		   	&emsp;
                   		<a class="btn-solid-reg page-scroll" href="../activityuser">返回</a>
                    </div>
    
    </div>
    
    <script type="text/javascript">
    	$(function(){
    		let date = new Date();
    		console.log('今天日期='+date.toISOString().split('T')[0]);
    		console.log('國棟截止=' + '${query_activity.signUpDeadline}');
    		console.log('已過期=' + (date.toISOString().split('T')[0] >= '${query_activity.signUpDeadline}'));
    		if(date.toISOString().split('T')[0] >= '${query_activity.signUpDeadline}'){
    			$('#wantToSignUp').attr("disabled","disabled")
    								.attr("style", "background-color:gray;border:gray;color:white")
    								.attr('value', '報名截止');
    		}
    	});
    </script>

<%@ include file="../admin/FrontStageFoot.jsp"%>
</body>
</html>