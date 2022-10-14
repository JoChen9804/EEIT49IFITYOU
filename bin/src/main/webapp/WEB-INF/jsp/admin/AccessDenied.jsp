<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<script src="https://apis.google.com/js/platform.js"></script>
<meta name="google-signin-client_id"
	content="586404491668-rdn4074gsm078d7unu31ap8k5q3g6hfm.apps.googleusercontent.com">
<body class="bg-gradient-primary">
	<%@ include file="FrontStageHead.jsp"%>
	
	<!-- Header -->
	<header id="header" class="header">
		<div class="header-content" style="padding-top: 10rem;">
			<!-- Bootstrap core JavaScript-->
			<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

			<!-- Core plugin JavaScript-->
			<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

			<!-- Custom scripts for all pages-->
			<script src="js/sb-admin-2.min.js"></script>

			<div class="container">

				<!-- Outer Row -->
				<div class="row justify-content-center">

					<div class="col-xl-10 col-lg-12 col-md-9">

						<div class="card o-hidden border-0 shadow-lg my-5">
							<div class="card-body p-0">
								<!-- Nested Row within Card Body -->
								<div class="row">
									<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
									<div class="col-lg-6">
										<div class="p-5">
											<div class="text-center">
												<h2 class="h1 text-gray-900 mb-2">權限不足</h2>
												
												<hr/>
												<br/>
												<h3>您的權限不足，建議您：</h3>
												<br/>
												<p class="mb-4">1.儘速至email點選連結開通帳號。</p>
												<p class="mb-4">2.返回至正確的網頁。</p>
												<br/>
												<hr/>
												<h2>
													<a href="javascript:history.back()">點此返回上一頁</a>
												</h2>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>

					</div>

				</div>
			</div>
			<!-- end of header-content -->
		</div>
	</header>
	<!-- end of header -->
	<script>
		$(document).ready(
				function() {
					$('#loginbutton').attr("style",
							"background-color:#4e73df;font-size:1.2rem;")
					$('#cktoggle_id2').val("on")
					$('#group5control').attr('style',
							'background-color: #53618b;font-size:1.2rem;')
				});

	</script>
	<%@ include file="FrontStageFoot.jsp"%>

</body>
</html>