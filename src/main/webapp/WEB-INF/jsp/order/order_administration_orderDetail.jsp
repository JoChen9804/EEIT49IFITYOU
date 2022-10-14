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
    <title>${orderNo }</title>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

    <link rel="stylesheet" type="text/css" href="/shoppingCss/shopping-main.css">
    
    <script src="https://kit.fontawesome.com/0d0c16b1bb.js" crossorigin="anonymous"></script>
    
    <style type="text/css">
    
    .container-table100 {
    width: 100%;
    padding:20px 20px 20px;
    align-items: center;
    justify-content: center;
    flex-wrap: wrap;
	}
	
	.title{
	font-size:20px;
	padding-bottom:8px;
	}
    
    table { 
  	border:1px solid #000; 
  	font-family: 微軟正黑體; 
  	font-size:16px; 
  	width: 85%;
  	border:1px solid #000;
  	text-align:center;
  	border-collapse:collapse;
	} 
	
	th { 
  	background-color: #009FCC;
  	padding:10px;
  	border:1px solid #000;
  	text-align:center;
  	color:#fff;
	} 
	
	td { 
  	border:1px solid #000;
  	padding:5px;
	} 
	
	.column1{
	width:40%;
	}
	
	.underTable{
	margin-top:8px;
	font-size:20px
	}
    </style>
    
</head>

<body>

<div class="container-table100">
	
	<div class="title">
	<span>訂單  #${orderNo } :</span>
	<button onclick="printpage()"><i class="fa-solid fa-print"></i>列印該訂單</button>
	</div>
	
	<table>
		<thead>
			<tr>
				<th class="column1">商品名稱</th>
				<th class="column2">單件價格</th>
				<th class="column3">購買數量</th>
				<th class="column4">小計</th>
			</tr>
		</thead>
		
		<tbody>
		<% 
		Order order = (Order) session.getAttribute("myorder");
		Set<OrderItem> orderItems = order.getOrderItems();
		
		int total = 0;
		for(OrderItem orderItem : orderItems ){
			
			ServletContext application1 = getServletContext();
			WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(application1);
			CommodityService cService = context.getBean("cService",CommodityService.class);
			
			Commodity commodity = cService.findCommodityById(orderItem.getCommodityNo()); 
			
			total += orderItem.getSubtotal();
			
		%>
			<tr>
				<td class="column1"><%=commodity.getCommodityName() %></td>
				<td class="column2">NT$<%=orderItem.getCommodityPrice() %></td>
				<td class="column3"><%=orderItem.getQuantity() %></td>
				<td class="column4">NT$<%=orderItem.getSubtotal() %></td>
			</tr>
			
		
	 <%}%>	
		</tbody>
	</table>
	
	<div class="underTable">
		<div>
    		<span>小計:</span>
    		<span>NT$ <%=total %></span>
    	</div>
                                  
                                        
        <c:if test="${myorder.voucherNo != null}" >
        <div class="discount">
        	<span class="pull-left">折扣:</span>
            <span class="pull-right">-NT$ ${myorder.voucherDiscount}</span>
        </div>
        </c:if>

        <div class="delivery-fee emphasize">
        	<span class="pull-left">運費:</span>
                                            
            <c:if test="${myorder.shippingFee == '免運'}" >
            <span class="pull-right">${myorder.shippingFee}</span>
            </c:if>
            
            <c:if test="${myorder.shippingFee != '免運'}" >
            <span class="pull-right">+NT$ ${myorder.shippingFee}</span>
            </c:if>
            
      	</div>
                                        
        <div class="total">
        	<span class="pull-left">合計<span class="hidden-sm hidden-md hidden-lg"> (${myorder.orderItems.size()}項商品)</span>:</span>
            <span class="pull-right">NT$ ${myorder.orderTotal}</span>
       	</div>
    </div>
	
</div>



<script>
<!--一件列印-->
function printpage(){
	window.print();
}

</script>

	
</body>

</html>