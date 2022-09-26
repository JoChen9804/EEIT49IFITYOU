<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8" />
<link rel="stylesheet" href="styles/Topic.css">
<TITLE>${queryOne.title}</TITLE>
<script src="/group5/js/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
    $("#likemainpost").on("click",function(){
        var mainPostNo = $(this).prev().val();
        let mainPostBean={"mainPostNo":mainPostNo};
        $.ajax({
            type: "put",
            url:'/group5/admin/LikesAJAX',
            data: mainPostBean,
            dataType:'json',
           
            success: function(data){
                  console.log(data);
                  $("#likemainpost").text("讚"+data.likeNumber);
                 //location.reload();
            }
        });
    });
});
</script>





<style>
.table1 {
	width: 600px;
	table-layout: fixed;
	margin-left:auto; 
    margin-right:auto;
    background-color: #f7f4dd;
}

.column1 {
	width: 200px;
	text-align: center;
	vertical-align: bottom;
	background-color: #f7f4dd;
}

.column2 {
	width: 800px;
	text-align: left;
	vertical-align: bottom;
	background-color: #f7f4dd;
}

.column3 {
	width: 200px;
	text-align: center;
	vertical-align: top;
	background-color: #f7f4dd;
}

.column4 {
	width: 800px;
	text-align: center;
	background-color: #f7f4dd;
}

.content {
	/* border: 1px solid;*/
	/* width: 800px;*/
	/* height: 400px; */
	background-color: #f7f4dd;
	/* margin: auto; */
	word-wrap: break-word;
}

.img {
width:150px ;
height:150px;
}

.imgs {
    width: 300px;
    padding: 5px 5px 5px 5px;
    margin: 10px;
}


</style>
</head>

<body>
	
	<%@ include file="../admin/AdminstyleHead.jsp" %>

		<table class="table1" border="1">
		<form ACTION="MainPostServlet" method="post">
			<tr>
				<td class="column1">帳號:${queryOne.account}</td>
				<td class="column4">
					<H1 ALIGN=CENTER>${queryOne.title}</H1>
				</td>
			</tr>
			<tr>
				<td class="column3">
				<img class="img" src="${queryOne.postPhoto}"></td>
				<td>
					<div class="content">
						
						<P>發布時間:${queryOne.addtime}</P>
						<p class="content">${queryOne.content}</p>


						<c:forEach var="image" items="${allImages}">
							<img src="${image}">
						</c:forEach>
						</form>
						
					
						 <br>
							<input type="hidden" id="mainPostNo" name="mainPostNo"
								value="${queryOne.mainPostNo}">
							<button type="submit" name="likenumber" id="likemainpost" class="btn btn-outline-danger" value="${likes}">讚${likes}</button>

					</div>
				</td>
			</tr>




        <c:forEach var="onereply" items="${allReply}">
			<tr>
				<td class="column1">帳號:${onereply.replyAccount}</td>
				<td class="column2">回復時間:${onereply.replyTime}</td>
			</tr>
			<tr>
				<td class="column3"><img class="img" src="${onereply.replyPhoto}"></td>
				<td>
					<div class="content">
					<p>${onereply.replyContent}</p>
					<c:forEach var="onewReplyImage" items="${onereply.r_imagess}">
					   <img width='300' height='200' src="${onewReplyImage}">
                       </c:forEach>
						
			                 <br>
						   <input type="hidden" id="mainPostNo" name="mainPostNo" value="${queryOne.mainPostNo}">
                            <input type="hidden"  name="replyNo" value="${onereply.replyNo}">
                            <button type="submit" name="replylikenumber" id="${onereply.replyNo}" class="btn btn-outline-danger" value="${onereply.replyLikeNumber}"> 讚${onereply.replyLikeNumber}</button>

						<script type="text/javascript">
                        $(function(){
                            var onereply = document.getElementById("${onereply.replyNo}");
                            
                            onereply.onclick = function (event) {
                                var replyNo = $(this).prev().val();
                                console.log(replyNo);
                                let ReplyPostBean = {"replyNo":replyNo};
                                $.ajax({
                                    type: "put",
                                    url:'/group5/admin/ReplyLikesAJAX',
                                    data: ReplyPostBean,
                                    dataType:'json',
                                    success: function(data){
                                        console.log(data);
                                        document.getElementById("${onereply.replyNo}").innerText ="讚"+data.replyLikeNumber
                                    }
                                });
                            }
                            
                          });
                        </script>
					</div>
				</td>
			</tr>
			</c:forEach>

			
			
			
			
			<form action=ReplyPost method="post" onsubmit="return checkip()" enctype='multipart/form-data'>
			<input type="hidden" name="mainPostNo" value="${queryOne.mainPostNo}">
			    <tr>
                  <td class="column3">
                <img class="img" src="${queryOne.postPhoto}"></td>
                <td><div class="content">
                
               
                                                
            <textarea name="replyContent" id="content1" cols="90" rows="10" 
            required oninvalid="setCustomValidity('請輸入內容')" oninput="setCustomValidity('')"></textarea>
            
  
            
            
            
            
           
            </div>
       請選擇圖片(最多五張):<input id="file1" type="file" class="btn btn-outline-primary" name="replyfile" multiple="multiple" 
                            accept="image/*" onchange="checkip()">           
            <div id="imgs"></div>
             <script src="/group5/js/jquery.min.js"></script>
             <script src="js/images.js"></script>  
            
            
            
            <!--    之後改成抓取會帳號     -->
            <input type="hidden" id="會員帳號" name="會員帳號" value="replyAccount">
            <input type="submit" name="replysubmit" class="btn btn-outline-success"  value="發表回復">
  
                </td>
            </tr>
         </form>   
          

		</table>
		<form name="updateForm" action="MainPost.return" method="GET">
			<div class="sub"><input type="submit" name="returns" class="btn btn-outline-primary" value="返回首頁" margin="auto"></div>
		</form>
		
		<%@ include file="../admin/AdminstyleFoot.jsp"%>
		
</body>

</html>