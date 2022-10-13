<%@page import="java.util.Set"%>
<%@page import="tw.group5.order.model.Order"%>
<%@page import="tw.group5.commodity.model.Commodity"%>
<%@page import="tw.group5.commodity.service.CommodityService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="tw.group5.order.model.OrderItem"%>
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
    
    span.col-xs-7.col-sm-8 {
    padding: 8px 15px;
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
    .panelShowBTN{
    padding-top:15px;
    padding-bottom:15px;
    font-size: 22px;
    font-weight: bold;
    line-height: 1.5;
    color: #ff5353 !important;
    }
    
    .order-toggle{
    color: #666;
    font-size: 13px;
    padding: 5px;
    }
    
    .js-container{
    border:2px solid #f7f7f7;
    }
    
    .salePage-img{
    height: 83px;
    left: 25px;
    float: left;
    margin-right: 10px;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    }
    </style>
        
    
</head>


<body>

	<%@ include file="../shopping/shoppingFrontStageHead.jsp" %>
	
	
	 <div class="body-wrapper" style="margin-top:110px;margin-bottom:110px">
        <div class="body-content mobile-revamp-navigation">
            <div class="yield-wrapper">
                <div id="checkout-container" class="page-order-show">
                    <div class="container js-container">

                        <!-- Cart Summary -->
                        <div class="panel cart-summary margin-top-large collapsed" data-toggle="collapse" href="#cartSummary" aria-expanded="false">
                            <div class="panel-header">
                                <div class="order-title">
                                   <div class="panelShowBTN">
                                        <span>共${myorder.orderItems.size()}項商品，總計</span>
                                        <!-- 總計金額 -->
                                        <span class="order-text price-red cms-moneyColor"
                                            id="topTotalPayment">NT$<span>${myorder.orderTotal}</span>
                                        </span>
                                        
                                        <!--收合符號  -->
                                        <div class="order-toggle">
                                        <i class="fa-solid fa-angles-down" id="angles-down"></i>
                                        <i class="fa-solid fa-angles-up" id="angles-up"></i>
                                        </div>
                                   </div>
                                </div>
                            </div>

                            <!-- 點了秀出訂單商品 -->
                            <div id="cartSummary" class="collapse" aria-expanded="false" style="height: 0px;">
                                <div class="panel-body">
                                    <section class="shopping-cart">
                                        <div class="cart-items">
                                            <div class="table-header row hidden-xs">
                                                <div class="col-sm-5">商品資料</div>
                                                <div class="col-sm-1">優惠</div>
                                                <div class="col-sm-2 text-center">單件價格</div>
                                                <div class="col-sm-2 text-center">數量</div>
                                                <div class="col-sm-2 text-center item-total">小計</div>
                                            </div>
                                            
                                           
                                            <%
                                            Set<OrderItem> orderItems = ( (Order)session.getAttribute("myorder") ).getOrderItems();
                                            for(OrderItem orderItem : orderItems){
                                            	
                                            	ServletContext application1 = getServletContext();
			                					WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(application1);
			                					CommodityService cService = context.getBean("cService",CommodityService.class);
			                					
			                					Commodity commodity = cService.findCommodityById(orderItem.getCommodityNo()); 
			                					String commodityIMG = "/group5/commodityImages/"+ orderItem.getCommodityNo() +"_image1.jpg";
			                				%>
			                          
                                            	<div class="table-row row cart-item read-only">
                                                	<div class="col-xs-12 col-sm-5 item-information">
                                                		<a href="http://localhost:8080/group5/shopping.detail/<%= orderItem.getCommodityNo()%>">
                                                        	<img class="salePage-img" src="<%= commodityIMG %>">
                                                    	</a>	
                                                    	
                                                    	<div class="description">
                                                    		<div class="cart-promotion-lables">
                                                    	</div>
                                                    	
                                                    	<div>
                                                            <span><%=commodity.getCommodityName() %></span>
                                                        </div>
                                                        <span class="variant-name"><%=commodity.getCommodityStyle() %></span>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-xs-12 col-sm-1 item-promotion"></div>
                                                
                                                <div class="col-xs-12 col-sm-2 text-center item-price">
                                                    <span class="price-label">NT$<span><%= orderItem.getCommodityPrice() %></span></span>
                                                </div>
                                                <div
                                                    class="col-xs-12 col-sm-2 text-center item-quantity global-secondary dark-secondary padding-zero-sm">
                                                    <span class="hidden-sm hidden-md hidden-lg">數量: </span><%= orderItem.getQuantity()%>
                                                </div>
                                                <div class="col-xs-12 col-sm-2 text-center item-total">
                                                    <span class="price-label">NT$<span><%= orderItem.getSubtotal() %></span></span>
                                                </div>
                                            </div>

                                          <%}%>

                                        </div>
                                        <div class="cart-promotions">
                                            <div class="cart-promotions triggered-promotions">
                                                <div class="cart-promotions-content">
                                                    <h5 class="promotion-title">已享用之優惠</h5>
                                                    
                                                    <c:if test="${myorder.voucherNo != null}" >
                                                    <div class="promotion">
                                                    
                                                        <div class="badge">
                                                            <span>折扣碼</span>
                                                        </div>
                                                        
                                                        <div class="description">
                                                            ${myorder.voucherNo}
                                                            <span class="applied-reminder"></span>
                                                        </div>
                                                        
                                                        <div class="discount">
                                                            <span>-NT$ ${myorder.voucherDiscount}</span>
                                                        </div>
                                                    </div>
                                                    </c:if>
                                                    
                                                    <c:if test="${myorder.shippingFee == '免運'}" >
                                                    <div class="promotion">
                                                        <div class="badge">
                                                            <span>免運優惠</span>
                                                        </div>
                                                        <div class="description">
                                                            消費滿NT$1500免運
                                                            <span class="applied-reminder">
                                                            </span>
                                                        </div>
                                                        <div class="discount">
                                                            <span>-</span>
                                                        </div>
                                                    </div>
                                                    </c:if>

                                                </div>
                                            </div>


                                        </div>
                                    </section>
                                    <div class="order-summary col-xs-12 col-sm-5 pull-right">
                                    
                                        <div class="subtotal">
                                            <span class="pull-left">小計:</span>
                                            <span class="pull-right">NT$ ${subtotalWithoutDiscount}</span>
                                        </div>
                                        
                                        <c:if test="${myorder.voucherNo != null}" >
                                        <div class="discount">
                                            <span class="pull-left">折扣:</span>
                                            <span class="pull-right">-NT$ ${myorder.voucherDiscount}</span>
                                        </div>
                                        </c:if>

                                        <div class="delivery-fee emphasize">
                                            <span class="pull-left">
                                                運費:
                                            </span>
                                            
                                            <c:if test="${myorder.shippingFee == '免運'}" >
                                            <span class="pull-right">
                                                ${myorder.shippingFee}
                                            </span>
                                            </c:if>
                                            <c:if test="${myorder.shippingFee != '免運'}" >
                                            <span class="pull-right">
                                                +NT$ ${myorder.shippingFee}
                                            </span>
                                            </c:if>
                                        </div>
                                        
                                        <div class="total">
                                            <span class="pull-left">合計<span class="hidden-sm hidden-md hidden-lg"> (${myorder.orderItems.size()}項商品
                                                    )</span>:</span>
                                            <span class="pull-right">NT$ ${myorder.orderTotal}</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-order-info">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-sm-6 order-detail-section">
                                        <h4>訂單資訊</h4>
                                        <div class="row">
                                            <span class="col-xs-5 col-sm-4">訂單號碼:</span>
                                            <span class="col-xs-7.col-sm-8">${myorder.orderNo}</span>
                                        </div>
                                        
                                        <div class="row">
                                            <span class="col-xs-5 col-sm-4">訂單日期:</span>
                                            <span class="col-xs-7.col-sm-8 datetime">${myorder.orderTime}</span>
                                        </div>
                                        <div class="row">
                                            <span class="col-xs-5 col-sm-4">訂單狀態:</span>
                                            <span class="col-xs-7.col-sm-8">${myorder.orderStatus}</span>
                                        </div>
                                    </div>
                                    
                                    <div class="col-sm-6 order-detail-section">
                                        <h4>顧客資訊</h4>
                                        <div class="row">
                                            <span class="col-xs-5 col-sm-4">名稱:</span>
                                            <span class="col-xs-7.col-sm-8">${memeberName }</span>
                                        </div>
                                        <div class="row">
                                            <span class="col-xs-5 col-sm-4">電話號碼:</span>
                                            <span class="col-xs-7.col-sm-8">${memberPhone}</span>
                                        </div>
                                    </div>
                                    <!-- User fields -->
                                    
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 order-detail-section delivery-detail">
                                        <h4>送貨資訊</h4>
                                        <div class="row">
                                            <span class="col-xs-5 col-sm-4">送貨方式:</span>
                                            <span class="col-xs-7 col-sm-8">${myorder.shippingType}</span>
                                        </div>

                                        
                                        
                                        <c:if test="${myorder.shippingType == '7-ELEVEN超商取貨' }">
                                        <div class="row">
                                        	<span class="col-xs-5 col-sm-4">7-ELEVEN 店號:</span>
                                        	<span class="col-xs-7 col-sm-8">${myorder.storeID }</span>
                                        </div>
                                        
                                        <div class="row">
                                        	<span class="col-xs-5 col-sm-4">7-ELEVEN 門市名稱:</span>
                                        	<span class="col-xs-7 col-sm-8">7-ELEVEN ${myorder.storeName}</span>
                                        </div>
                                        
                                        <div class="row">
                                        	<span class="col-xs-5 col-sm-4">門市地址:</span>
                                        	<span class="col-xs-7 col-sm-8">${myorder.deliveryAddress}</span>
                                        </div>
                                        </c:if>
                                        
                                        <c:if test="${myorder.shippingType == '全家超商取貨' }">
                                        <div class="row">
                                        	<span class="col-xs-5 col-sm-4">全家店號:</span>
                                        	<span class="col-xs-7 col-sm-8">${myorder.storeID }</span>
                                        </div>
                                        
                                        <div class="row">
                                        	<span class="col-xs-5 col-sm-4">全家門市名稱:</span>
                                        	<span class="col-xs-7 col-sm-8">全家 ${myorder.storeName}</span>
                                        </div>
                                        <div class="row">
                                        	<span class="col-xs-5 col-sm-4">門市地址:</span>
                                        	<span class="col-xs-7 col-sm-8">${myorder.deliveryAddress}</span>
                                        </div>
                                        </c:if>
                                        
                                        <c:if test="${myorder.shippingType == '萊爾富超商取貨' }">
                                        <div class="row">
                                        	<span class="col-xs-5 col-sm-4">萊爾富店號:</span>
                                        	<span class="col-xs-7 col-sm-8">${myorder.storeID }</span>
                                        </div>
                                        
                                        <div class="row">
                                        	<span class="col-xs-5 col-sm-4">萊爾富門市名稱:</span>
                                        	<span class="col-xs-7 col-sm-8">萊爾富 ${myorder.storeName}</span>
                                        </div>
                                        <div class="row">
                                        	<span class="col-xs-5 col-sm-4">門市地址:</span>
                                        	<span class="col-xs-7 col-sm-8">${myorder.deliveryAddress}</span>
                                        </div>
                                        </c:if>
                                        
                                        <c:if test="${myorder.shippingType == '宅配' || myorder.shippingType == '離島宅配' }">
                                        <div class="row">
                                        	<span class="col-xs-5 col-sm-4">宅配地址:</span>
                                        	<span class="col-xs-7 col-sm-8">${myorder.deliveryAddress}</span>
                                        </div>
                                        </c:if>
                                        
                                        
                                        <div class="row"><span class="col-xs-5 col-sm-4">收件人中文全名(需與身份證姓名相同):</span><span
                                                class="col-xs-7 col-sm-8">${myorder.pickerName}</span></div>
                                        <div class="row"><span class="col-xs-5 col-sm-4">收件人電話號碼:</span><span
                                                class="col-xs-7 col-sm-8">${myorder.pickerCellphone}</span></div>
                                                
                                        
                                        



                                    </div>

                                    <div class="col-sm-6 order-detail-section">
                                        <h4>付款資訊</h4>
                                        <div class="row">
                                            <span class="col-xs-5 col-sm-4">付款方式:</span>
                                            <span class="col-xs-7 col-sm-8">${myorder.payType }</span>
                                        </div>
                                        <div class="row">
                                            <span class="col-xs-5 col-sm-4">付款狀態:</span>
                                            <span class="col-xs-7 col-sm-8">${myorder.payStatus}</span>
                                        </div>

										<c:if test="${myorder.payType == '信用卡一次付清'}">
                                        <div class="row">
                                            <span class="col-xs-5 col-sm-4">綠界交易編號:</span>
                                            <span class="col-xs-7 col-sm-8" ng-non-bindable="">${myorder.ecTradeNo}</span>
                                        </div>
										</c:if>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
            
                	
    <%@ include file="../admin/FrontStageFoot.jsp" %>

</body>
</html>