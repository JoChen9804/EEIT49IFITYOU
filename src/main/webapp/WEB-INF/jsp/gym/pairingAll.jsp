<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-hang-TW">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>詳細資訊</title>
    <!--   official Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
		
    <!-- Custom for this template -->
    <link href="/group5/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <!-- Core plugin JavaScript-->
    <script src="/group5/js/jquery.easing.min.js"></script>
    <!-- Custom scripts for this pages-->
    <script src="/group5/js/jquery.dataTables.min.js"></script>
    <script src="/group5/js/dataTables.bootstrap4.min.js"></script>
    <script src="/group5/js/datatables-demo.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
    
</head>
<body>
<%@ include file="../admin/AdminstyleHead.jsp" %>
    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">參與配對會員資料總覽 <a href="/group5/admin/pairing/success" class="btn btn-secondary">成功配對一覽</a></h1> 
    </div>

    <div class="row">
        <div class="col-lg-6">
                    <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">參與配對之會員名單</h6>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered display" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>會員編號</th>
                                    <th>會員帳號</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>會員編號</th>
                                    <th>會員帳號</th>
                                </tr>
                            </tfoot>
                            <tbody>
                            <c:forEach var="pd" items="${all}">
                                <tr>
                                    <td>${pd.member.id }</td>
                                    <td>${pd.member.memberAccount }</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div> <!-- card end -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">參與配對會員之性別分布</h6>
                </div>
                <div class="card-body d-flex">
                	<div class="w-50">
	                    <canvas id="genderChart"></canvas>
                	</div>
                </div>
            </div>
            
        </div> <!-- col end -->
        <div class="col-lg-6">
        	<div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">參與配對會員之運動種類偏好</h6>
                </div>
                <div class="card-body">
					<div class="w-100">
	                    <canvas id="wtChart"></canvas>
                	</div>
                </div>
            </div>
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">參與配對會員之運動頻率</h6>
                </div>
                <div class="card-body">
                	<div class="w-100">
	                    <canvas id="wfChart"></canvas>
                	</div>
                </div>
            </div> <!-- card end -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">參與配對會員之運動時間偏好</h6>
                </div>
                <div class="card-body d-flex">
                    <div class="w-100">
						<canvas id="ttChart"></canvas>
					</div>
                </div>
            </div><!-- card end -->
        </div> <!-- col end -->
    </div><!-- row end -->
    <script>
	const genderData1={
			labels: ['男', '女'],
			datasets: [{
						 	label: '性別比',
						    data: [${count["male"]},${count["female"]}],
						    backgroundColor: ["#a8baef","#7d98e7"]
						}]
			};	
   const genderConfig = {
			  type: 'pie',
			  data: genderData1,
			  options: {
			    responsive: true
			  },
			};
  const ctx = $('#genderChart')[0].getContext('2d');
  const myChart = new Chart(ctx, genderConfig);
  
  //運動種類		
	const workType={
			labels: ['徒手健身／街頭健身', '自由重量','機械式','其他無氧運動','室內有氧（跑步機、踏步機等）','瑜珈、皮拉提斯等','其他有氧運動'],
			datasets: [{
						 	label: '運動種類',
						    data: [${count["t1"]},${count["t2"]},${count["t3"]},${count["t4"]},${count["t5"]},${count["t6"]},${count["t7"]}],
						    backgroundColor: ["#a8baef","#7d98e7"]
						}]
			};	
   const wtConfig = {
		   type: 'bar',
		   data: workType,
		   options: {
		   responsive: true,
		   	    scales: {
		   	    	y: {
		   	   			beginAtZero: true,
		   				grace: '5%'
		   	    	 },
		  		}
     		}
	  	}
  const ctx2 = $('#wtChart')[0].getContext('2d');
  const myChart2 = new Chart(ctx2, wtConfig);
  
  //運動頻率		
	const workF={
			labels: ['一週少於1次', '一週1次','一週2次','一週3次','一週4次','一週5次','一週6次','一週7次'],
			datasets: [{
						 	label: '運動種類',
						    data: [${count["f0"]},${count["f1"]},${count["f2"]},${count["f3"]},${count["f4"]},${count["f5"]},${count["f6"]},${count["f7"]}],
						    backgroundColor: ["#a8baef","#7d98e7"]
						}]
			};	
 const wfConfig = {
		   type: 'bar',
		   data: workF,
		   options: {
		   responsive: true,
		   	    scales: {
		   	    	y: {
		   	   			beginAtZero: true,
		   				grace: '5%'
		   	    	 },
		  		}
   		}
	  	}
const ctx3 = $('#wfChart')[0].getContext('2d');
const myChart3 = new Chart(ctx3, wfConfig);
  
//運動時間	
const workTime={
		labels: ['02:01-10:00', '10:01-18:00','18:01-02:00'],
		datasets: [{
					 	label: '運動時間',
					    data: [${count["wt1"]},${count["wt2"]},${count["wt3"]}],
					    backgroundColor: ["#a8baef","#7d98e7"]
					}]
		};	
const workTimeConfig = {
	   type: 'bar',
	   data: workTime,
	   options: {
	   responsive: true,
	   	    scales: {
	   	    	y: {
	   	   			beginAtZero: true,
	   				grace: '5%'
	   	    	 },
	  		}
 		}
  	}
const ctx4 = $('#ttChart')[0].getContext('2d');
const myChart4 = new Chart(ctx4, workTimeConfig);
    </script>
<%@ include file="../admin/AdminstyleFoot.jsp" %>
</body>

</html>