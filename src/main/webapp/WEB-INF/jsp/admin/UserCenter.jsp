<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%@ include file="FrontStageHead.jsp"%>
	<!-- Features -->
	<div id="features" class="tabs">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h2 class="h2-heading">會員資料</h2>
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
								class="fas fa-envelope-open-text"></i>基本資料</a></li>
						<li class="nav-item"><a class="nav-link" id="nav-tab-2"
							data-toggle="tab" href="#tab-2" role="tab" aria-controls="tab-2"
							aria-selected="false"><i class="fas fa-list"></i>詳細資料</a></li>
						<li class="nav-item"><a class="nav-link" id="nav-tab-3"
							data-toggle="tab" href="#tab-3" role="tab" aria-controls="tab-3"
							aria-selected="false"><i class="fas fa-globe"></i>給健友的話</a></li>
					</ul>
					<!-- end of tabs links -->

					<!-- Tabs Content -->
					<div class="tab-content" id="argoTabsContent"
						style="text-align: center;">

						<!-- Tab -->
						<div class="tab-pane fade show active" id="tab-1" role="tabpanel"
							aria-labelledby="tab-1">
							<div class="row">
								<div class="col-lg-6">
									<div class="image-container">
										<div id="result">
											<img src="${loginMember.memberPhoto}" height=350 width=350
												id="img"> <input name="modifyimage" value="false"
												type="hidden" id="modifyimage">
										</div>
										<br /> <input type="file" name="filepath" accept="image/*"
											id="file_input" style="display: none">
										<button type="button" onclick="file_input.click()"
											class="btn-solid-reg" style="vertical-align: middle;">上傳照片</button>
									</div>
									<!-- end of image-container -->

								</div>
								<!-- end of col -->
								<div class="col-lg-6">
									<div class="text-container">
										<label>編號：</label> <input id="setId" type="text"
											value="${loginMember.id}" disabled><br /> <label>帳號：</label>
										<input id="account1" type="text" name="account" required
											value="${loginMember.memberAccount}" disabled><br />
										<label for="pwd1" class="t1">密碼：</label> <input id="pwd1"
											type="password" name="pwd" maxlength="15" required
											onblur="validate()" value="******" disabled><br />
										<div style="display: none">
											<label for="pwd2" class="t1">再次輸入密碼：</label><input id="pwd2"
												type="password" name="pwd2" maxlength="15" required
												onblur="validate()"><br/> <span id="tishi"></span>
											<input type="hidden" name="originalRealPassword"
												value="${pwd}"> 
												<label for="name1" class="t1">姓名：</label>
											<input id="name1" type="text" name="name" required>
										</div>


										<a class="btn-solid-reg popup-with-move-anim"
											href="#details-lightbox-1">修改</a>
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
	<script>
		$(document).ready(function() {
			$('#group5control').attr('style', 'background-color: #f3f7fd;')
		});
		var result = document.getElementById("result");
		var input = document.getElementById("file_input");

		if (typeof FileReader === 'undefined') {
			result.innerHTML = "Sorry, 瀏覽器不支持 FileReader";
			input.setAttribute('disabled', 'disabled');
		} else {
			input.addEventListener('change', readFile, false);
		}

		function readFile() {
			$('#modifyimage').val("true")
			var file = this.files[0];
			var reader = new FileReader();
			reader.readAsDataURL(file);
			reader.onload = function(e) {
				result.innerHTML = '<img src="' + this.result + '"  height="350px" width="350px"/>'
			}
		}
		//兩次密碼輸入相同驗證
		function validate() {
			var pwd1 = document.getElementById("pwd1").value;

			var pwd2 = document.getElementById("pwd2").value;

			if (pwd1 == pwd2) {
				document.getElementById("tishi").innerHTML = "<font color='green'兩次密碼相同</font>";
				document.getElementById("sub1").disabled = false;
			} else {
				document.getElementById("tishi").innerHTML = "<font color='red'>兩次密碼不相同</font>";
				document.getElementById("sub1").disabled = true;
			}
		}
	</script>
	<%@ include file="FrontStageFoot.jsp"%>
</body>
</html>