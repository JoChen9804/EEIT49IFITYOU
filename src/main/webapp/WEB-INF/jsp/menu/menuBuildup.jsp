<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<!-- ----------------------------------------------------------------------------------------------------------------------- -->
<html>

<head>
<html lang="en">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
	crossorigin="anonymous"></script>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="https://kit.fontawesome.com/e0dfce8aed.js"
	crossorigin="anonymous"></script>

<title>Personal Menu</title>

<link rel="stylesheet" href="mycss/menuStyle.css">

</head>

<body>

	<%@ include file="../admin/AdminstyleHead.jsp"%>

	<section> <header>
	<h2>Personal Menu build up</h2>
	</header>

	<div>
		<h4>種類選擇..</h4>
		<select id="Partlist" onchange="changePart(this.selectedIndex)"></select>
	</div>

	<div>
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
		
		<button id="add" class="btn btn-dark">
			<i class="fa-brands fa-pagelines">ADD</i>
		</button>
	</div>

	<div class="container">
		<table class="table table-dark table-hover">
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

		<form action="writeinSQL.controller" method="post">
			<input type="text" class="data" name="complete" id="test1" value="">
			<button type="submit" name="confirm_add" id="menuok" value="02"
				class="btn btn-dark">
				<i class="fa-solid fa-person-running">完成菜單</i>
			</button>
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.js"> </script> 

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
            })
        </script> </section>
        
        <%@ include file="../admin/AdminstyleFoot.jsp"%>
        
</body>

</html>