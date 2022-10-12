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
	
	<div id="pricing" class="cards-2">
		<div class="container">
			<div class="row">
				<h2 class="h2-heading">My OWN MENU</h2>
				<div class="col-lg-12"></div>
			</div>
			
			
			
			
			
			
			<input type="hidden" name="userAccount" value="123"> 
			<button type="button" class="btn btn-primary adddone" 
    		    		data-bs-toggle="modal" data-bs-target="#addone" >加 1 !</button>
			
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
				
    			<table id="table_id">
				<thead>
				<tr>
				<th>名稱</th>
				<th>日期</th>
				<th>查看內容</th>
				<th>加新動作</th>
				<th>刪除菜單</th>
				</tr>
			</thead>
			
    			<c:forEach var="ql" items="${queryAll}">
    			<tr>
    			<td>${ql.menuName}</td>
    			<td>${ql.createDate}</td>
    			
    		
    					
    			<td>
    			<form action="QueryOne" method="get">
    			<input type="hidden" name="setid" value="${ql.setid}">
    		     <button type="submit" class="btn btn-primary edit" 
    		    		data-bs-toggle="modal">查看內容!</button>
    		    </form>
			    </td>
			    <td>
				<form action="goWrap1" method="get">
				<input type="hidden" name="setid" value="${ql.setid}">
				  <button type="submit" class="btn btn-primary edit" 
  		    		data-bs-toggle="modal">加新動作!</button>
			    </form>
			    </td>
			    <td>
			    <form action="msetDel" method="get">
				<input type="hidden" name="setid" value="${ql.setid}">
				<input type="submit"  class="btn btn-primary del"  value="刪除菜單!">
			    </form>
			    </td>
			    </tr>
    			</c:forEach>
    			</table>
    			`);
    			}
    		    });
  
    </script>

	<%@ include file="../admin/FrontStageFoot.jsp"%>
</body>

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