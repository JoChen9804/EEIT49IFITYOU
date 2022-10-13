<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <HEAD>
      <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8"/>
        
<link rel="stylesheet" href="styles/Topic.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
      
<script src="/group5/js/jquery.min.js"></script>
<script src="/group5/js/jquery.dataTables.min.js"></script>     
      

<!--css sweet alert-->
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" />

<!--SweetAlert2.js-->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
      
<!-- Styles -->
<!--引用SweetAlert2.js-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js"
    type="text/javascript"></script>
<link
    href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,700&display=swap&subset=latin-ext" rel="stylesheet">
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/fontawesome-all.css" rel="stylesheet">
<link href="css/swiper.css" rel="stylesheet">
<link href="css/magnific-popup.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">


      
      
<TITLE>貼文管理</TITLE>
<style>
     
fieldset {
    width: 1000px;
    border: 1px solid #acd6ff;
    border-radius: 15px;
    opacity: 0.85;
    margin: auto;
/*     background: #f7f4dd; */
} 

.imgpostdetails {
    width: 300px;
    padding: 5px 5px 5px 5px;
    margin: 10px;
}  
   
.imgfront {
        width: 150px;
        height: 120px;
        padding: 2px 2px 2px 2px;
        margin: 2px;
}

.imgheadstickers {
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
 
    </style>
      
   </HEAD>
    <body>
    
    <%@ include file="../admin/AdminstyleHead.jsp" %>
     
<!--      <a class="btn-solid-reg " href="/group5/admin/AllPostStatus">貼文管理</a> -->
    
    <!-- Features -->
            <!--     class="tabs" -->
    <div id="features" class="tabs">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
<!--                     <div class="above-heading">FEATURES</div> -->

                    <h2 class="h2-heading">後台貼文管理</h2>

                </div> <!-- end of col -->
            </div> <!-- end of row -->
            <div class="row">
                <div class="col-lg-12">

                    <!-- Tabs Links -->
                    <ul class="nav nav-tabs" id="argoTabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="nav-tab-1" data-toggle="tab" href="#tab-1" role="tab"
                                aria-controls="tab-1" aria-selected="true"><i class="fas fa-chart-bar"></i>數據表</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link mainpost" id="nav-tab-2" data-toggle="tab" href="#tab-2" role="tab"
                                aria-controls="tab-2" aria-selected="false"><i class="fas fa-list"></i>貼文</a>
                        </li>
                        
                        <li class="nav-item">
                            <a class="nav-link" id="nav-tab-3" data-toggle="tab" href="#tab-3" role="tab"
                                aria-controls="tab-3" aria-selected="false"><i
                                    class="fas fa-envelope-open-text"></i>檢舉</a>
                        </li>
                           <li class="nav-item">
                            <a class="nav-link" id="nav-tab-3" data-toggle="tab" href="#tab-4" role="tab"
                                aria-controls="tab-4" aria-selected="false"><i
                                    class="fas fa-envelope-open-text"></i>禁言名單</a>
                        </li>
                        
                    </ul>
                    <!-- end of tabs links -->
 
                    <!-- Tabs Content -->
                    <div class="tab-content" id="argoTabsContent">

                        <!-- Tab -->
                        <div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="tab-1">
                            <div class="row">

                                <div class="col-lg-12">
                                    <div class="text-container">
                                        <!-- Begin Page Content -->
                                        <div class="container-fluid">
                                            <!-- Content Row -->
                                            <div class="row">
                                                <!-- Area Chart -->
                                                <div class="col-xl-8 col-lg-7">
                                                    <div class="card shadow mb-4">
                                                        <!-- Card Header - Dropdown -->
                                                        <div
                                                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                                            <h6 class="m-0 font-weight-bold text-primary">貼文數量</h6>
                                                        </div>
                                                        <input type="hidden" class="jan" value="${jan}">
                                                        <input type="hidden" class="feb" value="${feb}">
                                                        <input type="hidden" class="mar" value="${mar}">
                                                        <input type="hidden" class="apr" value="${apr}">
                                                        <input type="hidden" class="may" value="${may}">
                                                        <input type="hidden" class="jun" value="${jun}">
                                                        <input type="hidden" class="jul" value="${jul}">
                                                        <input type="hidden" class="aug" value="${aug}">
                                                        <input type="hidden" class="sep" value="${sep}">
                                                        <input type="hidden" class="oct" value="${oct}">
                                                        <input type="hidden" class="nov" value="${nov}">
                                                        <input type="hidden" class="dec" value="${dec}">
                                                        <!-- Card Body -->
                                                        <div class="card-body">
                                                            <div class="chart-area">
                                                                <canvas id="myAreaChart"></canvas>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- Pie Chart -->
                                                <div class="col-xl-4 col-lg-5">
                                                    <div class="card shadow mb-4">
                                                        <!-- Card Header - Dropdown -->
                                                        <div
                                                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                                            <h6 class="m-0 font-weight-bold text-primary">貼文類型</h6>
                                                        </div>
                                                        <!-- Card Body -->
                                                        <div class="card-body">
                                                            <div class="chart-pie pt-4 pb-2">
                                                                <canvas id="myPieChart"></canvas>
                                                            </div>
                                                            <div class="mt-4 text-center small">
                                                                <span class="mr-2">
                                                                    <i class="fas fa-circle text-primary"></i>飲食
                                                                    ${diet}
                                                                    <input type="hidden" class="diet"
                                                                        value="${diet}">
                                                                </span>
                                                                <span class="mr-2">
                                                                    <i class="fas fa-circle text-success"></i>分享
                                                                    ${share}
                                                                    <input type="hidden" class="share" value="${share}">
                                                                </span>
                                                                <span class="mr-2">
                                                                    <i class="fas fa-circle text-info"></i>問題
                                                                    ${question}
                                                                    <input type="hidden" class="question"
                                                                        value="${question}">
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div> <!-- end of text-container -->
                                </div> <!-- end of col -->
                            </div> <!-- end of row -->
                        </div> <!-- end of tab-pane -->
                        <!-- end of tab -->


                        <!-- Tab -->
                        <div class="tab-pane fade" id="tab-2" role="tabpanel" aria-labelledby="tab-2">
                            <div class="row">

                                <div class="col-lg-12">
                                    <div class="text-container">
                                        <form id="audit" class="btn btn-success btn-icon-split" action="auditPost"
                                            method="post">
                                           <span class="icon text-white-50"><i class="fas fa-check"></i></span>
                                            <span><input id="del" type="hidden" name=auditNo>
                                            <input class="text" type="button" value="批次審核" id="deleteSubmitCheck"
                                                style="border: none; background-color: #1cc88a; color: white" /></span>
                                        </form>

<!--                                            <form action="MainPost.all" method="GET"> -->
<!--                                                <input type="submit" class="btn btn-outline-primary" name="postPermission" value="待審核"> -->
<!--                                            </form> -->
<!--                                            <form action="MainPost.all" method="GET"> -->
                                                <button type="submit" class="btn btn-info btn-icon-split pendingreview" value="所有貼文">
                                                <span class="icon text-white-50"><i class="fas fa-info-circle"></i>
                                                 </span><span class="text">所有貼文</span></button>
<!--                                              </form> -->


                                         <button type="submit" class="btn btn-info btn-icon-split pendingreview" value="待審核">
                                          <span class="icon text-white-50"><i class="fas fa-info-circle"></i>
                                             </span><span class="text">待審核</span></button>
                                             <script>
                                           $(".pendingreview").on('click', function(event){
                                        	   var postPermission = $(this).val();
                                        	  console.log(postPermission);
                                        	  $("#table_ids").empty("");
                                        	   $.ajax({
                                                     type: "GET",
                                                     url: "/group5/admin/PendingReviewAJAX",
                                                     data: {postPermission:postPermission},
                                                     dataType : 'json',
                                                     success: function(data){
                                                    	 console.log(data);
                                                        
                                                             var table = $("#table_ids");
                                                             
                                                             table.append(` <thead>
                                                                     <tr>
                                                                     <th>選取
             <!--                                                         <br>全選<input class="delete" type="checkbox" -->
             <!--                                                                 onclick="checkAll()" id="checkAll"> -->
                                                                             </th>
                                                                     <th>貼文編號</th>
                                                                     <th>圖片</th>
                                                                     <th>類型</th>
                                                                     <th>標題</th>
                                                                     <th>會員<br>發布日期</th>
                                                                     <th>會員<br>最後回覆</th>
                                                                     <th>狀態</th>
                                                                     <th>操作</th>
                                                                 </tr>
                                                                 </thead>`);
                                                             $.each(data, function(i,n){
                                                                 if(n.mainPostNo == 0){
                                                                     $('#table_ids').empty("");
                                                                     $('#table_ids').append(`<h3 class='center'>查無紀錄</h3>`);
                                                                 }else{
                                                                 
                                                                 var title = n.title;
                                                                 
                                                                 var tr ="<tbody><tr class='content'>" +
                                                                 "<td class='align-middle'><input class='delete' type='checkbox'></td>" +
                                                                 "<td class='align-middle'>" + n.mainPostNo +"</td>" +
                                                                 "<td class='align-middle'><img class='imgfront' src='" + n.p_image + "'></td>" +
                                                                 "<td class='align-middle'>" + [n.postTypeName] + "</td>" +
                                                                 "<td class='align-middle'>" + n.title + "</td>" +
                                                                 "<td class='align-middle'>" + n.account +"<br />" +n.addtime +"</td>" +
                                                                 "<td class='align-middle'>" + n.replyAccount +"<br />" + n.lastReplyTime + "</td>" +
                                                                 "<td class='align-middle'>" + n.postPermission+ "</td>" +
                                                                 "<td class='align-middle'><input type='hidden' name='deletepost' class='postid' value='"+ n.mainPostNo + "'>" +
                                                                 
                                                                 "<form action='MainPost.watch' class='btn btn-info btn-icon-split' method='POST'>"  +
                                                                 
                                                                 "<span class='icon text-white-50'><i class='fas fa-info-circle'></i></span>"  +
                                                                         "<input type='hidden' name='mainPostNo' value='"+ n.mainPostNo +"'>"  +
                                                                         "<button type='submit' class='btn btn-info btn-icon-split' value='觀看'>"  +
                                                                             "<span class='text'>觀看</span></button></form>"  +

                                  
                                                                 "<input type='hidden' name='xreason' value=''>"  +
                                                                 "<input type='hidden' name='mainPostNo' value='"+ n.mainPostNo +"'>"  +
                                                                 "<button type='submit' class='btn btn-warning btn-icon-split turnDown' value='駁回'>"  +
                                                                 "<span class='icon text-white-50'><i class='fas fa-exclamation-triangle'></i></span>"  +
                                                                 "<span class='text'>駁回</span></button>" 
                                                                 
                                                                            ;
                                                                 table.append(tr);
                                                                 
                                                                 }
                                                             });
                                                     
                                                             
                                                     
                                                     
                                                     }
                                                 
                                        	   
                                        	   
                                        	   });
                                        	   
                                        	   
                                               
                                           });
                                           </script>
                                  

                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="table_ids"
                                                class="compact hover stripe">
                                                <thead>
                                                    <tr>
                                                        <th>選取
<!--                                                         <br>全選<input class="delete" type="checkbox" -->
<!--                                                                 onclick="checkAll()" id="checkAll"> -->
                                                                </th>
                                                        <th>貼文編號</th>
                                                        <th>圖片</th>
                                                        <th>類型</th>
                                                        <th>標題</th>
                                                        <th>會員<br>發布日期</th>
                                                        <th>會員<br>最後回覆</th>
                                                        <th>狀態</th>
                                                        <th>操作</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="allmpbs" items="${query}">

                                                        <tr class="content">
                                                            <td class="align-middle"><input class="delete"
                                                                    type="checkbox"></td>

                                                            <td class="align-middle">${allmpbs.mainPostNo}</td>
                                                            <td class="align-middle"><img class="imgfront"
                                                                    src="${allmpbs.p_image}"></td>
                                                            <td class="align-middle">${allmpbs.postTypeName}</td>

                                                            <td class="align-middle">${allmpbs.title}</td>
                                                            <td class="align-middle">
                                                                ${allmpbs.account}<br />${allmpbs.addtime}</td>
                                                            <td class="align-middle">
                                                                ${allmpbs.replyAccount}<br />${allmpbs.lastReplyTime}
                                                            </td>
                                                            <td class="align-middle">${allmpbs.postPermission}</td>
                                                            <td class="align-middle">
                                                                <form action="MainPost.watch" class="btn btn-info btn-icon-split" method="POST">
                                                               
                                                                <span class="icon text-white-50"><i class="fas fa-info-circle"></i></span>
                                                                        <input type="hidden" name="mainPostNo" value="${allmpbs.mainPostNo}">
                                                                        <button type="submit" class="btn btn-info btn-icon-split" value="觀看">
                                                                            <span class="text">觀看</span>
                                                                        </button>
                                                                </form>

                                 
                                                                <input type="hidden" name="xreason" value="">
                                                                <input type="hidden" name="mainPostNo" value="${allmpbs.mainPostNo}">
                                                                <button type="submit" class="btn btn-warning btn-icon-split turnDown" value="駁回">
                                                                <span class="icon text-white-50"><i class="fas fa-exclamation-triangle"></i></span>
                                                                <span class="text">駁回</span></button>
                                                            </td>

                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                  
                                        
                                        </div>
                                       
                                        <script>
                                            $('#table_ids').dataTable({})
                                            </script>
                             

                                    </div> <!-- end of text-container -->
                                </div> <!-- end of col -->
                            </div> <!-- end of row -->
                        </div> <!-- end of tab-pane -->
                        <!-- end of tab -->
                                        


                        <!-- Tab -->
                        <div class="tab-pane fade" id="tab-3" role="tabpanel" aria-labelledby="tab-3">
                            <div class="row">
                                
                                <div class="col-lg-12">
                                    <div class="text-container">
                                             <table class="table table-bordered" id="table_id"
                                                class="compact hover stripe">
                                                <thead>
                                                    <tr>
                                                        <th>選取<br>全選<input class="delete1" type="checkbox"
                                                                onclick="checkAlls()"></th>
                                                        <th>回覆編號</th>
                                                        <th>內容</th>
                                                        <th>會員<br>回覆時間</th>
                                                        <th>檢舉原因</th>
                                                        <th>操作</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="report" items="${reportBean}">

                                                        <tr class="content">
                                                            <td class="align-middle"><input class="delete1" name="delete1" type="checkbox"></td>
                                                            <td class="align-middle">${report.replyNo}</td>
                                                            
                                                            <td class="align-middle card-text">${report.replyContent}</td>
                                                            <td class="align-middle replyAccount">
                                                                ${report.replyAccount}<br />${report.replyTime}</td>
                                                            <td class="align-middle">${report.replyPermission}</td>
                                                            <td class="align-middle">
                                                                
                                                                
                                                                <a class="btn btn-info btn-icon-split popup-with-move-anim viewreplies" href="#details-lightbox-3">
                                                                <span class="icon text-white-50"><i class="fas fa-info-circle"></i></span>
                                                                <span class="text">觀看</span></a>
                                                                
                                                                <input type="hidden" class="replyPhoto" value="${report.replyPhoto}">
                                                                <input type="hidden" class="replyContent" value="${report.replyContent}">
                                                                <input type="hidden" class="replyTime" value="${report.replyTime}">
                                                                <input type="hidden" class="replyaccount" value="${report.replyAccount}">
                                                                <input type="hidden" class="reportimage" value="${report.r_image}">
                                                                <input type="hidden" class="reportreplyNo" value="${report.replyNo}">
                                                                
                                                                <button type="submit" class="btn btn-warning btn-icon-split deletereply" value="刪除">
                                                                <span class="icon text-white-50"><i class="fas fa-exclamation-triangle"></i></span>
                                                                <span class="text">刪除</span></button>
                                                                
                                                                <button type="submit" class="btn btn-secondary btn-icon-split revoke" value="撤銷">
                                                                <span class="icon text-white-50"><i class="fas fa-arrow-right"></i></span>
                                                                <span class="text">撤銷</span></button>
                                                            </td>

                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                                    <h3 class='center'>${nowhistleblower}</h3>
                                    </div> <!-- end of text-container -->
                                </div> <!-- end of col -->
                            </div> <!-- end of row -->
                        </div> <!-- end of tab-pane -->
                        <!-- end of tab -->
                        
                        
                                                <!-- Tab -->
                        <div class="tab-pane fade" id="tab-4" role="tabpanel" aria-labelledby="tab-4">
                            <div class="row">
                                
                                <div class="col-lg-12">
                                    <div class="text-container">
                                    
                                             <table class="table table-bordered bannedlist" id="table_id" 
                                                class="compact hover stripe">
                                                
                                                <thead>
                                                    <tr>
                                                        <th>會員編號</th>
                                                        <th>會員</th>
                                                        <th>照片</th>
                                                        <th>操作</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="banned" items="${bannedList}">

                                                        <tr class="content">
                                                            <td class="align-middle">${banned.id}</td>
                                                            <td class="align-middle">${banned.memberAccount}</td>
                                                            <td class="align-middle"><img class="imgfront"
                                                                    src="${banned.memberPhoto}"></td>
                                                            <td class="align-middle">

                                                                <input type="hidden" class="replyPhoto" value="${banned.memberAccount}">
                                                                <button type="submit" class="btn btn-secondary btn-icon-split replyspeech" value="回復發言">
                                                                <span class="icon text-white-50"><i class="fas fa-arrow-right"></i></span>
                                                                <span class="text">回復發言</span></button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                                    <h3 class='center'>${nolist}</h3>
                                    </div> <!-- end of text-container -->
                                </div> <!-- end of col -->
                            </div> <!-- end of row -->
                        </div> <!-- end of tab-pane -->
                        <!-- end of tab -->
                        
                        
    <!-- Details Lightbox 3 -->
    <div id="details-lightbox-3" class="lightbox-basic zoom-anim-dialog mfp-hide">
        <div class="container">
            <div class="row">
                <button title="Close (Esc)" type="button" class="mfp-close x-button">×</button>
            
                <div class="col-lg-12">
                    
              <table class="table-bordered table1">
                <tr>
                    <td class="column3"><div class="Lightbox3account"></div>
                        <br>
                        <img class="imgheadstickers Lightbox3postPhoto">
                    </td>
                    <td>
                        <div class="content">
                            <P class="Lightbox3addtime"></P>
                            <p class="content Lightbox3content"></p>
                             
                             <div class="imgs"></div>
                             
                        </div>
                    </td>
                </tr>
               </table>
                        <div class="center">
                     <a class="btn-outline-reg mfp-close as-button"  href="#screenshots">關閉</a>
                     </div>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of lightbox-basic -->
    <!-- end of details lightbox 3 -->
    <!-- end of details lightboxes -->         
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                        
                                           <script>
                                           $(".replyspeech").on('click', function(event){
                                               console.log("324432");
                                               var replyaccount = $(this).prev().val();
                                               console.log(replyaccount);
                                              
                                               Swal.fire({
                                                   title: '確定回復'+replyaccount+'發言?',
                                                   text: "",
                                                   icon: 'warning',
                                                   showCancelButton: true,
                                                   confirmButtonColor: '#3085d6',
                                                   cancelButtonColor: '#d33',
                                                   confirmButtonText: '刪除',
                                                   cancelButtonText: '取消',
                                                   
                                                 }).then((result) => {
                                                     if (result.isConfirmed) {
                                                    	 replySspeech(replyaccount)
                                                         
                                                         $(this).siblings().parent().parent().remove();
                                                         
                                                         Swal.fire(
                                                                 '已回復'+replyaccount+'發言'
                                                         ).then((result)=>{
                                                             if(result.isConfirmed){
                                                                 //location.reload();
                                                             }
                                                         });
                                               
                                                       }
                                                     });
                                               
                                           });
                    
                    
                    
                    function replySspeech(replyaccount){
                        var mute = 0;
                        $.ajax({
                            type: "Post",
                            url: "/group5/admin/UserPostMute/"+ replyaccount + "/" + mute,
                            success: function(){
                                var text ='已對'+ replyaccount + '回復發言!';
                                Swal.fire(
                                        text
                                ).then((result)=>{
                                    if(result.isConfirmed){
                                    }
                                });
                                
                            }
                        });
                    };
                    
                    
                    </script>

                    </div> <!-- end of tab content -->
                    <!-- end of tabs content -->

                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of tabs -->
    <!-- end of features -->




        <script>
        
        $(function(){
    		console.log('測試測試');
    		$('#forColor').attr('style', 'background-color: white');
    	}); 
        
        var members = new Set([]);

        
        
        $(document).on('click','.delete', function() {
            let checked = $(this).prop('checked')
            
            console.log(members);
            
            if (checked) {
                $(this).closest('tr').addClass('active')
                var deleteObject = $(this).parent().next().text()
                members.add(deleteObject);
            } else {
                var deleteObject = $(this).parent().next().text()
                members.delete(deleteObject);
                $(this).closest('tr').removeClass('active')
            }
        });
        

        


        $("#deleteSubmitCheck").on('click', function(event) {
            console.log(Array.from(members).join(',').length);
            console.log(members);
            if (Array.from(members).join(',').length != 0) {
                $('#del').val(Array.from(members).join(','));
                Swal.fire({
                    title: '確定審核選取資料?',
                    text: '',
                    icon: 'warning',
                    cancelButtonText: '取消',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '發布'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire({
                            title: '發布成功',
                            icon: 'success'
                        }).then((result) => {
                            $('#audit').submit();
                        });
                    }
                });
            } else {
                Swal.fire({
                    title: '請選取審核貼文',
                    icon: 'warning',
                    cancelButtonColor: '#d33'
                })

            }
        });
        
        function checkAll(){
            var hobby  = document.getElementsByClassName("delete");
            var checkAll = document.getElementById("checkAll");
           // console.log(checkAll);
         console.log(hobby);
            //var members = new Set([]);
            for(var i  =0;i<hobby.length;i++){
                var h = hobby[i];
                
                console.log(h);
                h.checked = checkAll.checked;
            }
        }
        
        
//         $("#checkAll").on('click',function(){
//             let checkedAll = $(this).prop('checked');
//             var hobbys   = $(".delete").parent().next().text();
//             console.log();
//         });
        
        
        
        
        
        
        

        
        $(document).on('click',".turnDown", function(event) {
            (async () => {
                const { value: text } = await Swal.fire({
                  title:'駁回原因',
                  input: 'textarea',
                  inputLabel: '',
                  inputPlaceholder: '請輸入內容',
                  inputAttributes: {
                    'aria-label': 'Type your message here'
                  },
                  showCancelButton: true
                })
                if (text) {
                    var mainPostNo = $(this).prev().val();
                    console.log(mainPostNo);
                    let xreason=text;  
                    console.log(xreason);
                    $.ajax({
                           type: "POST",
                           url: "/group5/admin/turnDownPost",
                           data : {mainPostNo:mainPostNo,xreason:xreason},
                           dataType : 'json',
                           success: function(){
                               console.log("ok");
                           }
                       })
                    Swal.fire("已駁回").then((result)=>{
                        if(result.isConfirmed){
                            location.reload();
           
                        }
                    });
                }
                })()
        });
        
        
        
        
                    
        $(function () {
            var len = 20; // 超過20個字以"..."取代
            $(".card-text").each(function (i) {
                if ($(this).text().length > len) {
                    $(this).attr("title", $(this).text());
                    var text = $(this).text().substring(0, len - 1) + "...";
                    $(this).text(text);
                }
            });
        });
             
        $(".viewreplies").on('click', function(event){
            //let replyContent = $(this).parent().siblings(".replyContent").text();
            let replyPhoto = $(this).siblings(".replyPhoto").val();
            let replyContent = $(this).siblings(".replyContent").val();
            let replyaccount = $(this).siblings(".replyaccount").val();
            let replyTime = $(this).siblings(".replyTime").val();
            let replyimage = $(this).siblings(".reportimage").val().split(",");
            $(".Lightbox3postPhoto").attr("src",replyPhoto);
            $(".Lightbox3content").text(replyContent);
            $(".Lightbox3account").text(replyaccount);
            $(".Lightbox3addtime").text("回覆時間:"+replyTime);
            
            $(".imgs").html("");
            
            for(i=0 ; i < replyimage.length -1; i++){
            	var img = $("<img class='imgpostdetails'>").attr('src', replyimage[i]);
                $(".imgs").append(img);
            }
            
            console.log();
        });
        
        $(".deletereply").on('click', function (event) {
            let replyNo = $(this).siblings(".reportreplyNo").val();
            let replyaccount = $(this).siblings(".replyaccount").val();
            console.log(replyaccount);
            //userMute(replyaccount);
            
            Swal.fire({
                title: '確定刪除回覆?',
                text: '',
                icon: 'warning',
                cancelButtonText: '取消',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '刪除'
            }).then((result) => {
                if (result.isConfirmed) {
                	//呼叫刪除
                	deletereply(replyNo);
                	$(this).siblings().parent().parent().remove();
                     Swal.fire({
		                title: '刪除成功，需要對會員'+replyaccount+'禁止發言嗎?',
		                text: '',
		                icon: 'warning',
		                cancelButtonText: '取消',
		                showCancelButton: true,
		                confirmButtonColor: '#3085d6',
		                cancelButtonColor: '#d33',
		                confirmButtonText: '禁言'
		            }).then((result) => {
		            	if (result.isConfirmed) {
		            		//呼叫禁言
		            		userMute(replyaccount);
		            		
		            		
		            		
		            	}
                     });
                }
            });
            
        });
        
        //刪除回覆
       function deletereply(replyNo){
           $.ajax({
               type: "Delete",
               url: "/group5/admin/ReplyPost",
               data: { replyNo: replyNo },
               dataType: 'json',
               success: function () {
                   console.log("ok");
               }
           })
       };
        
        //禁止發言
        function userMute(replyaccount){
        	var mute = 1;
            $.ajax({
                type: "Post",
                url: "/group5/admin/UserPostMute/"+ replyaccount + "/" + mute,
                success: function(){
                    var text ='已對'+ replyaccount + '禁止發言!';
                	Swal.fire(
                			text
                    ).then((result)=>{
                        if(result.isConfirmed){
                        }
                    });
                    
                }
            });
        };
        
        
        $(".revoke").on('click', function (event) {
            let replyNo = $(this).siblings(".reportreplyNo").val();
            console.log(replyNo);
            Swal.fire({
                title: '確定撤銷檢舉?',
                text: '',
                icon: 'warning',
                cancelButtonText: '取消',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '撤銷'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: "Put",
                        url: "/group5/admin/RevokeReport",
                        data: { replyNo: replyNo },
                        dataType: 'json',
                        success: function () {
                            console.log("ok");
                        }
                    })
                    Swal.fire({
                        title: '撤銷成功',
                        icon: 'success'
                    }).then((result) => {
                    	$(this).siblings().parent().parent().remove();
                        //location.reload();
                    });
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
        
//      $('.delete').on('click', function() {
//      let checked = $(this).prop('checked')
     
//      console.log(members);
//     // let checkAll = $("#checkAll").prop('checked',"false");
//      //let checkAlls = $("#checkAll").parent().next().text()
//      //console.log(checkAlls);
     
//      if (checked) {
//          $(this).closest('tr').addClass('active')
//          var deleteObject = $(this).parent().next().text()
//          members.add(deleteObject);
//      } else {
//          var deleteObject = $(this).parent().next().text()
//          members.delete(deleteObject);
//          $(this).closest('tr').removeClass('active')
//      }
//  });

//         $(".turnDown").on('click', function(event) {
//             (async () => {
//                 const { value: text } = await Swal.fire({
//                   title:'駁回原因',
//                   input: 'textarea',
//                   inputLabel: '',
//                   inputPlaceholder: '請輸入內容',
//                   inputAttributes: {
//                     'aria-label': 'Type your message here'
//                   },
//                   showCancelButton: true
//                 })
//                 if (text) {
//                     var mainPostNo = $(this).prev().val();
//                     console.log(mainPostNo);
//                     let xreason=text;  
//                     console.log(xreason);
//                     $.ajax({
//                            type: "POST",
//                            url: "/group5/admin/turnDownPost",
//                            data : {mainPostNo:mainPostNo,xreason:xreason},
//                            dataType : 'json',
//                            success: function(){
//                                console.log("ok");
//                            }
//                        })
//                     Swal.fire("已駁回").then((result)=>{
//                         if(result.isConfirmed){
//                             location.reload();
           
//                         }
//                     });
//                 }
//                 })()
//         });
        
        </script>
        
        
<%@ include file="../admin/AdminstyleFoot.jsp"%>
       <!-- JQuery  -->
    <script src="/group5/js/jquery.min.js"></script>
    <!-- Custom scripts for all pages-->
    <!-- DataTable 連結 -->
   
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>
  <!-- Page level plugins -->
  <script src="vendor/chart.js/Chart.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="postfolder/demo/chart-area-demo.js"></script>
  <script src="postfolder/demo/chart-pie-demo.js"></script>
<!--   <script src="postfolder/demo/chart-bar-demo.js"></script> -->

    <!-- Scripts -->
    <script src="/group5/js/popper.min.js"></script> <!-- Popper tooltip library for Bootstrap -->
    <script src="/group5/js/bootstrap.min.js"></script> <!-- Bootstrap framework -->
    <script src="/group5/js/jquery.easing.min.js"></script> <!-- jQuery Easing for smooth scrolling between anchors -->
    <script src="/group5/js/swiper.min.js"></script> <!-- Swiper for image and text sliders -->
    <script src="/group5/js/jquery.magnific-popup.js"></script> <!-- Magnific Popup for lightboxes -->
    <script src="/group5/js/validator.min.js"></script> <!-- Validator.js - Bootstrap plugin that validates forms -->
    <script src="/group5/js/scripts.js"></script> <!-- Custom scripts -->





        
        
    </body>
</html>