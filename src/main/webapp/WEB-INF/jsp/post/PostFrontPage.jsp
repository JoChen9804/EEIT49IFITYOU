<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <HEAD>
      <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8"/>
      
      <link rel="stylesheet" href="styles/Topic.css">
      <script type="text/javascript" src="postfolder/js/jquery-3.6.0.js"></script>
      <TITLE>貼文首頁</TITLE>
    <style>
  img {
         width: 150px;
         /*border: 3px solid red;*/
        padding: 5px 5px 5px 5px;
        margin: 5px;
     }
     
td,
th {
    border: 1px solid gray;
   }
   fieldset {
    width: 700px;
    border: 1px solid #acd6ff;
    border-radius: 15px;
    opacity: 0.85;
    margin: auto;
    background: #f7f4dd;
}   
   
    </style>
      
   </HEAD>
    <body>
       
   <fieldset>
    <h1 ALIGN=CENTER>貼文首頁</h1>
    <form name="querypostbut" action="MainPost.all" method="GET">
     <table>
           <tr>
            <th>  
            <label for="dataa" class="t1">主貼文編號:</label>
            <input type="TEXT" id=dataa name="mainPostNo" 
            required oninvalid="setCustomValidity('請輸入貼文編號id')" oninput="setCustomValidity('')"><BR></th>
            <th>
            <input type="submit" name="inquireId" value="查詢">
           </th>
        </tr>
    </table>
   </form>
       <form name="likequerypostbut" action="MainPost.all" method="GET">
     <table>
           <tr>
             <th>  
            <label for="dataa1" class="t1">搜尋:</label>
            <input type="TEXT" id=dataa1 name="title" 
            required oninvalid="setCustomValidity('請輸入標題名稱')" oninput="setCustomValidity('')"/><BR></th>
            <th>
            <input type="submit"  name="likequire" value="查詢標題" >
           </th>
        </tr>
    </table>
  
   </form>
   <form action="MainPost.return" method="GET">
        <input type="submit"  name="returns" value="所有貼文" >
   </form>
    <table>
    <thead>
        <tr>
        <th>圖片</th>
        <th>貼文id</th>
        <th>類型</th>
        <th>標題</th>
        <th>會員帳號</th>
        <th>發布日期</th>
        <th colspan="3">編輯</th>
        </tr>
    </thead>
    <c:forEach var="allmpbs" items="${query}">
        <tbody>
         <tr>
            <td><img src="${allmpbs.p_image}"></td>
            <td>${allmpbs.mainPostNo}</td>
            <td>${allmpbs.postTypeName}</td>
            <td>${allmpbs.title}</td>
            <!-- <td><a href="/MainPost.watch2/${allmpbs.mainPostNo}">${allmpbs.title}</a></td>  -->           
            <td>${allmpbs.account}</td>
            <td>${allmpbs.addtime}</td>
            <td>
                <form name="sendForm" action="MainPost.watch" method="POST">
                    <input type="hidden" name="watch" value="${allmpbs.mainPostNo}">
                   <!--   <button type="submit" name="watch1" value="${allmpbs.mainPostNo}">1111觀看</button>-->
                    <input type="submit" value="觀看"> 
                </form>
                </td>
                <td>
                    <form name="AddForm" action="MainPostingServlet" method="POST"> 
                    <input type="hidden" name="_method" value="DELETE">
                    <input type="hidden" name="deletepost" value="${allmpbs.mainPostNo}">
                    <input type="submit" value="刪除"> 
                    </form>
               </td>
               <td>
                    <form name="updateForm" action="MainPostingServlet" method="POST"> 
                    <input type="hidden" name="updatepost" value="${allmpbs.mainPostNo}">
                    <input type="submit" value="修改">
                    </form>
                </td>
          </tr>
        </tbody>
    </c:forEach>
    <tbody><tr><td colspan="7">${error}</td></tr></tbody>
            </table>  

                <div class="sub">
                <form name="addForm" action="MainPosting.add" method="POST"> 
                <input type="submit" name="addpost" value="發布貼文">
                </form>
               </div>
        </fieldset>
    </body>
</html>