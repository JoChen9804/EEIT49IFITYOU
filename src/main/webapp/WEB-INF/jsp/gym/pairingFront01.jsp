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
	 let i=1;
     $("#addLoc").on("click",function(){
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
     
     $("#goData").on("click",function(){
        $("#showLocText").text("臺北市、新北市、桃園市、臺中市");
        $("#dataWT").prop("selected","true");
        $("#dataF").prop("selected","true");
        $("#dataT").prop("selected","true");
        $("#dataR").prop("selected","true");
        $("#connection").attr("class","form-control-input notEmpty");
        $("#connection").text("Line Id: @happy2meet");
        $("#toPartner").text("有機會一起健身吧！");
        $("#toPartner").attr("class","form-control-input notEmpty");
        $("#nterms").prop("checked","true");
	})
     
     
});
let pairdataBean;
function submitPairData(){
	pairdataBean={"memberId":${loginMember.id},"workoutTime":$("#workoutTime").val(),
			"workoutFrequency":$("#workoutFrequency").val(),"workoutType":$("#workoutType").val(),"relationship":$("#relationship").val(),
			"currentLocation":$("#showLocText").text(),"connection":$("#connection").val(),"toPartner":$("#toPartner").val()};
	$.ajax({
		type:'post',
		url:'/group5/user/pairing/save1',
		contentType:'application/json',
		data:JSON.stringify(pairdataBean),
		dataType:'json',
		success:function(data){
			$("#subid").val(data.pdId);
			$("#submit01").submit();
		}
	});
	
}
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
                        <div class="above-heading">ABOUT ME</div>
                        <h2>配對資料－關於我</h2>
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
	                                <option class="select-option" value="1">02:01-10:00</option>
	                                <option class="select-option" value="2">10:01-18:00</option>
	                                <option class="select-option" value="3" id="dataWT">18:01-02:00</option>
                                </select>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                            	<select class="form-control-select" id="workoutFrequency" required>
	                                <option class="select-option" value="" disabled selected>請選擇運動頻率</option>
	                                <option class="select-option" value="0">一週少於1天</option>
	                                <option class="select-option" value="1">一週1天</option>
	                                <option class="select-option" value="2">一週2天</option>
	                                <option class="select-option" value="3">一週3天</option>
	                                <option class="select-option" value="4">一週4天</option>
	                                <option class="select-option" value="5" id="dataF">一週5天</option>
	                                <option class="select-option" value="6">一週6天</option>
	                                <option class="select-option" value="7">一週7天</option>
                                </select>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                            	<select class="form-control-select" id="workoutType" required>
	                                <option class="select-option" value="" disabled selected>請選擇偏好的運動種類</option>
	                                <option class="select-option" value="1">徒手健身／街頭健身</option>
	                                <option class="select-option" value="2" id="dataT">自由重量</option>
	                                <option class="select-option" value="3">機械式</option>
	                                <option class="select-option" value="4">其他無氧運動</option>
	                                <option class="select-option" value="5">室內有氧（跑步機、踏步機等）</option>
	                                <option class="select-option" value="6">瑜珈、皮拉提斯等</option>
	                                <option class="select-option" value="7">其他有氧運動</option>
                                </select>
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-group">
                            	<select class="form-control-select" id="relationship" required>
	                                <option class="select-option" value="" disabled selected>請選擇目前的感情狀態</option>
	                                <option class="select-option" value="1" id="dataR">單身</option>
	                                <option class="select-option" value="3">非單身</option>
	                                <option class="select-option" value="2">其他</option>
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
                            <div class="form-group checkbox">
                                <input type="checkbox" id="nterms" value="Agreed-to-Terms" required>勾選表示同意資料將被合理運用至配對相關功能。 
                                <div class="help-block with-errors"></div>
                            </div>
                            <div class="form-message">
                                <div class="h3 text-center hidden" id="vforAll"></div>
                            </div>
                            <div class="form-group d-flex justify-content-center">
                                <button type="button" class="btn-solid-reg" id="subMePair">申請配對</button>
                                <button type="button" class="btn-solid-reg" id="goData">一鍵輸入</button>
                            </div>
                        </div>
                        <!-- end of newsletter form -->
                        <form action="/group5/user/pairing/whofitme" method="post" id="submit01"><input type="hidden" name="pdid" id="subid"></form>
                    </div> <!-- end of text-container -->
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of form -->
    <!-- end of newsletter -->
<%@include file="../admin/FrontStageFoot.jsp" %>
</body>
</html>