<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title>新增活動</title>
<link rel="stylesheet" href="/group5/css/voucherStyle.css">

<link href="/group5/css/bootstrap.css" rel="stylesheet">
<link href="/group5/css/fontawesome-all.css" rel="stylesheet">
<link href="/group5/css/swiper.css" rel="stylesheet">
<link href="/group5/css/magnific-popup.css" rel="stylesheet">
<link href="/group5/css/styles.css" rel="stylesheet">

<!-- sweet alert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- ckeditor5 -->
<script src="https://cdn.ckeditor.com/ckeditor5/35.1.0/classic/ckeditor.js"></script>

<style type="text/css">
.ck-editor__editable {
                min-height: 300px;
            }
</style>
</head>
<body>

	<%@ include file="../admin/AdminstyleHead.jsp" %>

	<form:form action="/group5/admin/addactivity.controller" method="post" modelAttribute="activity" enctype="multipart/form-data">

		<form:input type="hidden" path="a_account" value="${loginMember.adminName }"/>

			<H2>活動資料</H2>
			
			
			<!-- Details -->
    <div id="details" class="basic-1" style="padding-top: 2.5rem; padding-bottom: 2.5rem;">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="text-container">
                        <form action="/group5/user/signupadd.controller" method="post" >
                        <ul class="list-unstyled li-space-lg">
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
										活動名稱:
										<c:choose>
											<c:when test="${upd}">${update_activity.activityTitle}</c:when>
											<c:when test="${query}">${query_activity.activityTitle}</c:when>
											<c:otherwise>${add_activity.activityTitle}</c:otherwise>
										</c:choose>
									</div>
								</li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
                               		活動類型:
										<c:choose>
											<c:when test="${upd}">${update_activity.typeContent}</c:when>
											<c:when test="${query}">${query_activity.typeContent}</c:when>
											<c:otherwise>${add_activity.typeContent}</c:otherwise>
										</c:choose>
									</div>
                            </li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
										主辦方:
										<c:choose>
											<c:when test="${upd}">${update_activity.holder}</c:when>
											<c:when test="${query}">${query_activity.holder}</c:when>
											<c:otherwise>${add_activity.holder}</c:otherwise>
										</c:choose>
									</div>
                            </li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
										活動地點:
										<c:choose>
											<c:when test="${upd}">${update_activity.location}</c:when>
											<c:when test="${query}">${query_activity.location}</c:when>
											<c:otherwise>${add_activity.location}</c:otherwise>
										</c:choose>
									</div>
                            </li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
										活動開始日:
										<c:choose>
											<c:when test="${upd}">${update_activity.startTime}</c:when>
											<c:when test="${query}">${query_activity.startTime}</c:when>
											<c:otherwise>${add_activity.startTime}</c:otherwise>
										</c:choose>
									</div>
                            </li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
									活動結束日:
									<c:choose>
										<c:when test="${upd}">${update_activity.endTime}</c:when>
										<c:when test="${query}">${query_activity.endTime}</c:when>
										<c:otherwise>${add_activity.endTime}</c:otherwise>
									</c:choose>
								</div>
							</li>
							<li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
									活動內容:
									<br>
									<c:choose>
										<c:when test="${upd}">${update_activity.activityContent}</c:when>
										<c:when test="${query}">${query_activity.activityContent}</c:when>
										<c:otherwise>${add_activity.activityContent}</c:otherwise>
									</c:choose>
								</div>
							</li>
                        </ul>
                        </form>
                       
                    </div> <!-- end of text-container -->
                </div> <!-- end of col -->
                <div class="col-lg-6" style="align-items: center; display: flex;">
                    <div class="image-container">
                    <img width="600" src='/Path/<c:choose>
										<c:when test="${upd}">${update_activity.photoData}</c:when>
										<c:when test="${query}">${query_activity.photoData}</c:when>
										<c:otherwise>${add_activity.photoData}</c:otherwise>
									</c:choose>' />
					</div> <!-- end of image-container -->
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of basic-1 -->
    <!-- end of details -->
			
			
			<div class="st1">
				<label class="t1">活動名稱:</label> 
				<form:input type="text" path="activityTitle" placeholder="activityTitle" class="need"/>＊請勿超過20個字
			</div>
			
			<div class="st1">
				<label class="t1">活動類型:</label>
				<form:input type="text" path="typeContent" placeholder="typeContent" class="need"/>＊
			</div>
			
			<div class="st1">
				<label class="t1">主辦方:</label>
				<form:input type="text" path="holder" placeholder="holder" class="need"/>＊
			</div>
			
			<div class="st1">
				<label class="t1">活動地點:</label>
				<form:input type="text" path="location" placeholder="location" class="need"/>＊
			</div>
			
			<div class="st1">
				<label class="t1">報名截止日:</label> 
				<form:input type="date" path="signUpDeadline" id="deadline" class="need"/>＊
			</div>
			
			<div class="st1">
				<label class="t1">活動開始日:</label> 
				<form:input type="date" path="startTime" id="startTime" class="need"/>＊
			</div>
			
			<div class="st1">
				<label class="t1">活動結束日:</label> 
				<form:input type="date" path="endTime" id="endTime" class="need"/>＊
			</div>
			
			<br>

			<div class="st1">
				<label for="memo" style="float: left; margin: 3px;">圖片:</label> 
				<input type="file" id="ff" name="photo"/>
			</div>
			<img id="img1" height="150" />
			
			<label style="	margin: 3px;">活動內容:</label>＊
			<!-- <form:textarea path="activityContent" id="activityContent" cols="70" rows="15" class="need"></form:textarea> -->
			<div id="editor"></div>
			
		
		<div class="sub">
			<input type="button" id="add" value="送出">
			<input type="hidden" name="add" value="送出">
			<a href="activitymain.controller"><input type="button" value="返回"></a>
		</div>
	</form:form>
	
	
	<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
	
	<!-- ckeditor5 -->
	<script>
    ClassicEditor
        .create( document.querySelector( '#editor' )
        		, {
			ckfinder:{
				uploadUrl: "/group5/admin/uploadimages"
			}
        })
        .then(editor => {
            myEditor = editor;
            // 设置初始值
            myEditor.setData('');
        })
        .catch( error => {
            console.error( error );
        } 
);
	</script>
	
	<script type="text/javascript">    
	
	$('#test').on('click', function(){
		const data = myEditor.getData();
		console.log(data);
		//myEditor.setData('<p>台北市建築世代會為專業建築開發之新世代領導者組成，擁有共同理念。<br>將『家』的溫度、『城市的文明』一磚一瓦建造成型，取之於社會用之於社會。<br><strong>常年以行動散播愛分享愛，舉辦慈善耶誕路跑</strong><br><strong>今年即將邁入10週年，讓我們一同藉由運動一同響應公益，為愛而跑，讓更多孩童獲得實質的支持與幫助。</strong><br><strong>路跑報名費所得將全數捐贈。</strong></p');
	})
	
	$('#ff').on('change', function(e){      
		
		console.log("圖片預覽");
		
  		const file = this.files[0];
  		const objectURL = URL.createObjectURL(file);
  		
  		$('#img1').attr('src', objectURL);
		});
	
    	$("#add").on('click', function(event){
			var rs = false;
    		$(".need").each(function(){
    			if($(this).val()==""){
    	    		console.log('檢查到欄位有空值!');
        			Swal.fire({
    					title:'資料不完整',
    					text:'請檢查＊號欄位是否都有填入',
    					icon:'warning'
    				});
    		   		rs = true;
        		}
    		});
    		if(rs)return;
    		
    		let date = new Date();
			if(date.toISOString().split('T')[0] >= $('#endTime').val() || date.toISOString().split('T')[0] >= $('#deadline').val()){
				Swal.fire({
					title:'日期錯誤',
					text:'結束日期已過請重新選擇',
					icon:'warning'
				})
		   		return;
		    }
			if($('#startTime').val() > $('#endTime').val()){
				Swal.fire({
					title:'日期錯誤',
					text:'開始日期大於結束日期',
					icon:'warning'
				})
		   		return;
		    }
			$(this).parent().parent().submit();
    	});
	</script>
	
	<%@ include file="../admin/AdminstyleFoot.jsp"%>
	
</body>
</html>