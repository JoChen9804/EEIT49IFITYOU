<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body>
	<%@ include file="../admin/FrontStageHead.jsp"%>
	<!-- Features -->
	<div id="features" class="tabs">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="above-heading">FEATURES</div>
					<h2 class="h2-heading">論壇貼文</h2>
					<img class="img"     width="100%" height="70%" src="postfolder/images/post.jpg">
					<p class="p-heading">無論是要給予正評或負評，發文內容請勿提及健身業者名稱
						嚴禁任何形式的商業行為，以上規定適用於體育運動各版面 累犯或明知故犯，將依所犯情節懲處予以禁權 (禁言)
						嚴禁回覆已過時效的主題炒作舊帖、嚴禁連續大量回文洗版</p>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
			<div class="row">
				<div class="col-lg-12">

					<!-- Tabs Links -->
					<ul class="nav nav-tabs" id="argoTabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							id="nav-tab-1" data-toggle="tab" href="#tab-1" role="tab"
							aria-controls="tab-1" aria-selected="true"><i
								class="fas fa-list"></i>全部貼文</a></li>
						<li class="nav-item"><a class="nav-link" id="nav-tab-2"
							data-toggle="tab" href="#tab-2" role="tab" aria-controls="tab-2"
							aria-selected="false"><i class="fas fa-list"></i>我的分享貼文</a>
						</li>
						<li class="nav-item"><a class="nav-link" id="nav-tab-3"
							data-toggle="tab" href="#tab-3" role="tab" aria-controls="tab-3"
							aria-selected="false"><i class="fas fa-chart-bar"></i>收藏貼文</a>
						</li>
					</ul>
					<!-- end of tabs links -->

					<!-- Tabs Content -->
					<div class="tab-content" id="argoTabsContent">

						<!-- Tab -->
						<div class="tab-pane fade show active" id="tab-1" role="tabpanel"
							aria-labelledby="tab-1">
							<div class="row">
								<!-- <div class="col-lg-6">
									<div class="image-container">
										<img class="img-fluid" src=""
											alt="alternative">
									</div>-->
									<!-- end of image-container -->
								</div>
								<!-- end of col -->
								<div class="col-lg-12">
									<div class="text-container">
									<table class="table table-bordered" id="table_id" class="compact hover stripe">
    <thead>
        <tr>
        <th>圖片</th>
        <th>貼文id</th>
        <th>類型</th>
        <th>標題</th>
        <th>會員帳號</th>
        <th>發布日期</th>
        
        </tr>
    </thead>
    <c:forEach var="allmpbs" items="${query}">
        <tbody>
         <tr>
            <td><img class="img" src="${allmpbs.p_image}"></td>
            <td>${allmpbs.mainPostNo}</td>
            <td>${allmpbs.postTypeName}</td>
            <td>${allmpbs.title}</td>
            <!-- <td><a href="/MainPost.watch2/${allmpbs.mainPostNo}">${allmpbs.title}</a></td>  -->           
            <td>${allmpbs.account}</td>
            <td>${allmpbs.addtime}</td>
            
            </tr>
        </tbody>
     </c:forEach>
            <tbody>
            <tr><td colspan="9">${error}</td></tr></tbody>
            </table> 
									
									
									
										<!--<h3>List Building Is Easier Than Ever</h3>
										
										<p>
											It's very easy to start using Tivo. You just need to fill out
											and submit the <a class="blue page-scroll"
												href="sign-up.html">Sign Up Form</a> and you will receive
											access to the app and all of its features in no more than
											24h.
										</p>
										<ul class="list-unstyled li-space-lg">
											<li class="media"><i class="fas fa-square"></i>
												<div class="media-body">Create and embed on websites
													newsletter sign up forms</div></li>
											<li class="media"><i class="fas fa-square"></i>
												<div class="media-body">Manage forms and landing pages
													for your services</div></li>
											<li class="media"><i class="fas fa-square"></i>
												<div class="media-body">Add and remove subscribers
													using the control panel</div></li>
										</ul>-->
										
										<a class="btn-solid-reg popup-with-move-anim"
											href="#details-lightbox-1">首頁</a>
									</div>
									<!-- end of text-container -->
								</div>
								<!-- end of col -->
							</div>
							<!-- end of row -->
						</div>
						<!-- end of tab-pane -->
						<!-- end of tab -->

						<!-- Tab -->
						<div class="tab-pane fade" id="tab-2" role="tabpanel"
							aria-labelledby="tab-2">
							<div class="row">
								<div class="col-lg-6">
									<div class="image-container">
										<img class="img-fluid" src="images/features-2.png"
											alt="alternative">
									</div>
									<!-- end of image-container -->
								</div>
								<!-- end of col -->
								<div class="col-lg-6">
									<div class="text-container">
										<h3>Campaigns Monitoring Tools</h3>
										<p>Campaigns monitoring is a feature we've developed since
											the beginning because it's at the core of Tivo and basically
											to any marketing activity focused on results.</p>
										<ul class="list-unstyled li-space-lg">
											<li class="media"><i class="fas fa-square"></i>
												<div class="media-body">Easily plan campaigns and
													schedule their starting date</div></li>
											<li class="media"><i class="fas fa-square"></i>
												<div class="media-body">Start campaigns and follow
													their evolution closely</div></li>
											<li class="media"><i class="fas fa-square"></i>
												<div class="media-body">Evaluate campaign results and
													optimize future actions</div></li>
										</ul>
										<a class="btn-solid-reg popup-with-move-anim"
											href="#details-lightbox-2">LIGHTBOX</a>
									</div>
									<!-- end of text-container -->
								</div>
								<!-- end of col -->
							</div>
							<!-- end of row -->
						</div>
						<!-- end of tab-pane -->
						<!-- end of tab -->

						<!-- Tab -->
						<div class="tab-pane fade" id="tab-3" role="tabpanel"
							aria-labelledby="tab-3">
							<div class="row">
								<div class="col-lg-6">
									<div class="image-container">
										<img class="img-fluid" src="images/features-3.png"
											alt="alternative">
									</div>
									<!-- end of image-container -->
								</div>
								<!-- end of col -->
								<div class="col-lg-6">
									<div class="text-container">
										<h3>Analytics Control Panel</h3>
										<p>Analytics control panel is important for every
											marketing team so it's beed implemented from the begging and
											designed to produce reports based on very little input
											information.</p>
										<ul class="list-unstyled li-space-lg">
											<li class="media"><i class="fas fa-square"></i>
												<div class="media-body">If you set it up correctly you
													will get acces to great intel</div></li>
											<li class="media"><i class="fas fa-square"></i>
												<div class="media-body">Easy to integrate in your
													websites and landing pages</div></li>
											<li class="media"><i class="fas fa-square"></i>
												<div class="media-body">The generated reports are
													important for your strategy</div></li>
										</ul>
										<a class="btn-solid-reg popup-with-move-anim"
											href="#details-lightbox-3">LIGHTBOX</a>
									</div>
									<!-- end of text-container -->
								</div>
								<!-- end of col -->
							</div>
							<!-- end of row -->
						</div>
						<!-- end of tab-pane -->
						<!-- end of tab -->

					</div>
					<!-- end of tab content -->
					<!-- end of tabs content -->

				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</div>
	<!-- end of tabs -->
	<!-- end of features -->


	<!-- Details Lightboxes -->
	<!-- Details Lightbox 1 -->
	<div id="details-lightbox-1"
		class="lightbox-basic zoom-anim-dialog mfp-hide">
		<div class="container">
			<div class="row">
				<button title="Close (Esc)" type="button" class="mfp-close x-button">×</button>
				<div class="col-lg-8">
					<div class="image-container">
						<img class="img-fluid" src="images/details-lightbox.png"
							alt="alternative">
					</div>
					<!-- end of image-container -->
				</div>
				<!-- end of col -->
				<div class="col-lg-4">
					<h3>List Building</h3>
					<hr>
					<h5>Core service</h5>
					<p>It's very easy to start using Tivo. You just need to fill
						out and submit the Sign Up Form and you will receive access to the
						app.</p>
					<ul class="list-unstyled li-space-lg">
						<li class="media"><i class="fas fa-square"></i>
							<div class="media-body">List building framework</div></li>
						<li class="media"><i class="fas fa-square"></i>
							<div class="media-body">Easy database browsing</div></li>
						<li class="media"><i class="fas fa-square"></i>
							<div class="media-body">User administration</div></li>
						<li class="media"><i class="fas fa-square"></i>
							<div class="media-body">Automate user signup</div></li>
						<li class="media"><i class="fas fa-square"></i>
							<div class="media-body">Quick formatting tools</div></li>
						<li class="media"><i class="fas fa-square"></i>
							<div class="media-body">Fast email checking</div></li>
					</ul>
					<a class="btn-solid-reg mfp-close" href="sign-up.html">SIGN UP</a>
					<a class="btn-outline-reg mfp-close as-button" href="#screenshots">BACK</a>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</div>
	<!-- end of lightbox-basic -->
	<!-- end of details lightbox 1 -->

	<!-- Details Lightbox 2 -->
	<div id="details-lightbox-2"
		class="lightbox-basic zoom-anim-dialog mfp-hide">
		<div class="container">
			<div class="row">
				<button title="Close (Esc)" type="button" class="mfp-close x-button">×</button>
				<div class="col-lg-8">
					<div class="image-container">
						<img class="img-fluid" src="images/details-lightbox.png"
							alt="alternative">
					</div>
					<!-- end of image-container -->
				</div>
				<!-- end of col -->
				<div class="col-lg-4">
					<h3>Campaign Monitoring</h3>
					<hr>
					<h5>Core service</h5>
					<p>It's very easy to start using Tivo. You just need to fill
						out and submit the Sign Up Form and you will receive access to the
						app.</p>
					<ul class="list-unstyled li-space-lg">
						<li class="media"><i class="fas fa-square"></i>
							<div class="media-body">List building framework</div></li>
						<li class="media"><i class="fas fa-square"></i>
							<div class="media-body">Easy database browsing</div></li>
						<li class="media"><i class="fas fa-square"></i>
							<div class="media-body">User administration</div></li>
						<li class="media"><i class="fas fa-square"></i>
							<div class="media-body">Automate user signup</div></li>
						<li class="media"><i class="fas fa-square"></i>
							<div class="media-body">Quick formatting tools</div></li>
						<li class="media"><i class="fas fa-square"></i>
							<div class="media-body">Fast email checking</div></li>
					</ul>
					<a class="btn-solid-reg mfp-close" href="sign-up.html">SIGN UP</a>
					<a class="btn-outline-reg mfp-close as-button" href="#screenshots">BACK</a>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</div>
	<!-- end of lightbox-basic -->
	<!-- end of details lightbox 2 -->

	<!-- Details Lightbox 3 -->
	<div id="details-lightbox-3"
		class="lightbox-basic zoom-anim-dialog mfp-hide">
		<div class="container">
			<div class="row">
				<button title="Close (Esc)" type="button" class="mfp-close x-button">×</button>
				<div class="col-lg-8">
					<div class="image-container">
						<img class="img-fluid" src="images/details-lightbox.png"
							alt="alternative">
					</div>
					<!-- end of image-container -->
				</div>
				<!-- end of col -->
				<div class="col-lg-4">
					<h3>Analytics Tools</h3>
					<hr>
					<h5>Core service</h5>
					<p>It's very easy to start using Tivo. You just need to fill
						out and submit the Sign Up Form and you will receive access to the
						app.</p>
					<ul class="list-unstyled li-space-lg">
						<li class="media"><i class="fas fa-square"></i>
							<div class="media-body">List building framework</div></li>
						<li class="media"><i class="fas fa-square"></i>
							<div class="media-body">Easy database browsing</div></li>
						<li class="media"><i class="fas fa-square"></i>
							<div class="media-body">User administration</div></li>
						<li class="media"><i class="fas fa-square"></i>
							<div class="media-body">Automate user signup</div></li>
						<li class="media"><i class="fas fa-square"></i>
							<div class="media-body">Quick formatting tools</div></li>
						<li class="media"><i class="fas fa-square"></i>
							<div class="media-body">Fast email checking</div></li>
					</ul>
					<a class="btn-solid-reg mfp-close" href="sign-up.html">SIGN UP</a>
					<a class="btn-outline-reg mfp-close as-button" href="#screenshots">BACK</a>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</div>
	<!-- end of lightbox-basic -->
	<!-- end of details lightbox 3 -->
	<!-- end of details lightboxes -->






	<%@ include file="../admin/FrontStageFoot.jsp"%>
</body>
</html>