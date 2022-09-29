<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>論壇貼文</title>

<style>
.imgfront {
	width: 150px;
	height: 120px;
	padding: 2px 2px 2px 2px;
	margin: 2px;
}

</style>
<!-- Favicon  -->
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
					<img class="img" width="100%" height="70%"
						src="postfolder/images/post.jpg">
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
							aria-selected="false"><i class="fas fa-list"></i>我的分享貼文</a></li>
						<li class="nav-item"><a class="nav-link" id="nav-tab-3"
							data-toggle="tab" href="#tab-3" role="tab" aria-controls="tab-3"
							aria-selected="false"><i class="fas fa-chart-bar"></i>收藏貼文</a></li>
					</ul>
					<!-- end of tabs links -->

					<!-- Tabs Content -->
					<div class="tab-content" id="argoTabsContent">

						<!-- Tab -->
						<div class="tab-pane fade show active" id="tab-1" role="tabpanel"
							aria-labelledby="tab-1">
							<div class="row">
								<!--<div class="col-lg-6">
									<!--	<div class="image-container">
									</div>
								<!-- end of image-container -->
								<!--	</div>-->
								<!-- end of col -->
                                <!-- //////////////////////	跳到發布貼文///////////////////////////// -->
								<div class="col-lg-12">
									<div class="text-container">
										<a class="btn-solid-reg popup-with-move-anim"
											href="#details-lightbox-1">發布貼文</a>
										<div class="row g-2">
											<div class="col-md">
												<div class="form-floating">
													<input type="text" name="title" class="form-control"
														id="floatingInputGrid" placeholder="請輸入標題"
														oninvalid="setCustomValidity('請輸入標題')"
														oninput="setCustomValidity('')"> <label
														for="floatingInputGrid">{error}</label>
												</div>
											</div>
											<div class="col-md">
												<div class="form-floating">
													<input type="submit"
														class="btn-solid-reg popup-with-move-anim"
														name="inquireId" value="查詢">
												</div>
											</div>
										</div>
										<p>${error}</p>
										<table class="table table-sm">
											<thead>
												<tr>
													<th>圖片</th>
													<th>類型</th>
													<th>標題</th>
													<th>發布日期</th>
													<th>最後回覆</th>
													<th>觀看</th>
												</tr>
											</thead>
											<c:forEach var="allmpbs" items="${query}">
												<tbody>
													<tr>
														<!--<a href="/group5/PostWtch/${allmpbs.mainPostNo}"></a>-->
														<td class="align-middle"><img class="imgfront"
															src="${allmpbs.p_image}"></td>
														<td class="align-middle">[${allmpbs.postTypeName}]</td>
														<td class="align-middle">${allmpbs.title}</td>
														<td class="align-middle">${allmpbs.account}<br />${allmpbs.addtime}</td>
														<td class="align-middle">帳號<br />最後回覆</td>
														<td class="align-middle">
															<form action="PostWtch"
																method="GET">
																<input type="hidden" name="mainPostNo"
																	value="${allmpbs.mainPostNo}">
																<input type="submit" class="btn btn-outline-success"
																	value="觀看">
															</form>
														</td>
													</tr>
												</tbody>
											</c:forEach>
										</table>

									</div>
									<!-- end of text-container -->
								</div>
								<!-- end of col -->
							</div>
							<!-- end of row -->
						</div>
						<!-- end of tab-pane -->
						<!-- end of tab -->
                        <!-- ////////////////////// 跳到發布貼文///////////////////////////// -->
						<!-- Tab -->
						<div class="tab-pane fade" id="tab-2" role="tabpanel"
							aria-labelledby="tab-2">
							<div class="row">
								<!-- end of col -->
								<div class="col-lg-12">
									<div class="text-container">
									                               <div class="col-lg-12">
                                    <div class="text-container">
                                        <div class="row g-2">
                                            <div class="col-md">
                                                <div class="form-floating">
                                                    <input type="text" name="title" class="form-control"
                                                        id="floatingInputGrid" placeholder="請輸入標題"
                                                        oninvalid="setCustomValidity('請輸入標題')"
                                                        oninput="setCustomValidity('')"> <label
                                                        for="floatingInputGrid">{error}</label>
                                                </div>
                                            </div>
                                            <div class="col-md">
                                                <div class="form-floating">
                                                    <input type="submit"
                                                        class="btn-solid-reg popup-with-move-anim"
                                                        name="inquireId" value="查詢">
                                                </div>
                                            </div>
                                        </div>
                                        <p>${error}</p>
                                        <table class="table table-sm">
                                            <thead>
                                                <tr>
                                                    <th>圖片</th>
                                                    <th>類型</th>
                                                    <th>標題</th>
                                                    <th>發布日期</th>
                                                    <th>最後回覆</th>
                                                    <th>狀態</th>
                                                </tr>
                                            </thead>
                                            <c:forEach var="allmpbs" items="${query}">
                                                <tbody>
                                                    <tr>
                                                        <!--<a href="/group5/PostWtch/${allmpbs.mainPostNo}"></a>-->
                                                        <td class="align-middle"><img class="imgfront"
                                                            src="${allmpbs.p_image}"></td>
                                                        <td class="align-middle">[${allmpbs.postTypeName}]</td>
                                                        <td class="align-middle">${allmpbs.title}</td>
                                                        <td class="align-middle">${allmpbs.account}<br />${allmpbs.addtime}</td>
                                                        <td class="align-middle">帳號<br />最後回覆</td>
                                                        <td class="align-middle">
                                                            <form action="PostWtch"
                                                                method="GET">
                                                                <input type="hidden" name="mainPostNo"
                                                                    value="${allmpbs.mainPostNo}">
                                                                <input type="submit" class="btn btn-outline-success"
                                                                    value="觀看">
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </c:forEach>
                                        </table>

                                    </div>
                                    <!-- end of text-container -->
                                </div>
                                <!-- end of col -->
                            </div>
									
									
									
									
<!-- 										<h3>Campaigns Monitoring Tools</h3> -->
<!-- 										<p>Campaigns monitoring is a feature we've developed since -->
<!-- 											the beginning because it's at the core of Tivo and basically -->
<!-- 											to any marketing activity focused on results.</p> -->
<!-- 										<ul class="list-unstyled li-space-lg"> -->
<!-- 											<li class="media"><i class="fas fa-square"></i> -->
<!-- 												<div class="media-body">Easily plan campaigns and -->
<!-- 													schedule their starting date</div></li> -->
<!-- 											<li class="media"><i class="fas fa-square"></i> -->
<!-- 												<div class="media-body">Start campaigns and follow -->
<!-- 													their evolution closely</div></li> -->
<!-- 											<li class="media"><i class="fas fa-square"></i> -->
<!-- 												<div class="media-body">Evaluate campaign results and -->
<!-- 													optimize future actions</div></li> -->
<!-- 										</ul> -->
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
				<!--<div class="col-lg-8">
					<div class="image-container">
						 <img class="img-fluid" src="images/details-lightbox.png"
							alt="alternative">
					</div>-->
				<!-- end of image-container -->
			</div>
			<!-- end of col -->
			<div class="row justify-content-center">
				<div class="col-lg-3">
					<form action="/group5/Posting" enctype='multipart/form-data'
						method="POST" onsubmit="return checkip()">
						<h3>發布貼文</h3>
						<table class="img-fluid">
							<thead>
								<tr>
									<th><label> <input type="radio"
											name="postTypeName" value="公告" id="" required
											oninvalid="setCustomValidity('請輸入帳號')"
											oninput="setCustomValidity('')">公告
									</label> <label> <input type="radio" name="postTypeName"
											value="分享" id="" checked>分享
									</label> <label> <input type="radio" name="postTypeName"
											value="問題" id="">問題
									</label></th>
								</tr>
								<tr>
									<th><div class="mb-3">
											標題:<input type="text" name="title" class="form-control"
												id="floatingInput" placeholder="請輸入標題"
												oninvalid="setCustomValidity('請輸入標題')"
												oninput="setCustomValidity('')"> <label
												for="floatingInput">{請輸入標題}</label>
										</div></th>
								</tr>

								<tr>

									<th><div class="form-floating">
											內容:
											<textarea name="content" class="form-control" cols="60"
												rows="10" placeholder="請輸入內容" id="floatingTextarea" required
												oninvalid="setCustomValidity('請輸入內容')"
												oninput="setCustomValidity('')"></textarea>
											<label for="floatingTextarea">{請輸入內容}</label>
										</div></th>
								</tr>
								<tr>
									<th>請選擇圖片(最多五張，每張2MB以下):<input id="file1" type="file"
										class="btn btn-outline-primary" name="file"
										multiple="multiple" accept="image/*" onchange="checkip()">
										<div id="imgs"></div></th>
								</tr>
							</thead>
						</table>
						<script src="/group5/js/jquery.min.js"></script>
						<script src="js/images.js"></script>
						<input type="submit" class="btn-solid-reg mfp-close" value="送出"><a
							class="btn-outline-reg mfp-close as-button" href="#screenshots">取消</a>
					</form>
				</div>
				<!--</div>-->
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