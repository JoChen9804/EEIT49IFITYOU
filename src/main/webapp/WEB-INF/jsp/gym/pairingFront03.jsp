<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fit U</title>
<!-- Core plugin JavaScript-->
<script src="/group5/js/jquery.min.js"></script>
<script>
</script>
</head>
<body>
<%@include file="../admin/FrontStageHead.jsp" %>
    <!-- Header -->
    <header id="header" class="ex-2-header" style="background-image: linear-gradient(to bottom, #3a62d6, #ffffff);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>${mainPD.member.memberAccount} 本日配對</h1>
                    <!-- Sign Up Form -->
                    <div class="form-container">
                    	<img src="${matching.member.memberPhoto}">
                    	<div class="">姓名：${matching.member.memberAccount}</div>
                    	<div class="">性別：${matching.member.memberDetail.gender}</div>
                    	<div class="">出沒地區：${matching.currentLocation}</div>
                    	<div class="">主要運動種類：${matching.workoutType}</div>
                    	<div class="">運動頻率：${matching.workoutFrequency}</div>
                    	<div class="">平時主要運動時間：${matching.workoutTime}</div>
                    	<button>一起健身吧！</button>
                    	<button>下次再說</button>
                    </div> <!-- end of form container -->
                    <!-- end of sign up form -->

                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of ex-header -->
    <!-- end of header -->

<%@include file="../admin/FrontStageFoot.jsp" %>
</body>
</html>