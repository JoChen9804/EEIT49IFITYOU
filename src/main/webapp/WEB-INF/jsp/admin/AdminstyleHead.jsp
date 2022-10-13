<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
.big_font {
	font-size: 1.14rem;
}

.big_font2 {
	font-size: 1.4rem;
}
</style>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>I FIT YOU 後臺管理系統</title>

<!-- Custom fonts for this template-->
<link href="/group5/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/group5/css/sb-admin-2.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="/group5/admin/AdminBackstage">
				<div class="sidebar-brand-icon rotate-n-15">
					<img src="/group5/img/i_ift_you.jpg"
						class="img-profile rounded-circle" height=55 width=55 />
				</div>
				<div class="sidebar-brand-text mx-4 big_font">
					I FIT YOU<br>管理系統 <sup></sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading"
				style="font-size: 1.2rem; font-weight: 600;">管理項目</div>

			<!-- Nav Item - Pages Collapse Menu æå¡ç®¡ç-->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseMember"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span
					style="font-size: 1.2rem; font-weight: 600;">使用者</span>
			</a>
				<div id="collapseMember" class="collapse"
					aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<c:choose>
							<c:when test="${loginMember.authority==2}">
								<form class="collapse-item"
									ACTION="/group5/admin/adminAdminAction.controller"
									method="post">
									<INPUT type="submit" name="adminAdminAction" value="管理員管理"
										style="border: none; background-color: transparent; font-size: 1.2rem; font-weight: 550;">
								</form>
								<form class="collapse-item"
									ACTION="/group5/admin/adminMemberAction.controller"
									method="post">
									<INPUT type="submit" name="adminMemberAction" value="會員管理"
										style="border: none; background-color: transparent; font-size: 1.2rem; font-weight: 550;">
								</form>
							</c:when>
							<c:when test="${loginMember.authority==1}">
								<form class="collapse-item"
									ACTION="/group5/admin/adminMemberAction.controller"
									method="post">
									<INPUT type="submit" name="adminMemberAction" value="會員管理"
										style="border: none; background-color: transparent; font-size: 1.2rem; font-weight: 550;">
								</form>
							</c:when>
						</c:choose>
					</div>
				</div></li>


			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseActivities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-cog"></i> <span
					style="font-size: 1.2rem; font-weight: 600;">活動</span>
			</a>
				<div id="collapseActivities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/group5/admin/activitymain.controller" style="border: none; background-color:transparent; font-size: 1.2rem; font-weight:550;">活動管理</a>
						<a class="collapse-item" href="/group5/admin/vouchermain.controller" style="border: none; background-color:transparent; font-size: 1.2rem; font-weight:550;">優惠券管理</a>
						<a class="collapse-item" href="/group5/admin/statisticsmain.controller" style="border: none; background-color:transparent; font-size: 1.2rem; font-weight:550;">活動數據</a>
					</div>
				</div></li>
			<!-- Nav Item - Pages Collapse Menu æå¡ç®¡ç-->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseArea"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span
					style="font-size: 1.2rem; font-weight: 600;">據點</span>
			</a>
				<div id="collapseArea" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/group5/admin/gym/allMain"
							style="font-size: 1.2rem; font-weight: 550;">查詢地點</a> <a
							class="collapse-item" href="/group5/admin/gym/addMain"
							style="font-size: 1.2rem; font-weight: 550;">新增地點</a>
					</div>
				</div></li>
			<!-- Nav Item - Pages Collapse Menu æå¡ç®¡ç-->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePair"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span style="border: none; background-color:transparent;font-size: 1.2rem; font-weight:550;">配對</span>
			</a>
				<div id="collapsePair" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/group5/admin/pairing/pairMembers" style="border: none; background-color:transparent; font-size: 1.2rem; font-weight:550;">配對資料</a>
					</div>
				</div>
			</li>
			<!-- Nav Item - Pages Collapse Menu æå¡ç®¡ç-->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseProducts"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span
					style="font-size: 1.2rem; font-weight: 600;">商品</span>
			</a>
				<div id="collapseProducts" class="collapse"
					aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/group5/admin/commodity_administration" style="border: none; background-color:transparent; font-size: 1.2rem; font-weight:550;">商品管理</a>
						<a class="collapse-item" href="/group5/admin/order_administration" style="border: none; background-color:transparent; font-size: 1.2rem; font-weight:550;">訂單管理</a>
					</div>
				</div></li>
			<!-- Nav Item - Pages Collapse Menu æå¡ç®¡ç-->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseText"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span
					style="font-size: 1.2rem; font-weight: 600">貼文</span>
			</a>
				<div id="collapseText" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<form class="collapse-item" ACTION="/group5/admin/MainPost.all"
							method="get">
							<input type="hidden" name="todo" value="allposts"> <INPUT
								type="submit" name="goToFrontPage" value="貼文管理"
								style="border: none; background-color: transparent; font-size: 1.2rem; font-weight: 550;">
						</form>
					</div>
				</div></li>
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseFitness"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span
					style="font-size: 1.2rem; font-weight: 600;">健身菜單</span>
			</a>
				<div id="collapseFitness" class="collapse"
					aria-labelledby="headingTwo" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="/group5/admin/insertandadd"
							style="font-size: 1.2rem; font-weight: 550;">菜單動作管理</a>
					</div>
				</div></li>
		</ul>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<button id="sidebarToggleTop"
						class="btn btn-link d-md-none rounded-circle mr-3">
						<i class="fa fa-bars"></i>
					</button>

					<!-- Topbar Search -->

					<!-- Topbar Navbar -->
					<ul class="navbar-nav ml-auto">

						<!-- Nav Item - Alerts -->

						<!-- Nav Item - Messages -->

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <span
								class="mr-4 d-none d-lg-inline text-gray-600 big big_font2"><span>${loginMember.adminName}</span>
							</span> <img class="rounded-circle" src="${loginMember.adminPhoto}"
								height=55 width=55 />

						</a> <!-- Dropdown - User Information -->
							<div
								class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
								aria-labelledby="userDropdown">
								<a class="h6 dropdown-item" href="/group5/logout"
									data-toggle="modal" data-target="#logoutModal"> <i
									class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
									登出
								</a>
							</div></li>

					</ul>

				</nav>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
</body>

</html>