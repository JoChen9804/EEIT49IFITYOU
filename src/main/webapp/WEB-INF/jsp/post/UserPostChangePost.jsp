<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="/group5/js/jquery.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<title>Insert title here</title>
<style>
.imgss {
	width: 300px;
	height: 200px;
	padding: 5px 5px 5px 5px;
	margin: 10px;
}
</style>
</head>
<body>
	<%@ include file="../admin/FrontStageHead.jsp"%>



	<!-- Details -->
	<div id="details" class="basic-1">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="text-container">
						<h2>修改貼文</h2>
						<form action="/group5/UserPost" enctype='multipart/form-data'
							method="POST" onsubmit="return checkip()">
							<input type="hidden" name="_method" value="PUT"> 
							
							<input type="hidden" name="mainPostNo" value="${queryContent.mainPostNo}">
							<input type="hidden" name="account" value="${queryContent.account}">
                            <input type="hidden" name="likeNumber" value="${queryContent.likeNumber}">
                            <input type="hidden" id="p_image" name="p_image" value="${queryContent.p_image}">
                            <input type="hidden" name="replyAccount" value="${queryContent.replyAccount}">
                            <input type="hidden" name="lastReplyTime" value="${queryContent.lastReplyTime}">
                            <input type="hidden" name="ctr" value="${queryContent.ctr}">

							<table class="img-fluid">
								<thead>
									<tr>
										<th>
										<c:choose>
										
										<c:when test="${queryContent.postTypeName=='飲食'}">
										<label> <input type="radio"
												class="revisepostType" name="postTypeName" 
												value="飲食" checked>飲食</label> 
										<label> <input type="radio" class="revisepostType"
												name="postTypeName" value="分享" >分享</label> 
										
										<label> <input type="radio" class="revisepostType"
												name="postTypeName" value="問題" >問題
										</label>
										</c:when>
										
										<c:when test="${queryContent.postTypeName=='分享'}">
                                        <label> <input type="radio"
                                                class="revisepostType" name="postTypeName" 
                                                value="飲食">飲食</label> 
                                        <label> <input type="radio" class="revisepostType"
                                                name="postTypeName" value="分享" checked>分享</label> 
                                        
                                        <label> <input type="radio" class="revisepostType"
                                                name="postTypeName" value="問題">問題
                                        </label>
                                        </c:when>
                                        
                                        <c:when test="${queryContent.postTypeName=='問題'}">
                                        <label> <input type="radio"
                                                class="revisepostType" name="postTypeName" 
                                                value="飲食">飲食</label> 
                                        <label> <input type="radio" class="revisepostType"
                                                name="postTypeName" value="分享" >分享</label> 
                                        
                                        <label> <input type="radio" class="revisepostType"
                                                name="postTypeName" value="問題" checked>問題
                                        </label>
                                        </c:when>
										
										
										</c:choose>
										
										</th>
									</tr>
									<tr>
										<th><div class="mb-3">
												標題:<input type="text" name="title"
													class="form-control revisetitle" id="floatingInputGrid" value="${queryContent.title}" 
													placeholder="請輸入標題" oninvalid="setCustomValidity('請輸入標題')"
													oninput="setCustomValidity('')">
													<label style="color:#FF0000" for="floatingInputGrid"></label>
											</div></th>
									</tr>

									<tr>
										<th><div class="form-floating">
												內容:
												<textarea name="content" id="floatingInputGrids" class="form-control revisecontent" cols="60" rows="10"
													oninput="setCustomValidity('')">${queryContent.content}</textarea>
													<label style="color:#FF0000" for="floatingInputGrids"></label>
											</div></th>
									</tr>
									<tr>
										<th>
											<c:forEach var="image" items="${updatImages}">
                                             <img class="imgss" src="${image}">
                                              </c:forEach>
											
											<br> 重新選擇圖片(最多五張，每張2MB以下):<input id="file1" type="file"
											class="btn btn-outline-primary" name="changeimages"
											multiple="multiple" accept="image/*" onchange="checkip()">
											<div id="imgs"></div>
                                             <script src="/group5/js/jquery.min.js"></script>
                                             <script src="js/images.js"></script>
                                             
										</th>
									</tr>
									
									<tr>
                                        <th>
									       <input type="submit" class="btn-solid-reg modifySend" value="修改送出">
                                            <a class="btn-outline-reg" href="/group5/UserPostAll">取消</a>
									   </th>
                                    </tr>
                                    
								</thead>
							</table>
							        <script>
						
							        
							        $("form").submit(function(event){
							        	event.preventDefault();
							        	  var revisecontent = $(".revisecontent").val();
		                                     var revisetitle = $(".revisetitle").val();
		                                     console.log(revisetitle);
		                                     if(!revisetitle){
		                                         $(".revisetitle").next().text("請輸入標題");
		                                     }
		                                     
		                                     if(!revisecontent){
		                                         $(".revisecontent").next().text("請輸入內容");
		                                     } 
		                                     if(revisetitle && revisecontent) {
							        	
							        	
							             Swal.fire({
							                 title: '確認是否修改送出?',
							                 text: '備註:已發布的貼文修改會經過管理員審核!',
							                 icon: 'warning',
							                 cancelButtonText: '取消',
							                 showCancelButton: true,
							                 confirmButtonColor: '#3085d6',
							                 cancelButtonColor: '#d33',
							                 confirmButtonText: '送出'
							             }).then((result) => {
							                 if (result.isConfirmed) {
							                     Swal.fire({
							                         title: '修改送出成功',
							                         icon: 'success'
							                     }).then((result) => {
							                    	 $(this).submit();
							                     });
							                 }
							             });
							        
		                                     }
							        
							        });

            </script>
                            </form>
					</div>
					<!-- end of text-container -->
				
				</div>
				<!-- end of col -->
				<!--  <div class="col-lg-6">
                    <!--<div class="image-container">
                        <img class="img-fluid" src="images/details.png" alt="alternative">
                    </div> <!-- end of image-container -->
				<!--</div> <!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</div>
	<!-- end of basic-1 -->
	<!-- end of details -->
 




	<%@ include file="../admin/FrontStageFoot.jsp"%>
</body>
</html>