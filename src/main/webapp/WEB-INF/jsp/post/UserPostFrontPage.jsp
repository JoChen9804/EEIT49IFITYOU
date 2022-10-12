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

.side{
     width:130px;
     height: 170px;

}

.sideh4{
    margin: 0;
}

.iconHome{
    font-size:20px;
}

.iconSide{
    font-size:15px;
    float: right;
}
.samerow {
    position: relative;
    top: 2px;
    }
    
    
.enlarge:hover{
    transform:scale(1.2);
    transition: all 1s ease 0s;
}

.enlarge {  
       
    transform: scale(1);  
    transition: all 1s ease 0s;
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
<!-- 					<div class="above-heading">FEATURES</div> -->
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
					 
					<input type="hidden" class="usermute" value="${user.memberDetail.mute}"> 
					<!-- end of tabs links -->
                    <script>
                    
                    $(function(){
                    	console.log($(".useraccount").val());
                    	//console.log(usermute);
                    	var account =  $(".useraccount").val();
                    	if($(".useraccount").val()){
                    		console.log("有登入");
                    		
                    		favoritePostAJAX()
                    		
                    		userPostsAJAX(account)
                    		
                    		topThreePosts()
                    		
                    	}else{
                    		console.log("空值");
                    		topThreePosts()                    		
                    		
                    		 $('#favoriteShow').append(`<h3 class='center'>請登入或加入會員</h3>`);
                    		 $('#userPosts').append(`<h3 class='center'>請登入或加入會員</h3>`);
                    	}
                    
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
								    //reverseButtons: true
								
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
                    
                    //找使用者收藏
                    function favoritePostAJAX(){
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
                                            $('#favoriteShow').append(`<h3 class='center'>查無收藏紀錄</h3>`);
                                        }else{
                                        
                                        	
                                        var len = 50;	
                                        var content = n.content;
                                        var text = '' ;
                                        
                                        if(content.length > len){
                                        	  text = content.substring(0, len - 1) + "...";
                                        }else{
                                        	text = content ;
                                        }
                                        
                                        console.log(content.length);
                                            	
                                        	
                                        var title = n.title;
                                        var tr = "<tr class='content'>" + 
                                                 "<td class='align-middle'>" + n.postTypeName + "</td>" +
                                                 "<td class='align-middle'>" + n.title + "</td>" + 
                                                 "<td class='align-middle card-text'>" + text + "</td>" + 
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
                    	
                    	
                    }
                    
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
                    
                    //找user發布的貼文
                    function userPostsAJAX(account){
                        $.ajax({
                            type: "Post",
                            url: "/group5/UserPostsAJAX/"+account,
                            dataType : 'json',
                            success: function(data){
                                console.log();
                                $('#userPosts').empty(""); //先清空
                                    var table = $("#userPosts");
                                    table.append(`<thead>
                                            <tr>
                                            <th>圖片</th>
                                            <th>類型</th>
                                            <th>標題</th>
                                            <th>發布日期</th>
                                            <th>最後回覆</th>
                                            <th>狀態</th>
                                            <th>編輯</th>
                                        </tr></thead>`);
                                    $.each(data, function(i,n){
                                        if(n.mainPostNo == 0){
                                            $('#userPosts').empty("");
                                            $('#userPosts').append(`<h3 class='center'>查無發布紀錄</h3>`);
                                        }else{
                                        
                                        var title = n.title;
                                        
                                        var tr ="<tbody><tr>" +
                                        "<td class='align-middle'><img class='imgfront' src='" + n.p_image + "'></td>" +
                                        "<td class='align-middle'>" + [n.postTypeName] + "</td>" +
                                        "<td class='align-middle'>" + n.title + "</td>" +
                                        "<td class='align-middle'>" + n.account +"<br />" +n.addtime +"</td>" +
                                        "<td class='align-middle'>" + n.replyAccount +"<br />" + n.lastReplyTime + "</td>" +
                                        "<td class='align-middle'>" + n.postPermission+ "</td>" +
                                        "<td class='align-middle'><input type='hidden' name='deletepost' class='postid' value='"+ n.mainPostNo + "'>" +
                                        
                                        "<button type='submit' style='border:none' class='deletepost btn btn-outline-danger fa-regular fa-trash-can fa-1x'>"+"刪除"+"</button>" +
                                            "<form action='UserPostChange' method='POST'>"+
                                                "<input type='hidden' name='updatepost' value='" +n.mainPostNo +"'>" + 
                                                "<button type='submit' style='border:none' class='btn btn-outline-warning fa-regular fa-pen-to-square fa-1x'>"+"修改"+"</button>" +
                                                "</form>" + 
                                             "<form action='PostWtch' method='GET'>" +  
                                                "<input type='hidden' name='mainPostNo' value='"+ n.mainPostNo + "'>" +
                                                "<button type='submit' style='border:none'  class='btn btn-outline-success btn-icon-split fa-solid fa-magnifying-glass fa-1x'>"+"觀看"+"</button></form>" +
                                        "</td>" +
                                        "</tr>" +
                                        "</tbody>";
                                        table.append(tr);
                                        
                                        }
                                    });
                            }
                        });
                    
                    
                    }
                    
                    //user刪除貼文
                    $(document).on('click',".deletepost",function(){
                        let deletepost = $(this).siblings(".postid").val();
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
                    
                    //刪除貼文
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
                    
                    //觀看前三名貼文
                    function topThreePosts(){
                    	var popularPosts = $("#popularPosts");
                        console.log()
                        $.ajax({
                            type: "Post",
                            url: "/group5/TopThreePostsAJAX",
                            dataType : 'json',
                            success: function(data){
                            	$.each(data, function(i,n){
                            		var div ="<div class='col-xs-6 col-sm-6 col-md-12 col-lg-12 col-xl-12'>" +
				                                "<div class='side enlarge'>" +
				                                   " <div class='entry-header'>" +
 				                                       
				                                   "<a style='text-decoration:none;' href='/group5/MainPost.watch/" + n.mainPostNo +"'>" +
				                                   "<img class='post-thumbnail__img' width='130' height='100'src='" + n.p_image +"'>" +
				                                   "<small class='sideh4 samerow'>" + n.title + "</small>" + "<i class='fa-solid fa-eye iconSide samerow'>" + n.ctr + "</i><br/>" +
				                                   "<small class='text-muted'>會員:" + n.account + "</small></a>" +
				                                    "</div>" +
				                                "</div>" +
				                            "</div>";
				                   popularPosts.append(div);         
				                            
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
														<a class="btn-solid-reg popup-with-move-anim " 
															href="#details-lightbox-1">發布貼文</a>
															<div class="release"></div>
													</div>
												</div>


											</div>
										</form>
                                        
                                        <script>
                                       
                                      
                                        
                                            $(function(e){
                                            	var account = $(".useraccount").val();
                                            	console.log(account);
                                            	
//                                             	if(!account){
//                                             		$(".release").append(`<h3 class='center'>請登入會員才能發布</h3>`)
//                                             	}
                                           
                                            });
                                            
                                            
                                            
                                            
                                            
                                        
                                        </script>
                                        
                                        
                                        

<!--/////////////////// 首頁的主貼文//////////////////////////////////// -->
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
                                                      <button type='submit' style='border:none'  
                                                      class='btn btn-outline-success btn-icon-split fa-solid fa-magnifying-glass fa-1x'>觀看</button>
                                                    </form>
                                                    <i class="fa-solid fa-eye iconHome">${allmpbs.ctr}</i>
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
                                
                           
                            <form action="UserPostAll" method="GET">
                                <input type="text" name="title" class="form-control entertitle"
                                                            placeholder="請輸入標題" required
                                                            oninvalid="setCustomValidity('請輸入標題')"
                                                            oninput="setCustomValidity('')"><label style="color:#FF0000"
                                                            for="floatingInputGrid"></label>
                            
                                <input type="submit" class="btn-solid-reg inquiretitle" value="查詢">
                            </form>
                         
                         
                    </aside>
                    <aside id="widget-custom-posts-2" class="widget widget-custom-posts custom-posts">
                        <h3 class="widget-title">熱門貼文</h3>
                        <div class="row">
                        
                        <div id ="popularPosts"></div> 
                        
                 
                        
                        </div>
                    </aside>

<!--                     <aside id="categories-2" class="widget widget_categories"> -->
<!--                         <h5 class="widget-title">Categories</h5> -->
<!--                         <ul> -->
<!--                             <li class="cat-item cat-item-1"><a -->
<!--                                     href="https://ld-wp.template-help.com/wordpress_52382/category/business-plan-consulting/">Business -->
<!--                                     plan consulting</a> -->
<!--                             </li> -->
<!--                             <li class="cat-item cat-item-27"><a -->
<!--                                     href="https://ld-wp.template-help.com/wordpress_52382/category/conflict-management/">Conflict -->
<!--                                     management</a> -->
<!--                             </li> -->
<!--                         </ul> -->
<!--                     </aside> -->
                    
<!--                     <aside id="recent-comments-2" class="widget widget_recent_comments"> -->
<!--                         <h5 class="widget-title">Recent Comments</h5> -->
<!--                         <ul id="recentcomments"> -->
<!--                             <li class="recentcomments"><span class="comment-author-link">admin</span> on <a -->
<!--                                     href="https://ld-wp.template-help.com/wordpress_52382/2016/05/17/image-format/#comment-9">Image -->
<!--                                     Format</a></li> -->
<!--                             <li class="recentcomments"><span class="comment-author-link">admin</span> on <a -->
<!--                                     href="https://ld-wp.template-help.com/wordpress_52382/2016/05/17/bringing-a-new-cfo-at-the-time-of-crisis/#comment-8">Bringing -->
<!--                                     a new CFO at the time of crisis?</a></li> -->

<!--                         </ul> -->
<!--                     </aside> -->

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
									   <table id="userPosts" class="table table-sm"></table>



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
					<form action="/group5/Posting" class ="newPost" enctype='multipart/form-data'
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
											標題:<input type="text" name="title" class="form-control newtitle"
												id="floatingInput" placeholder="請輸入標題"
												oninvalid="setCustomValidity('請輸入標題')"
												oninput="setCustomValidity('')"> <label style="color:#FF0000"
												for="floatingInput"></label>
										</div></th>
								</tr>

								<tr>

									<th><div class="form-floating">
											內容:
											<textarea name="content" class="form-control newcontent" cols="60"
												rows="10" placeholder="請輸入內容" id="floatingTextarea"></textarea>
											<label style="color:#FF0000" for="floatingTextarea"></label>
										</div></th>
								</tr>
								<tr>
									<th>請選擇圖片(最多五張):<input id="file1" type="file"
										class="btn btn-outline-primary" name="file"
										multiple="multiple" accept="image/*" onchange="checkip()">
										<div id="imgs"></div></th>
								</tr>
							</thead>
						</table>
					
					
                        <button type='submit'  style='border:none' class='btn-solid-reg as-button'>送出</button>					
					    <button type='submit'  style='border:none' class='btn btn-success as-button onekeyinput'>一健輸入</button>
					
<!-- 						<input type="button" class="btn-solid-reg mfp-close newposting" value="送出"> -->
						<a class="btn-outline-reg mfp-close as-button" href="#screenshots">取消</a>
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
	
	 <script>
	                                   $(".newPost").submit(function(event){
                                        event.preventDefault();
                                        
                                        var newcontent = $(".newcontent").val();
                                        var newtitle = $(".newtitle").val();
                                        console.log(newcontent);
                                        if(!newtitle){
                                        	$(".newtitle").next().text("請輸入標題");
                                        }
                                        
                                        if(!newcontent){
                                            $(".newcontent").next().text("請輸入內容");
                                        }
                                        
                                        if(newtitle && newcontent) {
                                        
                                         Swal.fire({
                                             title: '確認是否送管理員審核?',
                                             text: '備註:審核後即可發布上貼文首頁',
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
				<form action="/group5/UserPost" class="modifysend" enctype='multipart/form-data'
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
                                         重新選擇圖片(最多五張):<input id="file1" type="file"
                                        class="btn btn-outline-primary" name="changeimages"
                                        multiple="multiple" accept="image/*" onchange="checkip()">
                                        
                                        <div id="imgs"></div>
                                        
                                        </th>
                                </tr>
                            </thead>
                        </table>
                        
                        <button type='submit'  style='border:none' class='btn-solid-reg as-button'>修改送出</button>
                        
                        <a class="btn-outline-reg mfp-close as-button" href="#screenshots">取消</a>
                        
                        </form>
            
            
					
					
				</div>
				<!-- end of col -->
			</div>
			<!-- end of row -->
		</div>
		<!-- end of container -->
	</div>
	<!-- end of lightbox-basic -->
	<!-- end of details lightbox 2 -->


	



    <script src="/group5/js/jquery.min.js"></script>
    <script src="js/images.js"></script>
                        <script>
                        
                        
                        $(".onekeyinput").on('click', function(event){
                            event.preventDefault();
                           
                            $(".newcontent").val("一堆問題");
                            
                            $(".newtitle").val("畢業了");
                           
                        });
                        
                        
                        

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