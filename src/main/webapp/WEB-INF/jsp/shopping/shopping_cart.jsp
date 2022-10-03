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
    <title>確認購物車 - iFit</title>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

    <link rel="stylesheet" type="text/css" href="/shoppingCss/shopping-main.css">
    
    <script src="https://kit.fontawesome.com/0d0c16b1bb.js" crossorigin="anonymous"></script>
    
    <link
        href="//official-static.91app.com/V2/bundles/v-638000899589737964-v/css/shoppingCart/index/Desktop?v=Obk4B9SQ-i4Mb7PQx2LIzMGvrsxgsAFY4hEcsvBLiM81"
        rel="stylesheet">
    
</head>


<body>

    <%@ include file="../shopping/shoppingFrontStageHead.jsp" %>
    
    <div class="center-sub-content" style="margin-top:80px">
    	<ns-progress-bar type="$root.headerProgressBarModelType">
        	<div class="header-progress-bar">
            	<ul>
                	<li class="step1 active cms-moneyColor" style="">
                        <span>
                            <span class="index cms-moneyBgColor" style="">1</span>
                            <span class="step-title cms-moneyColor cms-moneyBorderColor">確認購物車</span>
                        </span>
                    </li>
                   
                    <li class="step-arrow">
                        <span>
                            <i class="fa fa-angle-right cms-moneyColor"></i>
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
                    <li class="step3">
                        <span>
                            <span class="index">3</span>
                            <span class="step-title">資料填寫</span>
                        </span>
                    </li>
                </ul>
            </div>
            
        </ns-progress-bar>
        <div class="cart-wrapper">
            <!---->
            <div ui-view="" autoscroll="true">
                
                <div ui-view="">
                <!--空購物車-->
                <%
                List<ShoppingCartItem> shoppingCartItems = (List<ShoppingCartItem>) session.getAttribute("shoppingCartItems");
                if( shoppingCartItems.size() == 0){
                %>
                    <div class="cart-empty">
                    	<img src="//official-static.91app.com/V2/Content/Images/Icon/emptycart.png">
                    	<div class="cart-empty__message">
                        	<p>您的購物車還未有商品</p>
                        	<a href="/group5/shopping">繼續購物</a>
                    	</div>
                	</div>
              <%}else {%>
                
                <!--非空購物車-->
                    <div class="cart-wrapper-row hide-at-mobile">共<span id="showNumber">${shoppingCartItems.size()}</span>項商品</div>
                    
                    <!--若購物車被刪空-->
                    <div class="cart-empty" style="display:none;">
                    	<img src="//official-static.91app.com/V2/Content/Images/Icon/emptycart.png">
                    	<div class="cart-empty__message">
                        	<p>您的購物車還未有商品</p>
                        	<a href="/group5/shopping">繼續購物</a>
                    	</div>
                	</div>
                    
                    
                    
                    <div class="cart-wrapper-container">
                    
                        <!--商品清單-->
                        <div class="cart-content-container has-border has-bottom-gutter merchandise-list">
                            <%
                            int total = 0;
                           
                            for(ShoppingCartItem shoppingCartItem : shoppingCartItems){
                            	
                            	ServletContext application1 = getServletContext();
                				WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(application1);
                				CommodityService cService = context.getBean("cService",CommodityService.class);
                				
                            	Commodity commodity = cService.findCommodityById(shoppingCartItem.getCommodityNo());
                            	String commodityImage = "/group5/commodityImages/"+commodity.getCommodityNo()+"_image1.jpg";
                            	
                            	total += shoppingCartItem.getSubtotal();
                            %>
                            <div class="merchandise ">
                            	<div class="cart-content has-bottom-gutter">
                                	<!--商品圖片和名稱-->
                                    	<a class="row has-hozl-gutter" href="/group5/shopping.detail/<%=shoppingCartItem.getCommodityNo()%>">
                                        	<figure>
                                            	<img src="<%=commodityImage %>"
                                            	     alt="<%=commodity.getCommodityName() %>">	
                                        	</figure>
                                        	<div class="merchandise-title"><%=commodity.getCommodityName() %></div>
                                        	<div class="merchandise-sku"><%=commodity.getCommodityStyle() %></div>
                                    	</a>
                                    	
                                    	
                                    	<!--刪除按鈕  -->
                                        <button id="delete" class="icon icon-close close-btn" style="font-size:20px" value=<%=shoppingCartItem.getIdentityNumber()%>>
                                        	<i class="fa-solid fa-trash-can"></i>
                                        </button>
                                        

                                    	<!--商品數量和價格-->
                                    	<div class="row has-hozl-gutter">
                                        	<div class="qty-and-price-area">
                                            	<div class="counter qty-and-price-area__qty-counter">
                                                	<button class="decrease-btn" value="<%=shoppingCartItem.getIdentityNumber()%>">
                                                		<i class="fa-solid fa-minus"></i>
                                                	</button>
                                                	<span class="qty" id="cart_merchandise_qty"><%=shoppingCartItem.getQuantity() %></span>
                                                	<button class="increase-btn" value="<%=shoppingCartItem.getIdentityNumber()%>">
                                                		<i class="fa-solid fa-plus"></i>
                                                	</button>
                                            	</div>
                                            
                                            
                                            	<!-- 輸入折扣卷後顯示折扣 -->
                                            	<div class="fee-container qty-and-price-area__price">
                                            		<div class="fee-prefix-text cms-moneyColor invisible">折扣後</div>
                                                
                                                	<!-- 原總價 -->
                                                	<div class="fee cms-moneyColor">NT$<%=shoppingCartItem.getSubtotal() %></div>
                                                
                                                	<!-- 顯示省多少 -->
                                                	<div class="invisible">省 NT$9</div>
                                                
                                            	</div>
                                        	</div>
                                    	</div>
                                    	
                                    
                                </div>
                                <!---->
                                <!-- 贈品券商品列表 -->
                                <!---->
                            </div>
                       <% }%>
                        </div>
                        
                        
                        
                        <!-- 優惠碼專區 -->
                        <div class="ecoupon-block">
                            <div class="ecoupon-block__header">
                                <div class="ecoupon-title">
                                    <span>優惠碼</span>
                                </div>
                            </div>
                            <!-- 優惠券選擇器入口 -->
                            <div class="ecoupon-block__action">
                                <div class="ecoupon-block__action__desc">
                                    <input type="text" placeholder="請輸入優惠碼">
                                </div>
                                
                                <span>
                                    <button>使用</button>
                                </span>
                            </div>
                            
                            <!-- 優惠券使用狀況資訊顯示 -->
                            <div class="ecoupon-block__content">
                                <!-- 尚有優惠券可以使用" -->
                                <!---->
                                <!-- 已使用推薦碼 -->
                                <!---->
                                <!-- 已使用運費券 -->
                                <!---->
                                <!-- 已使用折價券 -->
                                <!---->
                                <!-- 已領取贈品 -->
                                <!---->
                            </div>
                        </div>
                        
                        
                        
                        <!--購物車金額整理-->
                        <div class="cart-content-container">
                            <div class="cart-full-content">
                                <div class="row has-hozl-gutter">
                                    <div class="cart-conclusion">
                                        <div class="conclusion-row">
                                            <div class="conclusion-li__left">商品金額小計</div>
                                            <div class="conclusion-li__right fee">NT$<span id="cartTotal"><%=total %></span></div>
                                        </div>
                                        
                                        <!--折扣-->
                                        <div class="conclusion-row">
                                            <div class="conclusion-li__left">折扣碼</div>
                                            <div class="conclusion-li__right fee">-NT$</div>
                                        </div>
                                        
                                        
                                        <!--總計-->
                                        <div class="conclusion-row has-top-border has-top-gutter">
                                            <div class="conclusion-li__left">
                                                <div class="highlight">共<span id="showNumber2">${shoppingCartItems.size()}</span>項商品</div>
                                            </div>
                                            
                                            <div class="conclusion-li__right fee red total bold cms-moneyColor">NT$<span id="cartTotal2"><%=total %></span></div>
                                        </div>
                                        
                                       
                                    </div>
                                </div>
                            </div>

               
                    <!-- 下一步 -->
                    <div class="cart-content-container cart-footer cart-footer-sticky">
                        <div>
                           <div class="sticky-area">
                                <!-- 運送區域-->
                                <div class="sticky-area__block sticky-area__shipping-area">
                                    <div class="composite-area__info__shipping__contentWrapper">
                                        <i class="icon icon-oversea-order"></i>
                                        <span class="sticky-area__shipping-area--text">運送地區：台灣</span>
                                    </div>
                                </div>

                                <!--小計-->
                                <div class="sticky-area__block sticky-area__payment">
                                    <span>小計：</span>
                                    <span class="sticky-area__payment--amount red cms-moneyColor">NT$<span id="cartTotal3"><%=total %></span></span>
                                </div>

                                <!--下一步-->
                                <div class="sticky-area__block">
                                    <label class="next-step-btn__hint ng-hide"></label>
                                    
                                    <form action="/group5/user/shopping.cart/pay" method="post">
                                    <input type="hidden" name="totalWithCoupon" value="<%=total %>" id="totalWithCoupon">
                                    <input type="submit" value="下一步" class="next-step-btn cms-primaryBtnTextColor cms-primaryBtnBgColor">
                                    </form>
                                    
                                    
                                </div>
                           </div>
                        </div>
                    </div>
                    


                    <!-- Desktop加購-->
                    <div class="cart-wrapper-row hide-at-mobile"
                        ng-show="CartCtrl.shoppingCart &amp;&amp; CartCtrl.shoppingCart.isValid()" style="">
                        <a href="/group5/shopping">繼續購物</a>
                        <a ng-href="https://tw.hconnect.com/TraceSalePageList/TraceSalePageList"
                            style="margin-left: 20px"
                            translate="frontend.typescripts.shopping_cart.check_out_my_collection"
                            href="https://tw.hconnect.com/TraceSalePageList/TraceSalePageList">看看我的收藏</a>
                    </div>

                    <!-- 購物車內加入購物車開半頁-->
                    <div class="push-half-page" data-ng-show="IsLoad" ns-push-half-page=""
                        ns-is-open="CartCtrl.OpenMobileAddToCart" ns-open-direction="'bottom'"
                        ns-close-function="CartCtrl.ResetAddToCartProcess()" style="">
                        <div class="half-page-background" data-ng-click="ClosePage()">
                        </div>
                        <div class="half-page-container vertical-container close-bottom">
                            <!---->
                            <!--有預設header區塊再加入scroll-class-->
                            <div class="half-page-content ng-hide"
                                data-ng-class="{'half-page-content--full': IsFullLayout}" data-ng-show="IsOpen">
                                <ng-transclude>
                                    <!---->
                                </ng-transclude>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%} %>
        </div>
        
        
    </div>



    </div>
    
    
      <%@ include file="../admin/FrontStageFoot.jsp" %>
      
      
      <script type="text/javascript">
      $(function(){
    	  
    	<!--刪除商品 -->
    	var deletes = $('.cart-content #delete').toArray();
    	
    	for(var i = 0 ; i < deletes.length ; i++){
    		$(deletes[i]).click(function(){
      			
      			var deleteIdentityNumber = $(this).val();
      			var originalNumber = $('#showNumber').text();
      			
      			$.ajax({
      				type:"POST",
      				url:"shopping.cart.delete",
      				data:"deleteIdentityNumber=" + deleteIdentityNumber,
      				dataType:"json",
      				context: this,
      				success:function(data){
      					alert("商品已從購物車移除!");
      					$(this).parent().parent('.merchandise').remove();
      					
      		  			<!--顯示共幾個 -->
      					$('#showNumber').text(data.numberShow);
      					$('#showNumber2').text(data.numberShow);
      					
      					<!--如果商品數變為0 -->
      					if( data.numberShow == 0 ){
      			  			$('.cart-empty').show();
      			  			$('.cart-wrapper-container').hide();
      			  		}
      					
      					<!--下面金額 -->
      					$('#cartTotal').text(data.total);
      					$('#cartTotal2').text(data.total);
      					$('#cartTotal3').text(data.total);
      					$('#totalWithCoupon').val(data.total);
      				}		
      			});	
      		});
		}
    	
    	
    	<!--數量增減:就是更新數量!! -->
    	var increaseBTNs = $('.counter .increase-btn').toArray();
    	
    	for(var i = 0 ; i < increaseBTNs.length ; i++ ){
    		
    		$(increaseBTNs[i]).on('click',function(){
    			
    			let updateIdentityNumber = $(this).val();
    			
    			let originalQuantity = $(this).prev().text();
    			let newQuantity = parseInt(originalQuantity) + 1;
    			$(this).prev().text(newQuantity);
    			
    			params = {"updateIdentityNumber":updateIdentityNumber,"newQuantity":''+newQuantity};
    			$.ajax({
    				type:"POST",
      				url:"/group5/user/shopping.cart.changeQuantity",
      				contentType:'application/json',
      				data:JSON.stringify(params)
    			});
    			
    			
    			
    		});
    		
 
        		
        	
    	};
    	
    	
    	
    	
  		
  		
  	  });
      </script>
    
    
</body>


</html>