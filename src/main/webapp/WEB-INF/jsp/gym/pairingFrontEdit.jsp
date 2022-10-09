<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>配對中心</title>
<!-- Core plugin JavaScript-->
<script src="/group5/js/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
let i=1;
$(function(){
	$("#connection").attr("class","form-control-input notEmpty");
	$("#connection").append("${loginMember.memberDetail.pairContactInfo}");
	$("#toPartner").attr("class","form-control-input notEmpty");
	$("#toPartner").append("${loginMember.memberDetail.pairInfo}");
	getUpdate();
    $("#addLoc").on("click",function(){
    	console.log(i);
        if(i<=5 && $("#showLocText").text().indexOf($("#clocate").val())==-1){
            $("#showLocText").append(($("#showLocText").text()==""?"":"、"))
            $("#showLocText").append($("#clocate").val());
            i++;
        }else if(i>5){
            $("#locError").text("出沒地區最多5個")
        }
        $("#clocate").val("");
    })
    
    $("#resetloc").on("click",function(){
   	
        i=1;
        $("#showLocText").text("");
        $("#locError").text("")
        $("#clocate").val("");
    })
    
    $("#subMePair").on("click",function(){
   	 submitPairData();
    })
    $("#subU").on("click",function(){
    	let pairdataBean={"pdId":pdId,"pairGender":$('input[name="gender"]:checked').val(),"pairRelationship":$('#relationship').val()};
    	console.log(pairdataBean);
    	$.ajax({
    		type:'post',
    		url:'/group5/user/pairing/save2',
    		contentType:'application/json',
    		data:JSON.stringify(pairdataBean),
    		dataType:'json',
    		success:function(data){
    			getUpdate();
    			Swal.fire(
    					  '更新成功',
    					  '',
    					  'warning'
    					)
    		}
    	});
    })
    
    $(".goPair").on("click",function(){
    	$("#goPairForm").submit();
    })
});
let pairdataBean;
let pdId;
function submitPairData(){
	pairdataBean={"pdId":pdId,"memberId":${loginMember.id},"workoutTime":$("#workoutTime").val(),
			"workoutFrequency":$("#workoutFrequency").val(),"workoutType":$("#workoutType").val(),"relationship":$("#relationship").val(),
			"currentLocation":$("#showLocText").text(),"connection":$("#connection").val(),"toPartner":$("#toPartner").val()};
	$.ajax({
		type:'post',
		url:'/group5/user/pairing/update1',
		contentType:'application/json',
		data:JSON.stringify(pairdataBean),
		dataType:'json',
		success:function(data){
			getUpdate();
			Swal.fire(
					  '更新成功',
					  '',
					  'warning'
					)
		}
	});
}

function getUpdate(){
	console.log(typeof(${loginMember.id}));
	$.ajax({
		type:'post',
		url:'/group5/user/pairing/querydata',
		data:{"memberid":${loginMember.id}},
		dataType:'json',
		success:function(data){
			console.log(data);
			pdId=data.pdId;
			$("#mPdId").val(pdId);
			$("#showLocText").text(data.currentLocation);
			let str=data.currentLocation;
			let list=str.split("、");
			i=list.length;
			i++;
			if(data.workoutTime==1){
				$("#t1").prop("selected","true");
			}else if(data.workoutTime==2){
				$("#t2").prop("selected","true");
			}else if(data.workoutTime==3){
				$("#t3").prop("selected","true");
			}
			if(data.workoutFrequency==0){
				$("#f0").prop("selected","true");
			}else if(data.workoutFrequency==1){
				$("#f1").prop("selected","true");
			}else if(data.workoutFrequency==2){
				$("#f2").prop("selected","true");
			}else if(data.workoutFrequency==3){
				$("#f3").prop("selected","true");
			}else if(data.workoutFrequency==4){
				$("#f4").prop("selected","true");
			}else if(data.workoutFrequency==5){
				$("#f5").prop("selected","true");
			}else if(data.workoutFrequency==6){
				$("#f6").prop("selected","true");
			}else if(data.workoutFrequency==7){
				$("#f7").prop("selected","true");
			}
			if(data.workoutType==1){
				$("#wt1").prop("selected","true");
			}else if(data.workoutType==2){
				$("#wt2").prop("selected","true");
			}else if(data.workoutType==3){
				$("#wt3").prop("selected","true");
			}else if(data.workoutType==4){
				$("#wt4").prop("selected","true");
			}else if(data.workoutType==5){
				$("#wt5").prop("selected","true");
			}else if(data.workoutType==6){
				$("#wt6").prop("selected","true");
			}else if(data.workoutType==7){
				$("#wt7").prop("selected","true");
			}
			if(data.relationship==1){
				$("#r1").prop("selected","true");
			}else if(data.relationship==2){
				$("#r2").prop("selected","true");
			}else if(data.relationship==3){
				$("#r3").prop("selected","true");
			}
			if(data.pairRelationship==1){
				$("#pr1").prop("selected","true");
			}else if(data.relationship==2){
				$("#pr2").prop("selected","true");
			}else if(data.relationship==3){
				$("#pr3").prop("selected","true");
			}
			if(data.pairRelationship==1){
				$("#pr1").prop("selected","true");
			}else if(data.pairRelationship==2){
				$("#pr2").prop("selected","true");
			}else if(data.pairRelationship==3){
				$("#pr3").prop("selected","true");
			}
			if(data.pairGender==1){
				$("#gender1").prop("checked","true");
			}else if(data.pairGender==2){
				$("#gender2").prop("checked","true");
			}else if(data.pairGender==3){
				$("#gender3").prop("checked","true");
			}
			
		}
	});
	
	

}
</script>
</head>
<body>
<%@include file="../admin/FrontStageHead.jsp" %>
<div id="features" class="tabs">
        <div class="container">
            <div class="row" style="padding:10px">
                <div class="col-lg-12">
                    <div class="above-heading">I FIT YOU</div>
                    <h2 class="h2-heading">配對中心</h2>
                    <p class="p-heading">尋找最適合你的</p>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
            <div class="row">
                <div class="col-lg-12">

                    <!-- Tabs Links -->
                    <ul class="nav nav-tabs" id="argoTabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="nav-tab-1" data-toggle="tab" href="#tab-1" role="tab" aria-controls="tab-1" aria-selected="true"><i class="fas fa-list"></i>開始配對</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="nav-tab-2" data-toggle="tab" href="#tab-2" role="tab" aria-controls="tab-2" aria-selected="false"><i class="fas fa-envelope-open-text"></i>關於我</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="nav-tab-3" data-toggle="tab" href="#tab-3" role="tab" aria-controls="tab-3" aria-selected="false"><i class="fas fa-chart-bar"></i>篩選資料</a>
                        </li>
                    </ul>
                    <!-- end of tabs links -->
					
					
                        
                    <!-- Tabs Content -->
                    <div class="tab-content" id="argoTabsContent">
                     <div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="tab-1">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="text-container">
                                    	<form action="/group5/user/pairing/start2pair" method="post" id="goPairForm">
				        					<input type="hidden" name="mainPid" id="mPdId">
				        					<input type="submit" value="今日配對" class="btn-solid-reg goPair">
				    					</form>
                                    </div> <!-- end of text-container -->
                                </div> <!-- end of col -->
                            </div> <!-- end of row -->
                        </div> <!-- end of tab-pane -->
                        <!-- end of tab -->
                        
                        <!-- Tab -->
                        <div class="tab-pane fade" id="tab-2" role="tabpanel" aria-labelledby="tab-2">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="text-container">
                                    <!-- Newsletter Form -->
				                        <div id="newsletterForm" data-toggle="validator" data-focus="false">
				                            <div class="form-group">
				                            	<input class="form-control-input" list="datalistOptions" id="clocate" required>
				                                <label class="label-control" for="clocate">出沒地區</label>
				                            	<datalist id="datalistOptions">
					                                <option class="select-option" value="基隆市"></option>
					                                <option class="select-option" value="臺北市"></option>
					                                <option class="select-option" value="新北市"></option>
					                                <option class="select-option" value="桃園市"></option>
					                                <option class="select-option" value="新竹市／新竹縣"></option>
					                                <option class="select-option" value="苗栗縣"></option>
					                                <option class="select-option" value="臺中市"></option>
					                                <option class="select-option" value="彰化縣"></option>
					                                <option class="select-option" value="南投縣"></option>
					                                <option class="select-option" value="雲林縣"></option>
					                                <option class="select-option" value="嘉義市／嘉義縣"></option>
					                                <option class="select-option" value="臺南市"></option>
					                                <option class="select-option" value="高雄市"></option>
					                                <option class="select-option" value="屏東縣"></option>
					                                <option class="select-option" value="宜蘭縣"></option>
					                                <option class="select-option" value="花蓮縣"></option>
					                                <option class="select-option" value="臺東縣"></option>
					                                <option class="select-option" value="澎湖縣"></option>
					                                <option class="select-option" value="金門縣"></option>
					                                <option class="select-option" value="連江縣"></option>
				                                </datalist>
				                                <div style="margin:10px;">
				                                	<p class="p-small" id="showLocText"></p>
				                                	<button class="btn-outline-reg" id="addLoc">新增地區</button>
				                                	<button class="btn-outline-red" id="resetloc">重設地區</button>
				                                </div>
				                                <div class="p-small" id="locError"></div>
				                                <div class="help-block with-errors"></div>
				                            </div>
				                            <div class="form-group">
				                            	<select class="form-control-select" id="workoutTime" required>
					                                <option class="select-option" value="" disabled selected>請選擇最常運動的時段</option>
					                                <option class="select-option" value="1" id="t1">02:01-10:00</option>
					                                <option class="select-option" value="2" id="t2">10:01-18:00</option>
					                                <option class="select-option" value="3" id="t3">18:01-02:00</option>
				                                </select>
				                                <div class="help-block with-errors"></div>
				                            </div>
				                            <div class="form-group">
				                            	<select class="form-control-select" id="workoutFrequency" required>
					                                <option class="select-option" value="" disabled selected>請選擇運動頻率</option>
					                                <option class="select-option" value="0" id="f0">一週少於1天</option>
					                                <option class="select-option" value="1" id="f1">一週1天</option>
					                                <option class="select-option" value="2" id="f2">一週2天</option>
					                                <option class="select-option" value="3" id="f3">一週3天</option>
					                                <option class="select-option" value="4" id="f4">一週4天</option>
					                                <option class="select-option" value="5" id="f5">一週5天</option>
					                                <option class="select-option" value="6" id="f6">一週6天</option>
					                                <option class="select-option" value="7" id="f7">一週7天</option>
				                                </select>
				                                <div class="help-block with-errors"></div>
				                            </div>
				                            <div class="form-group">
				                            	<select class="form-control-select" id="workoutType" required>
					                                <option class="select-option" value="" disabled selected>請選擇偏好的運動種類</option>
					                                <option class="select-option" value="1" id="wt1">徒手健身／街頭健身</option>
					                                <option class="select-option" value="2" id="wt2">自由重量</option>
					                                <option class="select-option" value="3" id="wt3">機械式</option>
					                                <option class="select-option" value="4" id="wt4">其他無氧運動</option>
					                                <option class="select-option" value="5" id="wt5">室內有氧（跑步機、踏步機等）</option>
					                                <option class="select-option" value="6" id="wt6">瑜珈、皮拉提斯等</option>
					                                <option class="select-option" value="7" id="wt7">其他有氧運動</option>
				                                </select>
				                                <div class="help-block with-errors"></div>
				                            </div>
				                            <div class="form-group">
				                            	<select class="form-control-select" id="relationship" required>
					                                <option class="select-option" value="" disabled selected>請選擇目前的感情狀態</option>
					                                <option class="select-option" value="1" id="r1">單身</option>
					                                <option class="select-option" value="3" id="r3">非單身</option>
					                                <option class="select-option" value="2" id="r2">其他</option>
				                                </select>
				                                <div class="help-block with-errors"></div>
				                            </div>
				                            <div class="form-group">
				                                <textarea class="form-control-input" id="connection" style="height: 100px" required></textarea>
				                                <label class="label-control" for="connection">聯繫方式</label>
				                                <div class="help-block with-errors"></div>
				                            </div>
				                            <div class="form-group">
				                                <textarea class="form-control-input" id="toPartner" style="height: 150px" required></textarea>
				                                <label class="label-control" for="toPartner">給健友的話</label>
				                                <div class="help-block with-errors"></div>
				                            </div>
				                            <div class="form-message">
				                                <div class="h3 text-center hidden" id="vforAll"></div>
				                            </div>
				                            <div class="form-group d-flex justify-content-center">
				                                <button type="button" class="btn-solid-reg" id="subMePair" style="margin:0 15px">資料修改</button>
				                                <button type="button" class="btn-solid-reg goPair" style="margin:0 15px">今日配對</button>
				                            </div>
				                        </div>
				                        <!-- end of newsletter form -->
                                    </div> <!-- end of text-container -->
                                </div> <!-- end of col -->
                            </div> <!-- end of row -->
                        </div> <!-- end of tab-pane -->
                        <!-- end of tab -->

                        <!-- Tab -->
                        <div class="tab-pane fade" id="tab-3" role="tabpanel" aria-labelledby="tab-3">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="text-container">
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
					                                <option class="select-option" value="1" id="pr1">單身</option>
					                                <option class="select-option" value="3" id="pr3">非單身</option>
					                                <option class="select-option" value="2" id="pr2">不拘</option>
				                                </select>
				                                <div class="help-block with-errors"></div>
				                            </div>
				                            <div class="form-message">
				                                <div class="h3 text-center hidden" id="vforAll"></div>
				                            </div>
				                            <div class="form-group d-flex justify-content-center">
				                                <button type="button" class="btn-solid-reg" id="subU" style="margin:0 15px">儲存修改</button>
				                                <button type="button" class="btn-solid-reg goPair" style="margin:0 15px">今日配對</button>
				                            </div>
				                        </div>
				                        <!-- end of newsletter form -->
                                    </div> <!-- end of text-container -->
                                </div> <!-- end of col -->
                            </div> <!-- end of row -->
                        </div> <!-- end of tab-pane -->
                        <!-- end of tab -->
                        
                    </div> <!-- end of tab content -->
                    <!-- end of tabs content -->
					<form action="/group5/user/pairing/start2pair" method="post" id="goPairForm">
				        <input type="hidden" name="mainPid" id="mPdId">
				    </form>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of tabs -->
    <!-- end of features -->

<%@include file="../admin/FrontStageFoot.jsp" %>
</body>
</html>