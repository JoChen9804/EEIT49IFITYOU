<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>配對資料填寫</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<h1>Sign Up</h1>
				<p>
					Fill out the form below to sign up for Tivo. Already signed up?
					Then just <a class="white" href="log-in.html">Log In</a>
				</p>
				<!-- Sign Up Form -->
				<div class="form-container">
					<form id="signUpForm" data-toggle="validator" data-focus="false">
						<div class="form-group">
							<input type="email" class="form-control-input" id="semail"
								required> <label class="label-control" for="semail">Email</label>
							<div class="help-block with-errors"></div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control-input" id="sname" required>
							<label class="label-control" for="sname">Name</label>
							<div class="help-block with-errors"></div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control-input" id="spassword"
								required> <label class="label-control" for="spassword">Password</label>
							<div class="help-block with-errors"></div>
						</div>
						<div class="form-group checkbox">
							<input type="checkbox" id="sterms" value="Agreed-to-Terms"
								required>I agree with Tivo's <a
								href="privacy-policy.html">Privacy Policy</a> and <a
								href="terms-conditions.html">Terms Conditions</a>
							<div class="help-block with-errors"></div>
						</div>
						<div class="form-group">
							<button type="submit" class="form-control-submit-button">SIGN
								UP</button>
						</div>
						<div class="form-message">
							<div id="smsgSubmit" class="h3 text-center hidden"></div>
						</div>
					</form>
				</div>
				<!-- end of form container -->
				<!-- end of sign up form -->

			</div>
			<!-- end of col -->
		</div>
		<!-- end of row -->
	</div>
	<!-- end of container -->
	</header>
	<!-- end of ex-header -->
	<!-- end of header -->
</body>
</html>