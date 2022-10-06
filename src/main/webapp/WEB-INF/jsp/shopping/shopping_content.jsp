<!DOCTYPE html>
<html>

<head>
</head>

<body>
    <!--商品呈現-->
                                
    <%@page import="java.util.List"%>
            
    <%@page import="tw.group5.commodity.model.Commodity"%>
            					
        
    <ul id="newProductList" class="list_display list_outfit">
                                
                                       
    <%    
	List<Commodity> shoppingDemonstration = (List<Commodity>) session.getAttribute("shoppingDemonstration");
  	for (Commodity commodity : shoppingDemonstration) {
  	String commodityImage = "/group5/commodityImages/"+commodity.getCommodityNo()+"_image1.jpg";
    %>
    
    <li><a class="imgd" href="http://localhost:8080/group5/shopping.detail/<%=commodity.getCommodityNo()%>">
        <img id="59078011" class=""
             src="<%=commodityImage %>"
             alt="<%=commodity.getCommodityName()%>" title="<%=commodity.getCommodityName()%>">      
        </a>
             
             
       	<div class="productname"><%=commodity.getCommodityName()%></div>
       	<br>
       	<span class="hidden" style="display: inline;">
       	<span id="currencyIdentifier">NT$</span><span class="currency symbol"><%=commodity.getCommodityPrice()%></span>
       	</span>
       	
   	</li>
  
	<%}%>


    </ul>

</body>
</html>