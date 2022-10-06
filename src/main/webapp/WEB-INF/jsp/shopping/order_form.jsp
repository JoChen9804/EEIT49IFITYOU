<%@page import="tw.group5.commodity.model.Commodity"%>
<%@page import="tw.group5.commodity.service.CommodityService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="java.util.List"%>
<%@page import="tw.group5.shopping.model.ShoppingCartItem"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Language" content="zh-tw">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>資料填寫</title>
    
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

    <link rel="stylesheet" type="text/css" href="/shoppingCss/shopping-main.css">

    <script src="https://kit.fontawesome.com/0d0c16b1bb.js" crossorigin="anonymous"></script>

    <link
        href="//official-static.91app.com/V2/bundles/v-638000899589737964-v/css/shoppingCart/index/Desktop?v=Obk4B9SQ-i4Mb7PQx2LIzMGvrsxgsAFY4hEcsvBLiM81"
        rel="stylesheet">

    <link
        href="//official-static.91app.com/V2/bundles/v-638003822420322220-v/css/pay/index?v=-Sm4LCdsEoTXD3n_iSN3y6WCxp6IrHHgnrH6it8l_8o1"
        rel="stylesheet">

    <script src="https://demeter.5fpro.com/tw/zipcode-selector.js"></script>
       

    
</head>


<body>

	<%@ include file="../shopping/shoppingFrontStageHead.jsp" %>
	
	<div class="center-sub-content" style="margin-top:80px">
	
	    <!-- 付款流程條 -->
        <ns-progress-bar>
            <div class="header-progress-bar">
                <ul>
                    <li class="step1">
                        <span>
                            <span class="index">1</span>
                            <span class="step-title">確認購物車</span>
                        </span>
                    </li>

                    <li class="step-arrow">
                        <span>
                            <i class="fa fa-angle-right"></i>
                        </span>
                    </li>

                    <li class="step2">
                        <span>
                            <span class="index">2</span>
                            <span class="step-title">付款與運送方式</span>
                        </span>
                    </li>

                    <li class="step-arrow">
                        <span>
                            <i class="fa fa-angle-right"></i>
                        </span>
                    </li>

                    <li class="step3 active cms-moneyColor">
                        <span>
                            <span class="index cms-moneyBgColor">3</span>
                            <span class="step-title cms-moneyColor cms-moneyBorderColor">資料填寫</span>
                        </span>
                    </li>
                </ul>
            </div>
        </ns-progress-bar>


        <div class="cart-wrapper">
            <div id="payProcess" class="">

                <div>
                    <div>
                        <!-- 訂單明細 -->
                        <div class="order-block">
                            <div>
                                <!-- 訂單標題 -->
                                <div class="order-header">
                                    <div class="submit-remind">
                                        <div class="order-currency-prompt">
                                            <span>
                                                <span>皆以TWD付款</span>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="order-title">
                                     <div class="panelShowBTN">
                                        <span>共${shoppingCartItems.size()}項商品，總計</span>
                                        <!-- 總計金額 -->
                                        <span class="order-text price-red cms-moneyColor"
                                            id="topTotalPayment">NT$<span>${totalWithDeliveryFee}</span>
                                        </span>
                                        
                                        <!--收合符號  -->
                                        <div class="order-toggle">
                                        <i class="fa-solid fa-angles-down" id="angles-down"></i>
                                        <i class="fa-solid fa-angles-up" id="angles-up"></i>
                                        </div>
                                     </div>
                                     
                                        <!-- 點了想要顯示麼訂單內容 -->
                                        <div class="panelShow">
                                        <div class="payProcess-block-lightgrey">
        									<div>
        										<!-- 商品 -->
        										<ul>
        										<%
        										List<ShoppingCartItem> shoppingCartItems = (List<ShoppingCartItem>) session.getAttribute("shoppingCartItems");
        										for(ShoppingCartItem shoppingCartItem : shoppingCartItems){
        			                            	
        			                            	ServletContext application1 = getServletContext();
        			                				WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(application1);
        			                				CommodityService cService = context.getBean("cService",CommodityService.class);
        			                				
        			                            	Commodity commodity = cService.findCommodityById(shoppingCartItem.getCommodityNo());
        			                            	String commodityImage = "/group5/commodityImages/"+commodity.getCommodityNo()+"_image1.jpg";
        										%>
                									<li class="order-detail-item">
                    									<div class="order-detail-left">
                        									<img class="salePage-img" src="<%=commodityImage%>">
                    									</div>
                    									
                    									<div class="order-detail-right">
                        									<p class="salePage-title" name="order-detail-item-title"><%=commodity.getCommodityName()%></p>
                        									<p class="salePage-desc"><%=commodity.getCommodityStyle()%></p>
                       		 								<div class="salePage-qty">
                            									<span>數量：</span>
                            									<span id="salePageQty_1"><%=shoppingCartItem.getQuantity()%></span>
                        									</div>
                        									
                        									<divclass="salePage-currency" id="salePagePrice_1">NT$<%=shoppingCartItem.getSubtotal()%></div>
                    									</div>
                									</li>
                							  <%} %>
                									
            									</ul>
        									</div>
        
        									<!--總結清單-->
        									<ul class="detail-consumption">
            									<li class="detail-item">
                									<p class="detail-title">商品小計(含折扣)</p>
                									<p class="detail-price" id="totalPrice">NT$ ${totalWithCoupon}</p>
            									</li>
           
           										<!--免/運費-->
            									<li class="detail-item">
                									<p class="detail-title">運費</p>
                									<p class="detail-price" id="fee">
                    									<span>${shippingFee}</span>
                									</p>
            									</li>
            
            									<li class="detail-item">
            										<!--共X項商品，總計-->
                									<p class="detail-title">
                    								<span id="bottomSalePageCount">共${shoppingCartItems.size()}項商品，總計</span>
                    								</p>
                    								<!--總計-->
                									<p class="detail-price detail-price__total price-red cms-moneyColor" id="bottomTotalPayment">
                									NT$ ${totalWithDeliveryFee }
                									</p>
            									</li>
        									</ul>
    									</div>
    									</div>

                                        
                                    </div>
                                </div>
                            </div>
                        </div>



                        <!-- 收件人資訊 -->
                        <form name="MemberLocationForm" id="receiver"
                            class="ng-pristine ng-valid-only-cellphone ng-valid-maxlength ng-valid-continuous-chinese-or-english ng-invalid ng-invalid-required ng-valid-pattern ng-valid-minlength">
                            <div class="payProcess-block payProcess-block-lightgrey height-block">
                                <div class="payProcess-item">
                                    <h2 class="payProcess-block-title inline-block required-star">收件人資訊
                                    </h2>

                                    <!-- 填寫收件人資訊 -->
                                    <div class="payProcess-item-row payProcess-item-row-white round-top">
                                        <label class="info-title">姓名</label>
                                        <input type="text"
                                            class="text ng-pristine ng-valid-continuous-chinese-or-english ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-valid-minlength ng-valid-maxlength ng-touched"
                                            id="receiverFullName" name="FullName" required="" minlength="2"
                                            maxlength="40" placeholder="請輸入真實姓名" style="">
                                    </div>
                                    <div class="payProcess-item-row payProcess-item-row-white">
                                        <label class="info-title">手機號碼</label>
                                        <input type="tel"
                                            class="text ng-pristine ng-untouched ng-valid ng-valid-only-cellphone ng-not-empty ng-valid-required ng-valid-maxlength"
                                            id="receiverCellPhone" name="CellPhone" maxlength="10" required=""
                                            placeholder="輸入有效手機號碼">
                                    </div>
                                    
                                    <!-- 宅配地址 -->
                                    <h2 class="payProcess-block-title pt-lg required-star ng-hide">收件地址</h2>
                                    <!-- 地址 -->
                                    <div class="address-block ng-pristine ng-invalid ng-invalid-required ng-valid-pattern">
                                    
                                        <div class="item-row ">
                                            <div class="choose-place split">
                                                <input class="js-demeter-tw-zipcode-selector" data-city="#city3"
                                                    data-dist="#dist3" placeholder="請輸入郵遞區號" value="" type="hidden">

                                                <select id="city3" placeholder="請選擇縣市"
                                                    class="option ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required"></select>
                                            </div>
                                            
                                            <div class="choose-place">
                                                <select id="dist3" placeholder="請選擇鄉鎮區"
                                                    class="option ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required"></select>
                                            </div>
                                        </div>
                                        
                                        <div class="item-row round-bottom">
                                            <input type="text"
                                                class="address-text ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required ng-valid-pattern"
                                                required="required" placeholder="請輸入地址">
                                        </div>
                                        
                               </form>
                               
                               <form action="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut/V5" method="post">
                                        <div class="payProcess-block-lightgrey button-area">
                                        	<input type="hidden" name="MerchantID" value="3002607">
                                        	<input type="hidden" name="MerchantTradeNo" value="${orderNo}">
                                        	<input type="hidden" name="MerchantTradeDate" value="${tradeDate}">
                                        	<input type="hidden" name="PaymentType" value="aio">
                                        	<input type="hidden" name="TotalAmount" value="${totalWithDeliveryFee}">
                                        	<input type="hidden" name="TradeDesc" value="test Description">
                                        	<input type="hidden" name="ItemName" value="iFit線上購物">
                                        	<input type="hidden" name="ReturnURL" value="http://localhost:8080/group5/user/myorder">
                                        	<input type="hidden" name="ChoosePayment" value="Credit">
                                        	<input type="hidden" name="CheckMacValue"
            										value="${CheckMacValue}">
            								<input type="hidden" name="EncryptType" value="1">
                                        
        									<input type="submit" value="送出" class="btn-red btn-medium btn-submit clear-float cms-primaryBtnTextColor cms-primaryBtnBgColor">
    									</div>
    									
    						</form>
                                    </div>
                                    
                                </div>
                            </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	
	<%@ include file="../admin/FrontStageFoot.jsp" %>
	
	
	<script type="text/javascript">
	$(function(){
		
		$('#angles-down').show();
		$('#angles-up').hide();
		$(".panelShow").hide();
		
		<!--收合顯示商品細項 -->
		$(".panelShowBTN").click(function(){
		    $(".panelShow").slideToggle("slow");
		    $('#angles-down').slideToggle();
		    $('#angles-up').slideToggle();
		  });
		
	});
	</script>
	
</body>
</html>