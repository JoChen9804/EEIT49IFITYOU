<%@page import="tw.group5.commodity.model.Commodity"%>
<%@page import="tw.group5.commodity.service.CommodityService"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="java.util.List"%>
<%@page import="tw.group5.shopping.model.ShoppingCartItem"%>
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
       

    <style>
    .commodity-panal-title{
    font-weight: bold;
    margin-bottom: 10px;
    line-height: 17px;
    display: -webkit-box;
    height: 34px;
    }
    
    .commodity-panal-style{
    font-size: 12px;
    margin-bottom: 10px;
    line-height: 17px;
    display: -webkit-box;
    }
    
    .commodity-panal-quantity{
    font-size: 12px;
    margin-bottom: 10px;
    line-height: 17px;
    display: -webkit-box;
    }
    
    .commodity-panal-currency{
    display: -webkit-box;
    }
    
    #choose-storeBTN {
    width:100%;
    text-align:left;
    }
    
    </style>
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
                        									<p class="commodity-panal-title" name="order-detail-item-title"><%=commodity.getCommodityName()%></p>
                        									<p class="commodity-panal-style"><%=commodity.getCommodityStyle()%></p>
                       		 								<p class="commodity-panal-quantity">
                            									<span>數量：</span>
                            									<span><%=shoppingCartItem.getQuantity()%></span>
                        									</p>
                        									
                        									<div class="commodity-panal-currency" id="salePagePrice_1">NT$<%=shoppingCartItem.getSubtotal()%></div>
                    									</div>
                									</li>
                							  <%} %>
                									
            									</ul>
            									
            									
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
                        </div>



                        <!-- 收件人資訊 -->
                        <div>
                            <div class="payProcess-block payProcess-block-lightgrey height-block">
                                <div class="payProcess-item">
                                
                                    <!-- 填寫收件人資訊 -->
                                    <h2 class="payProcess-block-title inline-block required-star">收件人資訊</h2>
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
                                    
                                    
                                    <h2 class="payProcess-block-title pt-lg required-star ng-hide">收件地址</h2>
                                    <div class="address-block ng-pristine ng-invalid ng-invalid-required ng-valid-pattern">
                                    
                                        <!-- 宅配地址 -->
                                        <c:if test="${shippingType =='宅配' || shippingType =='離島宅配'}">
                                        <div class="item-row ">
                                            <div class="choose-place split">
                                                <input class="js-demeter-tw-zipcode-selector" data-city="#city3"
                                                    data-dist="#dist3" placeholder="請輸入郵遞區號" value="" type="hidden">

                                                <select id="city3" placeholder="請選擇縣市"
                                                    class="option ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required"></select>
                                            </div>
                                            
                                            <div class="choose-place">
                                                <select id="dist3" placeholder="請選擇鄉鎮區"
                                                    class="option ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" name="district"></select>
                                            </div>
                                        </div>
                                        
                                        <div class="item-row round-bottom">
                                            <input type="text"
                                                class="address-text ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required ng-valid-pattern"
                                                required="required" placeholder="請輸入地址" id="address">
                                        </div>
                                        
                                        <div class="payProcess-block-lightgrey button-area" id="orderInformationSend">
                                        	<input type="submit" value="確認收件人資訊" class="btn-red btn-medium btn-submit clear-float cms-primaryBtnTextColor cms-primaryBtnBgColor">
                                        </div>
                                        
                                        </c:if>
                                      
                                      
                                        <!-- 超商取貨 -->
                                        <c:if test="${shippingType =='UNIMART' || shippingType =='HILIFE' || shippingType =='FAMI'}">
                                        <form action="https://logistics-stage.ecpay.com.tw/Express/map" method="post"> 
                                        	<input type="hidden" name="MerchantID" value="2000132">
                                        	<input type="hidden" name="MerchantTradeNo" value="${orderNo}">
                                        	<input type="hidden" name="LogisticsType" value="CVS">
                                        	<input type="hidden" name="LogisticsSubType" value="${shippingType}">
                                        	<input type="hidden" name="IsCollection" value="N">
                                        	<input type="hidden" name="ServerReplyURL" value="http://localhost:8080/group5/user/store_result">
                                        	
                                        	<button type="submit" class="payProcess-item-row payProcess-item-row-white choose-store  round-bottom" id="choose-storeBTN">
                								<div>
                									<c:if test="${shippingType =='UNIMART'}">
                									<i class="sevenEleven-icon"></i>
                									</c:if>
                									<c:if test="${shippingType =='HILIFE'}">
                									<i class="hiLife-icon"></i>
                									</c:if>
                									<c:if test="${shippingType =='FAMI'}">
                									<i class="familyMart-icon"></i>
                									</c:if>
                									
                									<c:if test="${storeName == null }">
                    								<span class="choose-store-text" id="storeNameForSevenEleven">請選擇取貨門市</span>
                    								</c:if>
                    								<c:if test="${storeName != null }">
                    								<span class="choose-store-text" id="storeNameForSevenEleven">${storeName} ( ${storeAddress} )</span>
                    								</c:if>
                    								<i class="arrow-right"></i>
                								</div>
           									</button>
                                        </form>
                                        
                                        <div class="payProcess-block-lightgrey button-area" id="orderInformationSend2">
                                        	<input type="submit" value="確認收件人資訊" class="btn-red btn-medium btn-submit clear-float cms-primaryBtnTextColor cms-primaryBtnBgColor">
                                        </div>
                                        
                                        </c:if>
                                        
                                        
                               		</div>
                                
                                <!-- 要去綠界付款的 -->
                                <c:if test="${payType == '信用卡一次付清' }">
                               	<form action="https://payment-stage.ecpay.com.tw/Cashier/AioCheckOut/V5" method="post" id="ECpayForm">
                                        <div class="payProcess-block-lightgrey button-area">
                                        	<input type="hidden" name="MerchantID" value="3002607">
                                        	<input type="hidden" name="MerchantTradeNo" value="${orderNo}">
                                        	<input type="hidden" name="MerchantTradeDate" value="${tradeDate}">
                                        	<input type="hidden" name="PaymentType" value="aio">
                                        	<input type="hidden" name="TotalAmount" value="${totalWithDeliveryFee}">
                                        	<input type="hidden" name="TradeDesc" value="test Description">
                                        	<input type="hidden" name="ItemName" value="iFit線上購物">
                                        	<input type="hidden" name="ReturnURL" value="http://localhost:8080/group5/user/order_result">
                                        	<input type="hidden" name="OrderResultURL" value="http://localhost:8080/group5/user/order_result">
                                        	<input type="hidden" name="ChoosePayment" value="Credit">
                                        	<input type="hidden" name="CheckMacValue"
            										value="${CheckMacValue}">
            								<input type="hidden" name="EncryptType" value="1">
                                        
        									<input type="submit" value="送出" class="btn-red btn-medium btn-submit clear-float cms-primaryBtnTextColor cms-primaryBtnBgColor">
    									</div>
    							</form>
    							</c:if>
    							
    							<c:if test="${payType == '貨到付款' }">
                               	<form action="/group5/user/order_result2" method="post" id="ECpayForm">
                                        <div class="payProcess-block-lightgrey button-area">
        									<input type="submit" value="送出" class="btn-red btn-medium btn-submit clear-float cms-primaryBtnTextColor cms-primaryBtnBgColor">
    									</div>
    							</form>
    							</c:if>
    							
    							
    							
    							
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
		
		<!--先出現送出收貨人資料的Button，並隱藏送往綠界的form -->
		$('#orderInformationSend').show();
		$('#ECpayForm').hide();
		
		<!--點了先送收件人資訊到後台(宅配的)，並出現綠界或結束 -->
		$('#orderInformationSend').click(function(){
			
			<!--送收件人資訊 -->
				var pickerName = $('#receiverFullName').val();
				var pickerCellphone = $('#receiverCellPhone').val();
				var city = $('#city3').val();
				var district = $('#dist3').val();
				var address = $('#address').val();
				var deliveryAddress = city+" "+district+" "+address;
				
				params = {"pickerName":pickerName,"pickerCellphone":pickerCellphone,"deliveryAddress":deliveryAddress};
				
				$.ajax({
					type:"POST",
	  				url:"/group5/user/pay/order_pickerInformation1",
	  				contentType:'application/json',
	  				data:JSON.stringify(params),
	  				context: this,
	  				success: function(){
	  					$(this).hide();
	  					$('#ECpayForm').show();
	  					$('#receiverFullName').attr('readonly',true);
	  					$('#receiverCellPhone').attr('readonly',true);
	  					$('#city3').attr('readonly',true);
	  					$('#dist3').attr('readonly',true);
	  					$('#address').attr('readonly',true)
	  				}
				});	
		})
		
		<!--點了先送收件人資訊到後台(超商取貨的)，並出現綠界或結束 -->
		$('#orderInformationSend2').click(function(){
			
			<!--送收件人資訊 -->
				var pickerName = $('#receiverFullName').val();
				var pickerCellphone = $('#receiverCellPhone').val();
				
				params = {"pickerName":pickerName,"pickerCellphone":pickerCellphone};
				
				$.ajax({
					type:"POST",
	  				url:"/group5/user/pay/order_pickerInformation2",
	  				contentType:'application/json',
	  				data:JSON.stringify(params),
	  				context: this,
	  				success: function(){
	  					$(this).hide();
	  					$('#ECpayForm').show();
	  					$('#receiverFullName').attr('readonly',true);
	  					$('#receiverCellPhone').attr('readonly',true);
	  				}
				});	
		})
		
		
		<!--收合顯示商品細項 -->
		$('#angles-down').show();
		$('#angles-up').hide();
		$(".panelShow").hide();
		
		$(".panelShowBTN").click(function(){
		    $(".panelShow").slideToggle("slow");
		    $('#angles-down').slideToggle();
		    $('#angles-up').slideToggle();
		  });
		
		
	});
	</script>
	
</body>
</html>