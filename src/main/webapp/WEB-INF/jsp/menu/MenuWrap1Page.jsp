96<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<head>
<meta charset="UTF-8">
<title>menu Select Part</title>
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

<script type="text/javascript">
console.log("平行");
var setid= setid;
console.log(${setid})
</script>

</head>
<body>
	<%@ include file="../admin/FrontStageHead.jsp"%>


	<!-- 
<!-- Pricing -->
	<div id="pricing" class="cards-2">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">

					<div class="above-heading">MENU</div>
					<h2 class="h2-heading">select your motion type</h2>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
			<div class="row">

				<div class="col-lg-12">

					<div class="modal-footer">
						<form action="BackLobby" method="post">
							<button class="btn btn-primary" type="submit">大廳 LOBBY</button>
						</form>
						</form>
						<form action="BackLobby" method="post">
							<button class="btn btn-primary" type="submit">查看已加入!</button>
						</form>

					</div>


					<!-- Card-->
					<div class="card">
						<div class="card-body">
							<div class="card-title">腿部 LEG</div>

							<div class="frequency">下肢動作訓練</div>
							<div class="frequency">
								<img width='260' height='200' src="/img/LEGS.png">
							</div>
							<div class="divider"></div>
							<ul class="list-unstyled li-space-lg">
								<li class="media"><i class="fas fa-check"></i>
									<div class="media-body">訓練區段:腿前、腿後、臀部、小腿</div></li>
								<li class="media"><i class="fas fa-check"></i>
									<div class="media-body">訓練肌群:股外側肌、股內側肌、股中間肌、股直肌</div></li>

							</ul>


							<div class="button-wrapper">
								<form action="wrapSelectleg" method="get">
									<input type="hidden" name="setid" value="${setid}">
									<button type="submit" class="btn-solid-reg page-scrol edit"
										data-bs-toggle="modal">SELECT !</button>
								</form>
							</div>


						</div>
					</div>
					<!-- end of card -->
					<!-- end of card -->



					<!-- Card-->
					<div class="card">
						<!--<div class="label">
                        <p class="best-value">Best Value</p>
                    </div> -->
						<div class="card-body">
							<div class="card-title">有氧伸展 Aerobic/Stretch</div>
							<div class="frequency">有氧伸展訓練</div>
							<div class="frequency">
								<img width='260' height='200' src="/img/ABROC.png">
							</div>
							<div class="divider"></div>
							<ul class="list-unstyled li-space-lg">
								<li class="media"><i class="fas fa-check"></i>
									<div class="media-body">訓練區段:腹、背、骨盆、腿部</div></li>
								<li class="media"><i class="fas fa-check"></i>
									<div class="media-body">訓練肌群:腹、背肌群、核心肌群、深層肌肉</div></li>

							</ul>
							<div class="button-wrapper">
								<a class="btn-solid-reg page-scroll" href="sign-up.html">SELECT
									!</a>
							</div>
						</div>
					</div>
					<!-- end of card -->
					<!-- end of card -->

				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</div>
	<!-- end of cards-2 -->
	<!-- end of pricing -->
	-->


	<%@ include file="../admin/FrontStageFoot.jsp"%>
</body>
</html>