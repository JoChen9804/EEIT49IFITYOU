<%@page import="tw.group5.commodity.model.Commodity"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>購物車</title>

    <Style>
        table {
            border: 1px solid black;
        }

        thead {
            border: 0.5px solid black;
            background-color: rgb(191, 213, 252);
        }

        tbody {
            border: 0.5px solid black;
        }
        
        img{
            width:100px;
            height:120px;
        }
        
        tr,td {
            border: 0.5px solid black;
        }
    </Style>
</head>

<body>
    
    
    <h1>您的購物車內有下列商品:</h1>

    <table>
        <thead>
            <tr>
                <th style="width:70px">產品編號</th>
                <th style="width:100px">產品類別</th>
                <th style="width:140px">商品圖片</th>
                <th style="width:400px">產品名稱</th>
                <th style="width:100px">產品價格</th>
                <th style="width:100px">購買數量</th>
                <th style="width:100px">小計</th>
                <th style="width:100px">移除該商品</th>
            </tr>
        </thead>

        <tbody>
            <%
    			List<OrderItem> orderItems = (List<OrderItem>) session.getAttribute("orderItems");
            
    			int sum = 0;
    			int index =0;
    			for ( OrderItem orderItem : orderItems) {
    				ServletContext application1 = getServletContext();
    				WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(application1);
    				CommodityService cService = context.getBean("cService",CommodityService.class);
    				
    				Commodity commodity = cService.select(orderItem.getCommodityNo());
    				
    				String commodityImage = "commodityImages/"+commodity.getCommodityNo()+"_image1.jpg";
    			%>
    				<tr>
        	        	<td><%=orderItem.getCommodityNo()%></td>
        	        	<td><%=commodity.getCommodityType()%></td>
        	        	<td class="image1"><img src="<%=commodityImage%>"></td>
        	        	<td><%=commodity.getCommodityName()%></td>
        	        	<td><%=orderItem.getCommodityPrice()%></td>
        	        	<td><%=orderItem.getOrderQuantity()%></td>
        	        	<td><%=orderItem.getSubtotal()%></td>
        	        	<td>
        	        	<form action="shopping_cart.remove" method="POST" >
        	        	<input type="hidden" name="whichDelete" value=<%=index%>>
                        <input type="submit" name="delete" value="從購物車移除" class="delete">
        	        	</form>
        	        	</td>
        	        </tr>
               <% 
               sum += orderItem.getSubtotal() ;
               index++;
               %>
               <%}%> 
        </tbody>  
   </table>
   <br>
   <div>訂單總金額:$<%=sum%></div>
   <div><input type="submit" value="結帳" class="order"></div>

</body>
</html>