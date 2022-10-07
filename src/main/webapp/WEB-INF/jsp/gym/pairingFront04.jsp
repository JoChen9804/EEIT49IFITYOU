<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fit U</title>
<!-- Core plugin JavaScript-->
<script src="/group5/js/jquery.min.js"></script>
<script>

</script>
</head>
<body>
<%@include file="../admin/FrontStageHead.jsp" %>
    <!-- Header -->
    <header id="header" class="ex-2-header" style="background-image: linear-gradient(to bottom, #3a62d6, #ffffff);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h1>${mainPD.member.memberAccount} 本日配對</h1>

                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </header> <!-- end of ex-header -->
    <!-- end of header -->

<%@include file="../admin/FrontStageFoot.jsp" %>
</body>
</html>