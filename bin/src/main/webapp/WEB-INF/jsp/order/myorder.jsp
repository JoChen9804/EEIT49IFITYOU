<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <style>
        span.col-xs-5.col-sm-4 {
            padding: 8px 15px 8px 25px;
        }

        .page-cart .panel-order-info h4,
        .page-checkout .panel-order-info h4,
        .page-order-show .panel-order-info h4 {
            font-weight: 500;
            border-bottom: 1px solid #e7e7e7;
            padding-bottom: 10px;
            background-color: #f7f7f7;
            padding: 8px 0 8px 15px;
        }
    </style>
    
    <style>
    .js-container{
    border:2px solid #f7f7f7;
    }
    
    .orderTitle{
    width: 100%;
    padding-right: 15px;
    padding-left: 200px;
    margin-right: auto;
    margin-left: auto;
    font-size:17px;
    }

	.order_container{
	margin:30px 30px 30px 30px;
	}
	
    .order_table{
    width:1050px;
    border:2px solid #e7e7e7;
    text-align: center;
    }
    
    th {
    background-color: #f7f7f7;
    }
    
    tr {
    height:40px;
    text-align: center;
    vertical-align: middle;
    }
    
    .orderCheckBTN {
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    padding: 5px 15px;
    border: 0px solid #5897f5;
    border-radius: 10px;
    background: #5897f5;
    background: -webkit-gradient(linear, left top, left bottom, from(#5897f5), to(#5897f5));
    background: -moz-linear-gradient(top, #5897f5, #5897f5);
    background: linear-gradient(to bottom, #5897f5, #5897f5);
    text-shadow: #5897f5 0px 0px 0px;
    font: normal normal bold 16px comic sans ms;
    color: #ffffff;
    text-decoration: none;
	}
	.orderCheckBTN:hover,
	.orderCheckBTN:focus {
    border: 0px solid #72c4ff;
    background: #6ab5ff;
    background: -webkit-gradient(linear, left top, left bottom, from(#6ab5ff), to(#6ab5ff));
    background: -moz-linear-gradient(top, #6ab5ff, #6ab5ff);
    background: linear-gradient(to bottom, #6ab5ff, #6ab5ff);
    color: #ffffff;
    text-decoration: none;
	}
	.orderCheckBTN:active {
    background: #355b93;
    background: -webkit-gradient(linear, left top, left bottom, from(#355b93), to(#5897f5));
    background: -moz-linear-gradient(top, #355b93, #5897f5);
    background: linear-gradient(to bottom, #355b93, #5897f5);
	}
	
    </style>
        
    
</head>


<body>

	<%@ include file="../shopping/shoppingFrontStageHead.jsp" %>
	
	
	 <div class="body-wrapper" style="margin-top:110px;margin-bottom:110px">
        <div class="body-content mobile-revamp-navigation">
            <div class="yield-wrapper">
                <div id="checkout-container" class="page-order-show">
                  <div class="orderTitle">我的訂單</div>
                    <div class="container js-container">
                        <div class="order_container">
                        	<table class="order_table">
                            	<thead>
                                	<tr>
                                    	<th>訂單編號</th>
                                    	<th>訂單日期</th>
                                    	<th>訂單金額</th>
                                    	<th>訂單狀態</th>
                                    	<th></th>
                                    </tr>
                                </thead>
                               
                            	<tbody>
                            	
                            	<c:forEach var="order" items="${myorders}">
                            		<tr>
                            			<td>${order.orderNo}</td>
                            			<td>${order.orderTime}</td>
                            			<td>NT$ ${order.orderTotal}</td>
                            			<td>${order.orderStatus}</td>
                            			<td><a href="/group5/user/myorder/${order.orderNo}"><button class="orderCheckBTN">查閱</button></a></td>
                            		</tr>
                            	</c:forEach>
                            	</tbody>
                            	
                            </table>
                                    
                                        
                                        

                                    
                                
                                    
                                
                                    

                               
                               
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
            
                	
    <%@ include file="../admin/FrontStageFoot.jsp" %>

</body>
</html>