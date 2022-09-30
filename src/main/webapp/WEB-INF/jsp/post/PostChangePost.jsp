<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=UTF-8"/>
    <TITLE>異動貼文</TITLE>
    <link rel="stylesheet" href="styles/Topic.css">
    <style>
fieldset {
    width: 700px;
    border: 1px solid #acd6ff;
    border-radius: 15px;
    opacity:0.85;
    margin: auto;
    background: #f7f4dd;
    } 
    .imgss {
    width: 300px;
    height: 200px;
    padding: 5px 5px 5px 5px;
    margin: 10px;
}
    
    
    .imgfront {
    width: 150px;
    height: 120px;
    padding: 2px 2px 2px 2px;
    margin: 2px;
}
    
    
    </style>
    </head>
    <body>
    
    <%@ include file="../admin/AdminstyleHead.jsp" %>

                 <table class="table table-bordered" class="compact hover stripe">
           <tr><th>
                <form  action="AllPostStatus" method="GET">
                <input type="submit" class="btn btn-outline-primary" name="postPermission" value="待審核">
                </form> 
           </th>
        </tr>
         
           <tr>
              <th> 
                <form action="AllPostStatus" method="GET">
                <input type="submit" class="btn btn-outline-primary"  name="postPermission" value="已審核" >
                </form>
              </th>
            </tr>
    </table>
  
   <form action="MainPost.return" method="GET">
        <input type="submit" class="btn btn-outline-primary"  name="returns" value="所有貼文" >
   </form>



     <table class="table table-sm">
    <thead>
        <tr>
            <th>圖片</th>
            <th>類型</th>
            <th>標題</th>
            <th>發布日期</th>
            <th>最後回覆</th>
            <th>觀看</th>
            <th>狀態</th>
        </tr>
    </thead>
    
    <c:forEach var="allmpbs" items="${query}">
        <tbody>
            <tr>
                <!--<a href="/group5/PostWtch/${allmpbs.mainPostNo}"></a>-->
                <td class="align-middle"><img class="imgfront"
                    src="${allmpbs.p_image}"></td>
                <td class="align-middle">[${allmpbs.postTypeName}]</td>
                <td class="align-middle">${allmpbs.title}</td>
                <td class="align-middle">${allmpbs.account}<br />${allmpbs.addtime}</td>
                <td class="align-middle">改成回覆帳號<br />${allmpbs.lastReplyTime}
                </td>
                <td class="align-middle">
                    <form action="PostWtch" method="GET">
                        <input type="hidden" name="mainPostNo"
                            value="${allmpbs.mainPostNo}"> <input
                            type="submit" class="btn btn-outline-success"
                            value="觀看">
                    </form>
                </td>
                <td class="align-middle">${allmpbs.postPermission}</td>
            </tr>
        </tbody>
    </c:forEach>
</table>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    <fieldset>
    <H1 ALIGN=CENTER>修改貼文</H1>
      <form ACTION="MainPostServlet" method="post" enctype='multipart/form-data'>
        <input type="hidden" name="_method" value="PUT">
    
            <div class="st1">
            <label for="mainPostNo" class="t1">主貼文編號:</label>${queryContent.mainPostNo}
             <input type="hidden" id="mainPostNo" name="mainPostNo" value="${queryContent.mainPostNo}">
             <input type="hidden" name="account" value="${queryContent.account}">
             <input type="hidden" name="likeNumber" value="${queryContent.likeNumber}">
             </div>
             
             
            <div class="st1">
            <label for="postTypeName" class="t1">貼文分類:</label>${queryContent.postTypeName}
             <input type="hidden" id="postTypeName" name="postTypeName" value="${queryContent.postTypeName}">
             </div>
             
           <div class="st1">
            <label for="title" class="t1">標題:</label>
            <INPUT TYPE="TEXT" id=data3 name="title" value="${queryContent.title}"
            required oninvalid="setCustomValidity('請輸入標題')" oninput="setCustomValidity('')"><BR>
         
        </div>    

        <div class="st1">
            
            <label for="content1" class="t1">內容:</label>
            <textarea name="content" id="content1" cols="40" rows="10" 
            required oninvalid="setCustomValidity('請輸入內容')" oninput="setCustomValidity('')">${queryContent.content}</textarea>
            
        </div>
        <input type="hidden" id="p_image" name="p_image" value="${queryContent.p_image}">
           <c:forEach var="image" items="${updatImages}">
           
                            <img class="imgss" src="${image}">
                        </c:forEach>
                        
        <P>重新選擇圖片(最多五張，每張2MB以下):<input id="file1" type="file" class="btn btn-outline-primary" name="chamgeimages" multiple="multiple" 
                            accept="image/*" onchange="checkip()"></P>        
         <div id="imgs"></div>  
        <script src="/group5/js/jquery.min.js"></script>
        <script src="js/images.js"></script>   
        
  
        <div class="sub">
        <input type="submit" name="modifyContent" class="btn btn-outline-success" value="修改內容">
        </div>
   </form>
   
   
   
    <form name="updateForm" action="MainPost.return" method="GET">
       <div class="sub"> 
       <input type="submit" name="returns" class="btn btn-outline-primary" value="返回首頁"></div>
    </form>
   
    
    </fieldset>
    
    <%@ include file="../admin/AdminstyleFoot.jsp"%>
    
    </body>
</html>