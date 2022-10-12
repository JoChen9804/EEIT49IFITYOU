<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Language" content="zh-tw">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>訂單結果</title>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

    <link rel="stylesheet" type="text/css" href="/shoppingCss/shopping-main.css">
    
    <script src="https://kit.fontawesome.com/0d0c16b1bb.js" crossorigin="anonymous"></script>
    
    <link
        href="//official-static.91app.com/V2/bundles/v-638000899589737964-v/css/shoppingCart/index/Desktop?v=Obk4B9SQ-i4Mb7PQx2LIzMGvrsxgsAFY4hEcsvBLiM81"
        rel="stylesheet">
    
</head>


<body>

	<%@ include file="../shopping/shoppingFrontStageHead.jsp" %>
	
	<div class="center-sub-content" style="margin-top:50px">
		<div class="cart-wrapper">
    		<div ui-view="" autoscroll="true">
                <div ui-view="">
                	<div class="cart-empty">
                    	<img src="/shoppingCss/delivery.gif">
                    	<div class="cart-empty__message">
                        	<p>訂單完成!!我們將會盡快為您安排出貨!!</p>
                        	<a href="/group5/user/myorder/${orderNo}">查詢訂單</a>
                    	</div>
                	</div>
                </div>
             </div>
        </div>
    </div>
            
                	
    <%@ include file="../admin/FrontStageFoot.jsp" %>

</body>
</html>