<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>配對資料填寫</title>
<!-- Core plugin JavaScript-->
<script src="/group5/js/jquery.min.js"></script>
<script>
$(function(){
    $("#subMePair").on("click",function(){
    	let pairdataBean={"pdId":"${pdid}","pairGender":$('input[name="gender"]:checked').val(),"pairRelationship":$('#relationship').val()};
    	console.log(pairdataBean);
    	$.ajax({
    		type:'post',
    		url:'/group5/user/pairing/save2',
    		contentType:'application/json',
    		data:JSON.stringify(pairdataBean),
    		dataType:'json',
    		success:function(data){
    			console.log(data.pdId+"success");
    			$("#mainPid").val(data.pdId);
    			$("#start2pair").submit();
    		}
    	});
    })
});


</script>
</head>
<body>
<%@include file="../admin/FrontStageHead.jsp" %>
<!-- Newsletter -->
    <div class="form">
        <div class="container" style="margin-top:50px">
            <div class="row">
                <div class="col-lg-12">
                    <div class="text-container">
                        <div class="above-heading">WHO FIT YOU</div>
                        <h2>篩選條件
                        	<p class="d-flex justify-content-center">請選擇您理想健友的條件</p>
                        </h2>
                        
                        <!-- Newsletter Form -->
                        <div id="newsletterForm" data-toggle="validator" data-focus="false">
                            <div class="form-group" style="font-size:0.8em">
                            	<span >尋找性別：</span>
                            	<div class="form-check form-check-inline">
		                            <input class="form-check-input" type="radio" name="gender" id="gender2" value="2">
									<label class="form-check-label" for="gender2">不拘</label>
	                            </div>
	                            <div class="form-check form-check-inline">
	                            	<input class="form-check-input" type="radio" name="gender" id="gender1" value="1">
									<label class="form-check-label" for="gender1">男性</label>
	                            </div>
	                            <div class="form-check form-check-inline">
	                            	<input class="form-check-input" type="radio" name="gender" id="gender3" value="3">
									<label class="form-check-label" for="gender3">女性</label>
                                </div>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                            	<select class="form-control-select" id="relationship" required>
	                                <option class="select-option" value="" disabled selected>請選擇希望對方的感情狀態</option>
	                                <option class="select-option" value="1">單身</option>
	                                <option class="select-option" value="3">非單身</option>
	                                <option class="select-option" value="2">不拘</option>
                                </select>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-message">
                                <div class="h3 text-center hidden" id="vforAll"></div>
                            </div>
                            <div class="form-group">
                                <button type="button" class="form-control-submit-button" id="subMePair">開始配對</button>
                            </div>
                        </div>
                        <!-- end of newsletter form -->
						<form action="/group5/user/pairing/start2pair" method="post" id="start2pair"><input type="hidden" name="mainPid" id="mainPid"></form>
                    </div> <!-- end of text-container -->
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of form -->
    <!-- end of newsletter -->
<%@include file="../admin/FrontStageFoot.jsp" %>
</body>
</html>