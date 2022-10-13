<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>健友配對</title>
</head>
<body>
<%@include file="../admin/FrontStageHead.jsp" %>
<!-- Details -->
    <div id="details" class="basic-1">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="text-container">
                    	<%if(request.getAttribute("singleOne")!=null){ %>
                    	<h2>${singleOne}</h2>
                        <p>建議：廣泛收藏健身房，有助於尋找合適健友！</p>
                    	<%}else{ %>
                        <h2>今日配對：${uPair.memberName}</h2>
                        <p>健友性別：${uPair.memberDetail.gender}</p>
                        <p>健友想說：${uPair.memberDetail.pairInfo}</p>
                        <p>健友想要：${uPair.memberDetail.pairRequest}</p>
                        <p>按喜歡看更多資訊</p>
                        <a class="btn-solid-reg page-scroll" href="#">喜歡</a>
                    </div> <!-- end of text-container -->
                </div> <!-- end of col -->
                <div class="col-lg-6">
                    <div class="image-container">
                        <img class="img-fluid" src="${uPair.memberPhoto}" alt="alternative">
                    </div> <!-- end of image-container -->
                <%} %>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of basic-1 -->
    <!-- end of details -->
<%@include file="../admin/FrontStageFoot.jsp" %>
</body>
</html>