<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>AdminLogin</title>
<!-- Custom fonts for this template-->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Custom styles for this template-->
<link href="css/sb-admin-2.min.css" rel="stylesheet">
<style>
/* CSS */

/* ************************
    原始版本開始
************************ */
.cktoggle {
	position: absolute;
	width: 80px; /* 全按鈕寬度 */
	top: 3%;
	left: 78%;
	display: inline;
}

/* 原按鈕樣式隱藏 */
.cktoggle_checkbox {
	display: none;
}

/* 主外框 */
.cktoggle_label {
	display: block;
	overflow: hidden;
	cursor: pointer;
	border-radius: 25px;
}

/* 背景 */
.cktoggle_inner {
	display: block;
	width: 200%;
	margin-left: -100%;
	transition: margin 0.3s ease-in 0s;
}

/* 背景 */
.cktoggle_inner:before, .cktoggle_inner:after {
	display: block;
	float: left;
	width: 50%; /* before和after各佔50% */
	height: 30px; /* 全按鈕高度 */
	line-height: 30px; /* ON OFF文字高度 */
	font-size: 16px;
	color: #4e73df;
	font-family: Trebuchet, Arial, sans-serif;
	font-weight: bold;
	box-sizing: border-box;
}

/* ON */
.cktoggle_inner:before {
	content: "會員";
	padding-left: 10px;
	background-color: #4e73df;
	color: #FFFFFF;
}

/* OFF 藍灰色*/
.cktoggle_inner:after {
	content: "管理員";
	padding-right: 10px;
	background-color: #53618b;
	color: #FFFFFF;
	text-align: right;
}

/* 上面的小圓 */
.cktoggle_circle {
	display: block;
	width: 15px; /* 小圓寬度 */
	height: 15px; /* 小圓高度 */
	margin: 0px; /* 小圓距離上下左右margin */
	background: white;
	position: absolute;
	top: 7px; /* 距離上邊緣 左右是和一開始的位置有關 */
	right: 60px; /* uncheck時 小圓移動到離右側距離XXpx位置 */
	border-radius: 100px;
	transition: right 0.3s ease-in 0s;
}

/* label和背景的移動 */
.cktoggle_checkbox:checked+.cktoggle_label .cktoggle_inner {
	margin-left: 0;
}

/* label和上面小圓的移動 */
.cktoggle_checkbox:checked+.cktoggle_label .cktoggle_circle {
	right: 10px;
}

/* ************************
    原始版本結束
************************ */
</style>
</head>
<body class="bg-gradient-primary">
	<%@ include file="FrontStageHead.jsp"%>
	<!-- Header -->
	<header id="header" class="header">
		<div class="header-content">
			<!-- Bootstrap core JavaScript-->
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
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
											<h3
												style="position: absolute; color: gray; top: 6%; left: 40%;">LOGIN</h3>
											<div class="cktoggle">
												<input type="checkbox" class="cktoggle_checkbox"
													id="cktoggle_id2" checked> <label
													class="cktoggle_label" for="cktoggle_id2"> <span
													class="cktoggle_inner"></span> <span
													class="cktoggle_circle"></span>
												</label>
											</div>
											<form class="user" ACTION="login" method="post">
												<div class="form-group">
													<br> <br> <input type="text"
														class="form-control form-control-user" id="uname"
														aria-describedby="emailHelp" placeholder="請輸入帳號..."
														name="name" required> <input type="hidden"
														name="username" id="username">
												</div>
												<div class="form-group">
													<br> <br> <input type="password"
														class="form-control form-control-user"
														id="exampleInputPassword" placeholder="請輸入密碼..."
														name="password" required>
												</div>
												<div class="form-group">
													<div class="custom-control custom-checkbox small">
														<input type="checkbox" class="custom-control-input"
															id="customCheck" name="rememberMe-key"> <label
															class="custom-control-label" for="customCheck">Remember
															Me</label>
													</div>
												</div>
												<br>
												<p id="errorMsg">${errorMsgMap.LoginError}</p>
												<br> <INPUT type="submit" value="login"
													class="btn btn-primary btn-user btn-block" id="loginbutton">
												<br> <br>
											</form>

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
	</header>
	<!-- end of header -->
	<script>
	$( document ).ready(function(){
		$('#loginbutton').attr("style", "background-color:#4e73df")
		$('#cktoggle_id2').val("on")
		$('#group5control').attr('style', 'background-color: #53618b')	
	});
	
		var unameValue = $('#uname').val();
		$('#uname').on('focus', function() {
			$('#errorMsg').html("");
		});
		$('#username').val(unameValue + ",on");
		console.log($('#username').val());
		$('#cktoggle_id2').on('change', function() {
			if ($('#cktoggle_id2').val() == "on") {
				$('#loginbutton').attr("style", "background-color:#53618b");
				$('#cktoggle_id2').val("off");
				var unameValue = $('#uname').val();
				$('#username').val(unameValue + ",off");
			} else {
				$('#loginbutton').attr("style", "background-color:#4e73df");
				$('#cktoggle_id2').val("on");
				var unameValue = $('#uname').val();
				$('#username').val(unameValue + ",on");

			}
			console.log($('#username').val());

		});
		$("#loginbutton").click(function() {
			var id2 = $('#cktoggle_id2').val();
			var unameValue = $('#uname').val();
			$('#username').val(unameValue + "," + id2);
		})
	</script>
	<%@ include file="FrontStageFoot.jsp"%>
</body>
</html>