<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Language" content="zh-tw">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>付款與運送方式</title>

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
	
	    <!-- 上方流程條 -->
    	<ns-progress-bar type="$root.headerProgressBarModelType">
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

                   	<li class="step2 active cms-moneyColor">
                   		<span>
                        	<span class="index cms-moneyBgColor">2</span>
                           	<span class="step-title cms-moneyColor cms-moneyBorderColor">付款與運送方式</span>
                        </span>
                   	</li>

                    <li class="step-arrow">
                      	<span>
                        	<i class="fa fa-angle-right cms-moneyColor"></i>
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
       	
       	
       	<!-- 選擇列 -->
       	<div class="cart-wrapper">
        	<div>
            	<div>
                	<div class="cart-wrapper-container">

                    	<!--支付方式選擇-->
                        <div class="cart-content-container has-border has-bottom-gutter">
                        	<div class="flow payment-list">
                            	<div class="cart-full-content flow-title">
                                	<h2 class="row has-hozl-gutter title">付款方式</h2>
                                </div>
                                
                                <ul class="flow-ul">
                                   
                                 <label class="flow-li">
                                	<li>
                                    	<div class="cart-content flow-li__content">
                                       		<div class="row has-hozl-gutter margin-right-20">
                                            	<div class="credit-card-once">
                                               		<div class="left-content">
                                                    	<input type="radio" name="payType" value="信用卡一次付清" checked>
                                                        <i class="icon circle icon-circle"></i>
                                                        <span class="flow-li-title pay-type-name">信用卡一次付清</span>
                                                    </div>
                                                    
                                                    <!-- 發卡組織圖示 -->
                                                    <div class="right-content credit-card-list">
                                                    	<i class="card-desc_img visa"></i>
                                                        <i class="card-desc_img mastercard"></i>
                                                        <i class="card-desc_img jcb"></i>
                                                    </div>          
                                                 </div>
                                            </div>
                                         </div>
                                    </li>
                                 </label>        
                                 
                                 <label class="flow-li">       
                                    <li>
                                    	<div class="cart-content flow-li__content">
                                       		<div class="row has-hozl-gutter margin-right-20">
                                            	<div class="credit-card-once">
                                               		<div class="left-content">
                                                    	<input type="radio" name="payType" value="貨到付款">
                                                        <i class="icon circle icon-circle"></i>
                                                        <span class="flow-li-title pay-type-name">貨到付款</span>
                                                    </div>
                                                </div>
                                            </div>
                                                        
                                       </div>
                                  	</li>
                                </label> 
                        		</ul>
                          	</div>
                         </div>
                         
                        	 
                         <!--物流清單-->
                		 <div class="cart-content-container has-border">
                    		<div class="flow delivery-list">
                    		
                        		<div class="cart-full-content flow-title">
                            		<h2 class="row has-hozl-gutter title">運送方式</h2>
                        		</div>
                        		
                        		<ul class="flow-ul">
                                	<label class="flow-li">
                            			<li>
                                			<div class="cart-content flow-li__content cart-full-content">
                                    			<ul class="row has-hozl-gutter has-bottom-gutter"></ul>
                                    			<div class="row has-hozl-gutter has-bottom-gutter">
                                        			<div class="list-wrapper">
                                        	
                                            			<!-- 配送方式 Radio Button -->
                                            			<div class="left">
                                                			<input type="radio" name="shippingType" value="SevenElevenPickup" checked>
                                                			<i class="icon circle icon-radio-selected"></i>
                                            			</div>
                                            		
                                            			<!-- 配送方式 Icon -->
                                            			<div class="left">
                                                			<img class="delivery-icon" src="/shoppingCss/711.svg">
                                                		</div>
                                                		
                                            			<!-- 配送方式名稱 -->
                                            			<div class="flow-content">
                                                			<span class="flow-li-title">7-ELEVEN取貨</span>
                                            			</div>
                                            			
                                            			<!-- 運費 -->
                                            			<div class="flow-fee cms-moneyColor">
                                                			<!-- 運費金額 or 免運 -->
                                                			<div id="deliveryFee"></div>
                                            			</div>
                                            			
                                        			</div>
                                    			</div>
                                    			
                                    			<ul class="row has-hozl-gutter delivery-info">
                                        			<li>
                                            			<span>
                                                			<span id="creditPay">付款後7-11取貨</span>
                                                			<span id="noPay">7-11貨到付款</span>
                                                			
                                               				<span>(<span id="deliveryFeeDescribe"></span>)</span>
                                            			</span>
                                        			</li>
                                    			</ul>
                                    
                                			</div>
                            			</li>
                            		</label>  
                        
                        
                        
                        
                            <label class="flow-li">
                             <li>
                            	<div class="cart-content flow-li__content">
                                	<ul class="row has-hozl-gutter has-bottom-gutter"></ul>
                                    	<div class="row has-hozl-gutter has-bottom-gutter">
                                        	<div class="list-wrapper">
                                        	
                                            	<!-- 配送方式 Radio Button -->
                                            	<div class="left">
                                                	<input type="radio" name="shippingType" value="HiLifePickup">
                                                	<i class="icon circle icon-circle"></i>
                                            	</div>
                                            	
                                            	<!-- 配送方式 Icon -->
                                            	<div class="left">
                                                	<img class="delivery-icon" src="/shoppingCss/hilife.svg"> 
                                            	</div>
                                            	
                                            	<!-- 配送方式名稱 -->
                                            	<div class="flow-content">
                                                	<span class="flow-li-title">萊爾富取貨</span>     
                                            	</div>
                                            
                                            	<!-- 運費 -->
                                            	<div class="flow-fee">
                                                	<!-- 運費金額 or 免運 -->
                                                	<div id="deliveryFee"></div>
                                                </div>
                                           </div>
                                    	</div>
                                    	
                                    <ul class="row has-hozl-gutter delivery-info">
                                    	<li>
                                    		<span>
                                            	<span id="creditPay">付款後萊爾富取貨</span>
                                                <span id="noPay">萊爾富貨到付款</span>
                                                			
                                             	<span>(<span id="deliveryFeeDescribe"></span>)</span>
                                                
                                            </span>
                                        </li>
                                        
                                    </ul>
                                    
                                </div>
                            </li>
                           </label>
          
          
          
          
                            <label class="flow-li">
                             <li>
                            	<div class="cart-content flow-li__content">
                                	<ul class="row has-hozl-gutter has-bottom-gutter"></ul>
                                    <div class="row has-hozl-gutter has-bottom-gutter">
                                    	<div class="list-wrapper">
                                    	
                                        	<!-- 配送方式 Radio Button -->
                                            <div class="left">
                                                <input type="radio" name="shippingType" value="FamilyPickup">
                                                <i class="icon circle icon-circle"></i>
                                            </div>
                                            
                                            <!-- 配送方式 Icon -->
                                            <div class="left">
                                            	<img class="delivery-icon" src="/shoppingCss/family.svg">
                                            </div>
                                            
                                            <!-- 配送方式名稱 -->
                                            <div class="flow-content">
                                                <span class="flow-li-title">全家取貨</span>
                                            </div>
                                            
                                            <!-- 運費 -->
                                            <div class="flow-fee">
                                            	<!-- 運費金額 or 免運 -->
                                                <div id="deliveryFee"></div>   
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <ul class="row has-hozl-gutter delivery-info"><!---->
                                    	<li>
                                    		<span>
                                            	<span id="creditPay">付款後全家取貨</span>
                                                <span id="noPay">全家貨到付款</span>
                                                			
                                             	<span>(<span id="deliveryFeeDescribe"></span>)</span>
                                                
                                            </span>
                                        </li>
                                        <!---->
                                    </ul>
                                </div>
                            </li>
                            </label>
                      
                      
                            
                            <label class="flow-li">
                            <li>
                                <div class="cart-content flow-li__content">
                                	<ul class="row has-hozl-gutter has-bottom-gutter"></ul>
                                    <div class="row has-hozl-gutter has-bottom-gutter">
                                    	<div class="list-wrapper">
                                    	
                                            <!-- 配送方式 Radio Button -->
                                            <div class="left">
                                            	<input type="radio" name="shippingType" value="Home">
                                                <i class="icon circle icon-circle"></i>
                                            </div>
                                            
                                            <!-- 配送方式 Icon -->
                                            <div class="left">
                                            </div>
                                            
                                            <!-- 配送方式名稱 -->
                                            <div class="flow-content">
                                                <span class="flow-li-title">宅配</span>
                                            </div>
                                            
                                            <!-- 運費 -->
                                            <div class="flow-fee">
                                                <!-- 運費金額 or 免運 -->
                                                <div id="deliveryFee"></div>  
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <ul class="row has-hozl-gutter delivery-info">
                                        <li>
                                        	<span>
                                            	<span id="creditPay">宅配</span>
                                                <span id="noPay">宅配貨到付款</span>
                                                			
                                             	<span>(<span id="deliveryFeeDescribe"></span>)</span>
                                                
                                            </span>
                                            
                                        </li>
                                    </ul>
                                       
                                </div>
                            </li>
                            </label>
                            
                            
                            
                            
                            <label class="flow-li">
                            <li>
                                <div class="cart-content flow-li__content">
                                	<ul class="row has-hozl-gutter has-bottom-gutter"></ul>
                                    	<div class="row has-hozl-gutter has-bottom-gutter">
                                        	<div class="list-wrapper">
                                        	
                                            	<!-- 配送方式 Radio Button -->
                                            	<div class="left">
                                                	<input type="radio" name="shippingType" value="islandHome">
                                                	<i class="icon circle icon-circle"></i>
                                            	</div>
                                            	
                                            	<!-- 配送方式 Icon -->
                                            	<div class="left">
                                            	</div>
                                            
                                            	<!-- 配送方式名稱 -->
                                            	<div class="flow-content">
                                                	<span class="flow-li-title">離島宅配</span>
                                            	</div>
                                            
                                            	<!-- 運費 -->
                                            	<div class="flow-fee">
                                                	<!-- 運費金額 -->
                                                	<div>NT$220</div>
                                            	</div>
                                            </div>
                                    	</div>
                                    	
                                    <ul class="row has-hozl-gutter delivery-info">
                                        <li>
                                        	<span>
                                                <span>離島黑貓宅配</span>
                                                <span>(<span>固定運費NT$220</span>)</span>
                                            </span>
                                        </li>
                                    </ul>
                                      
                                </div>
                            </li>
                            </label>
                            
                            
                            
                        </ul>
                    </div>
                </div>
                
                
                
                <!---->
                <div class="cart-content-container ng-hide">
                    <div class="flow shipping-info">
                    
                        <div class="info">
                            <div class="label">運送地區</div>
                            <div class="content">台灣</div>
                        </div>
                    </div>
                </div>
                
                
                <!--購物車各金額整理-->
                <div class="cart-content-container">
                    <div class="cart-full-content">
                        <!--各費用-->
                        <div class="row has-hozl-gutter">
                            <div class="cart-conclusion">
                            
                                <!--一般小計-->
                                <div class="conclusion-row">
                                    <div class="conclusion-li__left">折扣後小計</div>
                                    <div class="conclusion-li__right fee">NT$ ${totalWithCoupon} </div>
                                </div>
                                
                                <!--運費-->
                                <div>
                                	<div class="conclusion-row conclusion-row--thin">
                                    	<div class="conclusion-li__left">
                                            <span class="delivery__title">
                                                <span>運費</span>
                                            </span>
                                        </div>
                                        <div class="conclusion-li__right fee" id="calculateDeliveryFee"></div>
                                    </div>
                                    <div class="conclusion-row conclusion-row--thin delivery__fee-text">(再湊 NT$<span id="howmuchfreedelivery"></span>免運)</div>
                                </div>
                                
                                <!--總計-->
                                <div class="conclusion-row has-top-border has-top-gutter">
                                    <div class="conclusion-li__left highlight">共 ${shoppingCartItems.size()} 項商品</div>
                                    <div class="conclusion-li__right fee red total bold cms-moneyColor">NT$<span id="totalWithDeliveryFee"></span></div>
                                </div>
                                
                                <div class="conclusion-row padding-bottom-init">
                                    <div class="conclusion-li__right">(含運費)</div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
                         
                         
                <!-- Desktop置底：國家地區配送、小計、下一步 -->
                <!---->
                <div class="cart-content-container cart-footer cart-footer-sticky ">
                    <div class="sticky-area">
                        <div class="sticky-area__block sticky-area__shipping-area">
                            <div>
                                <i class="icon icon-oversea-order"></i>
                                <span class="sticky-area__shipping-area--text">運送地區：台灣</span>
                            </div>
                        </div>

                        <!--小計-->
                        <div class="sticky-area__block sticky-area__payment">
                            <span>小計：</span>
                            <span class="sticky-area__payment--amount red cms-moneyColor">NT$<span id="DesktopTotalWithDeliveryFee"></span></span>
                        </div>

                        <!--下一步-->
                        <div class="sticky-area__block">
                        
                        	<form action="/group5/user/shopping.cart/pay/orderInformation" method="post">
                        		<input type="hidden" name="formPayType" value="信用卡一次付清" id="formPayType">
                        		<input type="hidden" name="formShippingType" value="123" id="formShippingType">
                        		<input type="hidden" name="formShippingFee" value="" id="formShippingFee">
                            	<input type="hidden" name="formTotalWithDeliveryFee" value="" id="formTotalWithDeliveryFee">
                                <input type="submit" value="下一步" class="next-step-btn cms-primaryBtnTextColor cms-primaryBtnBgColor">
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
		
		<!--運費顯示 -->
		var deliveryFees = $('.flow-fee #deliveryFee').toArray();
		var deliveryFeeDescribes = $('li #deliveryFeeDescribe')
		
		<!--滿1500時 -->
		if( ${totalWithCoupon} >= 1500 ){
			
			<!--差多少免運條隱藏 -->
			$('.delivery__fee-text').hide();
			
			<!--物流選擇旁顯示的運費及物流下方描述條顯示 -->
			for( var i = 0 ; i < deliveryFees.length ; i++){
				console.log(i)
				$(deliveryFees[i]).text("免運");
				$(deliveryFeeDescribes[i]).text("已滿NT$1,500 免運");
			}
			
			<!--預設為7-11取貨 顯示免運，並且算出下方含運費金額 -->
			$('#calculateDeliveryFee').text("免運")
		    $('#formShippingFee').val("免運")

			
			<!--算出加運費總價 -->
			$('#totalWithDeliveryFee').text(${totalWithCoupon})
			$('#DesktopTotalWithDeliveryFee').text(${totalWithCoupon})
			$('#formTotalWithDeliveryFee').val(${totalWithCoupon})
			
			
			<!--可根據選擇再做變化 -->
			$('input[name=shippingType]').on('change',function(){
				var shippingType = $(this).val();
				
				if(shippingType === "islandHome"){
					$('#calculateDeliveryFee').text("NT$220")
					
					<!--算出加運費總價 -->
					$('#totalWithDeliveryFee').text(${totalWithCoupon}+220)
					$('#DesktopTotalWithDeliveryFee').text(${totalWithCoupon}+220)
					$('#formTotalWithDeliveryFee').val(${totalWithCoupon}+220)
					$('#formShippingFee').val("NT$220")
					
				}else {
					$('#calculateDeliveryFee').text("免運")
					
					<!--算出加運費總價 -->
					$('#totalWithDeliveryFee').text(${totalWithCoupon})
					$('#DesktopTotalWithDeliveryFee').text(${totalWithCoupon})
					$('#formTotalWithDeliveryFee').val(${totalWithCoupon})
				    $('#formShippingFee').val("免運")
				}
				
			})
			
		<!--未滿1500時 -->	
		}else{
			
			<!--差多少免運條因預設7-11顯示 -->
			$('#howmuchfreedelivery').text(1500-${totalWithCoupon});
			
			<!--物流選擇旁顯示的運費及物流下方描述條顯示 -->
			for( var i = 0 ; i < deliveryFees.length ; i++){
				$(deliveryFees[i]).text("NT$80");
				$(deliveryFeeDescribes[i]).text("未滿NT$1,500 運費$80");
			}
			
			<!--預設為7-11取貨 顯示運費為NT$80，並且算出下方含運費金額 -->
			$('#calculateDeliveryFee').text("NT$80")
			$('#formShippingFee').val("NT$80")
					    
			<!--算出加運費總價 -->
			$('#totalWithDeliveryFee').text(${totalWithCoupon}+80)
			$('#DesktopTotalWithDeliveryFee').text(${totalWithCoupon}+80)
			$('#formTotalWithDeliveryFee').val(${totalWithCoupon}+80)
			
			
			<!--可根據選擇再做變化 -->
			$('input[name=shippingType]').on('change',function(){
				var shippingType = $(this).val();
				
				if(shippingType === "islandHome"){
					
					<!--選離島差多少免運條隱藏 -->
					$('.delivery__fee-text').hide();
					
					<!--運費顯示 -->
					$('#calculateDeliveryFee').text("NT$220")
					
					<!--算出加運費總價 -->
					$('#totalWithDeliveryFee').text(${totalWithCoupon}+220)
					$('#DesktopTotalWithDeliveryFee').text(${totalWithCoupon}+220)
					$('#formTotalWithDeliveryFee').val(${totalWithCoupon}+220)
					$('#formShippingFee').val("NT$220")

					
				}else {
					
					<!--不是離島差多少免運條顯示 -->
					$('.delivery__fee-text').show();
					$('#howmuchfreedelivery').text(1500-${totalWithCoupon});
					
					<!--運費顯示 -->
					$('#calculateDeliveryFee').text("NT$80")
					
					<!--算出加運費總價 -->
					$('#totalWithDeliveryFee').text(${totalWithCoupon}+80)
					$('#DesktopTotalWithDeliveryFee').text(${totalWithCoupon}+80)
					$('#formTotalWithDeliveryFee').val(${totalWithCoupon}+80)
					$('#formShippingFee').val("NT$80")
					
				}
			})
			
		}
		
		
		
		
		
		<!--物流下方解說 預設顯示信用卡付款，且可判斷選了什麼跟著改變 -->
		var creditPays = $('li #creditPay').toArray();
		var noPays = $('li #noPay').toArray();
		
		for(var i = 0 ; i < creditPays.length ; i++){
			$(creditPays[i]).show();
			$(noPays[i]).hide();
		}
		
		$('input[name=payType]').on('change',function(){
			
			var payType = $(this).val();
			
			if(payType === "信用卡一次付清"){
				for(var i = 0 ; i < creditPays.length ; i++){
					$(creditPays[i]).show();
					$(noPays[i]).hide();
				}
				
				$('#formPayType').val("信用卡一次付清");
				
			}else if(payType === "貨到付款"){
				for(var i = 0 ; i < creditPays.length ; i++){
					$(creditPays[i]).hide();
					$(noPays[i]).show();
				}
				
				$('#formPayType').val("貨到付款");
			}
				
		});
		
		
		
		
		
		
		
	});
	</script>
	

</body>
</html>