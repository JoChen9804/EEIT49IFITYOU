<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品管理系統</title>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="css/commodity-scrollbar.css">

    <link rel="stylesheet" type="text/css" href="css/commodity-main.css">

    <link rel="stylesheet" type="text/css" href="css/commodity-window.css">
    
    <link rel="stylesheet" type="text/css" href="css/commodity/commodity-button.css">

    <script src="https://kit.fontawesome.com/0d0c16b1bb.js" crossorigin="anonymous"></script>
    
    <style type="text/css">
    
    .img_show{
    	width:100px;
        height:120px;
    }
    
    
    
    </style>


</head>



<body>

        <%@ include file="../admin/AdminstyleHead.jsp" %>
    
    
        <div class="container-table100">
            <div class="wrap-table100">

                <h4>商品管理</h4>
                
                
                <div style="padding-bottom:10px">
        		<%request.setCharacterEncoding("UTF-8");%>
        		<form  style="display: inline" action="commodity_administration" method="get">
            		<input type="text" class="searchCommodity" name="searchCommodity" placeholder="請輸入要尋找的商品" value=<%=request.getParameter("searchCommodity")==null?"":request.getParameter("searchCommodity").toString()%>>
            		<button type="submit" class="searchCommodityButton"><i class="fa-solid fa-magnifying-glass"></i></button>
        		</form>

				<!--點按鈕做商品添加-->
                <button class="add_button" data-bs-toggle="modal"
                        data-bs-target="#commodity_add"><i class="fa-solid fa-circle-plus"></i>&nbsp新增商品</button>
                

        		</div>	
        		
        		
        		

                <!-- 彈出視窗 -->
                <div class="modal fade" id="commodity_add">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <div class="modal-header">
                                <h4>商品添加:</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>

                            <div class="modal-body">
                                <div class="form-group">
                                    <form action="commodity_on_shelf.action" method="POST"
                                        enctype="multipart/form-data">

                                        <div>
                                            <label for="commodityNo">商品編號</label>
                                            <input type="text" id="commodityNo" name="commodityNo">

                                            <label class="custom-control ios-switch">是否上架:
                                                <input type="checkbox" class="ios-switch-control-input" name="onShelfButton">
                                                <span class="ios-switch-control-indicator"></span>
                                            </label>
                                        </div>

                                        <div>
                                            <label for="">商品種類</label>
                                            <select name="commodityType" size="1">
                                                <option value="乳清蛋白">乳清蛋白</option>
                                                <option value="服飾">服飾</option>
                                                <option value="配件">配件</option>
                                                <option value="器材">器材</option>
                                            </select>
                                        </div>

                                        <div>
                                            <label for="commodityName">商品名稱</label>
                                            <input type="text" id="commodityName" name="commodityName">
                                        </div>

                                        <div>
                                            <label for="commodityStyle">商品規格</label>
                                            <input type="text" id="commodityStyle" name="commodityStyle">
                                        </div>

                                        <div>
                                            <label for="commodityPrice">商品價格</label>
                                            <input type="text" id="commodityPrice" name="commodityPrice">
                                        </div>

                                        <div>
                                            <label for="commodityInventory">商品庫存</label>
                                            <input type="text" id="commodityInventory" name="commodityInventory">
                                        </div>

                                        <div>
                                            <label for="">照片1:</label>
                                            <img class="img1">
                                            <input type="file" name="image1" class="image1" multiple>
                                        </div>

                                        <div>
                                            <label for="">照片2:</label>
                                            <img class="img2">
                                            <input type="file" name="image2" class="image2" multiple>
                                        </div>

                                        <div>
                                            <label for="">照片3:</label>
                                            <img class="img3">
                                            <input type="file" name="image3" class="image3" multiple>
                                        </div>

                                        <div>
                                            <label for="">照片4:</label>
                                            <img class="img4">
                                            <input type="file" name="image4" class="image4" multiple>
                                        </div>

                                        <div>
                                            <label for="">照片5:</label>
                                            <img class="img5">
                                            <input type="file" name="image5" class="image5" multiple>
                                        </div>

                                        <div>
                                            <label for="commodityDescription">商品描述:</label>
                                            <textarea id="commodityDescription" name="commodityDescription" cols="40"
                                                rows="5"></textarea>
                                        </div>

                                        <div>
                                            <input type="submit" class="submit" value="送出">
                                            <input type="reset" value="清除">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!--商品管理表格-->
                <div class="table100 ver1 m-b-110">
                    <div class="table100-head">
                        <table>
                            <thead>
                                <tr class="row100 head">
                                    <th class="cell100 column01"></th>
                                    <th class="cell100 column02"></th>
                                    <th class="cell100 column1">商品編號</th>
                                    <th class="cell100 column2">商品類別</th>
                                    <th class="cell100 column3">商品圖片</th>
                                    <th class="cell100 column4">商品名稱</th>
                                    <th class="cell100 column5">商品價格</th>
                                    <th class="cell100 column6">商品庫存</th>
                                    <th class="cell100 column7">是否上架</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <div class="table100-body js-pscroll ps ps--active-y">
                        <table>
                            <tbody>
                            <%@page import="java.util.List"%>
            
            				<%@page import="tw.group5.commodity.model.Commodity"%>

    	    				<%    
    						List<Commodity> commodityAdministrationDemonstration = (List<Commodity>) session.getAttribute("commodityAdministrationDemonstration");
    		
    	    				for (Commodity commodity : commodityAdministrationDemonstration) {
    	    					
    	    				String commodityImage = "/group5/commodityImages/"+commodity.getCommodityNo()+"_image1.jpg";
    	    				
    	    				%>
    	    				
                                <tr class="row100 body">
                                
                                    <td class="cell100 column01">
                                    
                                    <button class="delete" value=<%=commodity.getCommodityNo()%>><i class="fa-solid fa-trash-can"></i></button>
                                    
                                    </td>
                                    
                                    <td class="cell100 column02">
                                    
                                    <button type="submit" name="update" class="update" value="修改" class="update"><i class="fa-solid fa-pencil"></i></button>
                                    
                                    </td>
                                    
                                    <td class="cell100 column1 commodityNo"><%=commodity.getCommodityNo()%></td>
                                    <td class="cell100 column2 commodityType"><%=commodity.getCommodityType()%></td>
                                    <td class="cell100 column3"><img src="<%=commodityImage %>" class="img_show"></td>
                                    <td class="cell100 column4 commodityName"><%=commodity.getCommodityName()%></td>
                                    <td class="cell100 column5 commodityPrice"><%=commodity.getCommodityPrice()%></td>
                                    <td class="cell100 column6 commodityInventory"><%=commodity.getCommodityInventory()%></td>
                                    
                                    <%if(commodity.getOnShelf()==true){%>
                                    	
                                    <td class="cell100 column7 commodityOnShelf">是</td>
                                        
                                    <%}else{%>
                                    
                                    <td class="cell100 column7 commodityOnShelf">否</td>
                                    
                                    <%}%>
                                       
                                </tr>
                            <%}%>
                            
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

    <script src="js/commodity-scrollbar.min.js"></script>
    <script>
        $('.js-pscroll').each(function () {
            var ps = new PerfectScrollbar(this);

            $(window).on('resize', function () {
                ps.update();
            })
        });
    </script>
    
    <script>
    
    <%
    for(int i = 1; i<=5 ;i++){
    	%>
    	$('.image'+'<%=i%>').on('change', function(e){      
            const file = this.files[0];
            const objectURL = URL.createObjectURL(file);
          
            $('.img'+'<%=i%>').attr('src', objectURL);
          });
  <%}%>
     
    </script>
    
    <script>
    <!--刪除商品 -->
    $(function(){
		$('.delete').click(function(){
			
			
			var deleteCommodityNo = $(this).val();
			
			$.ajax({
				type:"POST",
				url:"commodity_administration.delete",
				data:"deleteCommodityNo=" + deleteCommodityNo,
				dataType:"text",
				context: this,
				success:function(data){
					$(this).parent().parent().remove();
					alert(data);
				}		
			});	
		});
	});
    
    
         
     </script>
    
    <script>
    <!--更新商品 -->
     $(function () {
    	  	 
    	 var i = 1
    	 
         $('.update').on('click',function(){
       
        	  if (i%2 == 1){
        		  
        	    i++;
        		
        		let originalCommodityNo = $(this).parent('td').nextAll('.commodityNo').text();
        		
        		let originalCommodityNameWord = $(this).parent('td').nextAll('.commodityName').text().replaceAll(" ",",").replaceAll(","," ");
        	    let originalCommodityName = '<input type="text" class="commodityNameUpdate" value="'+originalCommodityNameWord+'">';
        	    
	    	    let originalCommodityPrice = '<input type="text" class="commodityPriceUpdate" value="'+$(this).parent('td').nextAll('.commodityPrice').text()+'">';
	    	    let originalCommodityInventory = '<input type="text" class="commodityInventoryUpdate" value="'+$(this).parent('td').nextAll('.commodityInventory').text()+'">';
	    	    
	    	    let originalOnShelf = $(this).parent('td').nextAll('.commodityOnShelf').text();
	    	    if(originalOnShelf == '否'){
	    	    	originalOnShelf = '<label class="custom-control ios-switch"><input type="checkbox" class="ios-switch-control-input" name="onShelfButton"><span class="ios-switch-control-indicator"></span></label>';
	    	    }else{
	    	    	originalOnShelf = '<label class="custom-control ios-switch"><input type="checkbox" class="ios-switch-control-input" checked name="onShelfButton"><span class="ios-switch-control-indicator"></span></label>';
	    	    	                   
	    	    }
	    	    
	    	    
	    	    
	    	    let originalCommodityType = null
	    	    let originalType = $(this).parent('td').nextAll('.commodityType').text()
	    	        if(originalType=="乳清蛋白"){
	        		   originalCommodityType = '<select name="commodityType" size="1" class="commodityTypeUpdate">' +
	                                                '<option value="乳清蛋白" selected>乳清蛋白</option>'+
	                                                '<option value="服飾">服飾</option>'+
	                                                '<option value="配件">配件</option>'+
	                                                '<option value="器材">器材</option>'+
	                                            '</select>'
	                }else if(originalType=="服飾"){
	            	    originalCommodityType = '<select name="commodityType" size="1" class="commodityTypeUpdate">' +
	                                                    '<option value="乳清蛋白">乳清蛋白</option>'+
	                                                    '<option value="服飾" selected>服飾</option>'+
	                                                    '<option value="配件">配件</option>'+
	                                                    '<option value="器材">器材</option>'+
	                                                '</select>'
	                }else if(originalType=="配件"){
	            		originalCommodityType = '<select name="commodityType" size="1" class="commodityTypeUpdate">' +
	                                                    '<option value="乳清蛋白">乳清蛋白</option>'+
	                                                    '<option value="服飾">服飾</option>'+
	                                                    '<option value="配件" selected>配件</option>'+
	                                                    '<option value="器材">器材</option>'+
	                                                '</select>'
	               }else if(originalType=="配件"){
	           		    originalCommodityType = '<select name="commodityType" size="1" class="commodityTypeUpdate">' +
	                                                    '<option value="乳清蛋白">乳清蛋白</option>'+
	                                                    '<option value="服飾">服飾</option>'+
	                                                    '<option value="配件">配件</option>'+
	                                                    '<option value="器材" selected>器材</option>'+
	                                                '</select>'
	               }
	    	    
        		$(this).html('<i class="fa-solid fa-check"></i>')
   	    	    $(this).parent('td').parent('tr').css('background','lightblue')
   	    	    $(this).parent('td').nextAll('.commodityNo').html(originalCommodityNo)
   	    	    $(this).parent('td').nextAll('.commodityType').html(originalCommodityType)
   	    	    $(this).parent('td').nextAll('.commodityName').html(originalCommodityName)
   	       	    $(this).parent('td').nextAll('.commodityPrice').html(originalCommodityPrice)
   	         	$(this).parent('td').nextAll('.commodityInventory').html(originalCommodityInventory)
				$(this).parent('td').nextAll('.commodityOnShelf').html(originalOnShelf)
	    	    
   		 
    	    	 }else if(i%2 == 0){
         		 
    	    	   i++
         	    
    	    	   $(this).attr('value','修改')
    	    	   $(this).parent('td').parent('tr').css('background','white')
    	    	   
    	    	   let updateCommodityNo = $(this).parent('td').nextAll('.commodityNo').text()
    	    	   let updateCommodityType = $(this).parent('td').nextAll('.commodityType').children('select').val()
    	    	   let updateCommodityName = $(this).parent('td').nextAll('.commodityName').children('input').val().replaceAll(","," ")
    	    	   let updateCommodityPrice = $(this).parent('td').nextAll('.commodityPrice').children('input').val()
    	    	   let updateCommodityInventory = $(this).parent('td').nextAll('.commodityInventory').children('input').val()
    	    	   
    	    	   let updateCommodityOnShelf = $(this).parent('td').nextAll('.commodityOnShelf').children().children('input').is(":checked")
    	    	   

    	    	   window.location.href="commodity_administration.update?updateCommodityNo="+updateCommodityNo+"&updateCommodityType="+encodeURIComponent(updateCommodityType)+
    	    			   "&updateCommodityName="+encodeURIComponent(updateCommodityName)+"&updateCommodityPrice="+updateCommodityPrice+
    	    			   "&updateCommodityInventory="+updateCommodityInventory+"&updateCommodityOnShelf="+updateCommodityOnShelf
    			 
    	    	 }
         	 
     	 
         	 
          })
     	
     			 

        
     })
    
     </script>
         
     <%@ include file="../admin/AdminstyleFoot.jsp"%>

</body>
</html>