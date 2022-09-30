<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>詳細資訊</title>
	<!--   official Bootstrap -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>

    <!-- Custom styles for this page -->

    <!-- Core plugin JavaScript--> 
	<script src="/group5/js/jquery.min.js"></script>
	<script src="/group5/js/jquery.easing.min.js"></script>
    <!-- Page level custom scripts --> <!-- Page level plugins -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://kit.fontawesome.com/a3daa825b8.js" crossorigin="anonymous"></script>

</head>
<body>
<%@ include file="../admin/FrontStageHead.jsp" %>
    <!-- Description -->
    <div class="cards-1">
        <div class="container">
            <div class="row">
                <div class="col-lg-12"   style="margin-top:50px;">
                    <div class="above-heading" style="font-size:1em; margin-bottom:5px;">健友在這裡</div>
                    <h2 class="h2-heading">${gymDetail.gymName }</h2>
                </div> <!-- end of col -->
            </div> <!-- end of row -->
            <div class="row">
                
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of cards-1 -->
    <!-- end of description -->
		
<%@ include file="../admin/FrontStageFoot.jsp" %>	
    
</body>
</html>