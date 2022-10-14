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
</style>
</head>
<body>
	<%@ include file="FrontStageHead.jsp"%>
	<!-- Header -->
	<header id="header" class="header">
		<div class="header-content" style="padding-top: 7rem;">
			<div class="container">

				<!-- Outer Row -->
				<div class="row justify-content-center">

					<div class="col-xl-10 col-lg-12 col-md-9">

						<div class="card o-hidden border-0 shadow-lg my-5">
							<div class="card-body p-0">
								<!-- Nested Row within Card Body -->
								<div class="row">
									<div class="col-lg-6 d-none d-lg-block bg-password-image"></div>
									<div class="col-lg-6">
										<div class="p-5">
											<div class="text-center">
												<h2 class="h2 text-gray-900 mb-2">Forgot Your Password?</h2>
												<br />
												<p class="mb-4">忘記密碼很正常喔，請輸入您的Email，I FIT YOU
													將寄連結給您，點選連結即可重設密碼!</p>
											</div>
											<form class="user" id="forgetPasswordForm" action="/group5/forgetPassword.controller" method="post">
												<div class="form-group">
													<input type="email" class="form-control form-control-user"
														id="exampleInputEmail" aria-describedby="emailHelp"
														placeholder="請輸入E-mail以重寄驗證信..." onchange="checkEmail()" name="email"> <label
														style="font-size: 1rem">&ensp;&ensp;<i
														class="fas fa-times" style="color: red"
														id="iconEmailValid"></i>&ensp;此Email為有效帳號
													</label>
												</div>
												<button
													class="btn btn-primary btn-user btn-block"
													 id="forgetPassword">重設密碼</button>
											</form>
											<hr>
											<div class="text-center">
												<a class="small" href="/group5/Register">還沒有帳號嗎?創建帳號!</a>
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

			</div>
		</div>
	</header>
	<script>
		$(document).ready(function() {
			$('#loginbutton').attr("style", "background-color:#4e73df");
			$('#cktoggle_id2').val("on");
			$('#group5control').attr('style', 'background-color: #53618b');
			$('#forgetPassword').attr('disabled', true);
		});
		<!-- email -->
		function checkEmail(){
			var userEmail = $('#exampleInputEmail').val();
			var params = {
					"email" : '' + userEmail
				}
			$.ajax({
				type : 'post',
				url : '/group5/memberEmailCheck.controller',
				contentType : 'application/json',
				data : JSON.stringify(params),
				success : function(data) {
					console.log('data' + data);
					if (data == 'N') {
						$('#iconEmailValid').attr('class', 'fas fa-times');
						$('#iconEmailValid').attr('style', 'color:red');
						$('#forgetPassword').attr('disabled', true);
					}
					if (data == 'Y') {
						$('#iconEmailValid').attr('class', 'fas fa-check');
						$('#iconEmailValid').attr('style', 'color:green');
						$('#forgetPassword').attr('disabled', false);
					}
				},
				error : function(e) {
					console.log(e);
				}
			});
		}
		//送出重設密碼
		$("#forgetPassword").on('click', function(event){
			if(grecaptcha.getResponse()){
					  Swal.fire({
						  title:'重設密碼信寄送成功!',
						  text: '會員您好，請至 ' + $('#exampleInputEmail').val() + ' 點選驗證信中之連結。',
						  icon:'success'
					  }).then((result) => {
			$('#forgetPasswordForm').submit();
						});
				
			}else{
				 Swal.fire({
					  title:'重設密碼信寄送失敗',
					  text:  '請再次確認您的email是否輸入正確。',
					  icon:'error'
				  }).then((result) => {
					});
				
			}

		});
	</script>

	<%@ include file="FrontStageFoot.jsp"%>
</body>
</html>