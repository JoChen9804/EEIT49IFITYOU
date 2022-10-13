<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>訂單管理系統</title>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        
    <link rel="stylesheet" type="text/css" href="css/commodity-scrollbar.css">

    <link rel="stylesheet" type="text/css" href="css/order/order-main.css">

    <link rel="stylesheet" type="text/css" href="css/commodity-window.css">
    
    <link rel="stylesheet" type="text/css" href="css/commodity/commodity-button.css">

    <script src="https://kit.fontawesome.com/0d0c16b1bb.js" crossorigin="anonymous"></script>
    
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <style>
    .orderCheckBTN {
    display: inline-block;
    text-align: center;
    vertical-align: middle;
    padding: 5px 15px;
    border: 0px solid #5897f5;
    border-radius: 10px;
    background: #5897f5;
    background: -webkit-gradient(linear, left top, left bottom, from(#5897f5), to(#5897f5));
    background: -moz-linear-gradient(top, #5897f5, #5897f5);
    background: linear-gradient(to bottom, #5897f5, #5897f5);
    text-shadow: #5897f5 0px 0px 0px;
    font: normal normal bold 16px comic sans ms;
    color: #ffffff;
    text-decoration: none;
	}
	.orderCheckBTN:hover,
	.orderCheckBTN:focus {
    border: 0px solid #72c4ff;
    background: #6ab5ff;
    background: -webkit-gradient(linear, left top, left bottom, from(#6ab5ff), to(#6ab5ff));
    background: -moz-linear-gradient(top, #6ab5ff, #6ab5ff);
    background: linear-gradient(to bottom, #6ab5ff, #6ab5ff);
    color: #ffffff;
    text-decoration: none;
	}
	.orderCheckBTN:active {
    background: #355b93;
    background: -webkit-gradient(linear, left top, left bottom, from(#355b93), to(#5897f5));
    background: -moz-linear-gradient(top, #355b93, #5897f5);
    background: linear-gradient(to bottom, #355b93, #5897f5);
	}
    </style>
    
</head>

<body>
	
	<%@ include file="../admin/AdminstyleHead.jsp" %>
	
	<div class="container-table100">
            <div class="wrap-table100">

                <h4>訂單管理</h4>
                
                
                <div style="padding-bottom:10px">
        		<%request.setCharacterEncoding("UTF-8");%>
        		<form  style="display: inline" action="commodity_administration" method="get">
            		<input type="text" class="searchCommodity" name="searchCommodity" placeholder="請輸入要尋找的訂單編號" value=<%=request.getParameter("searchCommodity")==null?"":request.getParameter("searchCommodity").toString()%>>
            		<button type="submit" class="searchCommodityButton"><i class="fa-solid fa-magnifying-glass"></i></button>
        		</form>
        		</div>	
        		
        		
                <!--商品管理表格-->
                <div class="table100 ver1 m-b-110">
                    <div class="table100-head">
                        <table>
                            <thead>
                                <tr class="row100 head">
                                	<th class="cell100 column1">訂單編號</th>
                                	<th class="cell100 column2">訂購會員</th>
                                	<th class="cell100 column3">訂單日期</th>
                                	<th class="cell100 column4">訂單金額</th>
                                	<th class="cell100 column5">付款狀態</th>
                                	<th class="cell100 column6">訂單狀態</th>
                                    <th class="cell100 column7"></th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="table100-body js-pscroll ps ps--active-y">
                        <table>
                            <tbody>
                            
                            	<c:forEach var="order" items="${allOrders}">
                                <tr class="row100 body">
                                    <td class="cell100 column1 orderNo" id="orderNo">${order.orderNo }</td>
                                    <td class="cell100 column2">${order.account }</td>
                                    <td class="cell100 column3">${order.orderTime }</td>
                                    <td class="cell100 column4">NT$ ${order.orderTotal }</td>
                                    
                                    <!-- 付款狀態 -->
                                    <c:if test="${order.payStatus == '已付款' }">
                                    <td class="cell100 column5">
                                    	<select name="commodityType" size="1" class="payStatusChoose">
                                        	<option value="已付款" selected>已付款</option>
                                            <option value="尚未付款">尚未付款</option>
                                            <option value="申請退款中">申請退款中</option>
                                            <option value="已退款">已退款</option>
                                        </select>
                                    </td>
                                    </c:if>
                                    
                                    <c:if test="${order.payStatus == '尚未付款' }">
                                    <td class="cell100 column5">
                                    	<select name="commodityType" size="1" class="payStatusChoose">
                                        	<option value="已付款">已付款</option>
                                            <option value="尚未付款" selected>尚未付款</option>
                                            <option value="申請退款中">申請退款中</option>
                                            <option value="已退款">已退款</option>
                                        </select>
                                    </td>
                                    </c:if>
                                    
                                    <c:if test="${order.payStatus == '申請退款中' }">
                                    <td class="cell100 column5">
                                    	<select name="commodityType" size="1" class="payStatusChoose">
                                        	<option value="已付款">已付款</option>
                                            <option value="尚未付款">尚未付款</option>
                                            <option value="申請退款中" selected>申請退款中</option>
                                            <option value="已退款">已退款</option>
                                        </select>
                                    </td>
                                    </c:if>
                                    
                                    <c:if test="${order.payStatus == '已退款' }">
                                    <td class="cell100 column5">
                                    	<select name="commodityType" size="1" class="payStatusChoose">
                                        	<option value="已付款">已付款</option>
                                            <option value="尚未付款">尚未付款</option>
                                            <option value="申請退款中">申請退款中</option>
                                            <option value="已退款" selected>已退款</option>
                                        </select>
                                    </td>
                                    </c:if>
                                    
                                    
                                    <!-- 訂單狀態 -->
                                    <c:if test="${order.orderStatus == '訂單確認中' }">
                                    <td class="cell100 column6">
                                    	<select name="commodityType" size="1" class="orderStatusChoose">
                                        	<option value="訂單確認中" selected>訂單確認中</option>
                                            <option value="訂單已確認(待發貨)">訂單已確認(待發貨)</option>
                                            <option value="訂單完成">訂單完成</option>
                                            <option value="訂單作廢">訂單作廢</option>
                                        </select>
                                    </td>
                                    </c:if>
                                    
                                    <c:if test="${order.orderStatus == '訂單已確認(待發貨)' }">
                                    <td class="cell100 column6">
                                    	<select name="commodityType" size="1" class="orderStatusChoose">
                                        	<option value="訂單確認中">訂單確認中</option>
                                            <option value="訂單已確認(待發貨)" selected>訂單已確認(待發貨)</option>
                                            <option value="訂單完成">訂單完成</option>
                                            <option value="訂單作廢">訂單作廢</option>
                                        </select>
                                    </td>
                                    </c:if>
                                    
                                    <c:if test="${order.orderStatus == '訂單完成' }">
                                    <td class="cell100 column6">
                                    	<select name="commodityType" size="1" class="orderStatusChoose">
                                        	<option value="訂單確認中">訂單確認中</option>
                                            <option value="訂單已確認(待發貨)">訂單已確認(待發貨)</option>
                                            <option value="訂單完成" selected>訂單完成</option>
                                            <option value="訂單作廢">訂單作廢</option>
                                        </select>
                                    </td>
                                    </c:if>
                                    
                                    <c:if test="${order.orderStatus == '訂單作廢' }">
                                    <td class="cell100 column6">
                                    	<select name="commodityType" size="1" class="orderStatusChoose">
                                        	<option value="訂單確認中">訂單確認中</option>
                                            <option value="訂單已確認(待發貨)">訂單已確認(待發貨)</option>
                                            <option value="訂單完成">訂單完成</option>
                                            <option value="訂單作廢" selected>訂單作廢</option>
                                        </select>
                                    </td>
                                    </c:if>
                                    
                                    
                                    <!-- 查閱按鈕 -->
                                    <td class="cell100 column7">
                                    	<button class="orderCheckBTN" data-bs-toggle="modal" data-bs-target="#order_check">查閱</button>
                                    </td>
                                    
                                    <!-- 彈出查閱視窗 -->
                					<div class="modal fade" id="order_check">
                						<div class="modal-dialog">
                        					<div class="modal-content">
                        					
                        						<div class="modal-header">
                                					<h4>訂單詳情:</h4>
                                					<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            					</div>
                            					
                            					 <div class="modal-body">
                            					 	<div class="panel cart-summary margin-top-large collapsed" data-toggle="collapse" href="#cartSummary" aria-expanded="false">
                            							<div class="panel-header">
                               								 <div class="order-title">
                                   								<div class="panelShowBTN">
                                        							<span>共${order.orderItems.size()}項商品，總計</span>
                                        							<!-- 總計金額 -->
                                        							<span class="order-text price-red cms-moneyColor"
                                            							id="topTotalPayment">NT$<span>${order.orderTotal}</span>
                                        							</span>
                                        
                                        							<!--收合符號  -->
                                        							<div class="order-toggle">
                                        							<i class="fa-solid fa-angles-down" id="angles-down"></i>
                                        							<i class="fa-solid fa-angles-up" id="angles-up"></i>
                                        							</div>
                                   								</div>
                                							</div>
                            							</div>
                            						</div>
                            					 </div>
                        					
                        					
                        					
                        					</div>
                        				</div>
                					</div>
                                    
                                    
                                    
                                </tr>
                                </c:forEach>
                         
                            
                            </tbody>
                        </table>

                        <div class="ps__rail-x" style="left: 0px; bottom: 0px;">
                            <div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
                        </div>
                        <div class="ps__rail-y" style="top: 0px; height: 585px; right: 5px;">
                            <div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 293px;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>

    <script src="js/commodity/commodity-scrollbar.min.js"></script>
    <script>
        $('.js-pscroll').each(function () {
            var ps = new PerfectScrollbar(this);

            $(window).on('resize', function () {
                ps.update();
            })
        });
    </script>
	
	<script type="text/javascript">
	$(function(){
		
		<!--訂單狀態修改-->
		var orderStatusChooses = $('.orderStatusChoose').toArray();
		
		for(var i = 0 ; i < orderStatusChooses.length ; i++){
			
			$(orderStatusChooses[i]).on('change',function(){
				
				var original = $(this).html();
				
				Swal.fire({
					title: '確認要修改該訂單狀態嗎?',
					showDenyButton: true,
					showCancelButton: false,
					confirmButtonText: '確認',
					denyButtonText: `取消`,
				}).then((result) => {
							
					if (result.isConfirmed) {
						Swal.fire('訂單狀態已修改完成!', '', 'success');
						    
						var updateOrderNo = $(this).parent().prev().prev().prev().prev().prev('#orderNo').text();
						var newOrderStatus = $(this).val();
						params = {"updateOrderNo":updateOrderNo,"newOrderStatus":newOrderStatus};
						    
						$.ajax({
						    type:"POST",
			      			url:"order_administration.updateOrderStatus",
			      			contentType: 'application/json',
			      			data:JSON.stringify(params),
			      			context: this,
						});
						    
						    
					} else if (result.isDenied) {
						Swal.fire('已取消變更', '', 'info')
						$(this).html(original)	    
					}
				})	
			});
			
			
		}
		
		
		
		
		
		
		<!--付款狀態修改-->
		
		var payStatusChooses = $('.payStatusChoose').toArray();
		
		for(var i = 0 ; i < payStatusChooses.length ; i++){
			
			$(payStatusChooses[i]).on('change',function(){
				
				var original = $(this).html();
				
				Swal.fire({
					title: '確認要修改付款狀態嗎?',
					showDenyButton: true,
					showCancelButton: false,
					confirmButtonText: '確認',
					denyButtonText: `取消`,
				}).then((result) => {
							
					if (result.isConfirmed) {
						Swal.fire('付款狀態已修改完成!', '', 'success');
						    
						var updateOrderNo = $(this).parent().prev().prev().prev().prev('#orderNo').text();
						var newPayStatus = $(this).val();
						params = {"updateOrderNo":updateOrderNo,"newPayStatus":newPayStatus};
						    
						$.ajax({
						    type:"POST",
			      			url:"order_administration.updatePayStatus",
			      			contentType: 'application/json',
			      			data:JSON.stringify(params),
			      			context: this,
						});
						    
					} else if (result.isDenied) {
						Swal.fire('已取消變更', '', 'info')
						$(this).html(original)	    
					}
				})	
			});
			
			
			
		}
		
		
		
		
		
		
		
		
		
		
	});
	
		
	
	
	
	</script>
	
	
	
	
	
	
	
	<%@ include file="../admin/AdminstyleFoot.jsp"%>

</body>
</html>