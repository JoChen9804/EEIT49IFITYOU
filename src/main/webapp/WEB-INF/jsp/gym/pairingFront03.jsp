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
$(function(){
	let ans;
	$("#yes2pair").on("click",function(){
		ans={ main: "${mainPD.pdId }", partner : "${matching.pdId }", ans2pair: "yes"};
		sendans();
	});
	$("#no2pair").on("click",function(){
		ans={ main: "${mainPD.pdId }", partner : "${matching.pdId }", ans2pair: "no"};
		nextperson();
	});
	
	function sendans(){
		$("#yes2pair").on("click",function(){
			console.log("hello")
			$.ajax({
				type:'post',
				url:'/group5/user/pairing/pairmove',
				data: jQuery.param(ans),
				contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				dataType: 'text',
				success: function(data){
					console.log(data);
					if(data=="wait"){
						$("#yes2pair").prop("disable","true");
						$("#no2pair").prop("disable","true");
						$("#wait").text("目前還未收到${matching.member.memberAccount}回應");
					}else if(data=="show"){
						$("#yes2pair").prop("disable","true");
						$("#no2pair").prop("disable","true");
						$("#lastitem").append("<div class='p-large'>聯絡資訊：${matching.member.memberDetail.pairContactInfo}</div><div class='p-large'>想對健友說的話：${matching.member.memberDetail.pairInfo}</div>")
					}else if(data=="next"){
						nextperson();
					}
				}
			});
		});
	}
	
	function nextperson(){
		$("#sendNext").submit();
	}
})
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
                    <p id="wait"></p>
                    <!-- Sign Up Form -->
                    <div class="form-container">
                    	<img src="${matching.member.memberPhoto}">
                    	<div class="p-large">配對指數：${matching.matchingScore}</div>
                    	<div class="">姓名：${matching.member.memberAccount}</div>
                    	<div class="">性別：${matching.member.memberDetail.gender}</div>
                    	<div class="">出沒地區：${matching.currentLocation}</div>
                    	<div class="">主要運動種類：${matching.workoutType}</div>
                    	<div class="">運動頻率：${matching.workoutFrequency}</div>
                    	<div class="" id="lastitem">平時主要運動時間：${matching.workoutTime}</div>
                    	<button class="btn-solid-reg" id="yes2pair" value="yes" name="ans2pair">一起運動吧！</button>
                    	<form action="/group5/user/pairing/pairnext" method="post" id="sendNext">
                    		<input type="hidden" name="main" value="${mainPD.pdId }">
                    		<button class="btn-solid-reg" id="no2pair" value="no" name="ans2pair" >下次再說</button>
                    	</form>
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