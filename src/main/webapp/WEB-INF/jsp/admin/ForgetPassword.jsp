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
.btn{
	font-size:1.2rem !important;
}
.form-control-user{
	font-size:1.2rem !important;
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
												<br/>
												<p class="mb-4">忘記密碼很正常喔，請輸入您的Email，I FIT YOU 將寄連結給您，點選連結即可重設密碼!</p>
											</div>
											<form class="user">
												<div class="form-group">
													<input type="email" class="form-control form-control-user"
														id="exampleInputEmail" aria-describedby="emailHelp"
														placeholder="請輸入E-mail以重寄驗證信...">
												</div>
												<a href="login.html"
													class="btn btn-primary btn-user btn-block" style="text-decoration: none;">重設密碼</a>
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
			$('#loginbutton').attr("style", "background-color:#4e73df")
			$('#cktoggle_id2').val("on")
			$('#group5control').attr('style', 'background-color: #53618b')
		});
	</script>

	<%@ include file="FrontStageFoot.jsp"%>
</body>
</html>