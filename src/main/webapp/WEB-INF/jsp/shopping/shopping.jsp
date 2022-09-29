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



    <link rel="stylesheet" type="text/css" href="css/shopping/shopping-main.css">

</head>


<body>

    <!-- <%@ include file="../admin/FrontStageHead.jsp" %>  -->	

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
                                        <a href="/MEN">
                                            <h2>乳清蛋白</h2>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="/MEN">
                                            <h2>服飾</h2>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="/MEN">
                                            <h2>配件</h2>
                                        </a>
                                    </li>

                                    <li>
                                        <a href="/MEN">
                                            <h2>器材</h2>
                                        </a>
                                    </li>

                                </ul>
                            </div>

                            <div class="grid_38 alpha omega">
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tbody>
                                        <tr>
                                            <td colspan="4"><a onclick="$.common.statisticClick(90013497)"
                                                    id="category0" name="category0"
                                                    href="https://www.lativ.com.tw/Detail/59156011" target="_blank"
                                                    style="cursor: pointer;"><img
                                                        src="https://s3.lativ.com.tw/i/NewArrivalBanner/59156_1010X400_220912_TW.jpg"
                                                        alt="" class="grid_38 alpha omega"></a></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <input id="showOutfitPic" name="showOutfitPic" type="hidden" value="True">
                                <input id="actionUrl" name="actionUrl" pageindex="0" type="hidden"
                                    value="/Product/GetNewProductCategoryList?MainCategory=MEN">



                                <!--商品呈現-->
                                
                                <%@page import="java.util.List"%>
            
            					<%@page import="tw.group5.commodity.model.Commodity"%>
            					
        
                                <ul id="newProductList" class="list_display list_outfit">
                                
                                
                       
                                <%    
    						    List<Commodity> shoppingDemonstration = (List<Commodity>) session.getAttribute("shoppingDemonstration");
    	    				    for (Commodity commodity : shoppingDemonstration) {
    	    					String commodityImage = "/group5/commodityImages/"+commodity.getCommodityNo()+"_image1.jpg";
    	    					%>
                                    <li><a class="imgd" href="/Detail/59078011"
                                            onclick="$.common.onProductClick('Jurassic World輕型風衣外套-男', 'New Arrival', $.product.Redirect(0));">
                                            <img
                                                id="59078011" class=""
                                                src="<%=commodityImage %>"
                                                alt="<%=commodity.getCommodityName()%>" title="<%=commodity.getCommodityName()%>"></a>
                                        <div class="productname"><%=commodity.getCommodityName()%></div><br><span class="hidden"
                                            style="display: inline;"><span id="currencyIdentifier">NT$</span><span
                                                class="currency symbol"><%=commodity.getCommodityPrice()%></span></span>
                                    </li>
 							<%}%>


                               </ul>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>

        </div>
    </div>
      <!-- <%@ include file="../admin/FrontStageFoot.jsp" %>  -->	
</body>


</html>