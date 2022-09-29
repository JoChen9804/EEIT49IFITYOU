<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

                   <h2>${signUpActivity.activityTitle} 活動報名表</h2>
					<br>
					<form action="" class="" method="post">
	
						<div>
							會員帳號:
							<input type="text" style="margin-bottom: 0.5em; " name="memberAccount" value="${loginM.memberAccount}" disabled="disabled"><br>
						
							姓名:
							<input type="text" style="margin-bottom: 0.5em;" name="memberName" value="${loginM.memberName}" disabled="disabled"><br>
						
							email:
							<input type="text" style="margin-bottom: 0.5em;" name="memberPhoto1" value="${loginM.email}"><br>
							
							連絡電話:
							<input type="text" style="margin-bottom: 0.5em;" name="memberPhoto2"value="${loginM.memberDetail.cellphone}"/><br>
							
							
						</div>
	
	
					</form>
					
					<br>
					
					<a href="/group5/toactivity/${signUpActivity.activityId}"  style="text-decoration:none;">
							<button class="btn-solid-reg page-scroll">返回</button>
					</a>
                    
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of basic-2 -->
    <!-- end of video -->

<%@ include file="../admin/FrontStageFoot.jsp"%>
</body>
</html>