<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Language" content="zh-tw">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>iFit 購物</title>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

    <link rel="stylesheet" type="text/css" href="/shoppingCss/shopping-main.css">
    
    <script src="https://kit.fontawesome.com/0d0c16b1bb.js" crossorigin="anonymous"></script>
    
    <style type="text/css">
    
    .searchMargin{
    margin-top:40px;
    margin-bottom:0px;
    margin-left:725px;
    }
    
    .searchCommodity{
	border-radius: 999px;
	font-family: Inter,Helvetica,"Apple Color Emoji","Segoe UI Emoji",NotoColorEmoji,"Noto Color Emoji","Segoe UI Symbol","Android Emoji",EmojiSymbols,-apple-system,system-ui,"Segoe UI",Roboto,"Helvetica Neue","Noto Sans",sans-serif;
  	font-size: 16px;
  	font-weight: 700;
  	line-height: 20px;
  	opacity: 1;
  	outline: 0 solid transparent;
  	padding: 8px 18px;
  	user-select: none;
  	-webkit-user-select: none;
  	touch-action: manipulation;
  	width: fit-content;
  	word-break: break-word;
  	border: 2px solid #555;
	}
	
	.searchCommodityButton{
	font-size: 16px;
	font-weight: 700;
  	line-height: 20px;
	background: 00;
	border:0
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


							<div class="grid_38 alpha omega">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
    							<tbody>
        							<tr>
            							<td colspan="4">
            							
            							<%if(session.getAttribute("banner").equals("main")){ %>
            								<a id="category0" name="category0" target="_blank" style="cursor: pointer;">
                                   			<img src="/group5/shoppingBanners/main_banner.jpg"
                                   				 alt="" class="grid_38 alpha omega">
                                   			</a>
            							<%}else if(session.getAttribute("banner").equals("protein")){ %>
            								<a id="category0" name="category0"
                                   			   href="http://localhost:8080/group5/shopping.detail/1" target="_blank"
                                   			   style="cursor: pointer;">
                                   			<img src="/group5/shoppingBanners/protein_banner.jpg"
                                   				 alt="" class="grid_38 alpha omega">
                                   			</a>
                                   		<%}else if(request.getAttribute("banner").equals("clothes")){ %>	
                                   			<a id="category0" name="category0"
                                   			   href="http://localhost:8080/group5/shopping.detail/7" target="_blank"
                                   			   style="cursor: pointer;">
                                   			<img src="/group5/shoppingBanners/clothes_banner.jpg"
                                   				 alt="" class="grid_38 alpha omega">
                                   			</a>
                                   		<%}else if(request.getAttribute("banner").equals("accessory")){ %>
                                   			<a id="category0" name="category0"
                                   			   href="http://localhost:8080/group5/shopping.detail/8" target="_blank"
                                   			   style="cursor: pointer;">
                                   			<img src="/group5/shoppingBanners/accessory_banner.jpg"
                                   				 alt="" class="grid_38 alpha omega">
                                   			</a>
                                   		<%}else if(request.getAttribute("banner").equals("equipment")){ %>
                                   			<a id="category0" name="category0"
                                   			   href="http://localhost:8080/group5/shopping.detail/9" target="_blank"
                                   			   style="cursor: pointer;">
                                   			<img src="/group5/shoppingBanners/equipment_banner.jpg"
                                   				 alt="" class="grid_38 alpha omega">
                                   			</a>
                                   		<%}%>
                                   		
                                   		
                                   		</td>
            						</tr>
        						</tbody>
    						</table>
    						
    						<input id="showOutfitPic" name="showOutfitPic" type="hidden" value="True">
    						<input id="actionUrl" name="actionUrl" pageindex="0" type="hidden"
           						   value="/Product/GetNewProductCategoryList?MainCategory=MEN">
                            
                            
                            
                            <%request.setCharacterEncoding("UTF-8");%>
                            <div class="searchMargin">
        						<form  style="display: inline" action="/group5/shopping" method="get">
            						<input type="text" class="searchCommodity" name="searchCommodity" placeholder="請輸入要尋找的商品" value=<%=request.getParameter("searchCommodity")==null?"":request.getParameter("searchCommodity").toString()%>>
            						<button type="submit" class="searchCommodityButton"><i class="fa-solid fa-magnifying-glass"></i></button>
        						</form>
        					</div>
        					
                            <%@ include file="../shopping/shopping_content.jsp" %>
                            
                            
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
    
</body>


</html>