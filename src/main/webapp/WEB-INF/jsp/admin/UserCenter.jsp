<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--引用css sweet alert-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<style>
.addr-county {
	width: 90px;
}

.addr-district {
	width: 120px;
}

.addr-zipcode {
	width: 120px;
}
</style>
</head>
<body>
	<%@ include file="FrontStageHead.jsp"%>
	<!--引用SweetAlert2.js-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js"
		type="text/javascript"></script>
	

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
								aria-selected="false"><i class="fas fa-list"></i>其他資訊</a></li>
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
											<br /> 
											<button type="button" onclick="file_input.click()"
												class="btn-solid-reg" style="vertical-align: middle;">上傳照片</button>
										</div>
										<!-- end of image-container -->

									</div>
									<!-- end of col -->
									<!-- 修改密碼專區 -->
									<div class="col-lg-5">
										<div style="text-align: left; valign: top">
											<label>帳號：</label> <input style="margin-bottom: 0.5em;"
												id="account1" type="text" name="account" required
												value="${loginMember.memberAccount}" disabled><br />
											<label for="pwd1" class="t1">密碼：</label> <input
												style="margin-bottom: 0.5em;" id="pwd1" type="password"
												maxlength="16" required onchange="testPassword()"
												value="******" disabled size=15> <input
												type="button" value="修改密碼" class="btn-solid-reg"
												id="passwordChange"><br />
											<div style="display: none" id="passwordAgain">
												<label for="pwd2" class="t1">再次輸入密碼：</label><input id="pwd2"
													type="password" name="pwd2" maxlength="16" required
													onchange="testPassword()" style="margin-bottom: 0.5em;"><br />
												<div style="height: 160px">
													<ul>
														<li class="media"><i class="fas fa-times"
															style="color: red" id="iconSame"></i>
															<div class="media-body" style="font-size: 1.2rem">&ensp;兩次輸入密碼須相同</div></li>
														<li class="media"><i class="fas fa-times"
															style="color: red" id="iconValid"></i>
															<div class="media-body" style="font-size: 1.2rem">&ensp;密碼須為8~16為英數字組合</div></li>
													</ul>
													<label for="inputOrginal">請輸入原密碼：</label><input
														id="inputOrginal" type="password" name="inputOrginal"
														maxlength="16" required style="margin-bottom: 0.5em;"><br />

													<button class="btn-solid-reg" id="passwordConfirm">確認修改</button>

												</div>
											</div>
										<form action="/group5/user/memberModify.controller"
											method="post" enctype="multipart/form-data" id="updateForm">
											<input type="file" name="filepath" accept="image/*"
												id="file_input" style="display: none">
											<input name="idNumString" value="${loginMember.id}"
												type="hidden"> <input name="modifyimage"
												value="false" type="hidden" id="modifyimage"> <input
												name="nowimage" value="${loginMember.memberPhoto}"
												type="hidden"> <input type="hidden" name="pwd"
												maxlength="16" required value="******"> <label
												for="name1" class="t1">姓名：</label> <input
												style="margin-bottom: 0.5em;" id="name1" type="text"
												name="name" required value="${loginMember.memberName}"><br />
											<label for="email1" class="t1">Email：</label><input
												id="email1" type="email" name="email" required
												style="margin-bottom: 0.7em;" value="${loginMember.email}" disabled>
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
													type="text" id="address" name="address" size="26" value=""
													style="margin-bottom: 1em;">
											</div>
											<input type="button" value="修改" id="sub1"
												class="btn-solid-reg modifySubmit"
												style="position: absolute; left: 30%">
										</form>
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
												<c:when test="${loginMember.memberDetail.pairWilling==0}">
													<label>健友配對：您目前尚未參加 &ensp;</label>
												</c:when>
												<c:when test="${loginMember.memberDetail.pairWilling==1}">
													<label>健友配對：您目前正在配對中 &ensp;</label>
												</c:when>
											</c:choose>
											<a href="#" class="btn-solid-reg" id="passwordChange">點此前往健友配對</a>
											<br />
											<br />
											<c:choose>
												<c:when test="${loginMember.memberDetail.mute==0}">
													<label>論壇狀態：您目前可以發言 &ensp;</label>

												</c:when>
												<c:when test="${loginMember.memberDetail.mute==1}">
													<label>論壇狀態：您目前正在禁言中 &ensp;</label>

												</c:when>
											</c:choose>
											<a href="#" class="btn-solid-reg" id="passwordChange">點此前往論壇</a>
											<br />
											<br />


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
			//按下修改密碼後出現再次輸入密碼
			$('#passwordChange').on('click',function(){
				if ($('#passwordChange').val()=="修改密碼"){
					$('#passwordAgain').attr('style','');
					$('#passwordChange').val("取消修改");
					$('#pwd1').attr('disabled', false);
					$('#pwd1').val('');
					$('#pwd2').val('');
					$('#inputOrginal').val(''),
					$('#iconValid').attr('class', 'fas fa-times');
					$('#iconValid').attr('style', 'color:red');
					$('#iconSame').attr('class', 'fas fa-times');
					$('#iconSame').attr('style', 'color:red');
					$('#passwordConfirm').attr('disabled', true);
					
				}else{
					$('#passwordAgain').attr('style','display:none');
					$('#passwordAgain').val('');
					$('#passwordChange').val("修改密碼");
					$('#pwd1').attr('disabled', true);
					$('#pwd1').val('******');
					$('#pwd2').val('******');
					$('#iconValid').attr('class', 'fas fa-times');
					$('#iconValid').attr('style', 'color:red');
					$('#iconSame').attr('class', 'fas fa-times');
					$('#iconSame').attr('style', 'color:red');
				}
			})
			//正則表達式專區
			//密碼8-16位英數字組合
			//正則表達式
		//密碼8-16位英數字組合
		function testPassword() {
			var passwordFilter = /^(?=.*[0-9\!@#\$%\^&\*])(?=.*[a-zA-Z]).{8,16}$/;
			let blnTest = passwordFilter.test($('#pwd1').val());
			if (blnTest) {
				$('#iconValid').attr('class', 'fas fa-check');
				$('#iconValid').attr('style', 'color:green');
				passwordTrueOne = true;

			} else {
				$('#iconValid').attr('class', 'fas fa-times');
				$('#iconValid').attr('style', 'color:red');
				passwordTrueOne = false;
			}
			if ($('#pwd1').val() === $('#pwd2')
					.val()) {
				$('#iconSame').attr('class', 'fas fa-check');
				$('#iconSame').attr('style', 'color:green');
				passwordTrueTwo = true;

			} else {
				$('#iconSame').attr('class', 'fas fa-times');
				$('#iconSame').attr('style', 'color:red');
				passwordTrueTwo = false;
			}
			checkPassword();
		}
			function checkPassword() {
				console.log(passwordTrueOne, passwordTrueTwo);
				if (passwordTrueOne && passwordTrueTwo) {
					$('#passwordConfirm').attr('disabled', false);
				} else {
					$('#passwordConfirm').attr('disabled', true);
				}
			}

			$(document).ready(function() {
				$('#passwordConfirm').attr('disabled', true);
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
			
			
			$("#passwordConfirm").on('click', function(event){
				$('submitNewPassword').val($('#pwd1').val());
				$('submitOrginPassword').val($('#inputOrginal').val());
				var userPassword = $('#inputOrginal').val();
				var id = $('#idNumString').val();
				var newPassword = $("#pwd1").val();
				var params = {
						"memberPassword" : '' + userPassword,
						"id" : '' + "${loginMember.id}",
						"newPassword" : '' + newPassword
					}
				console.log(params);
				$.ajax({
					type : 'post',
					url : '/group5/user/modifyPassword.controller',
					contentType : 'application/json',
					data : JSON.stringify(params), 
					success : function(data) {
						console.log('data' + data);
						if (data == 'Y') {
							Swal.fire({
								  title:'修改密碼成功!',
								  icon:'success'
								}).then((result) => {
							$('#passwordAgain').attr('style','display:none');
							$('#passwordAgain').val('');
							$('#passwordChange').val("修改密碼");
							$('#pwd1').attr('disabled', true);
							$('#pwd1').val('******');
							$('#pwd2').val('******');
							$('#iconValid').attr('class', 'fas fa-times');
							$('#iconValid').attr('style', 'color:red');
							$('#iconSame').attr('class', 'fas fa-times');
							$('#iconSame').attr('style', 'color:red');
								});
						}
						if (data == 'N') {
							Swal.fire({
								  title:'修改失敗!',
								  text:'您輸入的原密碼錯誤，請重新輸入。或是如果您使用的是google登入，因本網站不會紀錄您的google密碼，故無法使用此功能。',
								  icon:'error'
							  });
						}
					},
					error : function(e) {
						console.log(e);
					}
				}); 
				
			});
			//css調整專區
			$('#features').attr('style','padding-top:6rem');
		</script>
	<%@ include file="FrontStageFoot.jsp"%>
</body>
</html>