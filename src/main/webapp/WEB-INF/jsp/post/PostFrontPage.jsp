<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <HEAD>
      <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8"/>
        
      <link rel="stylesheet" href="styles/Topic.css">
      
      <script src="/group5/js/jquery.min.js"></script>
      <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>
      <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
      

<!--引用css sweet alert-->
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" />
<!--引用SweetAlert2.js-->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
      
      
      <TITLE>貼文首頁</TITLE>
    <style>
     
fieldset {
    width: 1000px;
    border: 1px solid #acd6ff;
    border-radius: 15px;
    opacity: 0.85;
    margin: auto;
    background: #f7f4dd;
}   
   
    .imgfront {
        width: 150px;
        height: 120px;
        padding: 2px 2px 2px 2px;
        margin: 2px;
    }   
   
   
    </style>
      
   </HEAD>
    <body>
    
    <%@ include file="../admin/AdminstyleHead.jsp" %>
     
     <a class="btn-solid-reg " href="/group5/admin/AllPostStatus">貼文管理</a>
       
     
     <!-- JQuery  -->
    <script src="/group5/js/jquery.min.js"></script>
    <!-- Custom scripts for all pages-->
    <!-- DataTable 連結 -->
    <script type="text/javascript" charset="utf8"
        src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>
     
     
     
   <form id="audit" class="btn btn-danger btn-icon-split"
     action="auditPost" method="post">
     
      <input id="del" type="hidden" name=auditNo> 
     <input class="text" type="button" value="批次審核" id="deleteSubmitCheck"
         style="border: none; background-color: #e74a3b; color: white" />
         
 </form>
 
	<form action="MainPost.all" method="GET">
	    <input type="submit" class="btn btn-outline-primary" name="postPermission" value="待審核">
	</form>
 
 
  
     <div class="table-responsive">
     <table class="table table-bordered" id="table_id" class="compact hover stripe">
         <thead>
             <tr>
                <th>選取<br>全選<input class="delete" type="checkbox" onclick="checkAll()"></th>
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
                     <td class="align-middle"><input class="delete" type="checkbox"></td>
    
                     <td class="align-middle">${allmpbs.mainPostNo}</td>
                     <td class="align-middle"><img class="imgfront" src="${allmpbs.p_image}"></td>
                     <td class="align-middle">${allmpbs.postTypeName}</td>

                     <td class="align-middle">${allmpbs.title}</td>
                     <td class="align-middle">${allmpbs.account}<br />${allmpbs.addtime}</td>
                     <td class="align-middle">${allmpbs.replyAccount}<br />${allmpbs.lastReplyTime}</td>
                     <td class="align-middle">${allmpbs.postPermission}</td>
                     <td class="align-middle">
                        <form action="MainPost.watch" method="POST">
                        <input type="hidden" name="mainPostNo" value="${allmpbs.mainPostNo}"> 
                        <input type="submit" class="btn btn-outline-success" value="觀看">
                        </form>
                        
<!--                         <form action="turnDownPost" method="POST"> -->
                        <input type="hidden" name="xreason"  value="">
                        <input type="hidden" name="mainPostNo" value="${allmpbs.mainPostNo}">
                        <input type="submit" class="btn btn-outline-primary turnDown" value="駁回">
<!--                         </form> -->
                    
                    </td>
                     
                 </tr>
             </c:forEach>
         </tbody>
     </table>
 </div>
 <script>
     $('#table_id').dataTable({});
 </script>
     
     
       
       
       
<!--    <fieldset> -->
<!--     <h1 ALIGN=CENTER>貼文首頁</h1> -->
    
<!--      <table class="table table-bordered" class="compact hover stripe"> -->
<!--           <form name="querypostbut" action="MainPost.all" method="GET"> -->
<!--            <tr> -->
<!--             <th>   -->
<!--             <label for="dataa" class="t1">主貼文編號:</label> -->
<!--             <input type="TEXT"  id=dataa name="mainPostNo"  -->
<!--             required oninvalid="setCustomValidity('請輸入貼文編號id')" oninput="setCustomValidity('')"><BR></th> -->
<!--             <th> -->
<!--             <input type="submit" class="btn btn-outline-primary" name="inquireId" value="查詢"> -->
<!--            </th> -->
<!--         </tr> -->
<!--              </form>  -->
         
<!--                <form name="likequerypostbut" action="MainPost.all" method="GET"> -->
<!--            <tr> -->
<!--              <th>   -->
<!--             <label for="dataa1" class="t1">搜尋:</label> -->
<!--             <input type="TEXT" id=dataa1 name="title"  -->
<!--             required oninvalid="setCustomValidity('請輸入標題名稱')" oninput="setCustomValidity('')"/><BR></th> -->
<!--             <th> -->
<!--             <input type="submit" class="btn btn-outline-primary"  name="likequire" value="查詢標題" > -->
<!--            </th> -->
<!--             </tr> -->
<!--             </form> -->
<!--     </table> -->
  
<!--    <form action="MainPost.return" method="GET"> -->
<!--         <input type="submit" class="btn btn-outline-primary"  name="returns" value="所有貼文" > -->
<!--    </form> -->
<!--    <div class="card-body"> -->
<!--    <div class="table-responsive"> -->
<!--     <table class="table table-bordered" id="table_id" class="compact hover stripe"> -->
<!--     <thead> -->
<!--         <tr> -->
<!--         <th>圖片</th> -->
<!--         <th>貼文id</th> -->
<!--         <th>類型</th> -->
<!--         <th>標題</th> -->
<!--         <th>會員帳號</th> -->
<!--         <th>發布日期</th> -->
<!--         <th colspan="3">編輯</th> -->
<!--         </tr> -->
<!--     </thead> -->
<%--     <c:forEach var="allmpbs" items="${query}"> --%>
<!--         <tbody> -->
<!--          <tr> -->
<%--             <td><img class="img" src="${allmpbs.p_image}"></td> --%>
<%--             <td>${allmpbs.mainPostNo}</td> --%>
<%--             <td>${allmpbs.postTypeName}</td> --%>
<%--             <td>${allmpbs.title}</td> --%>
<!--             <td><a href="/MainPost.watch2/${allmpbs.mainPostNo}">${allmpbs.title}</a></td>             -->
<%--             <td>${allmpbs.account}</td> --%>
<%--             <td>${allmpbs.addtime}</td> --%>
<!--             <td> -->
<!--                 <form name="sendForm" action="MainPost.watch" method="POST"> -->
<%--                     <input type="hidden" name="watch" value="${allmpbs.mainPostNo}"> --%>
<!--                      <button type="submit" name="watch1" value="${allmpbs.mainPostNo}">1111觀看</button> -->
<!--                     <input type="submit" class="btn btn-outline-success" value="觀看">  -->
<!--                 </form> -->
<!--                 </td> -->
<!--                 <td> -->
<!--                 <form name="AddForm" action="MainPostingServlet" method="POST">  -->
<!--                 <input type="hidden" name="_method" value="DELETE"> -->
<%--                 <input type="hidden" name="deletepost" value="${allmpbs.mainPostNo}"> --%>
<%--                 <input type="submit" id="${allmpbs.mainPostNo}" class="btn btn-outline-danger" value="刪除" >  --%>
<!--                 <script src="/group5/js/jquery.min.js"></script> -->
<!-- 				<script> -->
<%-- // 				var submitBtn = document.getElementById("${allmpbs.mainPostNo}"); --%>
<!-- // 				submitBtn.onclick = function (event) { -->
<!-- // 					var r=confirm("確認是否刪除"); -->
<!-- // 					if (r==true){ -->
<!-- // 						$(this).parent().submit(); -->
<!-- // 						return true; -->
<!-- // 				    } -->
<!-- // 				    else{ -->
<!-- // 				          return false; -->
<!-- // 				         }; -->
<!-- // 				}; -->
<!-- 				</script> -->
                    
<!--                 </form> -->
<!--                    </td> -->
                   
<!--                     <td> -->
<!--                     <form name="updateForm" action="MainPostingServlet" method="POST">  -->
<%--                     <input type="hidden" name="updatepost" value="${allmpbs.mainPostNo}"> --%>
<!--                     <input type="submit" class="btn btn-outline-info" value="修改"> -->
<!--                     </form> -->
<!--                     </td> -->
<!--             </tr> -->
<!--         </tbody> -->
<%--      </c:forEach> --%>
<!--             <tbody> -->
<%--             <tr><td colspan="9">${error}</td></tr></tbody> --%>
<!--             </table>  -->
           
      
         
           
            
<!--              </div>  -->
<!--                 <div class="sub"> -->
<!--                 <form name="addForm" action="MainPosting.add" method="POST">  -->
<!--                 <input type="submit" class="btn btn-outline-warning" name="addpost" value="發布貼文"> -->
<!--                 </form> -->
<!--                </div> -->
<!--                 </div> -->
<!--         </fieldset> -->

        <script>
        
        var members = new Set([]);
        $('.delete').on('click', function() {
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
            var members = new Set([]);
            for(var i  =0;i<hobby.length;i++){
                var h = hobby[i];
                if(h.checked != true){
	                h.checked = true;               
               }else if(h.checked == true){
                	 h.checked = false;
               }
                
                //全選 無效
//                if(h.checked = true){
//                    $(this).closest('tr').addClass('active')
//                    var deleteObject = $(this).parent().next().text()
//                    members.add(deleteObject);
//                } else {
//                    var deleteObject = $(this).parent().next().text()
//                    members.delete(deleteObject);
//                    $(this).closest('tr').removeClass('active')
//                }
            
            }
        }
        
        $(".turnDown").on('click', function(event) {
        	(async () => {

        		const { value: text } = await Swal.fire({
        		  input: 'textarea',
        		  inputLabel: '駁回原因',
        		  inputPlaceholder: '請輸入內容',
        		  inputAttributes: {
        		    'aria-label': 'Type your message here'
        		  },
        		  showCancelButton: true
        		})
        		if (text) {
        			
//         			console.log(text);
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
        
       
        
        </script>


        <%@ include file="../admin/AdminstyleFoot.jsp"%>
        
    </body>
</html>