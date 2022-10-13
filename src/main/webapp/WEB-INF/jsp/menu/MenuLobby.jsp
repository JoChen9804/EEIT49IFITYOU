<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Menu Lobby</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
    <link href="/group5/css/dataTables.bootstrap4.min.css" rel="stylesheet">
	<script src="/group5/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style type="text/css">

 .bg {
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            right: 0;
            z-index: -999;
        }
        .bg img {
            min-height: 100%;
            width: 100%;
        }
        
       .wrap {
            width: 800px;
            height: 400px;
            background-color: black;
            margin: 0 auto;
            position: relative;
            overflow: hidden;
        }

        .slide-img {
            position: absolute;
            left: 0;
            margin: 0;
            padding: 0;
            list-style: none;
            display: flex;
            /* left: -1600px; */
            width: 4000px;
        }

        .slide-img li {
            width: 800px;
            height: 400px;
        }

        .slide-img li img {
            width: 100%;
            height: 100%;
            /* 控制元素內容 調整比例 */
            object-fit: cover;
        }

        .pages {
            position: absolute;
            list-style: none;
            bottom: 10px;
            display: flex;
            margin: 0;
            padding: 0;
            width: 100%;
            justify-content: center;
        }

        .pages li {
            border: 1px solid white;
            width: 20px;
            height: 20px;
            border-radius: 20%;
            margin: 0 5px
        }

        .slide-arrow {
            position: absolute;
            z-index: 1;
            font-size: 36px;
            width: 30px;
            height: 100%;
            display: flex;
            /* 交錯軸置中 */
            align-items: center;
            /* 主軸置中 */
            justify-content: center;
            color: white;
            /* 透明度 */
            opacity: .6;
            /* 滑鼠型態 */
            cursor: pointer;
        }

        .right {
            right: 0;
        }

        .slide-arrow:hover {
            opacity: 1;
        }
</style>
</head>

<body>  

   <input type="hidden" class="useraccount" value="${loginMember.memberAccount}">


    <script>
        $(function () {

            /*
            1.放第一張圖
            2.放n張圖
            3.放分頁
            4.第一張圖移動
            5.n張圖的移動
            6.分頁的換色
            7.左右的換頁
            */
            let index = 0
            let slideMove = 0
            $('.pages li').eq(0).css('background', 'white')
            $('.pages li').on('mouseenter', function () {
                // console.log('123')
                // $('.slide-img').css('left', '-800px')
                // let index = $(this).index()
                index = $(this).index()
                // console.log(index)
                // let slideMove = 0 - index * 800
                slideMove = 0 - index * 800
                $('.slide-img').css('left', slideMove)
                $(this).css('background', 'white').siblings().css('background', 'transparent')
            })
            let pagesli = $('.pages li').length
            $('#slideNext').on('click', function () {
                index++;
                if (index >= pagesli) {
                    index = 0
                }
                slideMove = 0 - index * 800
                $('.slide-img').css('left', slideMove)
                $('.pages li').eq(index).css('background', 'white').siblings().css('background', 'transparent')
            })

            $('#slidePrev').on('click', function () {
                index--;
                if (index < 0) {
                    index = pagesli - 1
                }
                moveImg()
            })
            function moveImg() {
                slideMove = 0 - index * 800
                $('.slide-img').css('left', slideMove)
                $('.pages li').eq(index).css('background', 'white').siblings().css('background', 'transparent')
            }

            setInterval(autoImg, 2000)
            function autoImg() {
                index++
                if (index >= pagesli) {
                    index = 0
                }
                moveImg()
            }
        })

    </script> 

      
     <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://kit.fontawesome.com/464da6b4aa.js" crossorigin="anonymous"></script>


    
      
    	<input type="hidden" name="userAccount" value="123"> 
    	
    	
    	<script type="text/javascript">
    	//$(function(){
    	//	console.log($(".useraccount").val());
    		
    	//var account = $(".useraccount").val()
    	//	if($(".useraccount").val()){
    	//		console.log("有登入");
    			
    	//	}else{
    			
    	//		console.log("null");
    			
    	//		$('#ddd').append(`<h3 class='center'>請登入</h3>`)
    	//	}
    	//});
    	
 	
    	</script>
    	
    
	<%@ include file="../admin/FrontStageHead.jsp"%>
	

	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
	
	<br><br><br><br><br>
	
	<div class="container">
        <div class="wrap">
            <a class="slide-arrow right" id="slideNext"><i class="fa-solid fa-chevron-right"></i></a>
            <a class="slide-arrow" id="slidePrev"><i class="fa-solid fa-angle-left"></i></a>
            <ul class="slide-img">
                <li><img src="https://media.istockphoto.com/photos/active-senior-asian-woman-exercising-at-home-practicing-fitness-and-picture-id1350206394?k=20&m=1350206394&s=612x612&w=0&h=qVZ5ee8AZC8rmSHcINGp8O606odX0aFzyWMc9IRvxEA=" alt=""></li>
                <li><img src="https://media.istockphoto.com/photos/young-asian-man-athlete-running-on-beach-picture-id1322417673?k=20&m=1322417673&s=612x612&w=0&h=R75ma2IU9H5gvlQYNBRSm1MjvhhIctChR-hGpY1YA2I=" alt=""></li>
                <li><img src="https://media.istockphoto.com/photos/group-of-people-yoga-and-heathy-living-picture-id1324987683?k=20&m=1324987683&s=612x612&w=0&h=OLRI5r5ni5I9xDy1q26q1Eq9gYY5w98YbRLU_x3jO2k=" alt=""></li>
                <li><img src="https://media.istockphoto.com/photos/out-running-on-a-beautiful-day-picture-id514690917?k=20&m=514690917&s=612x612&w=0&h=57a7bQLpb2cWDY6bkR7n23efujFtk0-rXHuUiOnmRK4=" alt=""></li>
                <li><img src="https://media.istockphoto.com/photos/no-gym-required-how-to-get-fit-at-home-picture-id1339710682?k=20&m=1339710682&s=612x612&w=0&h=7ImIEMsbiRyi8nrHNiRIVNO5OM3C1smPfJxfjLdBShU=" alt=""></li>
            </ul>
            <ul class="pages">
                <li></li>
                <li></li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </div>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://kit.fontawesome.com/464da6b4aa.js" crossorigin="anonymous"></script>
	
		<div id="pricing" class="cards-1">
		
	<div id="pricing" class="cards-2" >
		<div class="container">
			<div class="row">
				<h2 class="h2-heading">My OWN MENU</h2>
				<div class="col-lg-12"></div>
			</div>
			<input type="hidden" name="userAccount" value="123"> 
			<button type="button" class="btn btn-primary adddone" 
    		    		data-bs-toggle="modal" data-bs-target="#addone" >加 1 !</button>
		</div>
		</div>
		<!-- end of col -->
		
	</div>
	<!-- end of row -->

	
	
	
		
    <div id="show"></div>
    
    <div id ="ddd"></div>
	<script>$('#table_id').dataTable({});</script>
	<script>			
    $(function(){
    	var page = `${page}`;
    	console.log(page);
    	
    	if(page==="query"){
    		
    	$('#show').html(`
				&emsp;&emsp;&emsp;
				
    			
    			
			    <div class="row"  >
 		      <c:forEach var="ql" items="${queryAll}">
 		       <div class="col-lg-3">
 		            <!-- Blog post-->
 		            <div class="card mb-4">
 		                <a href="#!"><img class="card-img-top" src="https://media.istockphoto.com/vectors/sports-training-with-coach-concept-vector-id1357660172?k=20&m=1357660172&s=612x612&w=0&h=yrJtXbcKl1r-kcaDhjiP5hMYMRHnQBzozfmSyDcvOL8="
 		                        alt="..." /></a>
 		                <div class="card-body">
 		                    <div class="small text-muted">${ql.createDate}</div>
 		                    <h2 class="card-title h4">${ql.menuName}</h2>
 		                  
 		                   
 		                    <form action="QueryOne" method="get" style="display : inline">
 		        			<input type="hidden" name="setid" value="${ql.setid}">
 		        		     <button type="submit" class="btn btn-primary edit" 
 		        		    		data-bs-toggle="modal">查看</button>
 		        		    </form>
 		                    <form action="goWrap1" method="get" style="display : inline">
 		    				<input type="hidden" name="setid" value="${ql.setid}">
 		    				  <button type="submit" class="btn btn-primary edit" 
 		      		    		data-bs-toggle="modal">加</button>
 		    			    </form>
 		                    <form action="msetDel" method="get" style="display : inline">
 		    				<input type="hidden" name="setid" value="${ql.setid}">
 		    				<input type="submit"  class="btn btn-primary del"  value="刪除!">
 		    			    </form>
 		                </div>
 		            </div>
 		            </div>
 		       	</c:forEach>
 		            </div>
			    
    		
    			`);
    			}
    		    });
  
    </script>
   
 


 
	
</body>
<%@ include file="../admin/FrontStageFoot.jsp"%>

<script type="text/javascript">

$(".adddone").on("click", function() {
   
	var Account = $(this).prev().val();
	console.log(Account)
	$("#userAccount").attr("value", Account);




});


$(function() {
	$(".del").on('click', function(event){
		event.preventDefault();
		var setid = $(this).prev().val();
		console.log("抓取刪除:" + setid);
		Swal.fire({
			  title:'確定要刪除嗎 ?',
			  text: '完整菜單將被刪除...',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '確認',
			  cancelButtonText: '取消'
			}).then((result) => {
			  if (result.isConfirmed) {
				  Swal.fire(
					      '刪除成功!',
					      '已完成刪除'
					    ).then((result) => {
			   				 $(this).parent().submit();
					    });
			  }
			});
	});
})

</script>
	
	
	<form action="msetAdd" method="get" enctype='multipart/form-data'>
    <input type="hidden" value="">
<div class="modal fade" id="addone" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">加一張 Menu !<span id="updateTitle"></span></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container-fluid ">
					<div class="input-group mb-3">
						<div id="updateDataTable" >
						
						        <input type="hidden" name="userAccount" id="userAccount" class="form-control">
							<div class="input-group mb-3">
								<label class="input-group-text" for="part">Menu 名稱：</label>
								<input type="text" name="menuName" class="menuName" placeholder="想個名字" id="menuName" class="form-control">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">我想算了</button>
					
					<button type="submit" class="btn btn-primary" id="submitUpdate">我想好了</button>
					
					
				</div>
			</div>
			</div>
		</div>
	</div>
	</form>

</html>