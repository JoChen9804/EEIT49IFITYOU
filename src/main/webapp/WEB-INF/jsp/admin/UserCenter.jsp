<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--引用css-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<style>
.addr-county {
	width: 80px;
}

.addr-district {
	width: 95px;
}

.addr-zipcode {
	width: 90px;
}
</style>
</head>
<body>
	<%@ include file="FrontStageHead.jsp"%>
	<!--引用SweetAlert2.js-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js"
		type="text/javascript"></script>
	<FORM ACTION="/group5/user/memberModify.controller" method="post"
		enctype="multipart/form-data" id="updateForm">
		<input name="mute" value="${loginMember.memberDetail.mute}"> <input
			name="referralCode" value="${loginMember.memberDetail.referralCode}">
		<input name="postPermission"
			value="${loginMember.memberDetail.postPermission}"> <input
			name="recentLoginDate"
			value="${loginMember.memberDetail.recentLoginDate}"> <input
			name="idNumString" value="${loginMember.id}" type="hidden"> <input
			name="account" value="${loginMember.memberAccount}" type="hidden">
		<input name="originalRealPassword"
			value="${loginMember.memberPassword}" type="hidden"> <input
			name="modifyimage" value="false" type="hidden" id="modifyimage">
		<input name="nowimage" value="${loginMember.memberPhoto}"
			type="hidden"> <input name="detailId"
			value="${loginMember.memberDetail.id}" type="hidden"> <input
			name="hrefSubmit" type="hidden" id="hrefSubmit">

		<!-- Features -->
		<div id="features" class="tabs">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<h2 class="h2-heading">會員資料</h2>
					</div>
					<!-- end of col -->
				</div>
				<!-- end of row -->
				<div class="row">
					<div class="col-lg-12">

						<!-- Tabs Links -->
						<ul class="nav nav-tabs" id="argoTabs" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="nav-tab-1" data-toggle="tab" href="#tab-1" role="tab"
								aria-controls="tab-1" aria-selected="true"><i
									class="fas fa-envelope-open-text"></i>基本資料</a></li>
							<li class="nav-item"><a class="nav-link" id="nav-tab-2"
								data-toggle="tab" href="#tab-2" role="tab" aria-controls="tab-2"
								aria-selected="false"><i class="fas fa-list"></i>論壇與健友</a></li>
						</ul>
						<!-- end of tabs links -->

						<!-- Tabs Content -->
						<div class="tab-content" id="argoTabsContent"
							style="text-align: center;">

							<!-- Tab -->
							<div class="tab-pane fade show active" id="tab-1" role="tabpanel"
								aria-labelledby="tab-1">
								<div class="row">
									<div class="col-lg-7">
										<div class="image-container">
											<div id="result">
												<img src="${loginMember.memberPhoto}" height=350 width=350
													id="img">
											</div>
											<br /> <input type="file" name="filepath" accept="image/*"
												id="file_input" style="display: none">
											<button type="button" onclick="file_input.click()"
												class="btn-solid-reg" style="vertical-align: middle;">上傳照片</button>
										</div>
										<!-- end of image-container -->

									</div>
									<!-- end of col -->
									<div class="col-lg-5">
										<div style="text-align: left; valign: top">
											<label>帳號：</label> <input style="margin-bottom: 0.5em;"
												id="account1" type="text" name="account" required
												value="${loginMember.memberAccount}" disabled><br />
											<label for="pwd1" class="t1">密碼：</label> <input
												style="margin-bottom: 0.5em;" id="pwd1" type="password"
												name="pwd" maxlength="15" required onblur="validate()"
												value="******" disabled><br /> <label for="name1"
												class="t1">姓名：</label> <input style="margin-bottom: 0.5em;"
												id="name1" type="text" name="name" required
												value="${loginMember.memberName}"><br /> <label
												for="email1" class="t1">Email：</label><input id="email1"
												type="email" name="email" required
												style="margin-bottom: 0.7em;" value="${loginMember.email}">
											<br /> <label for="" class="t1">生日：</label><input
												type="date" name="birthday"
												style="margin-bottom: 0.7em; width: 190px;"
												value="${loginMember.memberDetail.birthday}"
												style="margin-bottom: 0.5em;" id=birthday><br /> <label
												for="cellphone1" class="t1">手機：</label><input
												id="cellphone1" type="text" style="margin-bottom: 0.5em;"
												name="cellphone" maxlength="10"
												value="${loginMember.memberDetail.cellphone}"><br />
											<label for="referralCode" class="t1">推薦碼：</label> <input
												id="referralCode1" type="text" name="referralCode"
												maxlength="6"
												value="${loginMember.memberDetail.referralCode}" disabled
												style="margin-bottom: 0.5em; width: 190px;"> <br />
											<label for="" class="t1">性別：</label>
											<!-- label標籤有for id的功能 -->
											<label> <input type="radio" name="gender" value="男"
												id="male">男
											</label>&ensp; <label> <input type="radio" name="gender"
												value="女" class="radio" id="female">女
											</label>&ensp; <label> <input type="radio" name="gender"
												value="秘密" checked id="secret" style="margin-bottom: 0.5em;">秘密
											</label> <br />
											<div id="twzipcode" class="st2">
												<label for="address" class="t1" id="zipcode">地址：</label>
											</div>
											<div class="st2">
												<label for="address" class="t1">詳細地址：</label> <input
													type="text" id="address" name="address" size="32" value=""
													style="margin-bottom: 1em;">
											</div>
											<input type="button" value="修改" id="sub1"
												class="btn-solid-reg modifySubmit"
												style="position: absolute; left: 30%">

										</div>
										<!-- end of text-container -->
									</div>
									<!-- end of col -->
								</div>
								<!-- end of row -->
							</div>
							<!-- end of tab-pane -->
							<!-- end of tab -->

							<!-- Tab -->
							<div class="tab-pane fade" id="tab-2" role="tabpanel"
								aria-labelledby="tab-2">
								<div class="row">
									<div class="col-lg-6">
										<div class="image-container">
											<div id="result">
												<img src="${loginMember.memberPhoto}" height=350 width=350
													id="img">
											</div>
										</div>
										<!-- end of image-container -->
									</div>
									<!-- end of col -->
									<div class="col-lg-6">
										<div class="text-container" style="text-align: left;">
											<c:choose>
												<c:when test="${loginMember.memberDetail.mute==0}">
													<label>論壇狀態：您目前可以發言喔~~</label>
													<br />
												</c:when>
												<c:when test="${loginMember.memberDetail.mute==1}">
													<label>論壇狀態：很抱歉，您目前無法發言~~</label>
													<br />
												</c:when>
											</c:choose>
											<div class="st1">
												<label for="" class="t1" id="match">參加健友配對：</label> <label>
													<input type="radio" name="match" value="1" id="pairT">是
												</label> &emsp; <label> <input type="radio" name="match"
													value="0" class="radio" checked id="pairF">否
												</label>
											</div>
											<div class="st1 hide1" style="display: none">
												<h6>配對成功後，您的聯繫資訊與給健友的話將提供給配對成功之健友。</h6>
												<h6 style="color: red;">如無法同意請勿參加!!</h6>
												<label for="pairContactInfo" class="t1">配對聯繫：</label>
												<textarea id="pairContactInfo" name="pairContactInfo">${loginMember.memberDetail.pairContactInfo}</textarea>
											</div>
											<div class="st1 hide1" style="display: none">
												<label for="pairRequest" class="t1">配對需求：</label>
												<textarea id="pairRequest" name="pairRequest">${loginMember.memberDetail.pairRequest}</textarea>
											</div>
											<div class="st1 hide1" style="display: none">
												<label for="pairInfo" class="t1">給健友的話：</label>
												<textarea id="pairInfo" name="pairInfo">${loginMember.memberDetail.pairInfo}</textarea>
											</div>
											<input type="button" value="修改" id="sub1"
												class="btn-solid-reg modifySubmit"
												style="position: absolute; left: 20%">
										</div>
										<!-- end of text-container -->
									</div>
									<!-- end of col -->
								</div>
								<!-- end of row -->
							</div>
							<!-- end of tab-pane -->
							<!-- end of tab -->
						</div>
						<!-- end of tab content -->
						<!-- end of tabs content -->

					</div>
					<!-- end of col -->
				</div>
				<!-- end of row -->
			</div>
			<!-- end of container -->
		</div>
		<!-- end of tabs -->
		<!-- end of features -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
		<script>
			//twzipcode引用
			$(function() {
				$("#twzipcode").twzipcode({
					css : [ 'addr-county', 'addr-district', 'addr-zipcode' ]
				});
			});

			// 取得縣市 county（返回字串）
			$("#address").focus(function() {
				let county = $('#twzipcode').twzipcode('get', 'county');
				let district = $('#twzipcode').twzipcode('get', 'district');
				let zipcode = $('#twzipcode').twzipcode('get', 'zipcode');
				if (($('#address').val()).indexOf('號') == -1) {
					$('#address').val(county + district);
				}
				if (($('#address').val()).indexOf(county + district) == -1) {
					$('#address').val(county + district);
				}
			});
			$(function() {
						$('#group5control').attr('style',
								'background-color: #f3f7fd;')
						$('#twzipcode').twzipcode('set',
								"${loginMember.memberDetail.postalCode}");
						$('#address').val(
								"${loginMember.memberDetail.memberAddress}")
							if("${loginMember.memberDetail.pairWilling}"==1){
				                	document.getElementById("pairF").checked = false;
				                	document.getElementById("pairT").checked = true;
									var list, index;
									list = document.getElementsByClassName('hide1')
									for (index = 0; index < list.length; ++index) {
				    					list[index].setAttribute("style", "");
										}
				                }
					});
			
			var loginMem = "${loginMember.memberPhoto}";
			if (loginMem){
				var img=document.getElementById("img");
                img.setAttribute("src", "${loginMember.memberPhoto}"); 				
			}else{
				var img=document.getElementById("img");
                img.setAttribute("src", "img/undraw_profile_3.svg");
			}
                
			var result = document.getElementById("result");
			var input = document.getElementById("file_input");
			if (typeof FileReader === 'undefined') {
				result.innerHTML = "Sorry, 瀏覽器不支持 FileReader";
				input.setAttribute('disabled', 'disabled');
			} else {
				input.addEventListener('change', readFile, false);
			}

			function readFile() {
				$('#modifyimage').val("true")
				var file = this.files[0];
				var reader = new FileReader();
				reader.readAsDataURL(file);
				reader.onload = function(e) {
					result.innerHTML = '<img src="' + this.result + '"  width=350 height=350/>'
				}
			}
			//兩次密碼輸入相同驗證
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
			$(document).ready(function() {
			//是否參加健有配對之表單動態實現
			$('input:radio[name="match"]').change(
				function() {
					var matchVal = $(this).val();
					if (matchVal == 0) {
						var list, index;
						list = document.getElementsByClassName('hide1')
					for (index = 0; index < list.length; ++index) {
						list[index].setAttribute("style","display: none");
					}
					document.getElementById('hide2').setAttribute("style","");

					} else {
						var list, index;
						list = document.getElementsByClassName('hide1')
					for (index = 0; index < list.length; ++index) {
						list[index].setAttribute("style","");}
						}
					});
			if("${loginMember.memberDetail.gender}"=="男"){
            	document.getElementById("male").checked = true;
            	document.getElementById("female").checked = false;
            	document.getElementById("secret").checked = false;
            }else if("${loginMember.memberDetail.gender}"=="女"){
            	document.getElementById("male").checked = false;
            	document.getElementById("female").checked = true;
            	document.getElementById("secret").checked = false;
            }else{
            	document.getElementById("male").checked = false;
            	document.getElementById("female").checked = false;
            	document.getElementById("secret").checked = true;
            }

				});
			$(".modifySubmit").on('click', function(event){

						  Swal.fire({
							  title:'修改成功!',
							  icon:'success'
						  }).then((result) => {
					   		  $('#updateForm').submit();
							});

			});
			
		</script>
	</form>
	<%@ include file="FrontStageFoot.jsp"%>
</body>
</html>