<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>健身房查詢</title>
<!--   official Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>

<!-- Custom styles for this page -->
<link href="/group5/css/gymFrontAllStyle.css" rel="stylesheet">
<!-- Core plugin JavaScript-->
<script src="/group5/js/jquery.min.js"></script>
<script src="/group5/js/jquery.easing.min.js"></script>
<!-- Page level custom scripts -->
<!-- Page level plugins -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://kit.fontawesome.com/a3daa825b8.js"
	crossorigin="anonymous"></script>
<script>
$(function(){
	$("#addGym").on("click",function(){
		location.href = '/group5/user/gym/add';
	})
})
</script>

</head>
<body>
	<%@ include file="../admin/FrontStageHead.jsp"%>
	<!-- Description -->
	<div class="cards-1">
		<div class="container">
			<div class="row">
				<div class="col-lg-12" style="margin-top: 50px;">
					<div class="above-heading"
						style="font-size: 1em; margin-bottom: 5px;">健友在這裡</div>
					<h2 class="h2-heading">健身房一覽</h2>
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
			<div class="row">

				<c:forEach var="gymInSearch" items="${searchAllGym }">
					<!-- Card-->
					<div class="col-lg-4 d-flex">
						<div class="card flex-fill">
							<div class="feature-item h-100">
								<div class="card-body">
									<div class="card-title">
										<h4>
											<i class="fa-solid fa-map-pin"></i>&nbsp;&nbsp;&nbsp;${gymInSearch.gymName}
										</h4>
									</div>
									<div class="card-image">
										<img class="img-fluid" src="${gymInSearch.gymPicture}"
											alt="PdictureOfGym">
									</div>
									<div class="card-text">
										<ul class="w-hours list-unstyled">
											<li>評分：<span>${gymInSearch.rating}</span></li>
											<li>地址：<br>
											<span>${gymInSearch.gymAddress}</span></li>
										</ul>
										<form action="/group5/gym/searchDetail/${gymInSearch.gymName}"
											method="post">
											<% if(request.getSession().getAttribute("loginMember")!=null){%>
													<input type="hidden" value=${loginMember.id } name="memberIdNow" />
											<%}else{ %>
												<input type="hidden" value="0" name="memberIdNow" />
											<%}%>
											<button type="submit" class="btn-solid-reg page-scroll">更多資訊</button>
										</form>
		                            </div>
		                        </div>
	                        </div>
	                    </div>
	                    <!-- Card-->
                    </div>
					<!-- end of col -->
                    <!-- end of card -->
                </c:forEach>
                <div class="col-lg-4 d-flex">
						<div class="card flex-fill">
							<div class="feature-item h-100 d-flex align-items-center" id="addGym">
								<div class="card-body">
									<div class="card-text">
										<h1 style="color:gray">
											新增據點<br>
											<i class="fa-solid fa-circle-plus"></i>
										</h1>
		                            </div>
		                        </div>
	                        </div>
	                    </div>
	                </div> 
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of cards-1 -->
    <!-- end of description -->
    

	
		
<%@ include file="../admin/FrontStageFoot.jsp"%>	
</body>
</html>