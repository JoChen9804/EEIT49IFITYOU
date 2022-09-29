<%@page import="tw.group5.commodity.model.Commodity"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Language" content="zh-tw">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <%
    Commodity commodity = (Commodity) session.getAttribute("commodityDetail"); 
    String commodityImage = "/group5/commodityImages/"+commodity.getCommodityNo()+"_image1.jpg";
    %>
    
    <title><%=commodity.getCommodityName()%></title>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

    <link rel="stylesheet" type="text/css" href="/shoppingCss/shopping-main.css">
    
    <script src="https://kit.fontawesome.com/0d0c16b1bb.js" crossorigin="anonymous"></script>
    
    <style>
    .commodityStyle{
    border:solid 2px grey;
    font-size: 16px;
	font-weight: 700;
    }
    
    </style>

</head>


<body>

    <%@ include file="../shopping/shoppingFrontStageHead.jsp" %>
    
    <div id="wrap" class="container_48">

        <div id="content" class="container_48">

            <div class="main container_48">
            
                <div class="line_right container_48">
                
                    <div>
                        <input type="hidden" id="categoryMap" maincategory="MEN" subcategory="" itemcategory="">
                        <div id="exhibit" class="container_48">

                            <div id="sidenav" class="grid_9 alpha">

                                <ul class="sale">
                                    <li>
                                        <a href="/group5/shopping/protein">
                                            <h2>乳清蛋白</h2>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="/group5/shopping/clothes">
                                            <h2>服飾</h2>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="/group5/shopping/accessory">
                                            <h2>配件</h2>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="/group5/shopping/equipment">
                                            <h2>器材</h2>
                                        </a>
                                    </li>

                                </ul>
                            </div>
                            
                            
                            
                            <!-- 單項商品細節 -->
                            
   
                            <div class="grid_38 alpha omega">
            					<div class="sitemap grid_37 alpha hidden">
                				<input type="hidden" id="categoryMap" maincategory="WOMEN">
            					</div>
            					
            					
            					<div class="product_info grid_39 fix_shortcut_menu">
            					
            					    <!-- 商品主圖 -->
                					<div class="product_image">
                    					<img id="productImg" style="max-width: 500px; cursor: pointer;" onload="$.product.ChangeImgPadding();" src="<%=commodityImage %>" 
                    					alt="<%=commodity.getCommodityName()%>" title="<%=commodity.getCommodityName()%>">
                    					
                    					
                    					<!-- 圖片放大鏡 -->
                    					<span id="reading_glass_area">
                    						<a id="glass_57201011" class="fancyReadingGlass hidden" 
                    						href="https://s.lativ.com.tw/i/57201/57201011/5720101_1500.jpg" 
                    						data-include="57201011 57201012 57201013 57201014 57201015" rel="otherImgGroup">
                    						</a>
                    						<a id="glass_57201022" class="fancyReadingGlass" href="https://s.lativ.com.tw/i/57201/57201021/5720102_1500.jpg?_gl=1*d35pcw*_ga*NTgwNTU0NjM1LjE2NjQxNjIxMjE.*_ga_6DDQK3WLV7*MTY2NDMzMDA2Ni4xMC4xLjE2NjQzMzI4NzYuNTMuMC4w" 
                    						data-include="57201022 57201023 57201024" rel="otherImgGroup"><img id="glassImg" alt="" 
                    						src="https://s.lativ.com.tw/images/btn_zoom20.gif">
                    						</a>
                    					</span>
                    		
                				    </div>
                				
                					<div class="clearfloat">
                	
                	    				<!-- 商品名稱 -->
                    					<div class="product_title has-activity">
                        					<div id="product_name_area">
                            					<span class="title1"><%=commodity.getCommodityName()%></span>
                            					<br>
                        					</div>
                        
                        					<!-- 原價 -->
                        					<div id="product_price_area" class="hidden" style="display: block;">
                            					<div class="store_price">
                                				<span id="store_price" class="currency gridr activities"></span>
                        						</div>
                            
                            					<!-- 售價 -->
                            					<span id="currencyIdentifier">NT$</span><span id="price" class="currency noAboutSymbol price"><span id="specialPrice"><%=commodity.getCommodityPrice() %></span></span>                         
                        					</div>
                    					</div>
               
                    					<!-- 商品風格 -->
                    					<div class="size">
                        					<span id="sizelist" class="picksize" currentsn="57201022">
                        						<span class="commodityStyleFrame"><span class="commodityStyleContent"><%=commodity.getCommodityStyle()%></span></span> 
                        					</span>


                        					<div class="size2">                                                        
                            					<a class="product-comment" href="/Product/ProductComment?styleNo=57201&amp;itemNo=57201022" 
                            						onclick="openwin('/Product/ProductComment?styleNo=57201&amp;itemNo=57201022', '57201', 700, 800, status=0, scrollbars=1, localhost=0);return false;">評價&nbsp;(<span id="comment-count">221</span>)</a>
                            	
                            					<a class="product-size" href="/Product/ProductDesc?styleNo=57201&amp;itemNo=57201022" 
                            						onclick="openwin('/Product/ProductDesc?styleNo=57201&amp;itemNo=57201022', '57201', 700, 800, status=0, scrollbars=1, localhost=0);return false;">產品說明與尺寸表</a>
                            	
                            					<span class="product-keep" data-value="23837">收藏商品</span>
                       						</div>
                    					</div>
                    

                    					<div class="clear"></div>
                    
                    					<div class="addcart">
                    					
                    					    <input type="hidden" value=<%=commodity.getCommodityNo()%>>
                        					<input type="hidden" value=<%=commodity.getCommodityPrice()%>>
                        					
                        					<label for="buyQuantity">數量:</label>
                            				<input type="number" value="1" id="buyQuantity" name="buyQuantity" min="1" max="<%=commodity.getCommodityInventory()%>" step="1" required>
                        					
                        					<button class="addTocart">加入購物車</button>
                        
                    					</div>
                    					<div class="clear"></div>
                    
                    				</div>
            					</div>
            					
            					
            					<!--圖片區-->
            					<div class="clear"></div>
            					<div class="oldPic show">
            					<%
            					String image1 = commodity.getImage1();
            					String image2 = commodity.getImage2();
            					String image3 = commodity.getImage3();
            					String image4 = commodity.getImage4();
            					String image5 = commodity.getImage5();
	
            					String[] images = {image1,image2,image3,image4,image5};
            	
            					int i = 1;
            					for(String image : images){
            		
            						String imageSrc = "/group5/commodityImages/"+commodity.getCommodityNo()+"_image"+i+".jpg";
            		
            						if(image != null){%>
            							<img src="<%=imageSrc %>" alt="<%=commodity.getCommodityName()%>">
            	    				<%
            	    					i++;
            	    				} 
            					}
            					%>
    
            					</div>
        					</div>     
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    
    
    
    <%@ include file="../admin/FrontStageFoot.jsp" %>
    
    
    
    <script type="text/javascript">
    $(function(){
    	$(".addTocart").on("click",function(){
    		
    		var commodityNo = $(this).prev().prev().prev().prev().val();
    		var commodityPrice = $(this).prev().prev().prev().val();
    		var quantity = $(this).prev().val();
    		
    		
    		var account = ${loginMember.memberName};
 
    		cosole.log(account);
    		var params = null;
    		if(SecurityContextHolder.getContext().getAuthentication().isAuthenticated()){
    			params = {"account":${loginMember.account},"commodityNo":''+commodityNo , "commodityPrice":''+commodityPrice , "quantity":''+quantity};
    		}else if(!SecurityContextHolder.getContext().getAuthentication().isAuthenticated()){
    			params = {"account":null,"commodityNo":''+commodityNo , "commodityPrice":''+commodityPrice , "quantity":''+quantity};
    		}
    		
    		cosole.log(params);
    		
    		var params = {"commodityNo":''+commodityNo , "commodityPrice":''+commodityPrice , "quantity":''+quantity};
    		$.ajax({
    			type:'post',
				url:'shopping.addToCart',
				contentType:'application/json',
				data:JSON.stringify(params)
				
				
    		});
    		
    		
    	});
    });
    
    
    
    </script>
    
</body>


</html>