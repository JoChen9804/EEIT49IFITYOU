<%@page import="java.text.Format"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<title>Menu Build</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


</head>

<body>
	<section>
		<header>
			<h2>Build Up Your Menu</h2>
		</header>

		<div>
			<h4>種類選擇..</h4>
			<select id="Partlist" onchange="changePart(this.selectedIndex)"></select>

			<h4>選擇動作....</h4>
			<select id="sectorlist"></select>
		</div>

		<script>
            var kinds = ['有氧運動', '多功能性訓練', '推式孤立訓練', '拉式孤立訓練', '下肢孤立訓練',
                '軀幹孤立訓練', '肩胛孤立訓練', '核心穩定訓練'];
            var motionSelect = document.getElementById("Partlist");
            var inner = "";
            for (var i = 0; i < kinds.length; i++) {
                inner = inner + '<option>' + kinds[i] + '</option>';
            }
            motionSelect.innerHTML = inner;

            var sectors = new Array();
            sectors[0] = ['伸展動作 ', ' 腳踏車', ' 風扇腳踏車', ' 跑步機', ' 登階機',
                ' 滑步機 ', ' 划船機', ' 滑雪機'];
            sectors[1] = ['壺鈴 ', ' 地雷管 ', ' 懸吊運動 ', ' 戰繩 ', ' 藥球 ',
                ' 火箭筒 ', '硬舉運動 ', ' 抓舉運動 ', ' 上挺運動 ', ' 負重行走 ', ' 垂放 ',
                ' 土耳其起身 '];
            sectors[2] = ['胸推 ', ' 肩推 ', ' 體撐 ', ' 伏地挺身 ', ' 三頭屈伸 ',
                '飛鳥運動 ', ' 前舉運動 ', ' 側舉運動 '];
            sectors[3] = ['划船運動 ', ' 下拉運動 ', ' 引體向上 ', ' 站立上提 ', '二頭彎舉 ',
                '反向飛鳥 ', '直臂下拉 ', '面拉 '];
            sectors[4] = ['深蹲運動 ', ' 弓部蹲運動 ', ' 硬舉 ', ' 直膝挺髖 ', ' 提臀運動 ',
                ' 腿部推蹬 ', ' 腿部伸張', '腿部屈曲 ', '舉踵運動 ']
            sectors[5] = ['卷腹運動 ', '反向卷腹 ', '仰臥起坐 ', '軀幹旋轉 ', '側屈推拉 ',
                '體側屈運動 ', '直臂挺身 ', '背部屈伸 '];
            sectors[6] = ['胛內旋運動 ', ' 胛外旋運動 ', ' 肩胛內收外展 ', ' 肩胛下引 ',
                ' YTWL', ' 聳肩運動 '];
            sectors[7] = ['骨盆韻律 ', ' 死蟲式伸展 ', ' 超人式伸展 ', ' 棒式運動 ',
                ' 側棒式運動', ' 橋式運動 ', ' 熊爬式運動 '];

            function changePart(index) {
                var Sinner = "";
                for (var i = 0; i < sectors[index].length; i++) {
                    Sinner = Sinner + '<option>'
                        + sectors[index][i] + '</option>';
                }
                console.log(Sinner);
                var sectorSelect = document.getElementById("sectorlist");
                sectorSelect.innerHTML = Sinner;
            }
            changePart(document.getElementById("Partlist").selectedIndex);
        </script>

		<div>
			<h4>組數:</h4>
			<input class="te" id="setCount" type="text" placeholder="請輸入組數">組
		</div>

		<div>
			<h4>公斤數:</h4>
			<input class="te" id="exercisekilloo" type="text" placeholder="請輸入重量">公斤
		</div>

		<div>
			<h4>次數:</h4>
			<input class="te" id="exerciseTimes" type="text" placeholder="請輸入次數">次
		</div>
		<div>
			<h4>休息間隔:</h4>
			<input class="te" id="breakTime" type="text" placeholder="休息間隔">秒
		</div>
		<div>
			<button id="add">
				<i>ADD</i>
			</button>
		</div>

		<div class="container">
			<table>
				<thead>
					<th>動作種類</th>
					<th>動作</th>
					<th>組數</th>
					<th>公斤數</th>
					<th>次數</th>
					<th>休息間隔</th>
					<th>功能</th>
				</thead>
				<tbody>

				</tbody>
			</table>

			<form action="menuAddAction2.controller" method="post">
				<input type="text" class="data" name="complete" id="test1" value="">
				<button type="submit" name="confirm_add" id="menuok" class="confirm" value="02">
					<i>完成菜單</i>
				</button>
			</form>

		</div>

		<script src="https://code.jquery.com/jquery-3.6.0.js"> </script>
		<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

		<script>
            $(function () {

                let menuArray = new Array;
                function addJson(Partlist, sectorlist, setCount, exercisekilloo, exerciseTimes, breakTime) {
                    let Menu = {
                        Partlist: Partlist,
                        sectorlist: sectorlist,
                        setCount: setCount,
                        exercisekilloo: exercisekilloo,
                        exerciseTimes: exerciseTimes,
                        breakTime: breakTime
                    }
                    console.log(Menu);
                    menuArray.push(Menu);
                }
                $('#add').on('click', function () {
                    let Partlist = $('#Partlist').val(),
                        sectorlist = $('#sectorlist').val(),
                        setCount = $('#setCount').val(),
                        exercisekilloo = $('#exercisekilloo').val(),
                        exerciseTimes = $('#exerciseTimes').val(),
                        breakTime = $('#breakTime').val()

                    addJson(Partlist, sectorlist, setCount, exercisekilloo, exerciseTimes, breakTime);
                    let content = `
                        <tr>
                        <td><%="${Partlist}"%></td>
                        <td><%="${sectorlist}"%></td>
                        <td><%="${setCount}"%></td>
                        <td><%="${exercisekilloo}"%></td>
                        <td><%="${exerciseTimes}"%></td>
                        <td><%="${breakTime}"%></td>
                        <td><button class="del">del</button></td>
                    </tr> 
                `
                    $('tbody').append(content)
                })

                $('tbody').on('click', '.del', function () {
                    $(this).closest('tr').remove()
                })
                $('#menuok').on('click', function () {
                    let menuJson = JSON.stringify(menuArray);
                    let list = $('#test1')
                    list.attr("value", menuJson)
                })
            
                
                
                 $(".confirm").on('click', function(event){
				event.preventDefault();
				
				Swal.fire({
					  title:'確認要送出?送出後無法修改',
				
					  icon: 'question',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText:'確定',
					  cancelButtonText: '取消'
					}).then((result) => {
					  if (result.isConfirmed) {
						  Swal.fire({
							  title:'修改成功!',
							  icon:'success'
						  }).then((result) => {
					   			$(this).parent().submit();
							});
					  }
                         
            })
            })
            })
           
					
            		
    
      //   $(function(){
      //  	$('#submitAdd').on("click",function(){
      //  		let menubean={"Partlist":"part","sectorlist":"exerciseName","setCount":"setCount","exercisekilloo":"exercisekilloo","exerciseTimes":"exerciseTimes","breakTime":"breakTime"}
      //  		Swal.fire({
      //             title: 'Do you want to save ?',
      //             showDenyButton: true,
      //             confirmButtonText: 'Save',
      //             denyButtonText: `Don't save`,
      //         }).then((result) => {
      //         	 if (result.isConfirmed) {
      //         		 Swal.fire({
      //                     icon: 'Saved!',
      //                    html: '<p>類別：'+Partlist+'</p><p>運動：'+sectorlist+'</p><p>組數：'+setCount+'</p>'+'</p><p>重量數：'+exercisekilloo+'</p>'+'</p><p>次數：'+exerciseTimes+'</p>'+'</p><p>休息時間：'+breakTime+'</p>',
      //                     showCancelButton: true,
      //                    confirmButtonText: '確定新增',
      //                 }).then((result2)=>{
      //            		if(result2.isConfirmed){
      //            			$.ajax({
      //           				type: "post",
      //           				url: "/menuAddAction.controller",
      //            				data: JSON.stringify(menubean),
      //           				dataType: "json",
      //            				contentType: "application/json",
      //            				success: function(data){
      //             					let showResult="<p>建立完成!~~</p>";	
      //            					},
      //             					error: function(){
      //            						console.log("error");
      //             					}
      //             				});
      //             				Swal.fire('Saved!', '成功!!', 'success').then((result3)=>{
      //             					location.reload();
      //              				});
      //              			}
      //               		});
      //                } else if (result.isDenied) {
      //                    Swal.fire('Changes are not saved', '', 'info');
      //                }
      //            })
      // 		})
      		
      //	});
     
          
            </script>




	</section>
</body>
</html>