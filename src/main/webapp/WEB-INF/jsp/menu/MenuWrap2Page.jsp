<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Select Motion</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>
<link href="/group5/css/dataTables.bootstrap4.min.css" rel="stylesheet">
<script src="/group5/js/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style type="text/css">
.cards-1 {
	padding-top: 3.25rem;
	padding-bottom: 3rem;
	text-align: center;
}

.cards-1 .h2-heading {
	margin-bottom: 3.5rem;
}

.cards-1 .card {
	max-width: 21rem;
	margin-right: auto;
	margin-bottom: 3.5rem;
	margin-left: auto;
	padding: 0;
	border: none;
}

.cards-1 .card-image {
	max-width: 16rem;
	margin-right: auto;
	margin-bottom: 2rem;
	margin-left: auto;
}

.cards-1 .card-title {
	margin-bottom: 0.5rem;
}

.cards-1 .card-body {
	padding: 0;
}

/************************/
/*     07. Features     */
/************************/
.tabs {
	padding-top: 8rem;
	padding-bottom: 8.125rem;
	background-color: #f3f7fd;
}

.tabs .h2-heading, .tabs .p-heading {
	text-align: center;
}

.tabs .nav-tabs {
	display: block;
	margin-bottom: 2.25rem;
	border-bottom: none;
}

.tabs .nav-link {
	padding: 0.375rem 1rem 0.375rem 1rem;
	border: none;
	color: #86929b;
	font-weight: 700;
	font-size: 1.25rem;
	line-height: 1.75rem;
	text-align: center;
	text-decoration: none;
	transition: all 0.2s ease;
}

.tabs .nav-link:hover, .tabs .nav-link.active {
	background: transparent;
	color: #4e73df;
}

.tabs .nav-link .fas {
	margin-right: 0.625rem;
}

.tabs .image-container {
	margin-bottom: 2.75rem;
}

.tabs .list-unstyled .fas {
	color: #4e73df;
	font-size: 0.5rem;
	line-height: 1.625rem;
}

.tabs .list-unstyled .media-body {
	margin-left: 0.625rem;
}

.tabs #tab-1 h3 {
	margin-bottom: 0.75rem;
}

.tabs #tab-1 .list-unstyled {
	margin-bottom: 1.5rem;
}

.tabs #tab-2 h3 {
	margin-bottom: 0.75rem;
}

.tabs #tab-2 .list-unstyled {
	margin-bottom: 1.5rem;
}

.tabs #tab-3 h3 {
	margin-bottom: 0.75rem;
}

.tabs #tab-3 .list-unstyled {
	margin-bottom: 1.5rem;
}

/***************************************************************/
.p-heading {
	margin-bottom: 3.25rem;
}

.container {
	width: 100%;
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

div {
	display: block;
}

.decorative-line {
	display: block;
	width: 5rem;
	height: 0.5rem;
	margin-right: auto;
	margin-left: auto;
}

/***************************************/
.cards-2 {
	padding-top: 7.875rem;
	padding-bottom: 2.25rem;
	text-align: center;
}

.cards-2 .h2-heading {
	margin-bottom: 3.75rem;
}

.cards-2 .card {
	display: block;
	max-width: 19rem;
	margin-right: auto;
	margin-bottom: 3rem;
	margin-left: auto;
	border: 1px solid #ccd3df;
	border-radius: 0.375rem;
}

.cards-2 .card .card-body {
	padding: 2.5rem 2rem 2.75rem 2em;
}

.cards-2 .card .card-title {
	margin-bottom: 0.5rem;
	color: #4e73df;
	font: 700 1.125rem/1.5rem "Open Sans", sans-serif;
}

.cards-2 .card .price .currency {
	margin-right: 0.25rem;
	color: #434c54;
	font-weight: 700;
	font-size: 1.5rem;
	vertical-align: 40%;
}

.cards-2 .card .price .value {
	color: #434c54;
	font: 700 3.25rem/3.5rem "Open Sans", sans-serif;
	text-align: center;
}

.cards-2 .card .frequency {
	font-size: 0.875rem;
}

.cards-2 .card .divider {
	height: 1px;
	margin-top: 1.75rem;
	margin-bottom: 2rem;
	border: none;
	background-color: #ccd3df;
}

.cards-2 .card .list-unstyled {
	margin-top: 1.875rem;
	margin-bottom: 1.625rem;
	text-align: left;
}

.cards-2 .card .list-unstyled .media {
	margin-bottom: 0.5rem;
}

.cards-2 .card .list-unstyled .fas {
	color: #4e73df;
	font-size: 0.875rem;
	line-height: 1.625rem;
}

.cards-2 .card .list-unstyled .fas.fa-times {
	margin-left: 0.1875rem;
	margin-right: 0.125rem;
	color: #555;
}

.cards-2 .card .list-unstyled .media-body {
	margin-left: 0.625rem;
}
</style>


</head>
<body>
	<%@ include file="../admin/FrontStageHead.jsp"%>
	<!-- 
<!-- Pricing -->


	<div id="pricing" class="cards-2">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="above-heading">Motion Select!</div>
					<h2 class="h2-heading">ADD your motion</h2>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
			<div class="row">

				<div class="col-lg-12">

					<div class="modal-footer">
					
					    <form action="BackWrap1" method="get">
					    <input type="hidden" name="setid" value="${setid}">
						<button class="btn btn-primary" type="submit">返回 BACK</button>
						</form>
						<form action="BackLobby" method="post">
								<button class="btn btn-primary" type="submit">大廳 LOBBY</button>
						</form>
								<form action="QueryOne" method="GET">
						<input type="hidden" name="setid" value="${setid}">
								<button class="btn btn-primary" type="submit">查看已加入!</button>
						</form>

					</div>

					<c:forEach var="list" items="${querySelect}">
						<!-- Card-->
						<div class="card">
							<div class="card-body">
								<div class="card-title emnnn">${list.exerciseName}</div>

								<div class="frequency">
									<img width='260' height='200' src="${list.imageurl}">
								</div>
								
								<div class="divider"></div>
								<ul class="list-unstyled li-space-lg">
									<li class="media"><i class="fas fa-check"></i>
										<div class="media-body">${list.intro}</div></li>


								</ul>
								<div>
								
									<input type="hidden" name="setid" value="${setid}"> <input
										type="hidden" value="${list.exerciseName}">
									<button type="button" class="btn-solid-reg page-scrol insertll"
										data-bs-toggle="modal" data-bs-target="#addqq">ADD!</button>
								</div>
							</div>
						</div>
						<!-- end of card -->
						<!-- end of card -->
					</c:forEach>

					<script type="text/javascript">
						$(".insertll").on("click", function() {

							var Ename = $(this).prev().val();
							$(".exercisename").attr("text", Ename);
							$(".exercisename").val(Ename);
							console.log($(".exercisename").val());

							var setid = $(this).prev().prev().val();
							$(".setid").attr("text", setid);
							$(".setid").val(setid);
							var sei = $(".setid").val();
							console.log(sei);

						});
					</script>

					<%@ include file="../admin/FrontStageFoot.jsp"%>

					<form action="mainAddExercise" method="get"
						enctype='multipart/form-data'>
						<input type="hidden" value="">
						<div class="modal fade" id="addqq" data-bs-backdrop="static"
							data-bs-keyboard="false" tabindex="-1"
							aria-labelledby="staticBackdropLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="staticBackdropLabel">
											加入你的動作：<span id="updateTitle"></span>
										</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										<div class="container-fluid ">
											<div class="input-group mb-3">
												<div id="updateDataTable">
													<div class="input-group mb-3">
														<input type="hidden" name="exercisename" value=""
															id="exercisename" class="exercisename"
															class="form-control">
													</div>


													<div class="input-group mb-3">
														<label class="input-group-text" for="setcount">組數：</label>
														<input type="text" name="setcount" placeholder="輸入運動組數"
															id="setcount" class="form-control">
													</div>

													<div class="input-group mb-3">
														<label class="input-group-text" for="killoocount">負重：</label>
														<input type="text" name="killoocount"
															placeholder="輸入運動公斤數" id="killoocount"
															class="form-control">
													</div>

													<div class="input-group mb-3">
														<label class="input-group-text" for="times">次數：</label> <input
															type="text" name="times" placeholder="輸入運動次數" id="times"
															class="form-control">
													</div>

													<div class="input-group mb-3">
														<label class="input-group-text" for="continutedtime">持續時間：</label>
														<input type="text" name="continutedtime"
															placeholder="運動持續時間" id="continutedtime"
															class="form-control">
													</div>

													<div class="input-group mb-3">
														<label class="input-group-text" for="breaktime">休息間隔：</label>
														<input type="text" name="breaktime" " placeholder="運動休息間隔"
															id="breaktime" " class="form-control">
													</div>

													<div class="input-group mb-3">
														<input type="hidden" name="setid" value="" id="SetId"
															class="setid" class="form-control">
													</div>

												</div>
											</div>
										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Canser</button>
											<button type="submit" class="btn btn-primary"
												id="submitUpdate">確認</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
</body>

</html>