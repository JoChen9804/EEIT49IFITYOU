<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- SEO Meta Tags -->
<meta name="description"
	content="I FIT YOU is a HTML landing page template built with Bootstrap to help you crate engaging presentations for SaaS apps and convert visitors into users.">
<meta name="author" content="Inovatik">

<!-- Website Title -->
<title>I FIT YOU</title>

<!-- Styles -->
<!--引用SweetAlert2.js-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js"
	type="text/javascript"></script>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700&display=swap&subset=latin-ext"
	rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/fontawesome-all.css" rel="stylesheet">
<link href="css/swiper.css" rel="stylesheet">
<link href="css/magnific-popup.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>

<!-- Favicon  -->
<link rel="icon" href="images/favicon.png">
</head>
<body data-spy="scroll" data-target=".fixed-top">

	<!-- Preloader -->
	<div class="spinner-wrapper">
		<div class="spinner">
			<div class="bounce1"></div>
			<div class="bounce2"></div>
			<div class="bounce3"></div>
		</div>
	</div>
	<!-- end of preloader -->


	<!-- Navigation -->
	<nav
		class="navbar navbar-expand-lg navbar-dark navbar-custom fixed-top"
		style="background-color: #4e73df">
		<div class="container">

			<!-- Text Logo - Use this if you don't have a graphic logo -->
			<!-- <a class="navbar-brand logo-text page-scroll" href="index.html">I FIT YOU</a> -->

			<!-- Image Logo -->
			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="/group5/FrontStageMain" aria-haspopup="true"
				aria-expanded="false">
				<div class="sidebar-brand-icon rotate-n-15">
					<img src="img/i_ift_you.jpg" class="img-profile rounded-circle"
						height=50 width=50 />
				</div> <a class="nav-link page-scroll" href="/group5/FrontStageMain" 
				style="font-size: 20px; color: white; text-decoration: none;">I
					FIT YOU </a>
			</a>

			<!-- Mobile Menu Toggle Button -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarsExampleDefault"
				aria-controls="navbarsExampleDefault" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-awesome fas fa-bars"></span> <span
					class="navbar-toggler-awesome fas fa-times"></span>
			</button>
			<!-- end of mobile menu toggle button -->

			<div class="collapse navbar-collapse" id="navbarsExampleDefault">
				<ul class="navbar-nav ml-auto align-items-center">
					<li class="nav-item dropdown"><a class="nav-link page-scroll"
						href="#header" style="font-size: 17px;">首頁<span
							class="sr-only">(current)</span></a></li>
					<li class="nav-item dropdown"><a class="nav-link page-scroll"
						href="#features" style="font-size: 17px;">活動</a></li>
					<li class="nav-item dropdown"><a class="nav-link page-scroll"
						href="#details" style="font-size: 17px;">據點</a></li>

					<!-- Dropdown Menu dropdown-toggle下拉紐-->
					<li class="nav-item dropdown"><a
						class="nav-link page-scroll" href="#video"
						id="navbarDropdown" role="button" aria-haspopup="true"
						aria-expanded="false" style="font-size: 17px;">商品</a>
						<!-- <div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="article-details.html"><span
								class="item-text">ARTICLE DETAILS</span></a>
							<div class="dropdown-items-divide-hr"></div>
							<a class="dropdown-item" href="terms-conditions.html"><span
								class="item-text">TERMS CONDITIONS</span></a>
							<div class="dropdown-items-divide-hr"></div>
							<a class="dropdown-item" href="privacy-policy.html"><span
								class="item-text">PRIVACY POLICY</span></a>
						</div>--></li>
					<!-- end of dropdown menu -->

					<li class="nav-item dropdown"><a class="nav-link page-scroll"
						href="#pricing" style="font-size: 17px;">貼文</a></li>
					<li class="nav-item dropdown"><a class="nav-link page-scroll"
						href="#pricing" style="font-size: 17px;">菜單</a></li>

					<li class="nav-item dropdown" style="display: none;"
						id="memberShow"><a
						class="btn-outline-sm dropdown-toggle page-scroll"
						id="navbarDropdown" role="button" aria-haspopup="true"
						aria-expanded="false"> <img class="img-profile rounded-circle"
							src="${loginMember.memberPhoto}" height=45px width=45px></a> <!-- Dropdown - User Information -->
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/group5/user/UserCenter"><span
								class="item-text">會員中心</span></a>
							<div class="dropdown-items-divide-hr"></div>
							<a class="dropdown-item" href="terms-conditions.html"><span
								class="item-text">健友配對</span></a>
							<div class="dropdown-items-divide-hr"></div>
							<a class="dropdown-item" href="/logout" data-toggle="modal"
								data-target="#logoutModal"><span class="item-text"><i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>登出</span></a>
						</div></li>
					<li class="nav-item dropdown" id="loginShow"><span
						class="nav-item dropdown"> <a class="btn-outline-sm"
							href="/group5/login"
							style="border: 0.125rem solid #fff; padding: 0.875rem 1.5rem 0.875rem 1.5rem; font-size: 17px; border-radius: 2rem;">登入</a>
					</span></li>


				</ul>
			</div>
			<!-- end of container -->
	</nav>
	<!-- end of navbar -->
	<!-- end of navigation -->
	<script type="text/javascript">
		$().ready(function() {
			console.log("${loginMember.id}");
			var OneMember = "${loginMember.id}";
			if (OneMember) {
				$('#memberShow').attr('style', '');
				$('#loginShow').attr('style', 'display:none;');
			}
		})
	</script>
</body>
</html>