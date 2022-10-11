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
												<h2 class="h2 text-gray-900 mb-2">重新設定密碼</h2>
												<br />
											</div>
											<form class="user" id="forgetPasswordForm"
												action="/group5/resetPassword.controller" method="post">
												<input name="code" value="${code}" type="hidden">
												<div class="form-group">
													<div class="form-group row col-lg-12">
														<input type="password"
															class="form-control form-control-user"
															onchange="testPassword()" id="exampleInputPassword"
															placeholder="密碼" required name="pwd"> <br />
													</div>
													<div class="form-group row col-lg-12">
														<input type="password"
															class="form-control form-control-user"
															onchange="testPassword()" id="exampleRepeatPassword"
															placeholder="再次輸入密碼" required>
													</div>
													<label class="col-lg-12" style="font-size: 1rem">&ensp;&ensp;&ensp;&ensp;<i
														class="fas fa-times" style="color: red" id="iconSame"></i>&ensp;兩次輸入密碼須相同&ensp;&ensp;&ensp;
													</label> <label class="col-lg-12" style="font-size: 1rem">&ensp;&ensp;&ensp;&ensp;<i
														class="fas fa-times" style="color: red" id="iconValid"></i>&ensp;密碼須為8~16字英數字組合
													</label>

												</div>
												<button class="btn btn-primary btn-user btn-block"
													id="forgetPassword">重設密碼</button>
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
	</header>
	<script>
		$(document).ready(function() {
			$('#loginbutton').attr("style", "background-color:#4e73df");
			$('#cktoggle_id2').val("on");
			$('#group5control').attr('style', 'background-color: #53618b');
			$('#forgetPassword').attr('disabled', true);
		});

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
				$('#iconValid').attr('style', 'color:red');
				passwordTrueOne = false;
			}
			if ($('#exampleInputPassword').val() === $('#exampleRepeatPassword')
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
				$('#forgetPassword').attr('disabled', false);
			} else {
				$('#forgetPassword').attr('disabled', true);
			}
		}
	</script>

	<%@ include file="FrontStageFoot.jsp"%>
</body>
</html>