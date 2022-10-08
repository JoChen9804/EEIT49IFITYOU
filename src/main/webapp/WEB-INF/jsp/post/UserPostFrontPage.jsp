<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <!-- official Bootstrap-->
<!--     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>

<!--     Custom styles for this page -->
    <link href="/group5/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <script src="/group5/js/jquery.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


<title>論壇貼文</title>

<style>
.imgfront {
	width: 150px;
	height: 120px;
	padding: 2px 2px 2px 2px;
	margin: 2px;
}
.table1 {
    width: 800px;
    table-layout: fixed;
    margin-left: auto;
    margin-right: auto;
/*     background-color: #f7f4dd; */
    top: -100px;
    left: 100px;
}

.column1 {
    width: 200px;
    text-align: center;
    vertical-align: bottom;
/*     background-color: #f7f4dd; */
}

.column2 {
    width: 600px;
    text-align: left;
    vertical-align: bottom;
/*     background-color: #f7f4dd; */
}

.column3 {
    width: 200px;
    text-align: center;
    vertical-align: top;
/*     background-color: #f7f4dd; */
}

.column4 {
    width: 700px;
    text-align: center;
/*     background-color: #f7f4dd; */
}
.content {
/*     background-color: #f7f4dd; */
    word-wrap: break-word;
}
.center {
    text-align: center;
}

.card-body {
/*      width:350px; */
     height: 250px;
}

.p1 {
    margin: 0;
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
						<li class="nav-item"><a class="nav-link mycollection" id="nav-tab-3"
							data-toggle="tab" href="#tab-3" role="tab" aria-controls="tab-3"
							aria-selected="false"><i class="fas fa-chart-bar"></i>收藏貼文</a></li>
					</ul>
<!-- 					找會員帳號  與是否禁止發言-->
					<input type="hidden" class="useraccount" value="${user.memberAccount}"> 
					 
<%-- 					<input type="hidden" class="usermute" value="${user.memberDetail.mute}">  --%>
					<!-- end of tabs links -->
                    <script>
                    
                    
                    
                    $(function(){
                    	console.log($(".useraccount").val());
                    	//console.log(usermute);
                    	
                        $.ajax({
                            type: "GET",
                            url: "/group5/FavoritePostAJAX",
                            dataType : 'json',
                            success: function(data){
                                console.log();
                                $('#favoriteShow').empty(""); //先清空
                                    var table = $("#favoriteShow");
                                    table.append(` <tr>
                                                      <th>類型</th>
                                                      <th>標題</th>
                                                      <th>內容</th>
                                                      <th>會員<br>發布時間</th>
                                                      <th>操作</th>
                                                   </tr>`);
                                    $.each(data, function(i,n){
                                    	if(n.mainPostNo == 0){
                                    		$('#favoriteShow').empty("");
                                    		$('#favoriteShow').append(`<p class='center'>查無收藏紀錄<p>`);
                                    	}else{
                                    	
                                        var title = n.title;
                                        var tr = "<tr class='content'>" + 
                                                 "<td class='align-middle'>" + n.postTypeName + "</td>" +
                                                 "<td class='align-middle'>" + n.title + "</td>" + 
                                                 "<td class='align-middle'>" + n.content + "</td>" + 
                                                 "<td class='align-middle'>" + n.account + "<br/>"+ n.addtime +"</td>" +
                                                 "<td class='align-middle'>" +
                                                 "<input type='hidden' class='deletefasss' name='mainPostNo' value='"+ n.mainPostNo +"'>" +
                                                 "<button type='submit' style='border:none' class='deletefas btn btn-outline-danger fa-regular fa-trash-can fa-1x'>"+"刪除"+"</button>" +
                                                 "<form action='PostWtch' method='GET'>" +
                                                     "<input type='hidden' name='mainPostNo' value='"+ n.mainPostNo +"'>" +
                                                     "<button type='submit' style='border:none'  class='btn btn-outline-success btn-icon-split fa-solid fa-magnifying-glass fa-1x'>"+"觀看"+"</button>" +
                                                 "</form>"+   
                                                 "</td>" + 
                                                 "</tr>";
                                        table.append(tr);
                                        
                                    	}
                                    });
                            }
                        });
                    });
                    
                    $(document).on('click',".deletefas",function(){
                    	let mainPostNo = $(this).siblings(".deletefasss").val();
                    	//let tr = $(this).siblings(".deletefasss").parent();
                    	//console.log(tr);
                    	Swal.fire({
								    title: '確定刪除收藏？',
								    text: "",
								    icon: 'warning',
								    showCancelButton: true,
								    confirmButtonColor: '#3085d6',
								    cancelButtonColor: '#d33',
								    confirmButtonText: '刪除',
								    cancelButtonText: '取消',
								    reverseButtons: true
								
								}).then((result) => {
								    if (result.isConfirmed) {
								    	$(this).siblings().parent().parent().remove();
								    	deletefavorite(mainPostNo);
								        Swal.fire(
								            '已刪除貼文!'
								        ).then((result) => {
								            if (result.isConfirmed) {
								            }
								        });
								
								    }
								});
                    	
                    	
                    });
                    
                    function deletefavorite(mainPostNo){
                        $.ajax({
                            type: "Delete",
                            url: "/group5/FavoritePostAJAX/"+ mainPostNo,
                            success: function(){
                                Swal.fire(
                                        '已刪除收藏!'
                                ).then((result)=>{
                                    if(result.isConfirmed){
                                    }
                                });
                                
                            }
                        });
                    }
                    
                    </script>
                    


                    <!-- ////////////////////// 全部貼文///////////////////////////// -->
					<!-- Tabs Content -->
					<div class="tab-content" id="argoTabsContent">

						<!-- Tab -->
						<div class="tab-pane fade show active" id="tab-1" role="tabpanel"
							aria-labelledby="tab-1">
							<div class="row">
								
								
								<div class="col-lg-9">
									<div class="text-container">

										<form action="UserPostAll" method="GET">


											<div class="row g-2">
												<div class="col-md">
<!-- 													<div class="form-floating"> -->
<!-- 														<input type="text" name="title" class="form-control entertitle" -->
<!-- 															placeholder="請輸入標題" required -->
<!-- 															oninvalid="setCustomValidity('請輸入標題')" -->
<!-- 															oninput="setCustomValidity('')"><label style="color:#FF0000" -->
<!-- 															for="floatingInputGrid"></label> -->
<!-- 													</div> -->
												</div>  
<!-- 												<div class="col-md"> -->
<!-- 													<div class="form-floating"> -->
<!-- 														<input type="submit" class="btn-solid-reg inquiretitle" value="查詢"> -->
<!-- 													</div> -->
<!-- 												</div> -->
												
												<script>
                                                   $(".inquiretitle").on('click', function(event){
										            var rs = false;
										            $(".entertitle").each(function(){
										                if($(this).val()==""){
										                    console.log('請輸入標題');
										                    Swal.fire({
										                        title:'請輸入標題',
										                        icon:'warning'
										                    });
										                    $(this).next().text('請輸入標題');
										                    rs = true;
										                }
										            });
										            if(rs)return;
										            
										        });
                                                   </script>

												<div class="col-md">
													<div class="form-floating">
														<a class="btn-solid-reg" href="/group5/UserPostAll">所有貼文</a>
													</div>
												</div>


												<div class="col-md">
													<div class="form-floating">
														<a class="btn-solid-reg popup-with-move-anim"
															href="#details-lightbox-1">發布貼文</a>
													</div>
												</div>


											</div>
										</form>


<!-- 										<table class="table table-sm"> -->
<!-- 											<thead> -->
<!-- 												<tr> -->
<!-- 													<th>圖片</th> -->
<!-- 													<th>類型</th> -->
<!-- 													<th>標題</th> -->
<!-- 													<th>發布日期</th> -->
<!-- 													<th>最後回覆</th> -->
<!-- 													<th>觀看</th> -->
<!-- 												</tr> -->
<!-- 											</thead> -->
<%-- 											<c:forEach var="allmpbs" items="${query}"> --%>
<!-- 												<tbody> -->
<!-- 													<tr> -->
<!-- 														<a href="/group5/PostWtch/${allmpbs.mainPostNo}"></a> -->
<!-- 														<td class="align-middle"><img class="imgfront" -->
<%-- 															src="${allmpbs.p_image}"></td> --%>
<%-- 														<td class="align-middle">[${allmpbs.postTypeName}]</td> --%>
<%-- 														<td class="align-middle">${allmpbs.title}</td> --%>
<%-- 														<td class="align-middle">${allmpbs.account}<br />${allmpbs.addtime}</td> --%>
<%-- 														<td class="align-middle">${allmpbs.replyAccount}<br />${allmpbs.lastReplyTime} --%>
<!-- 														</td> -->
<!-- 														<td class="align-middle"> -->
<!-- 															<form action="PostWtch" method="GET"> -->
<!-- 																<input type="hidden" name="mainPostNo" -->
<%-- 																	value="${allmpbs.mainPostNo}"> <input --%>
<!-- 																	type="submit" class="btn btn-outline-success" -->
<!-- 																	value="觀看"> -->
<!-- 															</form> -->
<!-- 														</td> -->
<!-- 													</tr> -->
<!-- 												</tbody> -->
<%-- 											</c:forEach> --%>
<!-- 										</table> -->
										<h3>${error}</h3>
										<c:forEach var="allmpbs" items="${query}">
										      <div class="card mb-3" style="max-width: 900px;">
                                        <div class="row g-0">
                                            <div class="col-md-5 col-lg-5">
                                                <img src="${allmpbs.p_image}" width="450px"
                                                    height="250px" class="w-100">
                                            </div>

                                            <div class="col-md-7 col-lg-7">
                                                <div class="card-body">
                                                    <h3 class="card-title">${allmpbs.title}&emsp;[${allmpbs.postTypeName}]</h3>
                                                    <p class="card-text">${allmpbs.content}</p>
                                                    <p class="p1"><small class="text-muted">發布會員:${allmpbs.account}</small></p>
                                                    <p class="p1"><small class="text-muted">發布時間:${allmpbs.addtime}</small></p>
                                                    <form action="PostWtch" method="GET">
                                                      <input type="hidden" name="mainPostNo"value="${allmpbs.mainPostNo}"> 
                                                      <input type="submit" class="btn btn-outline-success" value="觀看">
                                                    </form>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
										</c:forEach>
										
									</div>
									
									
									
									<!-- end of text-container -->
								</div>
								
								
								<div id="sidebar-primary" class="col-xs-12 col-md-12 col-lg-3 col-xl-3 sidebar-primary widget-area"
                                            role="complementary">
                                <aside id="search-2">
                                
                                
<!--                         <form role="search" method="get" class="search-form" -->
<!--                             action="https://ld-wp.template-help.com/wordpress_52382/"> -->
                           
                            <form action="UserPostAll" method="GET">
                            <input type="text" name="title" class="form-control entertitle"
                                                            placeholder="請輸入標題" required
                                                            oninvalid="setCustomValidity('請輸入標題')"
                                                            oninput="setCustomValidity('')"><label style="color:#FF0000"
                                                            for="floatingInputGrid"></label>
                            
                            <input type="submit" class="btn-solid-reg inquiretitle" value="查詢">
<!--                             查詢:<input type="text" placeholder="Search" value="" /> -->
<!--                             <button type="submit" class="search-form__submit btn btn-primary"><i -->
<!--                                     class="material-icons">search</i></button> -->

                         </form>
                    </aside>
                    <aside id="widget-custom-posts-2" class="widget widget-custom-posts custom-posts">
                        <h5 class="widget-title">Recent Posts</h5>
                        <div class="custom-posts__holder row">
                            <div class="custom-posts__item post col-xs-6 col-sm-6 col-md-12 col-lg-12 col-xl-12">
                                <div class="post-inner">
                                    <div class="entry-header">
                                        <div class="post-thumbnail"><a
                                                href="https://ld-wp.template-help.com/wordpress_52382/2016/07/26/how-long-before-the-exit-you-must-be-planning-it/"
                                                class="post-thumbnail__link"><img class="post-thumbnail__img"
                                                    src="https://ld-wp.template-help.com/wordpress_52382/wp-content/uploads/2016/07/image41-130x136.jpg"
                                                    alt="How long before the exit you must be planning it?" width="130"
                                                    height="136"></a></div>
                                        <h4><a href="https://ld-wp.template-help.com/wordpress_52382/2016/07/26/how-long-before-the-exit-you-must-be-planning-it/"
                                                title="How long before the exit you must be planning it?">How long
                                                before the exit you must be planning it?</a></h4> <span
                                            class="post__date"><a
                                                href="https://ld-wp.template-help.com/wordpress_52382/2016/07/26/"
                                                class="post__date-link"><time
                                                    datetime="2016-07-26T13:40:57+00:00">26.07.2016</time></a></span>
                                    </div>
                                </div>
                            </div>
                            <div class="custom-posts__item post col-xs-6 col-sm-6 col-md-12 col-lg-12 col-xl-12">
                                <div class="post-inner">
                                    <div class="entry-header">
                                        <div class="post-thumbnail"><a
                                                href="https://ld-wp.template-help.com/wordpress_52382/2016/05/17/gallery-format/"
                                                class="post-thumbnail__link"><img class="post-thumbnail__img"
                                                    src="http://fakeimg.pl/130x136/000/fff/?text=130x136"
                                                    alt="Gallery Format" width="130" height="136"></a></div>
                                        <h4><a href="https://ld-wp.template-help.com/wordpress_52382/2016/05/17/gallery-format/"
                                                title="Gallery Format">Gallery Format</a></h4> <span
                                            class="post__date"><a
                                                href="https://ld-wp.template-help.com/wordpress_52382/2016/05/17/"
                                                class="post__date-link"><time
                                                    datetime="2016-05-17T14:37:10+00:00">17.05.2016</time></a></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </aside>

                    <aside id="categories-2" class="widget widget_categories">
                        <h5 class="widget-title">Categories</h5>
                        <ul>
                            <li class="cat-item cat-item-1"><a
                                    href="https://ld-wp.template-help.com/wordpress_52382/category/business-plan-consulting/">Business
                                    plan consulting</a>
                            </li>
                            <li class="cat-item cat-item-27"><a
                                    href="https://ld-wp.template-help.com/wordpress_52382/category/conflict-management/">Conflict
                                    management</a>
                            </li>

                        </ul>
                    </aside>
                    <aside id="recent-comments-2" class="widget widget_recent_comments">
                        <h5 class="widget-title">Recent Comments</h5>
                        <ul id="recentcomments">
                            <li class="recentcomments"><span class="comment-author-link">admin</span> on <a
                                    href="https://ld-wp.template-help.com/wordpress_52382/2016/05/17/image-format/#comment-9">Image
                                    Format</a></li>
                            <li class="recentcomments"><span class="comment-author-link">admin</span> on <a
                                    href="https://ld-wp.template-help.com/wordpress_52382/2016/05/17/bringing-a-new-cfo-at-the-time-of-crisis/#comment-8">Bringing
                                    a new CFO at the time of crisis?</a></li>

                        </ul>
                    </aside>

                </div>
								
								
								
								
								
								
								
								
								
								
								<!-- end of col -->
							</div>
							<!-- end of row -->
						</div>
						<!-- end of tab-pane -->
						<!-- end of tab -->
						<!-- ////////////////////// 全部貼文///////////////////////////// -->
                        <script>
                           $(".card-body").css("padding", "0");
                        </script>




						<!-- ////////////////////// 我的分享貼文///////////////////////////// -->
						<!-- Tab -->
						<div class="tab-pane fade" id="tab-2" role="tabpanel"
							aria-labelledby="tab-2">
							<div class="row">

								<div class="col-lg-12">
									<div class="text-container">
										<form action="UserPostAll" method="GET">


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
														<input type="submit" class="btn-solid-reg"
															name="inquireId" value="查詢">
													</div>
												</div>
											
											
											</div>



										</form>
										<table class="table table-sm">
											<thead>
												<tr>
													<th>圖片</th>
													<th>類型</th>
													<th>標題</th>
													<th>發布日期</th>
													<th>最後回覆</th>
													<th>狀態</th>
													<th>編輯</th>
												</tr>
											</thead>
											<c:forEach var="allmpbs" items="${userposts}">
												<tbody>
													<tr>
														<!--<a href="/group5/PostWtch/${allmpbs.mainPostNo}"></a>-->
														<td class="align-middle"><img class="imgfront"
															src="${allmpbs.p_image}"></td>
														<td class="align-middle">[${allmpbs.postTypeName}]</td>
														<td class="align-middle">${allmpbs.title}</td>
														<td class="align-middle">${allmpbs.account}<br />${allmpbs.addtime}</td>
														<td class="align-middle">${allmpbs.replyAccount}<br />${allmpbs.lastReplyTime}
														</td>
														<td class="align-middle">${allmpbs.postPermission}</td>
														<td class="align-middle">
															<!--  <form action="UserPost" method="POST">-->
																<input type="hidden" name="_method" value="DELETE">
																<input type="hidden" name="deletepost" class="postid" 
																	value="${allmpbs.mainPostNo}"> <input
																	type="submit" class="btn btn-outline-success deletepost" 
																	value="刪除">
															<!--</form>-->
															<form action="UserPostChange" method="POST">
																<input type="hidden" name="updatepost"
																	value="${allmpbs.mainPostNo}"> <input
																	type="submit" class="btn btn-outline-success"
																	value="修改" >
															</form> 
															 <form action="PostWtch" method="GET">
                                                                <input type="hidden" name="mainPostNo"
                                                                    value="${allmpbs.mainPostNo}"> <input
                                                                    type="submit" class="btn btn-outline-success"
                                                                    value="觀看">
                                                            </form>
															
															
															<!--<a id="${allmpbs.mainPostNo}" class="btn-solid-reg popup-with-move-anim"
															href="#details-lightbox-2">修改</a>-->
															
															<script type="text/javascript">
															
															$(function() {
															     $(".deletepost").click(function(){
                                                                    
                                                                    let deletepost = $(this).prev().val();
                                                                    console.log(deletepost);
                                                                    
                                                                    Swal.fire({
                                                                        title: '確定刪除貼文？',
                                                                        text: "",
                                                                        icon: 'warning',
                                                                        showCancelButton: true,
                                                                        confirmButtonColor: '#3085d6',
                                                                        cancelButtonColor: '#d33',
                                                                        confirmButtonText: '刪除',
                                                                        cancelButtonText: '取消',
                                                                        reverseButtons: true
                                                                        
                                                                      }).then((result) => {
                                                                          if (result.isConfirmed) {
                                                                              let deleteid = $(this).prev().val();
                                                                              $(this).siblings().parent().parent().remove();
                                                                              deletePost(deleteid);
                                                                              Swal.fire(
                                                                            		  '已刪除貼文!'
                                                                              ).then((result)=>{
                                                                            	  if(result.isConfirmed){
                                                                                      //location.reload();
                                                                                  }
                                                                              });
                                                                    
                                                                            }
                                                                          });
                                                                    
                                                                 });
															     
// 					                                            var onereply = document.getElementById("${allmpbs.mainPostNo}");
// 					                                            onereply.onclick = function(event) {
// 					                                            	  $("#oldimgs").html(""); // 清除預覽
// 		                                                                readURL(this);
// 		                                                                $("#imgs").html(""); // 清除
//                                                                         readURL(this);
					                                            	
// 					                                                console.log("${allmpbs.mainPostNo}");
// 					                                                let mpBean = {
// 					                                                    "updatepost" : "${allmpbs.mainPostNo}"
// 					                                                };
// 					                                                $.ajax({
// 					                                                     type : "post",
// 					                                                     url : '/group5/PostRevise',
// 					                                                     data : mpBean,
// 					                                                     dataType : 'json',
// 					                                                     success : function(data) {
// 					                                                    	 console.log(data);
					                                                    	 
// 					                                                    	 //單選還是有問題~
// 					                                                    	 $(".revisecontent").text(data.content);
// 					                                                    	 $(".revisetitle").val(data.title);
// 					                                                    	 $("input[name='postTypeName'][value='"+data.postTypeName+"']").attr("checked",true);
// 					                                                    	 $(".reviseaccount").val(data.account);
// 					                                                    	 $(".reviseamainPostNo").val(data.mainPostNo);
					                                                    	 
// 					                                                           //照片處理
// 					                                                    	   var img =data.p_image.split(',');
// 					                                                           for(var i=0; i <img.length -1; i++){
// 					                                                        	   var imgss = $("<img width='300' height='200'>").attr('src', img[i]);
// 	                                                                               console.log(img.length);
// 	                                                                               $("#oldimgs").append(imgss);
// 					                                                           }
					                                                           
// 					                                                            }
					                                                
// 					                                                        });
// 					                                            }
					                                            
					                                            
															
															
															});
															
															function deletePost(deletepost){
																console.log(deletepost)
																let mpBean = {
                                                                        "deletepost" : deletepost
                                                                    };
																
													            $.ajax({
													                type: "Delete",
													                url: "/group5/UserPost",
													                data : mpBean,
													                dataType : 'json',
													                success: function(){
													                	location.reload();
													                    console.log("deleted!!")
													                }
													            })
													        }
															
															
															
													</script>
															
															
														</td>
													</tr>
												</tbody>
											</c:forEach>
										</table>
										<h3>${notYetPublished}</h3>







									</div>
								</div>
							</div>
							<!-- end of row -->
						</div>
						<!-- end of tab-pane -->
						<!-- end of tab -->




						<!-- Tab -->
						
						<div class="tab-pane fade" id="tab-3" role="tabpanel"
							aria-labelledby="tab-3">
							<div class="row">
							 <div class="col-lg-12">
                                         <div class="text-container">
							
<!-- 							<div id ="favoriteShow"></div> -->
							<table id="favoriteShow" class="table table-sm"></table>
                                
								<!-- end of col -->
							</div>
							</div>
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



<!-- ////////////////////////////////////發布貼文畫面////////////////////////////////////////// -->
	<!-- Details Lightboxes -->
	<!-- Details Lightbox 1 -->
	<div id="details-lightbox-1"
        class="lightbox-basic zoom-anim-dialog mfp-hide" >
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
											name="postTypeName" value="飲食" id="" required
											oninvalid="setCustomValidity('請輸入帳號')"
											oninput="setCustomValidity('')">飲食
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



<!--///////////////////////////////// 有問題 暫時先到調轉到新畫面//////////////////////////////////   -->
	<!-- Details Lightbox 2 -->
	<div id="details-lightbox-2"
		class="lightbox-basic zoom-anim-dialog mfp-hide">
		<div class="container">
			<div class="row" >
				<button title="Close (Esc)" type="button" class="mfp-close x-button">×</button>
			
				<!--</div> -->
				<!-- end of col -->
				<div class="col-lg-12">
				<form action="/group5/UserPost" enctype='multipart/form-data'
                        method="POST" onsubmit="return checkip()">
                        <input type="hidden" name="_method" value="PUT">
                        
                        <input type="hidden" name="account" class="reviseaccount">
                        <input type="hidden" name="mainPostNo" class="reviseamainPostNo">
                        
				                        <h3>修改貼文</h3>
                        <table class="img-fluid">
                            <thead>
                                <tr>
                                    <th><label> <input type="radio" class="revisepostType"
                                            name="postTypeName" value="公告"  required
                                            oninvalid="setCustomValidity('請輸入帳號')"
                                            oninput="setCustomValidity('')">公告
                                    </label> <label> <input type="radio" class="revisepostType" name="postTypeName"
                                            value="分享"  checked>分享
                                    </label> <label> <input type="radio" class="revisepostType" name="postTypeName"
                                            value="問題" >問題
                                    </label></th>
                                </tr>
                                <tr>
                                    <th><div class="mb-3">
                                            標題:<input type="text" name="title" class="form-control revisetitle" 
                                                id="floatingInput" placeholder="請輸入標題"
                                                oninvalid="setCustomValidity('請輸入標題')"
                                                oninput="setCustomValidity('')"> <label
                                                for="floatingInput">{請輸入標題}</label>
                                        </div></th>
                                </tr>

                                <tr>

                                    <th><div class="form-floating">
                                            內容:
                                            <textarea name="content" class="form-control revisecontent" cols="60"
                                                rows="10" placeholder="請輸入內容" id="floatingTextarea" required
                                                oninvalid="setCustomValidity('請輸入內容')"
                                                oninput="setCustomValidity('')"></textarea>
                                            <label for="floatingTextarea">{請輸入內容}</label>
                                        </div></th>
                                </tr>
                                <tr>
                                    <th>
                                        <div id="oldimgs"></div><br>
                                         重新選擇圖片(最多五張，每張2MB以下):<input id="file1" type="file"
                                        class="btn btn-outline-primary" name="changeimages"
                                        multiple="multiple" accept="image/*" onchange="checkip()">
                                        
                                        <div id="imgs"></div>
                                        
                                        </th>
                                </tr>
                            </thead>
                        </table>
                        <input type="submit" class="btn-solid-reg mfp-close" value="修改送出">
                        <a class="btn-outline-reg mfp-close as-button" href="#screenshots">取消</a>
                        
                        </form>
            
					
				<!--	<a class="btn-solid-reg mfp-close" href="sign-up.html">SIGN UP</a>
					<a class="btn-outline-reg mfp-close as-button" href="#screenshots">BACK</a>-->
					
					
					
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



    <script src="/group5/js/jquery.min.js"></script>
    <script src="js/images.js"></script>
                        <script>

                        $(function () {
                            var len = 50; // 超過50個字以"..."取代
                            $(".card-text").each(function (i) {
                                if ($(this).text().length > len) {
                                    $(this).attr("title", $(this).text());
                                    var text = $(this).text().substring(0, len - 1) + "...";
                                    $(this).text(text);
                                }
                            });
                        });
                        
                        
                        
                        
                        

                        /*Bootstrap 3：在页面刷新时保持选中的选项卡*/
                        $(document).ready(function () {
                            if (location.hash) {
                                $("a[href='" + location.hash + "']").tab("show");
                            }
                            $(document.body).on("click", "a[data-toggle='tab']", function (event) {
                                location.hash = this.getAttribute("href");
                            });
                        });
                        $(window).on("popstate", function () {
                            var anchor = location.hash || $("a[data-toggle='tab']").first().attr("href");
                            $("a[href='" + anchor + "']").tab("show");
                        });

                        $(document).ready(function () {
                            if (location.hash) {
                                $("a[href='" + location.hash + "']").tab("show");
                            }
                            $(document.body).on("click", "a[data-toggle='tab']", function (event) {
                                location.hash = this.getAttribute("href");
                            });
                        });
                        $(window).on("popstate", function () {
                            var anchor = location.hash || $("a[data-toggle='tab']").first().attr("href");
                            $("a[href='" + anchor + "']").tab("show");
                        });
                        
                        
                        
                        
                    </script>
    
    
    
    
    

<script src="https://kit.fontawesome.com/f795d981d8.js" crossorigin="anonymous"></script>
<%@ include file="../admin/FrontStageFoot.jsp"%>
</body>
</html>