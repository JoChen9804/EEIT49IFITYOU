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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>
        
    <link rel="stylesheet" type="text/css" href="css/commodity-scrollbar.css">

    <link rel="stylesheet" type="text/css" href="css/order/order-main.css">

    <link rel="stylesheet" type="text/css" href="css/commodity-window.css">

    <script src="https://kit.fontawesome.com/0d0c16b1bb.js" crossorigin="anonymous"></script>
    
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    

    <style>
    .searchKeywordOutside input{
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
  	border: 2px solid #4e73df;
	}
    
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
                
                <!--商品管理表格-->
                <table id="table_id" class="table100 ver1 m-b-110">
                
                	<thead class="table100-head">
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
                	
                	
                	<tbody class="table100-body js-pscroll ps ps--active-y">
                	
                		<c:forEach var="order" items="${allOrders}">
                        	<tr style="height:90px">
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
                                        <span class="payStatus" style="display:none">已付款</span>
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
                                        <span class="payStatus" style="display:none">尚未付款</span>
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
                                        <span class="payStatus" style="display:none">申請退款中</span>
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
                                        <span class="payStatus" style="display:none">已退款</span>
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
                                        <span class="orderStatus" style="display:none">訂單確認中</span>
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
                                        <span class="orderStatus" style="display:none">訂單已確認(待發貨)</span>
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
                                        <span class="orderStatus" style="display:none">訂單完成</span>
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
                                        <span class="orderStatus" style="display:none">訂單作廢</span>
                                    </td>
                                </c:if>
                                    
                                    
                                <!-- 查閱按鈕 -->
                                <td class="cell100 column7">
                                	<a href="http://localhost:8080/group5/admin/order_administration/${order.orderNo }" target="_blank">
                                		<button class="orderCheckBTN" data-bs-toggle="modal" data-bs-target="#order_check">查閱</button>
                                	</a>
                                </td>
                                
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
        
        

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
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
						
						$(this).next('.orderStatus').text(newOrderStatus);
						
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
						
						$(this).next('.payStatus').text(newPayStatus);
						
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
		
		
		<!--未確認訂單底色為紅色 -->
		var orderStatuss = $('.orderStatus').toArray();
		
		for(var i = 0 ; i < orderStatuss.length ; i++){
			var orderStatusNeed = $(orderStatuss[i]).text();
			
			if(orderStatusNeed === "訂單確認中"){
				$(orderStatuss[i]).parent().parent('tr').css("background","#FFEEDD")
			}
			
		}

		
		
		$('#table_id').DataTable({
			
			<!--調整主要功能css -->
			"dom": "<'searchKeywordOutside'f>",
			
			<!--預設進頁面的排序-->
			"order": [[ 2, "desc" ]],
			
			<!--不要分頁 'paging':false, -->
			
			<!--中文化 -->
			"language":{
			    "processing": "處理中...",
			    "loadingRecords": "載入中...",
			    "paginate": {
			        "first": "第一頁",
			        "previous": "上一頁",
			        "next": "下一頁",
			        "last": "最後一頁"
			    },
			    "emptyTable": "目前沒有資料",
			    "datetime": {
			        "previous": "上一頁",
			        "next": "下一頁",
			        "hours": "時",
			        "minutes": "分",
			        "seconds": "秒",
			        "amPm": [
			            "上午",
			            "下午"
			        ],
			        "unknown": "未知",
			        "weekdays": [
			            "週日",
			            "週一",
			            "週二",
			            "週三",
			            "週四",
			            "週五",
			            "週六"
			        ],
			        "months": [
			            "一月",
			            "二月",
			            "三月",
			            "四月",
			            "五月",
			            "六月",
			            "七月",
			            "八月",
			            "九月",
			            "十月",
			            "十一月",
			            "十二月"
			        ]
			    },
			    "searchBuilder": {
			        "add": "新增條件",
			        "condition": "條件",
			        "deleteTitle": "刪除過濾條件",
			        "button": {
			            "_": "複合查詢 (%d)",
			            "0": "複合查詢"
			        },
			        "clearAll": "清空",
			        "conditions": {
			            "array": {
			                "contains": "含有",
			                "equals": "等於",
			                "empty": "空值",
			                "not": "不等於",
			                "notEmpty": "非空值",
			                "without": "不含"
			            },
			            "date": {
			                "after": "大於",
			                "before": "小於",
			                "between": "在其中",
			                "empty": "為空",
			                "equals": "等於",
			                "not": "不為",
			                "notBetween": "不在其中",
			                "notEmpty": "不為空"
			            },
			            "number": {
			                "between": "在其中",
			                "empty": "為空",
			                "equals": "等於",
			                "gt": "大於",
			                "gte": "大於等於",
			                "lt": "小於",
			                "lte": "小於等於",
			                "not": "不為",
			                "notBetween": "不在其中",
			                "notEmpty": "不為空"
			            },
			            "string": {
			                "contains": "含有",
			                "empty": "為空",
			                "endsWith": "字尾為",
			                "equals": "等於",
			                "not": "不為",
			                "notEmpty": "不為空",
			                "startsWith": "字首為",
			                "notContains": "不含",
			                "notStartsWith": "開頭不是",
			                "notEndsWith": "結尾不是"
			            }
			        },
			        "data": "欄位",
			        "leftTitle": "群組條件",
			        "logicAnd": "且",
			        "logicOr": "或",
			        "rightTitle": "取消群組",
			        "title": {
			            "_": "複合查詢 (%d)",
			            "0": "複合查詢"
			        },
			        "value": "內容"
			    },
			    "editor": {
			        "close": "關閉",
			        "create": {
			            "button": "新增",
			            "title": "新增資料",
			            "submit": "送出新增"
			        },
			        "remove": {
			            "button": "刪除",
			            "title": "刪除資料",
			            "submit": "送出刪除",
			            "confirm": {
			                "_": "您確定要刪除您所選取的 %d 筆資料嗎？",
			                "1": "您確定要刪除您所選取的 1 筆資料嗎？"
			            }
			        },
			        "error": {
			            "system": "系統發生錯誤(更多資訊)"
			        },
			        "edit": {
			            "button": "修改",
			            "title": "修改資料",
			            "submit": "送出修改"
			        },
			        "multi": {
			            "title": "多重值",
			            "info": "您所選擇的多筆資料中，此欄位包含了不同的值。若您想要將它們都改為同一個值，可以在此輸入，要不然它們會保留各自原本的值。",
			            "restore": "復原",
			            "noMulti": "此輸入欄需單獨輸入，不容許多筆資料一起修改"
			        }
			    },
			    "autoFill": {
			        "cancel": "取消"
			    },
			    "buttons": {
			        "copySuccess": {
			            "_": "複製了 %d 筆資料",
			            "1": "複製了 1 筆資料"
			        },
			        "copyTitle": "已經複製到剪貼簿",
			        "excel": "Excel",
			        "pdf": "PDF",
			        "print": "列印",
			        "copy": "複製",
			        "colvis": "欄位顯示",
			        "colvisRestore": "重置欄位顯示",
			        "csv": "CSV",
			        "pageLength": {
			            "-1": "顯示全部",
			            "_": "顯示 %d 筆"
			        },
			        "createState": "建立狀態",
			        "removeAllStates": "移除所有狀態",
			        "removeState": "移除",
			        "renameState": "重新命名",
			        "savedStates": "儲存狀態",
			        "stateRestore": "狀態 %d",
			        "updateState": "更新"
			    },
			    "searchPanes": {
			        "collapse": {
			            "_": "搜尋面版 (%d)",
			            "0": "搜尋面版"
			        },
			        "emptyPanes": "沒搜尋面版",
			        "loadMessage": "載入搜尋面版中...",
			        "clearMessage": "清空",
			        "count": "{total}",
			        "countFiltered": "{shown} ({total})",
			        "title": "過濾條件 - %d",
			        "showMessage": "顯示全部",
			        "collapseMessage": "摺疊全部"
			    },
			    "stateRestore": {
			        "emptyError": "名稱不能空白。",
			        "creationModal": {
			            "button": "建立",
			            "columns": {
			                "search": "欄位搜尋",
			                "visible": "欄位顯示"
			            },
			            "name": "名稱：",
			            "order": "排序",
			            "paging": "分頁",
			            "scroller": "卷軸位置",
			            "search": "搜尋",
			            "searchBuilder": "複合查詢",
			            "select": "選擇",
			            "title": "建立新狀態",
			            "toggleLabel": "包含："
			        },
			        "duplicateError": "此狀態名稱已經存在。",
			        "emptyStates": "名稱不可空白。",
			        "removeConfirm": "確定要移除 %s 嗎？",
			        "removeError": "移除狀態失敗。",
			        "removeJoiner": "和",
			        "removeSubmit": "移除",
			        "removeTitle": "移除狀態",
			        "renameButton": "重新命名",
			        "renameLabel": "%s 的新名稱：",
			        "renameTitle": "重新命名狀態"
			    },
			    "select": {
			        "columns": {
			            "_": "選擇了 %d 欄資料",
			            "1": "選擇了 1 欄資料"
			        },
			        "rows": {
			            "1": "選擇了 1 筆資料",
			            "_": "選擇了 %d 筆資料"
			        },
			        "cells": {
			            "1": "選擇了 1 格資料",
			            "_": "選擇了 %d 格資料"
			        }
			    },
			    "zeroRecords": "沒有符合的資料",
			    "aria": {
			        "sortAscending": "：升冪排列",
			        "sortDescending": "：降冪排列"
			    },
			    "info": "顯示第 _START_ 至 _END_ 筆結果，共 _TOTAL_ 筆",
			    "infoEmpty": "顯示第 0 至 0 筆結果，共 0 筆",
			    "infoFiltered": "(從 _MAX_ 筆結果中過濾)",
			    "infoThousands": ",",
			    "lengthMenu": "顯示 _MENU_ 筆結果",
			    "search": "",
			    "searchPlaceholder": "請輸入要搜尋的關鍵字",
			    "thousands": ","
			} 
			
			
		});
		
		
		
		
	});
	
		
	
	
	
	</script>
	
	<!-- Page level plugins -->
	<script src="vendor/datatables/jquery.dataTables.min.js"></script>
	<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
	
	
	
	
	
	<%@ include file="../admin/AdminstyleFoot.jsp"%>

</body>
</html>