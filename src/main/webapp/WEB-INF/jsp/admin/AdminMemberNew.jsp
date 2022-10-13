<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>會員資料填寫</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--引用css sweet alert-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<!--引用css sweet alert-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<!--引用SweetAlert2.js-->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js"
	type="text/javascript"></script>
<style>
fieldset {
	width: 1200px;
	border: 2px solid #D1BBFF;
	margin: auto;
	border-bottom: 5px;
	text-align: center;
}

.happy {
	width: 950px;
	margin: 10px auto;
}

.addr {
	border-left: 10px;
}

.bdcard {
	width: 370px;
	float: left;
}

.bdcard img {
	height: 300px;
	width: 300px;
	border: 3px dashed silver;
	margin-bottom: 12px;
}

.bdtext {
	width: 450px;
	float: right;
	border-left: 10px;
}

.bttext {
	width: 1000px;
	float: inline-end right;
}

.t1 {
	width: 135px;
	float: left;
	text-align: right;
	/* border: 1px solid rebeccapurple; */
}

input {
	float: inline-start;
}

.st1 {
	width: 450px;
	border-bottom: 2px dashed silver;
	margin: 0px 5px 8px 20px;
	padding-bottom: 4px;
	float: left;
	border-left: 5px;
	font-size: 1.1rem;
	color: black;
}

.st2 {
	width: 450px;
	border-bottom: 2px dashed silver;
	margin: 0px 5px 8px 20px;
	padding-bottom: 4px;
	float: left;
	border-left: 10px;
}

.pic {
	position: absolute;
	left: 30%;
}

h5 {
	text-align: center;
}

.addr-county {
	width: 80px;
	color: black;
}

.addr-district {
	width: 95px;
}

.addr-zipcode {
	width: 120px;
}
</style>
</head>

<body>
	<%@ include file="AdminstyleHead.jsp"%>
	<!--引用SweetAlert2.js-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js"
		type="text/javascript"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>

	<FORM ACTION="adminMemberModifyAndNew.controller" method="post"
		enctype="multipart/form-data" id="updateForm">
		<input name="idNumString" value="${OneMember.id}" type="hidden">
		<input name="modifyimage" value="false" type="hidden" id="modifyimage">
		<input name="nowimage" value="${OneMember.memberPhoto}" type="hidden">
		<fieldset>
			<h4 style="color: black">會員資料填寫</h4>
			<div style="visibility: hidden">
				<input id="sub" type="text" name="sub"> <input id="muteNew">
				<input id="postPermissionNew"> <input name="detailId"
					type="hidden" value="${OneMember.memberDetail.id}">
			</div>
			<div class="happy">
				<!-- 左邊欄位!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
				<div class="bdcard">
					<div id="result">
						<img src="" height=300 width=300 id="img">
					</div>
					<input type="file" name="filepath" accept="image/*" id="file_input"
						style="margin-bottom: 10px; margin-left: 25%;">
					<div class="st1">
						<label for="" class="t1">生日：</label><input type="date"
							name="birthday" value="1990-01-01" id=birthday>
					</div>
					<div class="st1">
						<label for="cellphone1" class="t1">手機：</label><input
							id="cellphone1" type="text" name="cellphone" maxlength="10">
					</div>
					<div class="st1">
						<label for="email1" class="t1">Email：</label><input id="email1"
							type="email" name="email" required>
					</div>
					<div class="st1">
						<label for="" class="t1">性別：</label>
						<!-- label標籤有for id的功能 -->
						<label> <input type="radio" name="gender" value="男"
							id="male">男
						</label>&ensp; <label> <input type="radio" name="gender" value="女"
							class="radio" id="female">女
						</label>&ensp; <label> <input type="radio" name="gender"
							value="秘密" checked id="secret">秘密
						</label>
					</div>
					<div class="st1 hide3" style="display: none">
						<label for="" class="t1">禁言：</label>
						<c:choose>
							<c:when test="${OneMember.memberDetail.mute==0}">
								<label> <input type="radio" name="mute" value="1">是
								</label>
								&emsp;
								<label> <input type="radio" name="mute" value="0"
									checked>否
								</label>
							</c:when>
							<c:when test="${OneMember.memberDetail.mute==1}">
								<label> <input type="radio" name="mute" value="1"
									checked>是
								</label>
								&emsp;
								<label> <input type="radio" name="mute" value="0"
									class="radio">否
								</label>
							</c:when>
						</c:choose>
					</div>
					<div class="st1" style="display: none">
						<label for="" class="t1">論壇權限：</label>
						<c:choose>
							<c:when test="${OneMember.memberDetail.postPermission==0}">
								<label> <input type="radio" name="postPermission"
									value="0" checked>普通
								</label>
								<label> <input type="radio" name="postPermission"
									value="1">高級
								</label>
								<label> <input type="radio" name="postPermission"
									value="2">最高
								</label>
							</c:when>
							<c:when test="${OneMember.memberDetail.postPermission==1}">
								<label> <input type="radio" name="postPermission"
									value="0">普通
								</label>
								<label> <input type="radio" name="postPermission"
									value="1" checked>高級
								</label>
								<label> <input type="radio" name="postPermission"
									value="2">最高
								</label>
							</c:when>
							<c:when test="${OneMember.memberDetail.postPermission==2}">
								<label> <input type="radio" name="postPermission"
									value="0">普通
								</label>
								<label> <input type="radio" name="postPermission"
									value="1">高級
								</label>
								<label> <input type="radio" name="postPermission"
									value="2" checked>最高
								</label>
							</c:when>
						</c:choose>
					</div>
				</div>
				<div class="bdtext">
					<div class="st1" style="visibility: hidden;" id="id">
						<label class="t1">編號：</label> <input id="setId" type="text"
							value="${OneMember.id}" disabled>
					</div>
					<div class="st1">
						<label for="account1" class="t1">帳號：</label> <input id="account1"
							type="text" name="account" autofocus placeholder=""
							autocomplete="off" required value="">

					</div>
					<div class="st1">
						<label for="pwd1" class="t1">密碼：</label><input id="pwd1"
							type="password" name="pwd" maxlength="15" required
							onblur="validate()">
					</div>
					<div class="st1">
						<label for="pwd2" class="t1">再次輸入密碼：</label><input id="pwd2"
							type="password" name="pwd2" maxlength="15" required
							onblur="validate()"> <span id="tishi"></span> <input
							type="hidden" name="originalRealPassword"
							value="${OneMember.memberPassword}" id="originalRealPassword">
					</div>
					<div class="st1">
						<label for="name1" class="t1">姓名：</label> <input id="name1"
							type="text" name="name" required>

					</div>
					<div id="twzipcode" class="st2" style="color: black">
						<label for="address" class="t1" id="zipcode" style="color: black">地址：</label>
					</div>
					<div class="st2">
						<label for="address" class="t1" style="color: black">詳細地址：</label> <input type="text"
							id="address" name="address" size="30" value="">
					</div>
					<div class="st1">
						<label for="" class="t1" id="match">參加健友配對：</label> <label>
							<input type="radio" name="match" value="1" id="pairT">是
						</label> &emsp; <label> <input type="radio" name="match" value="0"
							class="radio" checked id="pairF">否
						</label>
					</div>
					<div class="st1" id="hide2">
						<label for="registerReferralCode" class="t1">推薦人代碼：</label> <input
							id="registerReferralCode" type="text" name="registerReferralCode"
							maxlength="6">
					</div>
					<div class="st1 hide3" style="display: none">
						<label for="referralCode" class="t1">你的推薦碼：</label> <input
							id="referralCode1" type="text" name="referralCode" maxlength="6"
							value="${OneMember.memberDetail.referralCode}">
					</div>
					<div class="st1 hide3" style="display: none">
						<label for="" class="t1">最近登入日：</label><input type="date"
							name="recentLoginDate"
							value="${OneMember.memberDetail.recentLoginDate}">
					</div>
				</div>


			</div>
		</fieldset>
		<fieldset>
			<div>
				<input type="button" value="送出" id="sub1" class="modifySubmit">
				<input type="reset" value="清除"> <input type="button"
					id="goback" value="返回">
			</div>
		</fieldset>
		<br> <br>
		<script>
		$(function () {
			console.log($('originalRealPassword').val());
			$("#twzipcode").twzipcode({
				css: ['addr-county', 'addr-district', 'addr-zipcode']
			});
		});
		$("#goback").click(function() {

			$(location).attr("href", "adminMemberAction.controller")
		});
		$(document).ready(function() {
			var OneMember = "${OneMember.id}";
			if (OneMember){
				document.getElementById("id").setAttribute("style", "visibility:inline;");
				var img=document.getElementById("img");
                img.setAttribute("src", "${OneMember.memberPhoto}");                
                $('#account1').val("${OneMember.memberAccount}")
				$('#pwd1').val("******")
				$('#pwd2').val("******")
                $('#name1').val("${OneMember.memberName}")
                $('#email1').val("${OneMember.email}")
                
                $('#cellphone1').val("${OneMember.memberDetail.cellphone}")
                $('#registerReferralCode').val("${OneMember.memberDetail.registerReferralCode}")
                $('#nickname1').val("${OneMember.memberDetail.nickname}")
                $('#birthday').val("${OneMember.memberDetail.birthday}")
                $('#address').val("${OneMember.memberDetail.memberAddress}")
				$('#twzipcode').twzipcode('set', "${OneMember.memberDetail.postalCode}");
                $('#pairContactInfo').val("${OneMember.memberDetail.pairContactInfo}")
                $('#pairRequest').val("${OneMember.memberDetail.pairRequest}")
                $('#pairInfo').val("${OneMember.memberDetail.pairInfo}")
                var listHide3 = document.getElementsByClassName('hide3')
					for (var index = 0; index < listHide3.length; ++index) {
						listHide3[index].setAttribute("style", "");
						}
                if("${OneMember.memberDetail.pairWilling}"==1){
                	document.getElementById("pairF").checked = false;
                	document.getElementById("pairT").checked = true;
					var list, index;
					list = document.getElementsByClassName('hide1')
					for (index = 0; index < list.length; ++index) {
    					list[index].setAttribute("style", "");
						}
                }
                if("${OneMember.memberDetail.gender}"=="男"){
                	document.getElementById("male").checked = true;
                	document.getElementById("female").checked = false;
                	document.getElementById("secret").checked = false;
                }else if("${OneMember.memberDetail.gender}"=="女"){
                	document.getElementById("male").checked = false;
                	document.getElementById("female").checked = true;
                	document.getElementById("secret").checked = false;
                }else{
                	document.getElementById("male").checked = false;
                	document.getElementById("female").checked = false;
                	document.getElementById("secret").checked = true;
                }
                
                document.getElementById("sub").setAttribute("value", "modifyMemberSubmitAction");
                
			}else{
				var img=document.getElementById("img");
                img.setAttribute("src", "img/undraw_profile_3.svg");
                document.getElementById("sub").setAttribute("value", "newMemberSubmitAction");
                document.getElementById("muteNew").setAttribute("name", "mute");
                document.getElementById("muteNew").setAttribute("value", "0");
                document.getElementById("postPermissionNew").setAttribute("name", "postPermission");
                document.getElementById("postPermissionNew").setAttribute("value", "0");
			}
			//是否參加健有配對之表單動態實現
			$('input:radio[name="match"]').change(function (){ 
				var matchVal = $(this).val(); 
				if (matchVal==0){
					var list, index;
					list = document.getElementsByClassName('hide1')
					for (index = 0; index < list.length; ++index) {
    					list[index].setAttribute("style", "display: none");
    					
						}
					document.getElementById('hide2').setAttribute("style", "");
					
					
				}else{
					var list, index;
					list = document.getElementsByClassName('hide1')
					for (index = 0; index < list.length; ++index) {
    					list[index].setAttribute("style", "");
						}
				}  
	        });  
		
		});
			
			function validate() {
				var pwd1 = document.getElementById("pwd1").value;

				var pwd2 = document.getElementById("pwd2").value;

				if (pwd1 == pwd2) {
					document.getElementById("tishi").innerHTML = "<font color='green'兩次密碼相同</font>";
					document.getElementById("sub1").disabled = false;
				} else {
					document.getElementById("tishi").innerHTML = "<font color='red'>兩次密碼不相同</font>";
					document.getElementById("sub1").disabled = true;
				}
			}		
		// 取得縣市 county（返回字串）
		
		$("#address").focus(function() {
			let county = $('#twzipcode').twzipcode('get','county');
			let district = $('#twzipcode').twzipcode('get','district');
			let zipcode = $('#twzipcode').twzipcode('get','zipcode');
			if( ($('#address').val()).indexOf('號') == -1){
			$('#address').val(county + district);
			}
			if( ($('#address').val()).indexOf(county + district) == -1){
				$('#address').val(county + district);
				}
		});
		$(".modifySubmit").on('click', function(event){
			  Swal.fire({
				  title:'送出成功!',
				  icon:'success'
			  }).then((result) => {
		   		  $('#updateForm').submit();
				});

});
		

		</script>
	</form>
	<script src="js/admin/adminPhotoShow.js"></script>
	<%@ include file="AdminstyleFoot.jsp"%>
</body>
</html>