<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<style>
.btn {
	font-size: 1.2rem !important;
}

.form-control-user {
	font-size: 1.2rem !important;
}

.p-5 {
	padding: 1.2rem !important;
}

.form-group {
	margin-bottom: 0rem !important;
}

.label {
	margin-bottom: 0.7rem;
}

hr {
	margin-top: 1rem;
	margin-bottom: 0.5rem;
}
</style>
</head>
<body>
	<%@ include file="FrontStageHead.jsp"%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- Header -->
	<header id="header" class="header">
		<div class="header-content" style="padding-top: 4rem;">
			<!-- Bootstrap core JavaScript-->
			<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

			<!-- Core plugin JavaScript-->
			<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

			<!-- Custom scripts for all pages-->
			<script src="js/sb-admin-2.min.js"></script>

			<div class="container">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
							<div class="col-lg-7">
								<div class="p-5" style="padding: 1.2rem !important;">
									<div class="text-center">
										<h2 class="h2 text-gray-900 mb-3">建立帳號</h2>
									</div>
									<form class="user">
										<div class="form-group row">
											<div class="col-sm-6 mb-3 mb-sm-0">
												<input type="text" class="form-control form-control-user"
													id="exampleFirstName" placeholder="帳號" required
													onchange="checkAccount()"> <label
													style="font-size: 1rem; margin-bottom: 0rem;">&ensp;&ensp;<i
													class="fas fa-times" style="color: gray"
													id="iconAccountValid"></i>&ensp;此帳號沒有重複
												</label> <label style="font-size: 1rem">&ensp;&ensp;<i
													class="fas fa-times" style="color: gray"
													id="iconAccountLength"></i>&ensp;帳號須為4~16字並以字母開頭
												</label>
											</div>
											<div class="col-sm-6">
												<input type="text" class="form-control form-control-user"
													id="exampleLastName" placeholder="姓名" required onchange="testName()">
													 <label
													style="font-size: 1rem; margin-bottom: 0rem;">&ensp;&ensp;<i
													class="fas fa-times" style="color: gray"
													id="iconName"></i>&ensp;姓名為必填欄位
												</label> 
											</div>
										</div>
										<div class="form-group">
											<input type="email" class="form-control form-control-user"
												id="exampleInputEmail" placeholder="Email" required
												onchange="checkEmail()"> <label
												style="font-size: 1rem">&ensp;&ensp;<i
												class="fas fa-times" style="color: gray" id="iconEmailValid"></i>&ensp;此Email沒有重複
											</label> <label style="font-size: 1rem">&ensp;&ensp;&ensp;&ensp;&ensp;<i
												class="fas fa-times" style="color: gray"
												id="iconEmailFormat"></i>&ensp;Email格式正確
											</label>
										</div>
										<div class="form-group row">
											<div class="col-sm-6 mb-3 mb-sm-0">
												<input type="password"
													class="form-control form-control-user"
													onchange="testPassword()" id="exampleInputPassword"
													placeholder="密碼" required>
											</div>
											<div class="col-sm-6">
												<input type="password"
													class="form-control form-control-user"
													onchange="testPassword()" id="exampleRepeatPassword"
													placeholder="再次輸入密碼" required>
											</div>
											<label class="col-sm-5.9" style="font-size: 1rem">&ensp;&ensp;&ensp;&ensp;<i
												class="fas fa-times" style="color: gray" id="iconSame"></i>&ensp;兩次輸入密碼須相同&ensp;&ensp;&ensp;
											</label> <label class="col-sm-6.1" style="font-size: 1rem"><i
												class="fas fa-times" style="color: gray" id="iconValid"></i>&ensp;密碼須為8~16字英數字組合</label>
										</div>
										<div class="form-group row">
											<div class="col-sm-6">
												<input type="text" class="form-control form-control-user"
													id="referral" placeholder="推薦碼（選填）"
													onchange="checkReferral()"> <label
													style="font-size: 1rem;display:none;" id="referralLabel" >&ensp;&ensp;<i
													class="fas fa-times" style="color: gray"
													id="iconReferralValid"></i>&ensp;推薦碼請輸入正確
												</label>
											</div>
											<div class="col-sm-6"
												style="align-items: center; display: flex;">
												<input type="button" id="registerAccount"
													class="btn btn-primary btn-user btn-block"
													style="text-decoration: none;" value="Register Account">
											</div>
										</div>
										<hr style="margin-bottom: 0.5rem; margin-top: 0.5rem">
										<a href="index.html" class="btn btn-google btn-user btn-block"
											style="color: #fff; background-color: #ea4335; border-color: #fff; text-decoration: none;">
											<i class="fab fa-google fa-fw"></i> Register with Google
										</a>


									</form>
									<hr style="margin-bottom: 0.5rem; margin-top: 0.5rem">
									<div class="text-center">
										<a class="small" href="/group5/ForgetPassword">忘記密碼?</a>
									</div>

									<div class="text-center">
										<a class="small" href="/group5/login">已經有帳號了?登入!</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</header>

	<%@ include file="FrontStageFoot.jsp"%>
	<script>
	var nameTrue = false;
	var passwordTrueOne = false;
	var passwordTrueTwo = false;
	var accountTrueOne = false;
	var accountTrueTwo = false;
	var emailTrueOne = false;
	var emailTrueTwo = false;
	var referralTrue = true;
	
		$(document).ready(function() {
			$('#loginbutton').attr("style", "background-color:#4e73df")
			$('#cktoggle_id2').val("on")
			$('#group5control').attr('style', 'background-color: #53618b')
			$('#registerAccount').attr('disabled', true);
		});
		//姓名為必填
		function testName() {
			var userName = $('#exampleLastName').val();
		if($.trim(userName) == ''){
				$('#iconName').attr('class', 'fas fa-times');
				$('#iconName').attr('style', 'color:gray');
				nameTrue = false;
		}else {
			$('#iconName').attr('class', 'fas fa-check');
			$('#iconName').attr('style', 'color:green');
				nameTrue = true;
		}
				checkRegisterAccount();
			}
		
		//正則表達式
		//密碼8-16位英數字組合
		function testPassword() {
			var passwordFilter = /^(?=.*[0-9\!@#\$%\^&\*])(?=.*[a-zA-Z]).{8,16}$/;
			let blnTest = passwordFilter.test($('#exampleInputPassword').val());
			if (blnTest) {
				$('#iconValid').attr('class', 'fas fa-check');
				$('#iconValid').attr('style', 'color:green');
				passwordTrueOne = true;

			} else {
				$('#iconValid').attr('class', 'fas fa-times');
				$('#iconValid').attr('style', 'color:gray');
				passwordTrueOne = false;
			}
			if ($('#exampleInputPassword').val() === $('#exampleRepeatPassword')
					.val()) {
				$('#iconSame').attr('class', 'fas fa-check');
				$('#iconSame').attr('style', 'color:green');
				passwordTrueTwo = true;

			} else {
				$('#iconSame').attr('class', 'fas fa-times');
				$('#iconSame').attr('style', 'color:gray');
				passwordTrueTwo = false;
			}
			checkRegisterAccount();
		}
	<!-- AJAX專區 -->
	<!-- 帳號 -->
	//正則表達式
		function checkAccount() {
		var accountFilter = /^[a-zA-Z].{3,15}$/;
			var userAccount = $('#exampleFirstName').val();
			let blnTest = accountFilter.test($('#exampleFirstName').val());
			if (blnTest) {
				$('#iconAccountLength').attr('class', 'fas fa-check');
				$('#iconAccountLength').attr('style', 'color:green');
				accountTrueOne = true;
				

			} else {
				$('#iconAccountLength').attr('class', 'fas fa-times');
				$('#iconAccountLength').attr('style', 'color:gray');
				accountTrueOne = false;
			}
			var params = {
				"memberAccount" : '' + userAccount
			}
			if($.trim(userAccount) == ''){
				$('#iconAccountValid').attr('class', 'fas fa-times');
				$('#iconAccountValid').attr('style', 'color:gray');
				accountTrueTwo = false;
				checkRegisterAccount();
	}else{
			$.ajax({
				type : 'post',
				url : '/group5/memberAccountCheck.controller',
				contentType : 'application/json',
				data : JSON.stringify(params),
				success : function(data) {
					console.log('data' + data);
					if (data == 'Y') {
						$('#iconAccountValid').attr('class', 'fas fa-times');
						$('#iconAccountValid').attr('style', 'color:gray');
						accountTrueTwo = false;
						checkRegisterAccount();
					}
					if (data == 'N') {
						$('#iconAccountValid').attr('class', 'fas fa-check');
						$('#iconAccountValid').attr('style', 'color:green');
						accountTrueTwo = true;
						checkRegisterAccount();
					}
					

				},
				error : function(e) {
					console.log(e);
				}
			});
		
	}
		}
		<!-- email -->
		function checkEmail(){
			//Regular expression Testing
			var emailFilter = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;
			var userEmail = $('#exampleInputEmail').val();
			let blnTest = emailFilter.test($('#exampleInputEmail').val());
			if (blnTest) {
				$('#iconEmailFormat').attr('class', 'fas fa-check');
				$('#iconEmailFormat').attr('style', 'color:green');
				emailTrueOne = true;

			} else {
				$('#iconEmailFormat').attr('class', 'fas fa-times');
				$('#iconEmailFormat').attr('style', 'color:gray');
				emailTrueOne = false;
			}
			var params = {
				"email" : '' + userEmail
			}
			if($.trim(userEmail) == ''){
				$('#iconEmailValid').attr('class', 'fas fa-times');
				$('#iconEmailValid').attr('style', 'color:gray');
				emailTrueTwo = false;
				checkRegisterAccount();
				
	}else{
			$.ajax({
				type : 'post',
				url : '/group5/memberEmailCheck.controller',
				contentType : 'application/json',
				data : JSON.stringify(params),
				success : function(data) {
					console.log('data' + data);
					if (data == 'Y') {
						$('#iconEmailValid').attr('class', 'fas fa-times');
						$('#iconEmailValid').attr('style', 'color:gray');
						$('#registerAccount').attr('disabled', true);
						emailTrueTwo = false;
						checkRegisterAccount();
					}
					if (data == 'N') {
						$('#iconEmailValid').attr('class', 'fas fa-check');
						$('#iconEmailValid').attr('style', 'color:green');
						emailTrueTwo = true;
						checkRegisterAccount();
					}
				},
				error : function(e) {
					console.log(e);
				}
			});
	}
		}
		<!--referral-->
		function checkReferral(){
			var referralCode = $('#referral').val();
			var params = {
					"referralCode" : '' + referralCode
			}
			if($.trim(referralCode) == ''){
				$('#iconEmailValid').attr('class', 'fas fa-times');
				$('#iconEmailValid').attr('style', 'color:gray');
				$('#referralLabel').attr('style', 'display:none');
				referralTrue = true;
				checkRegisterAccount();
			}else{
			$.ajax({
				type : 'post',
				url : '/group5/memberReferralCheck.controller',
				contentType : 'application/json',
				data : JSON.stringify(params),
				success : function(data) {
					console.log('data' + data);
					if (data == 'N') {
						$('#referralLabel').attr('style', 'display:true;font-size: 1rem;');
						$('#iconReferralValid').attr('class', 'fas fa-times');
						$('#iconReferralValid').attr('style', 'color:gray');
						referralTrue = false;
						checkRegisterAccount();
					}
					if (data == 'Y') {
						$('#referralLabel').attr('style', 'display:true;font-size: 1rem;');
						$('#iconReferralValid').attr('class', 'fas fa-check');
						$('#iconReferralValid').attr('style', 'color:green');
						referralTrue = true;
						checkRegisterAccount();
					}
				},
				error : function(e) {
					console.log(e);
				}
			});
			}
		}
		function checkRegisterAccount(){
		console.log(nameTrue, passwordTrueOne, passwordTrueTwo, accountTrueOne,accountTrueTwo,emailTrueOne,emailTrueTwo,referralTrue);
		if (nameTrue && passwordTrueOne && passwordTrueTwo && accountTrueOne && accountTrueTwo && emailTrueOne && emailTrueTwo && referralTrue){
			$('#registerAccount').attr('disabled', false);
		}else{
			$('#registerAccount').attr('disabled', true);
		}			
		}
		
	</script>
</body>
</html>