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
let returnResult;
$(function(){
	let ans;
	$("#yes2pair").on("click",function(){
		ans={ main: "${mainPD.pdId }", partner : "${matching.pdId }", ans2pair: "yes"};
		if(returnResult==null){
			sendans();
		}
	});
	$("#no2pair").on("click",function(){
		ans={ main: "${mainPD.pdId }", partner : "${matching.pdId }", ans2pair: "no"};
		if(returnResult==null){
			sendans();
		}
		//nextperson();
	});
	
	function sendans(){
		console.log("hello")
		$.ajax({
			type:'post',
			url:'/group5/user/pairing/pairmove',
			data: jQuery.param(ans),
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType: 'text',
			success: function(data){
				returnResult=data;
				console.log(data);
				if(data=="wait"){
					$("#yes2pair").css("display","none");
					$("#no2pair").css("display","none");
					$("#lastitem").append("<h5 style='color:#C62828;'>目前還未收到${matching.member.memberAccount}回應</h5>");
				}else if(data=="show"){
					$("#yes2pair").css("display","none");
					$("#no2pair").css("display","none");
					let textadd='<li class="media"><i class="fas fa-square"></i><div class="media-body">聯絡資訊：${matching.member.memberDetail.pairContactInfo}</div></li>'
								+'<li class="media"><i class="fas fa-square"></i><div class="media-body">想對健友說的話：${matching.member.memberDetail.pairInfo}</div></li>';
					$("#lastitem").append(textadd);
				}else if(data=="end"){
					$(".form-container").empty();
					$(".form-container").append("<img src='/group5/images/undraw_missed_chances_k3cq.png' style='width:100%'><div style='margin-top:20px'>健友今天與您擦肩而過！</div>");
					
				}
			}
		});
	}
	
	function nextperson(){
		//$("#sendNext").submit();
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
                    <!-- Sign Up Form -->
                    <div class="form-container tabs">
                    	<img src="${matching.member.memberPhoto}">
                    	<h3 style="padding-top:5px">配對指數：${matching.matchingScore} %</h3>
                    	<ul class="list-unstyled li-space-lg" id="lastitem" style="padding:0px 50px 0px 50px">
                            <li class="media">
                            	<i class="fas fa-square"></i>
                                <div class="media-body">帳號：${matching.member.memberAccount}</div>
                            </li>
                            <li class="media">
                                 <i class="fas fa-square"></i>
                                 <div class="media-body">性別：${matching.member.memberDetail.gender}</div>
                            </li>
                            <li class="media">
                                 <i class="fas fa-square"></i>
                                 <div class="media-body">出沒地區：${matching.currentLocation}</div>
                            </li>
                            <li class="media">
                                 <i class="fas fa-square"></i>
                                 <div class="media-body">主要運動種類：${matching.workoutType}</div>
                            </li>
                            <li class="media">
                                 <i class="fas fa-square"></i>
                                 <div class="media-body">運動頻率：${matching.workoutFrequency}</div>
                            </li>
                            <li class="media">
                                 <i class="fas fa-square"></i>
                                 <div class="media-body">平時主要運動時間：${matching.workoutTime}</div>
                            </li>
                        </ul>
                    	<button class="btn-solid-reg" id="yes2pair" value="yes" name="ans2pair">一起運動吧！</button>
                    	<button class="btn-solid-reg" id="no2pair" value="no" name="ans2pair" >下次再說</button>
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