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
												<h1 class="h1 text-gray-900 mb-2">開通帳號失敗</h1>
												<br/>
												<hr/>
												<br/>
												<h2>麻煩再次前往您的email查看信件喔~</h2>
												<br/>
												<hr/>
												<h2>
													<a href="/group5/FrontStageMain">點此跳轉首頁</a>
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