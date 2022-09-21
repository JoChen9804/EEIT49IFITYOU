<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8" />
<TITLE>${queryOne.title}</TITLE>
<link rel="stylesheet" href="">

<style>
.table1 {
	width: 600px;
	table-layout: fixed;
	margin-left:auto; 
    margin-right:auto;
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
	border: 1px solid;
	width: 800px;
	/* height: 400px; */
	background-color: #f7f4dd;
	/* margin: auto; */
	word-wrap: break-word;
}
</style>
</head>

<body>
	

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
				<img width='150' height='150' src="imagestest/test.gif"></td>
				<td>
					<div class="content">
						<P>發布時間:${queryOne.addtime}</P>
						<p>${queryOne.content}</p>

						<c:forEach var="image" items="${allImages}">
							<img width='300' height='200' src="${image}">
						</c:forEach>
						</form>
						<form action=Likes method="post">
							<input type="hidden" name="_method" value="PUT"> <input
								type="hidden" id="mainPostNo" name="mainPostNo"
								value="${queryOne.mainPostNo}">
							<p><button type="submit" name="likenumber" value="${likes}">讚${likes}</button>
							</p>
						</form>

					</div>
				</td>
			</tr>


        <c:forEach var="測試回復" items="">
			<tr>
				<td class="column1">帳號:34654654</td>
				<td class="column2">發布時間:2020/1010</td>
			</tr>
			<tr>
				<td class="column3"><img width='150' height='150'
					src=""></td>
				<td>
					<div class="content">

						<p>內容</p>

						<c:forEach var="image" items="回復待修改">
							<img width='300' height='200' src="回復待修改">
						</c:forEach>

						<p><button type="submit" name="回復待修改" value="${queryOne.likeNumber}">讚</button>
						</p>
					</div>
				</td>
			</tr>
			</c:forEach>
			
			
			
			<form action=replypost method="post" onsubmit="return checkip()">
			    <tr>
                  <td class="column3">
                <img width='150' height='150' src="postfolder/images/test.gif"></td>
                <td><div class="content">
                
               <P>發布時間:${queryOne.addtime}</P>
                                                
            <textarea name="content" id="content1" cols="105" rows="10" 
            required oninvalid="setCustomValidity('請輸入內容')" oninput="setCustomValidity('')"></textarea>
           
            </div>
       請選擇圖片(最多五張):<input id="file1" type="file" class="upl" name="replyfile" multiple="multiple" 
                            accept="image/*" onchange="checkip()">           
            <div id="imgs"></div>
            <script src="postfolder/js/jquery-3.6.0.js"></script>
            <script src="postfolder/js/images.js"></script>
            
            
            
            <!--    之後改成抓取會帳號     -->
            <input type="hidden" id="mainPostNo" name="mainPostNo" value="replyAccount">
            <input type="submit" name="replysubmit"  value="送出">
  
                </td>
            </tr>
         </form>   
          

		</table>
		<form name="updateForm" action="MainPost.return" method="GET">
			<input type="submit" name="returns" value="返回首頁">
		</form>
</body>

</html>