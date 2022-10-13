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
let ans;
$(function(){
	//顯示其先查詢配對進度----------------------------------
	if('${already}'!=''){
		console.log('今天配對過囉，幫你看對方進度!')
		theAns('${already}')
	}
	let workoutTime=['02:01-10:00','10:01-18:00','18:01-02:00'];
	let wF=['一週少於1天','一週1天','一週2天','一週3天','一週4天','一週5天','一週6天','一週7天'];
	let wType=['徒手健身／街頭健身','自由重量','機械式','其他無氧運動','室內有氧（跑步機、踏步機等）','瑜珈、皮拉提斯等','其他有氧運動'];
	
	$("#wtype").append(wType[(${matching.workoutType}-1)]);
	$("#wtime").append(workoutTime[(${matching.workoutTime}-1)]);
	$("#wf").append(wF[${matching.workoutFrequency}]);
	
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
})	
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
				theAns(data);
			}
		});
	}
	
	function theAns(data){
		console.log('data'+data)
		if(data==null||data=="wait"){
			$("#yes2pair").css("display","none");
			$("#no2pair").css("display","none");
			$("#lastitem").append("<h5 style='color:#C62828;'>目前還未收到${matching.member.memberAccount}回應</h5>");
		}else if(data==1||data=="show"){
			$("#yes2pair").css("display","none");
			$("#no2pair").css("display","none");
			let textadd='<li class="media"><i class="fas fa-square"></i><div class="media-body">聯絡資訊：${matching.member.memberDetail.pairContactInfo}</div></li>'
						+'<li class="media"><i class="fas fa-square"></i><div class="media-body">想對健友說的話：${matching.member.memberDetail.pairInfo}</div></li>';
			$("#lastitem").append(textadd);
			successPair();
		}else if(data==0||data=="end"){
			$(".form-container").empty();
			$(".form-container").append("<img src='/group5/images/undraw_missed_chances_k3cq.png' style='width:100%'><div style='margin-top:20px'>健友今天與您擦肩而過！</div>");
			
		}
	}

	function successPair(){
		let thePair={'mainPd':{'pdId':'${mainPD.pdId }'},'pairPd':{'pdId':'${matching.pdId }'}}
		$.ajax({
			type:'post',
			url:'/group5/user/pairing/save2pairlog',
			data:JSON.stringify(thePair),
			contentType:'application/json',
			dataType:'json',
			sucess:function(){
				console.log("yes");
			}
		})
	}

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
                    	<img src="${matching.member.memberPhoto}" width="100%">
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
                                 <div class="media-body" id="wtype">主要運動種類：<br></div>
                            </li>
                            <li class="media">
                                 <i class="fas fa-square"></i>
                                 <div class="media-body" id="wf">運動頻率：</div>
                            </li>
                            <li class="media">
                                 <i class="fas fa-square"></i>
                                 <div class="media-body" id="wtime">平時主要運動時間：<br></div>
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