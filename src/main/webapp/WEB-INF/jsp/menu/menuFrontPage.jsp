<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>INSERT AND ADD PAGE</title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
    <link href="/group5/css/dataTables.bootstrap4.min.css" rel="stylesheet">
	<script src="/group5/js/jquery.min.js"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	<script>

	 $(function(){
			$('.edit').on("click",function(){
				let name=$(this).parent().siblings(".exerciseNameOfList").text();
				console.log(name);
				edit(name);
			});
			
			$("#submitupdate").on("click",function(){
				
				let part=$(".showpart").text();
				let exerciseName=$(".ExerciseOfList").text();
				let intro=$(".IntroOfList").text();
				let imageurl=$(".ImgOfList").text();
				
				let MenuDatabean ={"id": id ,"part": part, "exerciseName": exerciseName, "intro": intro , "imageurl":imageurl}
				
				$.ajax({
					type: "post",
					url: "/group5/admin/UpdateAction",
					dataType: "json",
					data: JSON.stringify(MenuDatabean),
					contentType: "application/json",
					success: function(data){
						console.log("success");
						location.reload();
					},
					error: function(){
						console.log("error");
					}
					
				});
				
			});
	</script>
	
	
</head>

<body>
<%@ include file="../admin/AdminstyleHead.jsp" %>
<div class="container-fluid">
       <h1>menu part select</h1>
       <div>  
       <form action="insertandadd2" method="get">
        <button type="submit" class="btn btn-primary">腿部</button>  
       </form>
       </div> 
       
       <div>
     <button type="button" class="btn btn-primary edit" 
	data-bs-toggle="modal" data-bs-target="#addrrr" >新增動作</button>
       </div>
       
           
 </div>
 

<script type="text/javascript">

function menutable(){
	console.log($('#table_id'))
	createTable()
	$('#table_id').dataTable();
}



</script>       
    

<div class="table-responsive">
<table id="table_id">
<thead>
<tr>
<th>ID</th>
<th>種類</th>
<!-- <th>圖示</th>  -->
<th>動作名</th>
<th>說明</th>
<th>修改</th>
</tr>
</thead>
<tbody>
<c:forEach var="list" items="${queryAll}">	

<tr>
<td class="IdofList">${list.id}</td>
<td class="PartOfList">${list.part}</td>
<!-- <td class="ImgOfList" ><img width='250' height='200' src="${list.imageurl}"></td> -->
<td class="exerciseNameOfList">${list.exerciseName}</td>
<td class="IntroOfList">${list.intro}</td>

<td><input type="hidden" id="imgpre" value="${list.imageurl}"><button type="button" class="btn btn-outline-secondary preimg" 
	data-bs-toggle="modal" data-bs-target="#btnpreview" >預覽圖片</button></td>
<td><input type="hidden" id="imgpre" value="${list.imageurl}"><button type="button" class="btn btn-outline-secondary editx" 
	data-bs-toggle="modal" data-bs-target="#btnEdit" >修改</button></td>
	
<td>
<form action="ALLdeleteAction3" method="get">
<input type="hidden" name="id" value="${list.id}">
<button type="button" class="btn btn-outline-danger deletegymoflist del">刪除</button>
</form>
</td>



<%-- <td><input type="hidden" id="imgpre" value="${list.imageurl}"></td> --%>
</tr>
</c:forEach>
</tbody>
</table>

<script>
$(function() {
	$(".del").on('click', function(event){
		event.preventDefault();
		var id = $(this).prev().val();
		console.log("抓取刪除:" + id);
		Swal.fire({
			  title:'確定要刪除'+id+'?',
			  text: '如刪除後不可復原...',
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
					      id+'已刪除',
					      'success'
					    ).then((result) => {
			   				 $(this).parent().submit();
					    });
			  }
			});
	});
})

$(".preimg").on("click",function(){
	
	var img = $(this).prev().val();
	var Ename = $(this).prev().prev().val();
	console.log(Ename);

	$(".ImgOfList").attr("src",img);
	$(".Imgtext").attr("text",Ename);
	console.log(img);
	
	});

$('.editx').on("click",function(){
	console.log("開始修改");
	let id=$(this).parent().siblings(".IdofList").text();
	let name=$(this).parent().siblings(".exerciseNameOfList").text();
	
	let part=$(this).parent().siblings(".PartOfList").text();
	let intro=$(this).parent().siblings(".IntroOfList").text();
	
	var img = $(this).prev().val();
	
	$(".imginput").attr("src",img);
	
	console.log("ID:"+ id);
	console.log("part"+part);
	console.log("Name:"+name);
	console.log("Intro:"+intro);
	console.log("Img:"+img)
	
	$("#updateTitle").text(name);
	$("#id").val(id);
	
	edit(name);
});


var id=""
	function edit(name){
		$.ajax({
			type: "post",
			url: "/group5/admin/allUpdate/"+name,
			dataType: "json",
			success: function(data){
				console.log(data);
				id=data.id;
				console.log(id);
				$("#updateTitle").text(data.exerciseName);
				$("#exerciseName").val(data.exerciseName);
				$(".showNameText").text(data.exerciseName);
				$(".showid").text(data.id)
				$(".showpart").text(data.part);
				$(".showimg").text(data.imgurl);
				$(".showIntro").text(data.intro);
			
			},
			error: function(){
				console.log("error");
			}
		});
	}


</script>

</div>
<%@ include file="../admin/AdminstyleFoot.jsp" %>	
</body>

<form action="UpdateAction2" method="post" enctype='multipart/form-data'>
<input type="hidden" value="">
<div class="modal fade" id="btnEdit" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">修改資訊：<span id="updateTitle"></span></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container-fluid ">
					<div class="input-group mb-3">
						<div id="updateDataTable" >
							<div style="padding-bottom: 18px;">
									<p id="showOldName">更改資訊預覽：</p>
									<p class="showid"></p>
									<p class="showpart"></p>
								    <p class="showexerciseName"></p>
									<p class="showimg"></p>
									<p class="showIntro"></p>
							</div>
							<div class="input-group mb-3">
							<input type="hidden" name="id" value="" id="id" class="form-control">
							</div>
							
							<div class="input-group mb-3">
								<label class="input-group-text" for="exerciseName">新更改動作名稱：</label>
								<input type="text" name="exerciseName" placeholder="輸入新名稱(限制10字)" id="exerciseName" class="form-control">
							</div>
							
							<div class="input-group mb-3">
								<label class="input-group-text" for="part">新更改種類：</label>
								<input type="text" name="part" placeholder="輸入種類(限制10字)" id="part" class="form-control">
							</div>
							
								<div class="input-group mb-3">
								<label class="input-group-text" for="imageurl">更改圖片：</label>
								<input type="text" name="imageurl" placeholder="上傳圖片" id="imageurl" class="form-control">
								 <input type="hidden" id="p_image" name="p_image" value="${list.imgurl}">
								 <img width='300' height='200' class="imginput" src="${list.imgurl}">
								 
								 
								 <div id="text"></div>
								 <div id="imgs"></div>
								 
								 
								 <input id="file1" type="file" class="upl" name="chamgeimages" multiple="multiple" 
                                  accept="image/*" onchange="checkip()"> 
                                  
                                  
                                  
                                  
                                  
                                  <script type="text/javascript">
                                  $("#file1").change(function() {
                                	    $("#imgs").html(""); // 清除預覽
                                	    readURL(this);
                                	    $("#text").append(`<p>原更新照片</p>`);
                                	});

                                	function readURL(input) {
                                	    if (input.files && input.files.length >= 0) {
                                	        if (input.files.length < 6) {
                                	            for (var i = 0; i < input.files.length; i++) {
                                	                var reader = new FileReader();
                                	                reader.onload = function(e) {
                                	                    var img = $("<img width='300' height='200'>").attr('src', e.target.result);
                                	                    $("#imgs").append(img);
                                	                }
                                	                reader.readAsDataURL(input.files[i]);
                                	            }
                                	        } else {
                                	            var noPictures = $("<p>選擇圖片超過五張，請重新選擇</p>");
                                	            $("#imgs").append(noPictures);
                                	        }

                                	    } else {
                                	        var noPictures = $("<p>目前沒有圖片</p>");
                                	        $("#imgs").append(noPictures);
                                	    }
                                	}
                                  
                                  </script>
                                  
                                  
                                  
                                  
                                       
         <div id="imgs"></div>  
							</div>
							
									<div class="input-group mb-3">
								<label class="input-group-text" for="intro">新更改說明：</label>
								<input type="text" name="intro" placeholder="輸入說明" id="intro" class="form-control">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Canser</button>
					<button type="submit" class="btn btn-primary" id="submitUpdate">確認更新</button>
				</div>
			</div>
			</div>
		</div>
	</div>
</form>

	<div class="modal fade" id="btnpreview" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">			
				<div class="modal-header">
				    <h5 class="modal-title" id="staticBackdropLabel">照片預覽：<span id="updateTitle"></span></h5>
				    	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				    	</div>
				  
				       	<div class="modal-body">
				    	<div class="container-fluid ">
					    <div class="input-group mb-3">
					    	<div id="updateDataTable" >	
					    	<p id="showOldName">預覽訊息：</p>
					    	<p class="Imgtext"></p>
					    	<p class="showimg"></p>
					    	<p><img class="ImgOfList" width='250' height='200'><p>
				    
					      </div>  	
			          </div>
		             </div>
			      </div>
			  </div>
		  </div>
    </div>
    
    
    
    
    <form action="UpdateAction2" method="post" enctype='multipart/form-data'>
    <input type="hidden" value="">
<div class="modal fade" id="addrrr" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">新增資訊：<span id="updateTitle"></span></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container-fluid ">
					<div class="input-group mb-3">
						<div id="updateDataTable" >
						
							<div class="input-group mb-3">
							<input type="hidden" name="id" value="" id="id" class="form-control">
							</div>
							
							<div class="input-group mb-3">
								<label class="input-group-text" for="exerciseName">新增動作名稱：</label>
								<input type="text" name="exerciseName" placeholder="輸入新名稱(限制10字)" id="exerciseName" class="form-control">
							</div>
							
							<div class="input-group mb-3">
								<label class="input-group-text" for="part">新增種類：</label>
								<input type="text" name="part" placeholder="輸入種類(限制10字)" id="part" class="form-control">
							</div>
							
								<div class="input-group mb-3">
								<label class="input-group-text" for="imageurl">新增圖片：</label>
								<input type="text" name="imageurl" placeholder="上傳圖片" id="imageurl" class="form-control">
								 <input type="hidden" id="p_image" name="p_image" value="${list.imgurl}">
								 <img width='300' height='200' src="${list.imgurl}">
								 <input id="file1" type="file" class="upl" name="chamgeimages" multiple="multiple" 
                                  accept="image/*" onchange="checkip()">      
         <div id="imgs"></div>  
							</div>
							
									<div class="input-group mb-3">
								<label class="input-group-text" for="intro">新增說明：</label>
								<input type="text" name="intro" placeholder="輸入說明" id="intro" class="form-control">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Canser</button>
					<button type="submit" class="btn btn-primary" id="submitUpdate">確認</button>
				</div>
			</div>
			</div>
		</div>
	</div>
	</form>
	

</html>